<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Order;
use App\Model\OrderDetails;
use DB;
use DateTime;

class OrderController extends Controller
{
   public function allorder()
   {
   		$date = date('d/m/Y');
   		$order = Order::with('customer')->where('order_date', $date)->latest('id')->get();
        return response()->json($order);
   }


   public function order($id)
   {
   	/*$order = Order::with('customer')->where('id', $id)->first();
   	 return response()->json($order);*/

   	 $order = DB::table('orders')
   	 			->join('customers', 'orders.customer_id', 'customers.id')
   	 			->where('orders.id', $id)
   	 			->select('customers.name', 'customers.phone', 'customers.address', 'orders.*')
   	 			->first();
   	 	return response()->json($order);
   }

   public function orderDetails($id)
   {
   	 $order_details = OrderDetails::where('order_id', $id)->with('product')->get();
   	 return response()->json($order_details);
   }

   public function searchOrder(Request $request)
   {

         $search = \Request::get('query');

         $newdate = new DateTime($search);

         $done = $newdate->format('d/m/Y');

         $order = Order::with('customer')->where('order_date', $done)->latest('id')->get();
        return response()->json($order);
   }
}
