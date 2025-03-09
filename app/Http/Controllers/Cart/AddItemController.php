<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Http\Request;

class AddItemController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Product $product)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1'
        ]);

        if ($request->quantity > $product->stock) {
            return back()->with('error', 'Quantité insuffisante en stock');
        }

        $cart = $request->user()->customer->cart()->firstOrCreate();

        $cartProduct = $cart->products()->where('product_id', $product->id)->first();

        if ($cartProduct) {
            if ($request->quantity + $cartProduct->pivot->quantity > $product->stock) {
                return back()->with('error', 'Quantité insuffisante en stock');
            }
            $cartProduct->pivot->update([
                'quantity' => $cartProduct->pivot->quantity + $request->quantity
            ]);
        } else {
            $cart->products()->attach($product->id,[
                'quantity' => $request->quantity
            ]);
        }

        return back()->with('success', 'Produit ajouté au panier');
    }
}
