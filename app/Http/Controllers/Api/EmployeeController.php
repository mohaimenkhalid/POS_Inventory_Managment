<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Employee;
use Image;
class EmployeeController extends Controller
{



    /* public function __construct()
    {
        $this->middleware('JWT', ['except' => ['login', 'signup']] );
    }*/
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employee = Employee::all();
        return response()->json($employee);
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
            'email' => ['required', 'string', 'email', 'max:255', 'unique:employees'],
            'phone' => ['required', 'string', 'max:20'],
            'salary' => ['required'],
            'nid' => ['required'],
            'address' => ['required'],
            'joining_date' => ['required'],
           
        ]);

       if ($request->photo) {

            $strpos = strpos($request->photo, ';'); //get string position
            $sub = substr($request->photo, 0, $strpos); // cut string 0 to ';' position
            $ex = explode('/', $sub)[1]; //explode from '/'
            $name = time().'.'.$ex; //time() gives a name and ex get a extension and then join here
            $location = ('backend/images/employee/'.$name);  // which location we want to save
            $img = Image::make($request->photo)->resize(240,200); //make image
            $img->save($location); //save to location

            $employee = new Employee;
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->address = $request->address;
            $employee->joining_date = $request->joining_date;
            $employee->photo = $location;
            $employee->save();
       }else{

            $employee = new Employee;
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->address = $request->address;
            $employee->joining_date = $request->joining_date;
            $employee->save();


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
        $employee = Employee::find($id);
        return response()->json($employee);
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
            'email' => ['required', 'string', 'email', 'max:255'],
            'phone' => ['required', 'string', 'max:20'],
            'salary' => ['required'],
            'nid' => ['required'],
            'address' => ['required'],
            'joining_date' => ['required'],
           
        ]);

        $employee = Employee::find($id);

        if ($request->photo != $employee->photo) {  //database image and edited image  if didn't match new image insert and old image unlink

            $strpos = strpos($request->photo, ';'); //get string position
            $sub = substr($request->photo, 0, $strpos); // cut string 0 to ';' position
            $ex = explode('/', $sub)[1]; //explode from '/'
            $name = time().'.'.$ex; //time() gives a name and ex get a extension and then join here
            $location = ('backend/images/employee/'.$name);  // which location we want to save
            $img = Image::make($request->photo)->resize(240,200); //make image
            $img->save($location); //save to location

            $image_path = public_path($employee->photo);
                if (file_exists($image_path)) {
                    @unlink($image_path);
                }

        }else{

            $location = $employee->photo;
        }

            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->address = $request->address;
            $employee->joining_date = $request->joining_date;
            $employee->photo = $location;
            $employee->save();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $employee = Employee::find($id);
        $image_path = public_path($employee->photo);
        if (file_exists($image_path)) {
            @unlink($image_path);
        }
        $employee->delete();
    }
}
