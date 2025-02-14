<?php

namespace Database\Factories;

use App\Enums\OrderStatus;
use App\Models\Order;
use App\Models\Product;
use App\Models\ShippingAddress;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $status = OrderStatus::cases();
        $randomStatus = $status[array_rand($status)]->value;

        return [
            'total_price' => $this->faker->numberBetween(100, 1000),
            'status' => $randomStatus,
            'shipping_address_id' => ShippingAddress::factory(),
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function (Order $order) {
            $products = Product::inRandomOrder()->take(3)->get();

            $total = 0;
            foreach ($products as $product) {
                $quantity = $this->faker->numberBetween(1, 5);
                $price = $product->price;

                $order->products()->attach($product->id, [
                    'quantity' => $quantity,
                    'total_price' => $price,
                ]);
                $total += $price * $quantity;
            }

            $order->update(['total_price' => $total]);
            
        });
    }
    

}
