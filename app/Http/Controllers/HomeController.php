<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Foundation\Application;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
// use Illuminate\Routing\Route;
use Inertia\Inertia;

class HomeController extends Controller
{
    /**
     * Handle the incoming request.
     */
    public function __invoke(Request $request)
    {
        $popularProducts = Product::where('is_active', true)
        ->withSum('orders as total_order_quantity', 'order_product.quantity')
        ->orderBy('total_order_quantity', 'desc')
        ->take(4)
        ->get();

        $categories = Category::inRandomOrder()->limit(4)->get();

        return Inertia::render('Home', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'popularProducts' => $popularProducts,
        'categories' => $categories,
        ]);
    }
}