<?php

namespace App\Http\Controllers\Cart;

use App\Http\Controllers\Controller;
use Inertia\Inertia;
use App\Models\Cart;
use Illuminate\Http\Request;

class ShowCartController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $customer = $request->user()->customer;
        $cart = $customer->cart?->load('products');
        $addresses = $customer->addresses;

        return Inertia::render('Cart/Index', [
            'cart' => $cart,
            'addresses' => $addresses
        ]);
    }
}
