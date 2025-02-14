<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref } from 'vue';
import { router } from '@inertiajs/vue3';

const props = defineProps({
    products: Array
});

const quantities = ref({});

props.products.forEach(product => {
    quantities.value[product.id] = 1;
});

const addToCart = (productId) => {
    router.post(route('cart.add'), {
        product_id: productId,
        quantity: quantities.value[productId]
    }, {
        preserveScroll: true,
        onSuccess: () => {
            quantities.value[productId] = 1;
        },
    });
};
</script>

<template>
    <AppLayout>
        <Head title="Nos Produits" />

        <div class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            <!-- Header Section -->
            <div class="text-center mb-12">
                <h1 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">
                    Nos Produits
                </h1>
                <p class="mt-3 max-w-2xl mx-auto text-xl text-gray-500 sm:mt-4">
                    Découvrez notre catalogue complet de produits
                </p>
            </div>

            <!-- Products Grid -->
            <div class="grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4">
                <div v-for="product in products" :key="product.id" 
                     class="group relative bg-white rounded-lg shadow-lg overflow-hidden hover:shadow-xl transition-shadow duration-300">
                    <!-- Image Container -->
                    <div class="w-full min-h-80 bg-gray-200 aspect-w-1 aspect-h-1 overflow-hidden">
                        <img 
                            :src="product.image" 
                            :alt="product.name"
                            class="w-full h-full object-cover object-center group-hover:opacity-75 transition-opacity"
                        />
                    </div>

                    <!-- Product Info -->
                    <div class="p-4">
                        <h2 class="text-lg font-medium text-gray-900">
                            {{ product.name }}
                        </h2>
                        <p class="mt-1 text-xl font-semibold text-indigo-600">
                            {{ product.price }} €
                        </p>
                        
                        <!-- Quantity Selector -->
                        <div class="mt-4 flex items-center justify-between">
                            <label for="quantity" class="text-sm text-gray-700">Quantité:</label>
                            <select 
                                v-model="quantities[product.id]"
                                class="ml-2 block w-20 rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                            >
                                <option v-for="n in Math.min(10, product.stock)" :key="n" :value="n">
                                    {{ n }}
                                </option>
                            </select>
                        </div>

                        <!-- Actions -->
                        <div class="mt-4 space-y-2">
                            <Link 
                                :href="route('products.show', { product: product.slug })"
                                class="w-full inline-flex justify-center items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700"
                            >
                                <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                </svg>
                                Voir le détail
                            </Link>

                            <button 
                                @click="addToCart(product.id)"
                                class="w-full inline-flex justify-center items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700"
                            >
                                <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                                </svg>
                                Ajouter au panier
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Empty State -->
            <div v-if="products.length === 0" class="text-center py-12">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">Aucun produit</h3>
                <p class="mt-1 text-sm text-gray-500">Aucun produit n'est disponible pour le moment.</p>
            </div>
        </div>
    </AppLayout>
</template>