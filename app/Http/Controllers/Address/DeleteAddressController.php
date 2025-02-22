<?php

namespace App\Http\Controllers\Address;

use App\Http\Controllers\Controller;
use App\Models\Address;
use Illuminate\Http\Request;

class DeleteAddressController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Address $address)
    {
        $address->delete();

        return redirect()->back()->with('success', 'Adresse supprimée avec succès');
    }
}
