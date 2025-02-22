<?php

namespace App\Http\Controllers\Address;

use App\Http\Controllers\Controller;
use App\Models\Address;
use Illuminate\Http\Request;

class UpdateAddressController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Address $address)
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

        $address->update($request->all());

        return redirect()->back()->with('success', 'Adresse mise à jour avec succès');
    }
}
