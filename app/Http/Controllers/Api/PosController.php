<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Product;
use App\Model\Order;
use App\Model\OrderDetails;
use App\Model\Pos;
use DB;

class PosController extends Controller
{
    public function getProduct($id)
    {
    	$product = Product::where('category_id', $id)->get();
    	return response()->json($product);
    }

    public function ordernow(Request $request)
    {



    	$validatedData = $request->validate([
            'customer_id' => ['required'],
            'payby' => ['required'] 
        ]);

        $data = array();

//orders add
        $data['customer_id']= $request->customer_id;
        $data['qty'] = $request->qty;
        $data['sub_total'] = $request->subtotal;
        $data['vat']= $request->vat;
        $data['total'] = $request->total;
        $data['pay']= $request->pay;
        $data['due'] = $request->due;
        $data['payby'] = $request->payby;
        $data['order_date'] = date('d/m/Y');
        $data['order_month'] = date('F');
        $data['order_year'] = date('Y');
        $order_id =  DB::table('orders')->insertGetId($data);


        $cart_product = Pos::all();
        $odata= array();
        foreach ($cart_product as $cart_product) {
                
        	$odata['order_id'] = $order_id;
        	$odata['product_id'] = $cart_product->pro_id;
        	$odata['pro_qantity'] = $cart_product->pro_quantity;
        	$odata['pro_price'] = $cart_product->pro_price;
        	$odata['sub_total'] = $cart_product->sub_total;
        	DB::table('order_details')->insert($odata);

        	//calculate total stock after order
	        $total_stock = Product::where('id', $cart_product->pro_id)->first()->product_quantity;
	        $cart_quantity = $cart_product->pro_quantity;
	        $remain_quantity = $total_stock - $cart_quantity;

	        $final_stock = Product::find( $cart_product->pro_id);
	        $final_stock->product_quantity = $remain_quantity;
	        $final_stock->save();

        }

        //clear cart..
        Pos::truncate();
    }


    public function todaySell()
    {
        $date = date('d/m/Y');
        $sell = Order::where('order_date', $date)->sum('total');
        return response()->json($sell);
    }

    public function todayIncome()
    {
        $date = date('d/m/Y');
        $income = Order::where('order_date', $date)->sum('pay');
        return response()->json($income);
    }

    public function sale()
    {
        $date = date('d/m/Y');
        $sale = Order::where('order_date', $date)->sum('qty');
        return response()->json($sale);
    }

    public function due()
    {
        $date = date('d/m/Y');
        $due = Order::where('order_date', $date)->sum('due');
        return response()->json($due);
    }

    public function stockout()
    {
        $product = Product::where('product_quantity', 0)->get();
        return response()->json($product);
    }
}
