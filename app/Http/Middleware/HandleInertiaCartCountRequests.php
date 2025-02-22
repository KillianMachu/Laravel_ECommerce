<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Inertia\Middleware;

class HandleInertiaCartCountRequests extends Middleware
{
    public function share(Request $request): array
    {
        return array_merge(parent::share($request), [
            'cartCount' => fn () => auth()->user()->customer?->cart?->products_count ?? 0,
        ]);
    }
}