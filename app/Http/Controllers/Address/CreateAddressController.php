<?php

namespace App\Http\Controllers\Address;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CreateAddressController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'recipient' => 'required|string|max:255',
            'street' => 'required|string|max:255',
            'postal_code' => 'required|numeric',
            'city' => 'required|string|max:255',
            'phone' => 'required|numeric',
            'is_default' => 'required|boolean',
        ]);

        if ($request->is_default) {
            $request->user()->customer->addresses()->update(['is_default' => false]);
        }

        $request->user()->customer->addresses()->create($request->all());

        return redirect()->back()->with('success', 'Adresse créée avec succès');
    }
}
