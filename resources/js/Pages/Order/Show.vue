<script setup>
import { ref } from 'vue'

import AppLayout from '@/Layouts/AppLayout.vue';

const props = defineProps({
    order: {
        type: Object,
        required: true
    }
});



// const getSubtotal = () => {
//   return order.value.items.reduce((total, item) => total + (item.price * item.quantity), 0)
// }

// const getShippingCost = () => {
//   const subtotal = getSubtotal()
//   return subtotal >= 50 ? 0 : 5.99
// }

// const getTotal = () => {
//   return getSubtotal() + getShippingCost()
// }
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

            <div class="card p-6 mb-8">
                <div class="flex justify-between items-start border-b pb-4 mb-4">
                    <div>
                        <h2 class="font-semibold text-lg text-gray-900">
                            Commande {{ order.id }}
                        </h2>
                        <p class="text-gray-500">
                            Passée le {{ new Date(order.created_at).toLocaleDateString() }}
                        </p>
                    </div>
                    <span class="badge badge-success">
                        {{ order.status }}
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
                            <p>{{ order.shipping_address.postalCode }} {{ order.shipping_address.city }}</p>
                            <p>{{ order.shipping_address.country }}</p>
                            <p>{{ order.shipping_address.phone }}</p>
                        </div>
                    </div>

                    <!-- Récapitulatif de la commande -->
                    <div>
                        <h3 class="font-medium text-gray-900 mb-4">Récapitulatif de la commande</h3>
                        <div class="space-y-4">
                            <div v-for="(item, index) in order.products" :key="index"
                                class="flex justify-between items-center py-4 border-b last:border-b-0">
                                <div>
                                    <p class="font-medium">{{ item.name }}</p>
                                    <p class="text-sm text-gray-500">Quantité: {{ item.pivot.quantity }}</p>
                                </div>
                                <div class="text-right">
                                    <p class="font-medium">{{ (item.price * item.pivot.quantity).toFixed(2) }} €</p>
                                    <p class="text-sm text-gray-500">{{ item.price.toFixed(2) }} € / unité</p>
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
                <button class="btn-primary">
                    Retour à la boutique
                </button>
            </div>
        </main>
    </AppLayout>
</template>