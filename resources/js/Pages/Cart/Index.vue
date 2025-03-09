<script setup>
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { computed, ref } from 'vue';

const page = usePage();
const isAuthenticated = computed(() => page.props.auth.user !== null);

const props = defineProps({
    cart: {
        type: Object,
        required: true
    },
    addresses: {
        type: Array,
        required: true
    }
});

const removeItem = (productId) => {
    if (!isAuthenticated.value) {
        window.location = route('login');
        return;
    }

    router.delete(route('cart.remove', { product: productId }), {}, {
        preserveScroll: true,
        onSuccess: () => {
            quantity.value = 1;
        },
    });
};

const updateQuantity = (productId, quantity) => {
    if (!isAuthenticated.value) {
        window.location = route('login');
        return;
    }

    router.put(route('cart.update', { product: productId }), {
        quantity: quantity
    }, {
        preserveScroll: true,
    });
};

const createOrder = () => {
    router.post(route('orders.create'), {
        address_id: selectedAddress.value
    }, {
        preserveScroll: true,
    });
}

const selectedAddress = ref(props.addresses.find(address => address.is_default)?.id)

const getTotalSavings = () => {
    return props.cart.products.reduce((total, product) => {
        if (product.discount_price) {
            return total + ((product.price - product.discount_price) * product.pivot.quantity)
        }
        return total
    }, 0)
}

</script>

<template>
    <AppLayout>
        <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
            <h1 class="page-title">Mon Panier</h1>

            <!-- Panier avec articles -->
            <div v-if="cart?.products.length > 0" class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                <div class="lg:col-span-2 space-y-6">
                    <!-- Articles du panier -->
                    <div v-for="product in cart.products" :key="product.id" class="card p-6">
                        <div class="flex gap-6">
                            <div class="w-24 h-24 flex-shrink-0 relative">
                                <div v-if="product.discount_price"
                                    class="absolute -top-2 -left-2 bg-red-600 text-white px-2 py-1 rounded-md text-sm font-semibold z-10">
                                    - {{ product.discount_percentage }} %
                                </div>
                                <img :src="'/storage/' + product.primary_image_url" :alt="product.name"
                                    class="w-full h-full object-cover rounded-lg">
                            </div>
                            <div class="flex-1">
                                <div class="flex justify-between">
                                    <h3 class="font-semibold text-lg">{{ product.name }}</h3>
                                    <button @click="removeItem(product.slug)" class="text-gray-400 hover:text-red-500">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M6 18L18 6M6 6l12 12"></path>
                                        </svg>
                                    </button>
                                </div>
                                <div class="mt-2 space-y-2">
                                    <div class="flex items-center gap-2">
                                        <p class="font-bold text-indigo-600">Prix unitaire:</p>
                                        <p class="font-bold text-indigo-600">{{ product.discount_price ?? product.price
                                            }} €</p>
                                        <p v-if="product.discount_price && product.discount_price > 0"
                                            class="text-xs text-gray-500 line-through">{{ product.price }} €</p>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <button
                                            @click="product.pivot.quantity > 1 ? updateQuantity(product.slug, product.pivot.quantity - 1) : null"
                                            class="w-8 h-8 flex items-center justify-center rounded-full border border-gray-300 hover:bg-gray-100">
                                            -
                                        </button>
                                        <input @change="updateQuantity(product.slug, Math.max(1, $event.target.value))"
                                            type="number" v-model="product.pivot.quantity" min="1"
                                            class="w-16 text-center border-gray-300 rounded-md">
                                        <button @click="updateQuantity(product.slug, product.pivot.quantity + 1)"
                                            class="w-8 h-8 flex items-center justify-center rounded-full border border-gray-300 hover:bg-gray-100">
                                            +
                                        </button>
                                    </div>
                                    <p class="text-indigo-600 font-semibold text-lg">
                                        Total: {{ product.pivot.quantity * (product.discount_price ?? product.price) }}
                                        €
                                    </p>
                                    <p v-if="product.discount_price" class="text-sm text-green-600">
                                        Économie: {{ ((product.price - product.discount_price) *
                                        product.pivot.quantity).toFixed(2) }} €
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Sélection d'adresse -->
                    <div class="card p-6">
                        <h2 class="text-lg font-semibold mb-4">Adresse de livraison</h2>
                        <div class="space-y-4">
                            <div v-for="address in addresses" :key="address.id" :class="[
                                'p-4 rounded-lg border-2 cursor-pointer transition-all',
                                selectedAddress === address.id
                                    ? 'border-indigo-600 bg-indigo-50'
                                    : 'border-gray-200 hover:border-indigo-300'
                            ]" @click="selectedAddress = address.id">
                                <div class="flex items-start justify-between">
                                    <div class="flex gap-3">
                                        <input type="radio" :checked="selectedAddress === address.id"
                                            :id="'address-' + address.id" name="delivery-address" class="mt-1">
                                        <div>
                                            <label :for="'address-' + address.id" class="font-medium">{{ address.name
                                            }}</label>
                                            <p class="text-gray-600">{{ address.recipient }}</p>
                                            <p class="text-gray-600">{{ address.street }}</p>
                                            <p class="text-gray-600">{{ address.postal_code }} {{ address.city }}</p>
                                            <p class="text-gray-600">{{ address.phone }}</p>
                                        </div>
                                    </div>
                                    <span v-if="address.is_default" class="badge badge-success text-xs">
                                        Par défaut
                                    </span>
                                </div>
                            </div>
                            <Link :href="route('addresses.show')" class="btn-primary w-full">
                                Ajouter une nouvelle adresse
                            </Link>
                        </div>
                    </div>
                </div>

                <div class="lg:col-span-1">
                    <div class="card p-6 space-y-4 sticky top-4">
                        <h2 class="text-lg font-semibold">Résumé de la commande</h2>
                        <div class="flex justify-between">
                            <span>Sous-total</span>
                            <span>{{ cart.total_price }} €</span>
                        </div>
                        <div class="flex justify-between">
                            <span>Livraison</span>
                            <span>0.00 €</span>
                        </div>
                        <div v-if="getTotalSavings() > 0" class="flex justify-between text-green-600 font-medium">
                            <span>Économies totales</span>
                            <span>-{{ getTotalSavings().toFixed(2) }} €</span>
                        </div>
                        <div class="border-t pt-4">
                            <div class="flex justify-between font-semibold">
                                <span>Total</span>
                                <span>{{ cart.total_price }} €</span>
                            </div>
                        </div>
                        <button class="btn-primary w-full mt-6" @click="createOrder">
                            Procéder au paiement
                        </button>
                        <p class="text-sm text-gray-500 text-center">
                            Livraison gratuite à partir de 50€ d'achat
                        </p>
                    </div>
                </div>
            </div>

            <!-- Panier vide -->
            <div v-else class="text-center py-12">
                <div class="w-24 h-24 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-6">
                    <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path>
                    </svg>
                </div>
                <h2 class="text-2xl font-semibold mb-4">Votre panier est vide</h2>
                <p class="text-gray-500 mb-8">Découvrez nos produits et commencez vos achats</p>
                <Link :href="route('products.index')" class="btn-primary">
                    Voir les produits
                </Link>
            </div>
        </main>
    </AppLayout>
</template>