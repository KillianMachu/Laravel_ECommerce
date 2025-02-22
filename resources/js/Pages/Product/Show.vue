<script setup>
import { Head, Link, usePage } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import { ref, computed } from 'vue';
import { router } from '@inertiajs/vue3';

const page = usePage();
const isAuthenticated = computed(() => page.props.auth.user !== null);

const props = defineProps({
  product: Object
});

const selectedImage = ref(0)
const quantity = ref(1)

const addToCart = () => {
  if (!isAuthenticated.value) {
    window.location = route('login');
    return;
  }

  router.post(route('cart.add', { product: props.product.slug }), {
    quantity: quantity.value
  }, {
    preserveScroll: true,
    onSuccess: () => {
      quantity.value = 1;
    },
  });
};
</script>

<template>
  <AppLayout>

    <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <!-- Images -->
        <div class="space-y-4">
          <div class="aspect-w-1 aspect-h-1 w-full overflow-hidden rounded-lg">
            <img :src="product.images[selectedImage].image_url" :alt="product.name"
              class="h-full w-full object-cover object-center">
          </div>
          <div class="grid grid-cols-3 gap-4">
            <button v-for="(image, index) in product.images" :key="index" @click="selectedImage = index" :class="[
              'aspect-w-1 aspect-h-1 overflow-hidden rounded-lg',
              selectedImage === index ? 'ring-2 ring-indigo-600' : ''
            ]">
              <img :src="image.image_url" :alt="`${product.name} ${index + 1}`"
                class="h-full w-full object-cover object-center hover:opacity-75">
            </button>
          </div>
        </div>

        <!-- Informations -->
        <div class="space-y-6">
          <div>
            <h1 class="text-3xl font-bold text-gray-900">{{ product.name }}</h1>
            <div class="mt-4 flex items-center gap-4 justify-between">
              <p class="text-3xl font-bold text-indigo-600">{{ product.price }} €</p>
              <div>
                <span v-if="product.stock > 0"
                  class="inline-flex items-center justify-center rounded-full bg-emerald-100 px-2.5 py-0.5 text-emerald-700">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="-ms-1 me-1.5 size-4">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <p class="whitespace-nowrap text-sm">En stock</p>
                </span>
                <span v-else
                  class="inline-flex items-center justify-center rounded-full bg-red-100 px-2.5 py-0.5 text-red-700">
                  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="-ms-1 me-1.5 size-4">
                    <path stroke-linecap="round" stroke-linejoin="round"
                      d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
                  </svg>
                  <p class="whitespace-nowrap text-sm">En rupture</p>
                </span>
              </div>
            </div>
          </div>

          <p class="text-gray-600">{{ product.description }}</p>

          <!-- Quantité et ajout au panier -->
          <div v-if="isAuthenticated" class="flex items-center gap-4">
            <div v-if="product.stock > 0" class="flex gap-4 w-full">
              <div class="w-32">
                <label for="quantity" class="sr-only">Quantité</label>
                <input type="number" id="quantity" v-model="quantity" min="1" :max="product.stock" class="input">
              </div>
              <button @click="addToCart()" class="btn-primary flex-1">
                Ajouter au panier
              </button>
            </div>
            <div v-else class="flex flex-col items-center gap-4 p-4 border border-gray-300 rounded-lg shadow-sm w-full">
              <p class="text-gray-600 text-sm text-center">
                Pas de stock disponible
              </p>
            </div>
          </div>

          <div v-else class="flex flex-col items-center gap-4 p-4 border border-gray-300 rounded-lg shadow-sm">
            <p class="text-gray-600 text-sm text-center">
              Veuillez vous connecter pour ajouter au panier
            </p>
            <Link :href="route('login')" class="btn-primary w-full text-center">
            Se connecter
            </Link>
          </div>

          <!-- Avantages -->
          <div class="grid grid-cols-2 gap-4 border-t border-b border-gray-200 py-6">
            <div class="flex items-center gap-3">
              <TruckIcon class="w-6 h-6 text-indigo-600" />
              <div>
                <p class="font-medium">Livraison gratuite</p>
                <p class="text-sm text-gray-500">Pour toute commande > 50€</p>
              </div>
            </div>
            <div class="flex items-center gap-3">
              <ShieldCheckIcon class="w-6 h-6 text-indigo-600" />
              <div>
                <p class="font-medium">Garantie 2 ans</p>
                <p class="text-sm text-gray-500">Satisfait ou remboursé</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

  </AppLayout>

</template>