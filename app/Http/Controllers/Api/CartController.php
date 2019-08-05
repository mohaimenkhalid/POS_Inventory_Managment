<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Pos;
use App\Model\Product;

class CartController extends Controller
{
    public function AddToCart(Request $request, $id)
    {
    	$data = Product::where('id', $id)->first();
    	$product_id = $id;
    	$product_name = $data->product_name;
    	$product_quantiry = 1;
    	$product_price = $data->selling_price;
    	$sub_total = $data->selling_price;

    	$cart = new Pos;
    	$cart->pro_id = $product_id;
    	$cart->pro_name = $product_name;
    	$cart->pro_quantity = $product_quantiry;
    	$cart->pro_price = $product_price;
    	$cart->sub_total = $sub_total;
    	$cart->save();

    }


    public function cartProduct()
    {
    	$cart = Pos::all();
    	return response()->json($cart);
    }

    public function removeCartItem($id)
    {

    	$cart = Pos::find($id);
    	$cart->delete();
    }
}
