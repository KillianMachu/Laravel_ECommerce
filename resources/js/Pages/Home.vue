<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
</script>

<template>
    <AppLayout>
        <Head title="Accueil" />

        <!-- Hero Section -->
        <div class="relative bg-gray-900 h-[600px]">
            <div class="absolute inset-0">
                <img 
                    src="https://images.unsplash.com/photo-1441986300917-64674bd600d8" 
                    class="w-full h-full object-cover opacity-50"
                    alt="Hero background"
                />
            </div>
            <div class="relative max-w-7xl mx-auto py-24 px-4 sm:py-32 sm:px-6 lg:px-8">
                <h1 class="text-4xl font-extrabold tracking-tight text-white sm:text-5xl lg:text-6xl">
                    Bienvenue chez [Nom du Commerce]
                </h1>
                <p class="mt-6 text-xl text-gray-300 max-w-3xl">
                    Découvrez notre sélection exceptionnelle de produits et services
                </p>
                <div class="mt-10">
                    <Link 
                        href="/products" 
                        class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700"
                    >
                        Découvrir nos produits
                    </Link>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="py-16 bg-white">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
                    <!-- Feature 1 -->
                    <div class="p-6 border rounded-lg">
                        <div class="text-indigo-600 mb-4">
                            <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                            </svg>
                        </div>
                        <h3 class="text-lg font-medium text-gray-900">Qualité garantie</h3>
                        <p class="mt-2 text-gray-500">Nous sélectionnons uniquement les meilleurs produits pour vous.</p>
                    </div>

                    <!-- Feature 2 -->
                    <div class="p-6 border rounded-lg">
                        <div class="text-indigo-600 mb-4">
                            <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </div>
                        <h3 class="text-lg font-medium text-gray-900">Livraison rapide</h3>
                        <p class="mt-2 text-gray-500">Recevez votre commande en un temps record.</p>
                    </div>

                    <!-- Feature 3 -->
                    <div class="p-6 border rounded-lg">
                        <div class="text-indigo-600 mb-4">
                            <svg class="h-8 w-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                            </svg>
                        </div>
                        <h3 class="text-lg font-medium text-gray-900">Service client</h3>
                        <p class="mt-2 text-gray-500">Une équipe à votre écoute 7j/7.</p>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>