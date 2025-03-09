<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { EyeIcon } from '@heroicons/vue/24/outline';

const props = defineProps({
    products: {
        type: Array,
        required: true
    }
});
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
                    <div class="relative">
                        <div v-if="product.discount_price"
                        class="absolute top-4 left-4 bg-red-600 text-white px-3 py-1.5 rounded-md text-lg font-semibold z-10">
                            - {{ product.discount_percentage }} %
                        </div>
                        <div class="aspect-w-16 aspect-h-9 w-full overflow-hidden rounded-t-lg">
                            <img :src="'/storage/' + product.primary_image_url" :alt="product.name"
                                class="w-full h-full object-cover object-center group-hover:opacity-75 transition-opacity" />
                        </div>
                    </div>

                    <!-- Product Info -->
                    <div class="p-6">
                        <h2 class="text-lg font-medium text-gray-900">
                            {{ product.name }}
                        </h2>
                        <div class="flex items-center gap-2 mt-2">
                                <p class="text-xl font-bold text-indigo-600">{{ product.discount_price ?? product.price }} €</p>
                                <p v-if="product.discount_price && product.discount_price > 0" class="text-sm text-gray-500 line-through">{{ product.price }} €</p>
                            </div>

                        <!-- Actions -->
                        <div class="mt-4 space-y-2">
                            <Link :href="route('products.show', { product: product.slug })"
                                class="w-full gap-3 inline-flex justify-center items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700">
                                <EyeIcon class="w-6 h-6 text-white" />
                                Voir le produit
                            </Link>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Empty State -->
            <div v-if="products.length === 0" class="text-center py-12">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
                </svg>
                <h3 class="mt-2 text-sm font-medium text-gray-900">Aucun produit</h3>
                <p class="mt-1 text-sm text-gray-500">Aucun produit n'est disponible pour le moment.</p>
            </div>
        </div>
    </AppLayout>
</template>