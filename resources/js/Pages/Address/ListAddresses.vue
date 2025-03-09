<script setup>
import { ref, watch, onMounted, onUnmounted, computed } from 'vue'

import { PlusIcon, PencilIcon, TrashIcon, XMarkIcon, StarIcon } from '@heroicons/vue/24/outline'
import { StarIcon as StarIconSolid } from '@heroicons/vue/24/solid'
import AppLayout from '@/Layouts/AppLayout.vue'
import { router, usePage } from '@inertiajs/vue3';

const page = usePage();
const isAuthenticated = computed(() => page.props.auth.user !== null);

const props = defineProps({
  addresses: {
    type: Array,
    required: true
  }
})

const newAddress = ref({
  name: '',
  recipient: '',
  street: '',
  postal_code: '',
  city: '',
  phone: '',
  is_default: false
})

const showAddForm = ref(false)
const showDeleteConfirm = ref(false)
const addressToDelete = ref(null)
const editingAddress = ref(null)

const setDefault = (addressId) => {
  if (!isAuthenticated.value) {
    window.location = route('login');
    return;
  }

  router.post(route('addresses.set-default', { address: addressId }), {}, {
    preserveScroll: true,
  });
};

const addAddress = () => {
  if (!isAuthenticated.value) {
    window.location = route('login');
    return;
  }

  console.log(newAddress.value)

  router.post(route('addresses.create'), {
    ...newAddress.value
  }, {
    preserveScroll: true,
    onSuccess: () => {
      resetForm()
    }
  });
};

const confirmDelete = (addressId) => {
  addressToDelete.value = addressId
  showDeleteConfirm.value = true
}

const deleteAddress = () => {
  if (!isAuthenticated.value) {
    window.location = route('login');
    return;
  }

  router.delete(route('addresses.delete', { address: addressToDelete.value }), {
    preserveScroll: true,
    onSuccess: () => {
      addressToDelete.value = null
      showDeleteConfirm.value = false;
    },
  });
};

const confirmEdit = (address) => {
  editingAddress.value = address.id
  newAddress.value = { 
    ...address,
    is_default: Boolean(address.is_default)
  }
  showAddForm.value = true
}

const editAddress = () => {
  if (!isAuthenticated.value) {
    window.location = route('login');
    return;
  }

  console.log(editingAddress.value)

  router.put(route('addresses.update', { address: editingAddress.value }), {
    ...newAddress.value
  }, {
    preserveScroll: true,
    onSuccess: () => {
      console.log("Adresse mise à jour avec succès")
      resetForm()
    },
    onError: (errors) => {
      console.log("Erreurs de validation :", errors);
    }
  });
};

const handleSubmit = () => {
  if (editingAddress.value) {
    editAddress()
  } else {
    addAddress()
  }
}

const resetForm = () => {
  newAddress.value = {
    name: '',
    recipient: '',
    street: '',
    postal_code: '',
    city: '',
    phone: '',
    is_default: false
  }
  showAddForm.value = false
  editingAddress.value = null
  searchQuery.value = ''
  searchResults.value = []
}




const searchResults = ref([])
const isSearching = ref(false)


const searchQuery = ref('')

watch(showAddForm, (newValue) => {
  if (newValue) {
    document.body.style.overflow = 'hidden'
  } else {
    document.body.style.overflow = ''
  }
})

const searchAddress = async (query) => {
  if (query.length < 3) {
    searchResults.value = []
    return
  }

  isSearching.value = true
  try {
    const response = await fetch(`https://api-adresse.data.gouv.fr/search/?q=${encodeURIComponent(query)}&limit=5`)
    const data = await response.json()
    searchResults.value = data.features.map((feature) => ({
      label: feature.properties.label,
      street: feature.properties.name,
      postal_code: feature.properties.postcode,
      city: feature.properties.city
    }))
  } catch (error) {
    console.error('Erreur lors de la recherche d\'adresse:', error)
    searchResults.value = []
  }
  isSearching.value = false
}

const selectAddress = (address) => {
  newAddress.value.street = address.street
  newAddress.value.postal_code = address.postal_code
  newAddress.value.city = address.city
  searchResults.value = []
  searchQuery.value = ''
}

watch(searchQuery, (newValue) => {
  if (newValue) {
    searchAddress(newValue)
  } else {
    searchResults.value = []
  }
})

</script>

<template>
  <AppLayout>
    <main class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8 py-8">
      <div class="flex justify-between items-center mb-8">
        <h1 class="page-title mb-0">Mes Adresses</h1>
        <button @click="showAddForm = true" class="btn-primary flex items-center gap-2">
          <PlusIcon class="w-5 h-5" />
          Ajouter une adresse
        </button>
      </div>

      <!-- Liste des adresses -->
      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div v-for="address in addresses" :key="address.id" class="card p-6">
          <div class="flex justify-between items-start mb-4">
            <div class="flex items-start gap-3">
              <button @click="setDefault(address.id)"
                :title="address.is_default ? 'Adresse par défaut' : 'Définir comme adresse par défaut'" class="mt-1">
                <component :is="address.is_default ? StarIconSolid : StarIcon"
                  :class="['w-5 h-5', address.is_default ? 'text-yellow-400' : 'text-gray-400 hover:text-yellow-400']" />
              </button>
              <div>
                <h3 class="font-semibold text-lg">{{ address.name }}</h3>
                <span v-if="address.is_default" class="badge badge-success text-xs">
                  Adresse par défaut
                </span>
              </div>
            </div>
            <div class="flex gap-2">
              <button @click="confirmEdit(address)"
                class="p-2 text-gray-400 hover:text-indigo-600 rounded-full hover:bg-gray-100"
                title="Modifier l'adresse">
                <PencilIcon class="w-5 h-5" />
              </button>
              <button @click="confirmDelete(address.id)"
                class="p-2 text-gray-400 hover:text-red-500 rounded-full hover:bg-gray-100" title="Supprimer l'adresse">
                <TrashIcon class="w-5 h-5" />
              </button>
            </div>
          </div>

          <div class="space-y-2 text-gray-600">
            <p>{{ address.recipient }}</p>
            <p>{{ address.street }}</p>
            <p>{{ address.postal_code }} {{ address.city }}</p>
            <p>{{ address.phone }}</p>
          </div>
        </div>
      </div>

      <!-- Modal d'ajout/modification d'adresse -->
      <Transition enter-active-class="transition ease-out duration-200" enter-from-class="opacity-0"
        enter-to-class="opacity-100" leave-active-class="transition ease-in duration-150" leave-from-class="opacity-100"
        leave-to-class="opacity-0">
        <div v-if="showAddForm" class="fixed inset-0 bg-black bg-opacity-50 z-50" @click="resetForm">
          <div class="fixed inset-0 flex items-center justify-center p-4">
            <div class="bg-white rounded-xl max-w-lg w-full p-8 relative shadow-xl transform transition-all"
              @click.stop>
              <div class="flex justify-between items-center mb-6 border-b pb-4">
                <h2 class="text-2xl font-bold text-gray-900">
                  {{ editingAddress ? 'Modifier l\'adresse' : 'Ajouter une adresse' }}
                </h2>
                <button @click="resetForm" class="text-gray-400 hover:text-gray-500 transition-colors">
                  <XMarkIcon class="w-6 h-6" />
                </button>
              </div>

              <form @submit.prevent="handleSubmit" class="space-y-6">
                <div class="grid grid-cols-2 gap-6">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nom de l'adresse</label>
                    <input type="text" v-model="newAddress.name" class="input" placeholder="ex: Domicile" required>
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Destinataire</label>
                    <input type="text" v-model="newAddress.recipient" class="input" placeholder="Nom et prénom"
                      required>
                  </div>
                </div>

                <div class="relative">
                  <label class="block text-sm font-medium text-gray-700 mb-1">Rechercher une adresse</label>
                  <input type="text" v-model="searchQuery" class="input" placeholder="Commencez à taper une adresse...">

                  <div v-if="searchResults.length > 0"
                    class="absolute z-10 mt-1 w-full bg-white shadow-lg rounded-md border border-gray-200 max-h-60 overflow-auto">
                    <div v-for="result in searchResults" :key="result.label" @click="selectAddress(result)"
                      class="p-4 hover:bg-gray-50 cursor-pointer border-b last:border-b-0">
                      <p class="font-medium text-gray-900">{{ result.label }}</p>
                    </div>
                  </div>
                </div>

                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Rue</label>
                  <input type="text" v-model="newAddress.street" class="input" required>
                </div>

                <div class="grid grid-cols-2 gap-6">
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Code postal</label>
                    <input type="text" v-model="newAddress.postal_code" class="input" required>
                  </div>
                  <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Ville</label>
                    <input type="text" v-model="newAddress.city" class="input" required>
                  </div>
                </div>

                <div>
                  <label class="block text-sm font-medium text-gray-700 mb-1">Téléphone</label>
                  <input type="tel" v-model="newAddress.phone" class="input" placeholder="+33 6 12 34 56 78" required>
                  <p class="text-sm text-gray-500 mt-1">
                    Format: +33 6 12 34 56 78 ou 06 12 34 56 78
                  </p>
                </div>

                <div class="flex items-center">
                  <input type="checkbox" id="default" v-model="newAddress.is_default"
                    class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded">
                  <label for="default" class="ml-2 text-sm text-gray-700">
                    Définir comme adresse par défaut
                  </label>
                </div>

                <div class="flex justify-end gap-4 mt-8 pt-4 border-t">
                  <button type="button" @click="resetForm"
                    class="px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-md transition-colors">
                    Annuler
                  </button>
                  <button type="submit" class="btn-primary">
                    {{ editingAddress ? 'Modifier' : 'Ajouter' }}
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </Transition>

      <!-- Modal de confirmation de suppression -->
      <Transition enter-active-class="transition ease-out duration-200" enter-from-class="opacity-0"
        enter-to-class="opacity-100" leave-active-class="transition ease-in duration-150" leave-from-class="opacity-100"
        leave-to-class="opacity-0">
        <div v-if="showDeleteConfirm" class="fixed inset-0 bg-black bg-opacity-50 z-50"
          @click="showDeleteConfirm = false">
          <div class="fixed inset-0 flex items-center justify-center p-4">
            <div class="bg-white rounded-xl max-w-md w-full p-6 relative shadow-xl" @click.stop>
              <div class="text-center">
                <h3 class="text-lg font-medium text-gray-900 mb-4">
                  Confirmer la suppression
                </h3>
                <p class="text-sm text-gray-500 mb-6">
                  Êtes-vous sûr de vouloir supprimer cette adresse ? Cette action est irréversible.
                </p>
                <div class="flex justify-center gap-4">
                  <button @click="showDeleteConfirm = false"
                    class="px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-md transition-colors">
                    Annuler
                  </button>
                  <button @click="deleteAddress"
                    class="px-4 py-2 text-sm font-medium text-white bg-red-600 hover:bg-red-700 rounded-md transition-colors">
                    Supprimer
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </Transition>
    </main>
  </AppLayout>
</template>

<style scoped>
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-content-enter-active,
.modal-content-leave-active {
  transition: all 0.3s ease;
}

.modal-content-enter-from,
.modal-content-leave-to {
  opacity: 0;
  transform: scale(0.95);
}
</style>