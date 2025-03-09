<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductImage>
 */
class ProductImageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'product_id' => Product::factory(),
            'image_url' => $this->fakeImage(),
            'is_primary' => $this->faker->boolean(20),
            'position' => $this->faker->numberBetween(1, 10),
        ];
    }

    public function fakeImage(): string
    {
        $image = 'https://picsum.photos/640/480?random=' . rand(1,100);
        $filename = 'products/' . uniqid() . '.jpg';
        $imageContent = file_get_contents($image);
        Storage::disk('public')->put($filename, $imageContent);

        return $filename;
    }
}
