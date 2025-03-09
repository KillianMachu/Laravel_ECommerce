<script setup>
import AppLayout from '@/Layouts/AppLayout.vue'
import { Link } from '@inertiajs/vue3'
import { router } from '@inertiajs/vue3'

defineProps({
  orders: {
    type: Array,
    required: true
  },
})

</script>

<template>
  <AppLayout>
    <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <h1 class="page-title">Mes Commandes</h1>

      <div class="space-y-6">
        <div v-for="order in orders" :key="order.id" class="card overflow-hidden">
          <!-- En-tête de la commande -->
          <div class="bg-gray-50 p-6 flex flex-wrap items-center justify-between gap-4">
            <div>
              <p class="text-sm text-gray-500">Commande</p>
              <p class="font-semibold">#{{ order.id }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Date</p>
              <p class="font-semibold">{{ new Date(order.created_at).toLocaleDateString() }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Total</p>
              <p class="font-semibold">{{ order.total_price }} €</p>
            </div>
            <div>
              <!-- <span :class="['badge', getStatusBadgeClass(order.status)]">
              {{ order.status }}
            </span> -->
            </div>
          </div>

          <!-- Détails de la commande -->
          <Link :href="route('orders.show', order.id)" class="p-6 block">
            <h3 class="font-semibold mb-4">Détails de la commande</h3>
            <div class="space-y-4">
              <div v-for="(product, index) in order.products" :key="index" class="flex justify-between items-center">
                <div class="flex gap-6 items-center">
                  <div class="w-24 h-24 flex-shrink-0">
                    <img :src="'/storage/' + product.primary_image_url" :alt="product.name" class="w-full h-full object-cover rounded-lg">
                  </div>
                  <div>
                    <p class="font-medium">{{ product.name }}</p>
                    <p class="text-sm text-gray-500">Quantité: {{ product.pivot.quantity }}</p>
                  </div>
                </div>
                <p class="font-medium">{{ product.pivot.unitary_price * product.pivot.quantity }} €</p>
              </div>
            </div>
          </Link>
        </div>
      </div>
    </main>
  </AppLayout>
</template>