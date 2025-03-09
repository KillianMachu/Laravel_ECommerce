<?php

namespace Database\Factories;

use App\Models\Cart;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cart>
 */
class CartFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'customer_id' => Customer::factory(),
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function (Cart $cart) {
            $products = Product::inRandomOrder()->take(rand(1, 4))->get();

            foreach ($products as $product) {
                $quantity = $this->faker->numberBetween(1, 5);

                $cart->products()->attach($product->id, [
                    'quantity' => $quantity,
                ]);
            }
        });
    }
}
