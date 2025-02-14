<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name')->comment('Product name');
            $table->text('description')->comment('Product description');
            $table->integer('price')->comment('Price in cents');
            $table->integer('discount_price')->nullable()->comment('Discount price in cents');
            $table->integer('stock')->default(0)->comment('Stock quantity');
            $table->boolean('is_active')->default(true)->comment('Product is active');
            $table->string('slug')->unique()->comment('Product slug');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
