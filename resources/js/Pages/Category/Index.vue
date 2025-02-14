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
    <div class="max-w-4xl mx-auto p-6 bg-white shadow-md rounded-lg">
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
    </div>
    </AppLayout>
</template>