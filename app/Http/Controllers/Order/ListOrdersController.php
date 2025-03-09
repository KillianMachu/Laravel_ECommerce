<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ListOrdersController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $customer = $request->user()->customer;

        return Inertia::render('Order/Index', [
            'orders' => $customer->orders->load('products', 'shippingAddress')
        ]);
    }
}
