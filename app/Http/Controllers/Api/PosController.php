<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Product;

class PosController extends Controller
{
    public function getProduct($id)
    {
    	$product = Product::where('category_id', $id)->get();
    	return response()->json($product);
    }
}
