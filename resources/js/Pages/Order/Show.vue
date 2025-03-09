<script setup>
import { ref, computed } from 'vue'
import { CheckCircleIcon, ClockIcon, TruckIcon, HomeIcon, AdjustmentsVerticalIcon } from '@heroicons/vue/24/outline'
import { Link } from '@inertiajs/vue3'

import AppLayout from '@/Layouts/AppLayout.vue';
import { } from '@vue-hero-icons/outline';

const props = defineProps({
    order: {
        type: Object,
        required: true
    }
});

const orderSteps = [
    { status: 'pending', name: 'En attente', description: 'Commande en attente de validation', icon: ClockIcon },
    { status: 'processing', name: 'En préparation', description: 'Commande en cours de préparation', icon: AdjustmentsVerticalIcon },
    { status: 'shipped', name: 'Expédiée', description: 'Commande expédiée', icon: TruckIcon },
    { status: 'delivered', name: 'Livrée', description: 'Commande livrée', icon: HomeIcon }
]

const specialStatuses = {
    'cancelled': { name: 'Annulée', color: 'bg-red-600' },
    'refunded': { name: 'Remboursée', color: 'bg-orange-500' }
}

const isSpecialStatus = (status) => {
    return status in specialStatuses
}

const getCurrentStepIndex = () => {
    return orderSteps.findIndex(step => step.status === props.order.status)
}

const getStepStatus = (index) => {
    if (isSpecialStatus(props.order.status)) return 'inactive'
    const currentIndex = getCurrentStepIndex()
    if (index < currentIndex) return 'completed'
    if (index === currentIndex) return 'current'
    return 'inactive'
}

const isMobile = computed(() => {
    return window.innerWidth < 640; // sm: breakpoint
})

</script>

<template>
    <AppLayout>

        <main class="mx-auto max-w-3xl px-4 sm:px-6 lg:px-8 py-8">
            <div class="text-center mb-12">
                <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <svg class="w-8 h-8 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                    </svg>
                </div>
                <h1 class="text-3xl font-bold text-gray-900 mb-4">
                    Merci pour votre commande !
                </h1>
                <p class="text-gray-600">
                    Nous vous tiendrons informé de l'avancement de votre commande par email.
                </p>
            </div>

            <!-- Barre de progression -->
            <div class="mb-20">
                <div v-if="isSpecialStatus(order.status)" class="flex items-center justify-center p-4 rounded-lg"
                    :class="specialStatuses[order.status].color">
                    <component :is="specialStatuses[order.status].icon" class="w-6 h-6 text-white mr-2" />
                    <span class="text-white font-medium">
                        Commande {{ specialStatuses[order.status].name.toLowerCase() }}
                    </span>
                </div>
                <div v-else class="relative">
                    <div
                        class="flex flex-wrap flex-col sm:flex-row gap-[7rem] sm:gap-0 items-center justify-between mb-[7rem]">
                        <div v-for="(step, index) in orderSteps" :key="step.status"
                            class="flex flex-col items-center relative z-10">
                            <div :class="[
                                'w-8 h-8 rounded-full flex items-center justify-center',
                                getStepStatus(index) === 'completed' || getStepStatus(index) === 'current' ? 'bg-indigo-600' :
                                    'bg-gray-200'
                            ]">
                                <CheckCircleIcon v-if="getStepStatus(index) === 'completed'"
                                    class="w-6 h-6 text-white" />
                                <div v-else-if="getStepStatus(index) === 'current'"
                                    class="w-3 h-3 bg-white rounded-full"></div>
                            </div>
                            <div class="absolute top-10 left-1/2 -translate-x-1/2 text-center min-w-max max-w-[50%]">
                                <component :is="step.icon" class="w-8 h-8 mb-2 text-gray-500 mx-auto mt-2"
                                    :class="getStepStatus(index) !== 'inactive' ? 'text-indigo-600' : 'text-gray-500'"" />
                                <p class=" text-sm font-medium"
                                    :class="getStepStatus(index) !== 'inactive' ? 'text-indigo-600' : 'text-gray-500'">
                                    {{ step.name }}
                                    </p>
                                    <p class="text-xs text-gray-500 mt-1">{{ step.description }}</p>
                            </div>
                        </div>
                    </div>
                    <div
                        class="absolute bg-gray-200 w-0.5 h-full sm:w-full top-0 left-1/2 -translate-x-1/2 sm:h-0.5 sm:left-0 sm:top-4 sm:translate-x-0">
                        <div class="absolute top-0 left-0 bg-indigo-600 transition-all duration-500" :style="{
                            width: isMobile ? '100%' : (getCurrentStepIndex() / (orderSteps.length - 1)) * 100 + '%',
                            height: isMobile ? (getCurrentStepIndex() / (orderSteps.length - 1)) * 100 + '%' : '100%'
                        }"></div>
                    </div>
                </div>
            </div>

            <div class="card p-6 mb-8">
                <div class="flex justify-between items-start border-b pb-4 mb-4">
                    <div>
                        <h2 class="font-semibold text-lg text-gray-900">
                            Commande #{{ order.id }}
                        </h2>
                        <p class="text-gray-500">
                            Passée le {{ new Date(order.created_at).toLocaleDateString() }}
                        </p>
                    </div>
                    <span :class="[
                        'badge',
                        isSpecialStatus(order.status) ?
                            (order.status === 'cancelled' ? 'badge-error' : 'badge-warning') :
                            'badge-success'
                    ]">
                        {{ isSpecialStatus(order.status) ? specialStatuses[order.status].name :
                            orderSteps[getCurrentStepIndex()].name }}
                    </span>
                </div>

                <div class="space-y-6">
                    <!-- Adresse de livraison -->
                    <div>
                        <h3 class="font-medium text-gray-900 mb-2">Adresse de livraison</h3>
                        <div class="bg-gray-50 rounded-lg p-4">
                            <p class="font-medium">{{ order.shipping_address.name }}</p>
                            <p>{{ order.shipping_address.recipient }}</p>
                            <p>{{ order.shipping_address.street }}</p>
                            <p>{{ order.shipping_address.postal_code }} {{ order.shipping_address.city }}</p>
                            <p>{{ order.shipping_address.country }}</p>
                            <p>{{ order.shipping_address.phone }}</p>
                        </div>
                    </div>

                    <!-- Récapitulatif de la commande -->
                    <div>
                        <h3 class="font-medium text-gray-900 mb-4">Récapitulatif de la commande</h3>
                        <div class="space-y-4">
                            <div v-for="(product, index) in order.products" :key="index"
                                class="flex justify-between items-center py-4 border-b last:border-b-0">
                                <div class="flex gap-6 items-center">
                                    <div class="w-24 h-24 flex-shrink-0">
                                        <img :src="'/storage/' + product.primary_image_url" :alt="product.name"
                                            class="w-full h-full object-cover rounded-lg">
                                    </div>
                                    <div class="flex-1">
                                        <p class="font-medium">{{ product.name }}</p>
                                        <p class="text-sm text-gray-500">Quantité: {{ product.pivot.quantity }}</p>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <p class="font-medium">{{ product.pivot.unitary_price * product.pivot.quantity }} €</p>
                                    <p class="text-sm text-gray-500">{{ product.pivot.unitary_price }} € / unité</p>
                                </div>
                            </div>
                        </div>

                        <!-- Total -->
                        <div class="mt-6 space-y-2">
                            <div class="flex justify-between text-gray-600">
                                <span>Sous-total</span>
                                <span>{{ order.total_price }} €</span>
                            </div>
                            <div class="flex justify-between text-gray-600">
                                <span>Livraison</span>
                                <span>{{ 0.00 }} €</span>
                            </div>
                            <div class="flex justify-between font-bold text-lg pt-4 border-t">
                                <span>Total</span>
                                <span>{{ order.total_price }} €</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center">
                <Link :href="route('home')" class="btn-primary w-fit">
                Retour à la boutique
                </Link>
            </div>
        </main>
    </AppLayout>
</template>