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
    public function __invoke(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1'
        ]);

        // Récupérer ou créer le panier pour l'utilisateur
        $cart = Cart::firstOrCreate([
            'user_id' => auth()->id(),
            'status' => 'active'
        ]);

        // Vérifier si le produit existe déjà dans le panier
        $cartItem = $cart->items()->where('product_id', $validated['product_id'])->first();

        if ($cartItem) {
            // Mettre à jour la quantité si le produit existe déjà
            $cartItem->update([
                'quantity' => $cartItem->quantity + $validated['quantity']
            ]);
        } else {
            // Créer un nouvel item dans le panier
            $product = Product::find($validated['product_id']);
            $cart->items()->create([
                'product_id' => $validated['product_id'],
                'quantity' => $validated['quantity'],
                'price' => $product->price
            ]);
        }

        return back()->with('success', 'Produit ajouté au panier');
    }
}
