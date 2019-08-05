<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Customer;
use Image;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customer = Customer::all();
        return response()->json($customer);
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
            'name' => ['required', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:20'],
            'address' => ['required'],
        ]);

       if ($request->photo) {

            $strpos = strpos($request->photo, ';'); //get string position
            $sub = substr($request->photo, 0, $strpos); // cut string 0 to ';' position
            $ex = explode('/', $sub)[1]; //explode from '/'
            $name = time().'.'.$ex; //time() gives a name and ex get a extension and then join here
            $location = ('backend/images/customer/'.$name);  // which location we want to save
            $img = Image::make($request->photo)->resize(240,200); //make image
            $img->save($location); //save to location

            $customer = new Customer;
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->photo = $location;
            $customer->save();
       }else{

            $customer = new Customer;
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->save();

       }


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $customer = Customer::find($id);
        return response()->json($customer);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
            'name' => ['required', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:20'],
            'address' => ['required'],
        ]);

        $customer = Customer::find($id);

        if ($request->photo != $customer->photo) {  //database image and edited image  if didn't match new image insert and old image unlink

            $strpos = strpos($request->photo, ';'); //get string position
            $sub = substr($request->photo, 0, $strpos); // cut string 0 to ';' position
            $ex = explode('/', $sub)[1]; //explode from '/'
            $name = time().'.'.$ex; //time() gives a name and ex get a extension and then join here
            $location = ('backend/images/customer/'.$name);  // which location we want to save
            $img = Image::make($request->photo)->resize(240,200); //make image
            $img->save($location); //save to location

            $image_path = public_path($customer->photo);
                if (file_exists($image_path)) {
                    @unlink($image_path);
                }

        }else{

            $location = $customer->photo;
        }

            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->photo = $location;
            $customer->save();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $customer = Customer::find($id);
        $image_path = public_path($customer->photo);
        if (file_exists($image_path)) {
            @unlink($image_path);
        }
        $customer->delete();
    }
}
