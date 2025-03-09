<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->unique()->word();

        return [
            'name' => $name,
            'description' => $this->faker->paragraph(),
            'image_url' => $this->fakeImage(),
            'slug' => Str::slug($name),
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
