<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

const props = defineProps({
    categories: {
        type: Array,
        required: true
    }
});
</script>

<template>
    <AppLayout>
    <!-- <div class="max-w-4xl mx-auto p-6 bg-white shadow-md rounded-lg">
        <h1 class="text-3xl font-bold mb-4">Liste des catégories</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div v-for="category in categories" :key="category.id" class="bg-white shadow-md rounded-lg p-4">
                <h2 class="text-xl font-bold mt-4">{{ category.name }}</h2>
                <p class="text-gray-700 text-lg mb-2">{{ category.description }}</p>
                <Link :href="`/categories/${category.id}`" class="px-4 py-2 bg-blue-500 text-white rounded">Voir la catégorie</Link>
            </div>
        </div>
        <div class="mt-6">
            <Link href="/categories/create" class="px-4 py-2 bg-green-500 text-white rounded">Ajouter une catégorie</Link>
        </div>
    </div> -->




        <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
            <h1 class="page-title">Toutes nos catégories</h1>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div v-for="category in categories" 
                :key="category.id" 
                class="card group cursor-pointer hover:shadow-xl transition-all duration-300">
                <div class="aspect-w-16 aspect-h-9 w-full overflow-hidden rounded-t-lg">
                <img :src="'/storage/' + category.image_url" 
                    :alt="category.name" 
                    class="h-full w-full object-cover object-center transform group-hover:scale-110 transition-transform duration-300">
                </div>
                <div class="p-6">
                <div class="flex justify-between items-start mb-4">
                    <div>
                    <h3 class="text-xl font-semibold text-gray-900">{{ category.name }}</h3>
                    <p class="text-sm text-gray-500 mt-1">{{ category.products_count }} produits</p>
                    </div>
                    <Link :href="`/categories/${category.slug}`" class="btn-primary">
                    Voir
                    </Link>
                </div>
                <p class="text-gray-600">{{ category.description }}</p>
                </div>
            </div>
            </div>
        </main>
    </AppLayout>
</template>