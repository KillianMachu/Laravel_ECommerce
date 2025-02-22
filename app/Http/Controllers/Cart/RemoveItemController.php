<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class RemoveItemController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Product $product)
    {
        $cart = $request->user()->customer->cart()->first();
        $cart->products()->detach($product->id);

        return back();
    }
}
