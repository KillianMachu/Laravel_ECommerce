<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'customer_id',
    ];

    protected $appends = ['total_price', 'products_count'];

    public function customer(): HasOne
    {
        return $this->hasOne(Customer::class);
    }

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class)
            ->using(CartProduct::class)
            ->withPivot('quantity')
            // ->withPivot('quantity', 'total_price')
            ->withTimestamps();
    }
    
    protected function totalPrice(): Attribute
    {
        return Attribute::make(
            get: fn () => $this->products->sum(function ($product) {
                return $product->pivot->quantity * $product->price;
            })
        );
    }

    protected function productsCount(): Attribute
    {
        return Attribute::make(
            get: fn () => $this->products->sum('pivot.quantity')
        );
    }
}
