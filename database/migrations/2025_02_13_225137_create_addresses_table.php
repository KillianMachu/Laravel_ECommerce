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
        Schema::create('addresses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('customer_id')->constrained()->onDelete('cascade');
            $table->string('name')->comment('Address name');
            $table->string('recipient')->comment('Recipient name');
            $table->string('street')->comment('Street');
            $table->string('postal_code')->comment('Postal code');
            $table->string('city')->comment('City');
            $table->string('phone')->comment('Phone');
            $table->boolean('is_default')->default(false)->comment('Is default address');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('addresses');
    }
};
