<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Pos;
use App\Model\Product;
use App\Model\Extra;

class CartController extends Controller
{
    public function AddToCart(Request $request, $id)
    {
    	

    	$check = Pos::where('pro_id', $id)->first();

    	if ($check) {

    		//send product id with $id
    		$cart = Pos::where('pro_id', $id)->increment('pro_quantity');
    		//subtotal count after Increase
		    	$product = Pos::where('pro_id', $id)->first();
		    	$cart_id = $product->id;
		    	$sub_total = $product->pro_quantity * $product->pro_price;

		    	$update_subtotal = Pos::find($cart_id);
		    	$update_subtotal->sub_total = $sub_total;
		    	$update_subtotal->save();

    		
    	}else{
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

    public function cartIncrement($id)
    {
    	$cart = Pos::where('id', $id)->increment('pro_quantity');

    	//subtotal count after increase
    	$product = Pos::where('id', $id)->first();
    	$sub_total = $product->pro_quantity * $product->pro_price;

    	$update_subtotal = Pos::find($id);
    	$update_subtotal->sub_total = $sub_total;
    	$update_subtotal->save();

    }

    public function cartDecrement($id)
    {
    	$cart = Pos::where('id', $id)->decrement('pro_quantity');

    	//subtotal count after Decrease
    	$product = Pos::where('id', $id)->first();
    	$sub_total = $product->pro_quantity * $product->pro_price;

    	$update_subtotal = Pos::find($id);
    	$update_subtotal->sub_total = $sub_total;
    	$update_subtotal->save();
    }

    public function vats()
    {
        $vat = Extra::first();

        return response()->json($vat);
    }
}
