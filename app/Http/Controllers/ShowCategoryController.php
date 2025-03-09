<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ShowCategoryController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request, Category $category)
    {
        $category->load(['products' => function ($product) {
            $product->where('is_active', true);
        }]);
        
        return Inertia::render('Category/Show', [
            'category' => $category,
        ]);
    }
}
