<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\Pivot;

class OrderProduct extends Pivot
{
    protected function totalPrice(): Attribute
    {
        return Attribute::make(
            get: fn (string $value) => $value * $this->quantity,
            set: fn (string $value) => $value,
        );
    }
}
