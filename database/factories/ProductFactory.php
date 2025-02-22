<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->words(3, true);
        $price = $this->faker->numberBetween(100, 1000);
        
        return [
            'name' => $name,
            'description' => $this->faker->paragraph(),
            'price' => $price,
            'discount_price' => $this->faker->boolean(50) ? round($price * (1 - $this->faker->numberBetween(10, 50) / 100), 2) : null,
            'stock' => $this->faker->numberBetween(0, 100),
            'is_active' => $this->faker->boolean(80),
            'slug' => Str::slug($name),
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function ($product) {
            $product->categories()->attach(
                Category::inRandomOrder()->limit(rand(1,3))->pluck('id')
            );
        });
    }
}
