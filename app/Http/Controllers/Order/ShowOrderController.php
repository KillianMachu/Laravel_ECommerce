<?php

namespace App\Http\Controllers\Order;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowOrderController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Order $order)
    {
        $customer = $request->user()->customer;


        if (!$customer->orders->contains($order)) {
            abort(404);
        }

        return Inertia::render('Order/Show', [
            'order' => $order->load('products', 'shippingAddress')
        ]);
    }
}
