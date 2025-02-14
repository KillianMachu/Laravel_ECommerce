<script setup>
import { Head, Link } from '@inertiajs/vue3';

const props = defineProps({
    product: Object
});

console.log(props.products);
</script>

<template>
    <div class="max-w-4xl mx-auto p-6 bg-white shadow-md rounded-lg">
        <h1 class="text-3xl font-bold mb-4">{{ product.name }}</h1>
        <p class="text-gray-700 text-lg mb-4">Prix : <strong>{{ product.price }} €</strong></p>
        <p class="text-gray-600">{{ product.description }}</p>

        <div class="mt-6">
            <Link :href="route('products')" class="px-4 py-2 bg-gray-500 text-white rounded">Retour à la liste</Link>
        </div>
    </div>
</template>