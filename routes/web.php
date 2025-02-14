<?php

use App\Http\Controllers\Cart\AddItemController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ShowAllCategoryController;
use App\Http\Controllers\ShowAllProductController;
use App\Http\Controllers\ShowCategoryController;
use App\Http\Controllers\ShowProductController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/', HomeController::class)->name('home');

Route::get('/products/{product}', ShowProductController::class)->name('products.show');
Route::get('/products', ShowAllProductController::class)->name('products');

Route::get('/categories/{product}', ShowCategoryController::class)->name('categories.show');
Route::get('/categories', ShowAllCategoryController::class)->name('categories');

Route::post('/cart/add', AddItemController::class)->name('cart.add');

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
});
