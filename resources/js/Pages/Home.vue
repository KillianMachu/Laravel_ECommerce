<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
</script>

<template>
    <AppLayout>
        <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8 space-y-12">
            <!-- Hero Section -->
            <section class="relative rounded-2xl overflow-hidden">
                <div class="absolute inset-0">
                    <img src="https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
                        class="w-full h-full object-cover" alt="Hero">
                    <div class="absolute inset-0 bg-gradient-to-r from-indigo-600/90 to-indigo-600/70"></div>
                </div>
                <div class="relative py-24 px-8 sm:px-12 text-center">
                    <h1 class="text-4xl sm:text-5xl font-bold text-white mb-6">Découvrez notre collection</h1>
                    <p class="text-xl text-white/90 mb-8 max-w-2xl mx-auto">Les meilleures marques aux meilleurs prix,
                        livrées directement chez vous.</p>
                    <button class="btn-primary text-lg px-8 py-3 bg-white text-indigo-600 hover:bg-gray-100">
                        Voir les produits
                    </button>
                </div>
            </section>

            <!-- Catégories -->
            <section>
                <div class="flex justify-between items-center mb-8">
                    <h2 class="section-title">Catégories Populaires</h2>
                    <button class="text-indigo-600 hover:text-indigo-700 font-medium flex items-center gap-1">
                        Voir tout
                        <ChevronRightIcon class="w-4 h-4" />
                    </button>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div v-for="category in categories" :key="category.id" class="card group cursor-pointer">
                        <div class="aspect-w-16 aspect-h-9 w-full overflow-hidden rounded-t-lg">
                            <img :src="category.image" :alt="category.name"
                                class="h-full w-full object-cover object-center transform group-hover:scale-110 transition-transform duration-300">
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold text-gray-900 mb-2">{{ category.name }}</h3>
                            <p class="text-gray-500">{{ category.description }}</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Produits Populaires -->
            <section>
                <div class="flex justify-between items-center mb-8">
                    <h2 class="section-title">Produits Populaires</h2>
                    <button class="text-indigo-600 hover:text-indigo-700 font-medium flex items-center gap-1">
                        Voir tout
                        <ChevronRightIcon class="w-4 h-4" />
                    </button>
                </div>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                    <div v-for="product in popularProducts" :key="product.id" class="card group cursor-pointer">
                        <div class="aspect-w-1 aspect-h-1 w-full overflow-hidden rounded-t-lg bg-gray-200">
                            <img :src="product.image" :alt="product.name"
                                class="h-full w-full object-cover object-center group-hover:scale-110 transition-transform duration-300">
                        </div>
                        <div class="p-6">
                            <h3 class="text-lg font-semibold text-gray-900">{{ product.name }}</h3>
                            <div class="flex items-center justify-between mt-2">
                                <p class="text-xl font-bold text-indigo-600">{{ product.price }} €</p>
                                <div class="flex items-center">
                                    <span class="text-yellow-400">★</span>
                                    <span class="ml-1 text-sm text-gray-500">{{ product.rating }}/5</span>
                                </div>
                            </div>
                            <button class="btn-primary w-full mt-4">
                                Ajouter au panier
                            </button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Avantages -->
            <section class="grid grid-cols-1 md:grid-cols-3 gap-8 py-12">
                <div class="text-center p-6">
                    <div class="w-16 h-16 bg-indigo-100 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7">
                            </path>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold mb-2">Livraison Gratuite</h3>
                    <p class="text-gray-500">Pour toute commande supérieure à 50€</p>
                </div>
                <div class="text-center p-6">
                    <div class="w-16 h-16 bg-indigo-100 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold mb-2">Support 24/7</h3>
                    <p class="text-gray-500">Une équipe à votre écoute</p>
                </div>
                <div class="text-center p-6">
                    <div class="w-16 h-16 bg-indigo-100 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"></path>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold mb-2">Retours Gratuits</h3>
                    <p class="text-gray-500">Satisfait ou remboursé sous 30 jours</p>
                </div>
            </section>
        </main>

    </AppLayout>
</template>