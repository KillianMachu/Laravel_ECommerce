<?php

namespace App\Http\Controllers\Address;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ListAddressesController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $customer = $request->user()->customer;
        $addresses = $customer->addresses;

        return Inertia::render('Address/ListAddresses', [
            'addresses' => $addresses
        ]);
    }
}
