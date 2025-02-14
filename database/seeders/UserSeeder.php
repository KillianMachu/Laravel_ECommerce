<?php

namespace Database\Seeders;

use App\Models\Address;
use App\Models\Customer;
use App\Models\Order;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::factory()->create([
            'name' => 'Admin',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'), // Change le mot de passe après
            'role' => 'admin',
        ]);

        // Créer 10 utilisateurs aléatoires avec le rôle customer
        User::factory(10)
        ->has(Customer::factory()
            ->has(Address::factory(2))
            ->has(Order::factory(rand(1, 3)))
        )
        ->create([
            'role' => 'customer',
        ])
        ->each(function ($user) {
        
            $addresses = $user->customer->addresses;
    
            if ($addresses->isNotEmpty()) {
                $addresses->first()->update(['is_default' => true]);
            }
        });
    }
}
