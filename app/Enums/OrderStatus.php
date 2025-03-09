<?php

namespace App\Enums;

enum OrderStatus: string
{
    case PENDING = 'pending';    // Commande en attente
    case PROCESSING = 'processing';  // Commande en préparation
    case SHIPPED = 'shipped';    // Commande expédiée
    case DELIVERED = 'delivered';  // Commande livrée
    case CANCELLED = 'cancelled';  // Commande annulée
    case REFUNDED = 'refunded'; // Commande remboursée

    public function label(): string
    {
        return match ($this) {
            self::PENDING => 'En attente',
            self::PROCESSING => 'En préparation',
            self::SHIPPED => 'Expédié',
            self::DELIVERED => 'Livré',
            self::CANCELLED => 'Annulé',
            self::REFUNDED => 'Remboursé',
        };
    }
}