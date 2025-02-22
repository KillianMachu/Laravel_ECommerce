<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\Pivot;

class CartProduct extends Pivot
{    
    protected $appends = ['total_price'];
    
    protected function totalPrice(): Attribute
    {
        return Attribute::make(
            get: fn () => $this->product->price * $this->quantity
        );
    }
    
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
