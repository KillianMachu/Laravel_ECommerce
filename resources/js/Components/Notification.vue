<script setup>
import { ShieldCheckIcon, TruckIcon, XMarkIcon, CheckCircleIcon, ExclamationCircleIcon, InformationCircleIcon } from '@heroicons/vue/24/outline';
import { ref, computed, watch } from 'vue';
import { usePage } from '@inertiajs/vue3';
const page = usePage();

const notification = ref({ show: false, message: '', type: 'success' })

const showNotification = () => {
  if (page.props.flash.success) {
    notification.value = { show: true, message: page.props.flash.success, type: 'success' }
  } else if (page.props.flash.error) {
    notification.value = { show: true, message: page.props.flash.error, type: 'error' }
  } else if (page.props.flash.info) {
    notification.value = { show: true, message: page.props.flash.info, type: 'info' }
  }
  setTimeout(() => {
    notification.value.show = false
  }, 3000)
}

const getNotificationIcon = (type) => {
  switch (type) {
    case 'success':
      return CheckCircleIcon
    case 'error':
      return ExclamationCircleIcon
    case 'info':
      return InformationCircleIcon
    default:
      return CheckCircleIcon
  }
}

const notificationClass = computed(() => {
  return {
    'notification-success': notification.value.type === 'success',
    'notification-error': notification.value.type === 'error',
    'notification-info': notification.value.type === 'info',
  };
});

watch(() => page.props.flash, () => {
    showNotification();
})
</script>


<template>
    <Transition name="notification">
        <div v-if="notification.show" :class="[
          'notification',
          notificationClass
        ]">
          <div class="flex items-center gap-2">
            <component :is="getNotificationIcon(notification.type)" class="w-5 h-5" />
            <span>{{ notification.message }}</span>
            <button @click="notification.show = false" class="text-white/80 hover:text-white">
              <XMarkIcon class="w-5 h-5" />
            </button>
          </div>
        </div>
      </Transition>
</template>
