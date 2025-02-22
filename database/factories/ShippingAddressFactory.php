<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ShippingAddress>
 */
class ShippingAddressFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->name,
            'recipient' => $this->faker->name,
            'street' => $this->faker->streetAddress,
            'postal_code' => $this->faker->postcode,
            'phone' => $this->faker->phoneNumber,
            'city' => $this->faker->city,
        ];
    }
}
