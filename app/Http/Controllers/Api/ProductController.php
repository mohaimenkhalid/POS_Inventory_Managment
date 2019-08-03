<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Product;
use Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
   public function index()
    {
        $product = Product::with('supplier', 'category')->orderBy('id', 'DESC')->get();
        return response()->json($product);
    }
    

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'product_name' => ['required', 'string', 'max:255'],
            'category_id' => ['required'],
            'root' => ['required', 'string'],
            'selling_price' => ['required'],
            'product_quantity' => ['required'],
           
        ]);

       if ($request->image) {

            $strpos = strpos($request->image, ';'); //get string position
            $sub = substr($request->image, 0, $strpos); // cut string 0 to ';' position
            $ex = explode('/', $sub)[1]; //explode from '/'
            $name = time().'.'.$ex; //time() gives a name and ex get a extension and then join here
            $location = ('backend/images/product/'.$name);  // which location we want to save
            $img = Image::make($request->image)->resize(240,200); //make image
            $img->save($location); //save to location

            $product = new Product;
            $product->product_name = $request->product_name;
            $product->category_id = $request->category_id;
            $product->supplier_id = $request->supplier_id;
            $product->product_code = $request->product_code;
            $product->root = $request->root;
            $product->buying_price = $request->buying_price;
            $product->selling_price = $request->selling_price;
            $product->buying_date = $request->buying_date;
            $product->product_quantity = $request->product_quantity;
            $product->image = $location;
            $product->save();
       }else{

            $product = new Product;
            $product->product_name = $request->product_name;
            $product->category_id = $request->category_id;
            $product->supplier_id = $request->supplier_id;
            $product->product_code = $request->product_code;
            $product->root = $request->root;
            $product->buying_price = $request->buying_price;
            $product->selling_price = $request->selling_price;
            $product->buying_date = $request->buying_date;
            $product->product_quantity = $request->product_quantity;
            $product->save();


       }



    }

    

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::find($id);
        return response()->json($product);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   public function update(Request $request, $id)
    {

         $validatedData = $request->validate([
            'product_name' => ['required', 'string', 'max:255'],
            'category_id' => ['required'],
            'root' => ['required', 'string'],
            'selling_price' => ['required'],
            'product_quantity' => ['required'],
           
        ]);

        $product = Product::find($id);

        if ($request->image != $product->image) {  //database image and edited image  if didn't match new image insert and old image unlink

            $strpos = strpos($request->image, ';'); //get string position
            $sub = substr($request->image, 0, $strpos); // cut string 0 to ';' position
            $ex = explode('/', $sub)[1]; //explode from '/'
            $name = time().'.'.$ex; //time() gives a name and ex get a extension and then join here
            $location = ('backend/images/product/'.$name);  // which location we want to save
            $img = Image::make($request->image)->resize(240,200); //make image
            $img->save($location); //save to location

            $image_path = public_path($product->image);
                if (file_exists($image_path)) {
                    @unlink($image_path);
                }

        }else{

            $location = $product->image;
        }

        
            $product->product_name = $request->product_name;
            $product->category_id = $request->category_id;
            $product->supplier_id = $request->supplier_id;
            $product->product_code = $request->product_code;
            $product->root = $request->root;
            $product->buying_price = $request->buying_price;
            $product->selling_price = $request->selling_price;
            $product->buying_date = $request->buying_date;
            $product->product_quantity = $request->product_quantity;
            $product->image = $location;
            $product->save();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   public function destroy($id)
    {
        $product = Product::find($id);
        $image_path = public_path($product->image);
        if (file_exists($image_path)) {
            @unlink($image_path);
        }
        $product->delete();
    }
}
