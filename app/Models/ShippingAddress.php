<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ShippingAddress extends Model
{
    use HasFactory;

    protected $fillable = [
        'street',
        'postal_code',
        'city',
    ];

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }
    
    
}
