<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowProductController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Product $product)
    {
        if (!$product->is_active) {
            abort(404);
        }

        return Inertia::render('Product/Show', [
            'product' => $product->load('images'),
        ]);
    }
}
