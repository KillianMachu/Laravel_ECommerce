<script setup>
import { Head, Link } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref } from 'vue';
import { MagnifyingGlassIcon, FunnelIcon, EyeIcon } from '@heroicons/vue/24/outline';

const props = defineProps({
    category: {
        type: Object,
        required: true
    }
});

const filters = ref({
    priceRange: [0, 2000],
    sortBy: 'popularity',
    inStock: true
})

const searchQuery = ref('')
</script>

<template>
    <AppLayout>
        <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
            <!-- En-tête de la catégorie -->
            <div class="relative rounded-2xl overflow-hidden mb-8">
                <div class="absolute inset-0">
                    <img :src="'/storage/' + category.image_url" class="w-full h-full object-cover" :alt="category.name">
                    <div class="absolute inset-0 bg-gradient-to-r from-indigo-600/90 to-indigo-600/70"></div>
                </div>
                <div class="relative py-16 px-8 sm:px-12">
                    <h1 class="text-4xl font-bold text-white mb-4">{{ category.name }}</h1>
                    <p class="text-xl text-white/90 max-w-2xl">{{ category.description }}</p>
                </div>
            </div>

            <!-- Barre de recherche et filtres -->
            <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4 mb-8">
                <div class="flex gap-4 flex-1">
                    <div class="relative flex-1">
                        <input type="text" placeholder="Rechercher dans cette catégorie..." v-model="searchQuery"
                            class="input pl-10 w-full">
                        <MagnifyingGlassIcon
                            class="w-5 h-5 text-gray-400 absolute left-3 top-1/2 transform -translate-y-1/2" />
                    </div>
                    <button class="btn-primary flex items-center gap-2">
                        <FunnelIcon class="w-5 h-5" />
                        Filtrer
                    </button>
                </div>
                <div class="flex items-center gap-2">
                    <span class="text-sm text-gray-500">Trier par:</span>
                    <select v-model="filters.sortBy" class="input">
                        <option value="popularity">Popularité</option>
                        <option value="price-asc">Prix croissant</option>
                        <option value="price-desc">Prix décroissant</option>
                        <option value="newest">Plus récent</option>
                    </select>
                </div>
            </div>

            <!-- Liste des produits -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
                <div v-for="product in category.products" :key="product.id"
                    class="card group cursor-pointer animate-fade-in">
                    <div class="relative">
                        <div v-if="product.discount_price"
                        class="absolute top-4 left-4 bg-red-600 text-white px-3 py-1.5 rounded-md text-lg font-semibold z-10">
                            - {{ product.discount_percentage }} %
                        </div>
                        <div class="aspect-w-1 aspect-h-1 w-full overflow-hidden rounded-t-lg bg-gray-200">
                            <img :src="'/storage/' + product.primary_image_url" :alt="product.name"
                                class="h-full w-full object-cover object-center group-hover:scale-110 transition-transform duration-300">
                        </div>
                    </div>
                    <div class="p-6">
                        <h3 class="text-lg font-semibold text-gray-900">{{ product.name }}</h3>
                        <div class="flex items-center gap-2 mt-2">
                                <p class="text-xl font-bold text-indigo-600">{{ product.discount_price ?? product.price }} €</p>
                                <p v-if="product.discount_price && product.discount_price > 0" class="text-sm text-gray-500 line-through">{{ product.price }} €</p>
                            </div>
                        <Link :href="route('products.show', product.slug)" class="inline-flex justify-center gap-3 btn-primary w-full mt-4">
                            <EyeIcon class="w-6 h-6 text-white" />
                            Voir le produit
                        </Link>
                    </div>
                </div>
            </div>
        </main>
    </AppLayout>
</template>