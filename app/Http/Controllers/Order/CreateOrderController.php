<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Models\ShippingAddress;
use Illuminate\Http\Request;

class CreateOrderController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $request->validate([
            'address_id' => 'required|exists:addresses,id',
        ]);

        $customer = $request->user()->customer;
        $cart = $customer->cart()->first();

        if (!$cart || $cart->products->isEmpty()) {
            return back()->with('error', 'Votre panier est vide');
        }

        foreach ($cart->products as $product) {
            if ($product->stock < $product->pivot->quantity) {
                return back()->with('error', 'Stock insuffisant pour le produit ' . $product->name);
            }
        }

        $address = $customer->addresses()->find($request->address_id);

        if (!$address) {
            return back()->with('error', 'Adresse invalide');
        }

        $shippingAddress = ShippingAddress::firstOrCreate([
            'name' => $address->name,
            'recipient' => $address->recipient,
            'street' => $address->street,
            'postal_code' => $address->postal_code,
            'city' => $address->city,
            'phone' => $address->phone,
        ]);

        $order = $request->user()->customer->orders()->create([
            "total_price" => $cart->total_price,
            "shipping_address_id" => $shippingAddress->id,
        ]);

        foreach ($cart->products as $product) {
            $order->products()->attach($product->id, [
                'quantity' => $product->pivot->quantity,
                'unitary_price' => $product->discount_price ?? $product->price,
            ]);

            $product->decrement('stock', $product->pivot->quantity);
        }

        $cart->products()->detach();
        $cart->delete();

        return redirect()->route('orders.show', $order)->with('success', 'Commande créée avec succès');
    }
}
