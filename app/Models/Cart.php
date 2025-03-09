<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Cart extends Model
{
    use HasFactory;

    protected $fillable = [
        'customer_id',
    ];

    protected $appends = ['total_price', 'products_count'];

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class);
    }

    public function products(): BelongsToMany
    {
        return $this->belongsToMany(Product::class, 'cart_product', 'cart_id', 'product_id')
            ->withPivot('quantity', 'product_id')
            ->withTimestamps();
    }
    
    protected function totalPrice(): Attribute
    {
        return Attribute::make(
            get: fn () => $this->products->sum(function ($product) {
                return $product->pivot->quantity * ($product->discount_price ?? $product->price);
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
