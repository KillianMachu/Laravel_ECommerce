<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'price',
        'discount_price',
        'stock',
        'is_active',
        'slug',
    ];

    protected function price(): Attribute
    {
        return Attribute::make(
            get: fn(string $value) => $value / 100,
            set: fn(string $value) => $value * 100,
        );
    }

    protected static function booted()
    {
        static::saving(function ($product) {
            if (!$product->slug) {
                $product->slug = Str::slug($product->name);
            }
        });

        static::deleting(function ($image) {
            if ($image->image_url) {
                $path = str_replace('/storage/products', '', $image->image_url); // Nettoyer le chemin
                if (Storage::disk('public')->exists($path)) {
                    Storage::disk('public')->delete($path);
                }
            }
        });
    }

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class)->withTimestamps();
    }

    public function images(): HasMany
    {
        return $this->hasMany(ProductImage::class);
    }

    public function carts(): BelongsToMany
    {
        return $this->belongsToMany(Cart::class)
            ->withPivot('quantity')
            // ->withPivot('quantity', 'total_price')
            ->withTimestamps();
    }

    public function orders(): BelongsToMany
    {
        return $this->belongsToMany(Order::class);
    }

    public function primaryImage()
    {
        return $this->hasOne(ProductImage::class)->where('is_primary', true);
    }

    protected function primaryImageUrl(): Attribute
    {
        return Attribute::make(
            get: fn() => $this->primaryImage()?->image_url ?? $this->images()->first()?->image_url,
        );
    }

    protected $appends = ['primary_image_url']; // Important ! N'oubliez pas d'ajouter l'attribut ici
}
