<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class UpdateItemController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Product $product)
    {
        $request->validate([
            'quantity' => 'required|integer|min:1'
        ]);
        
        $cart = $request->user()->customer->cart()->first();
        $cartProduct = $cart->products()->where('product_id', $product->id)->first();
        $cartProduct->pivot->update([
            'quantity' => $request->quantity
        ]);

        return back();
    }
}
