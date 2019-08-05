<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Salary;
use App\Model\Product;

class SalaryController extends Controller
{
    public function paid(Request $request, $id)
    {

    	$validatedData = $request->validate([
	            'month' => ['required'],
	        ]);

    	$month = $request->month;
		
		$check = Salary::where('employee_id', $id)->where('salary_month', $month)->first();
		if ($check) {
			
			 return response()->json('Salary alreadt taken in this month!!');   		
		}    	

    	else{

    	$salary = new Salary;
    	$salary->employee_id = $id;
    	$salary->amount = $request->salary;
    	$salary->salary_date =  date('d/m/y');
    	$salary->salary_month = $month;
    	$salary->salary_year = date('Y');
    	$salary->save();


    	return response()->json('done');
    	}
    }

    public function allSalary()
    {
    	$salary = Salary::distinct()->get(['salary_month']);

    	return response()->json($salary);
    }

    public function viewSalary($id)
    {
    	$salary = Salary::with('employee')->where('salary_month', $id)->get();
    	return response()->json($salary);
    }

    public function deleteSalary($id)
    {
    	$salary = Salary::find($id);
    	$salary->delete();
    }

    public function updatestock(Request $request, $id)
    {
       $validatedData = $request->validate([
                'product_quantity' => ['required']
            ]);

       $stock = Product::find($id);
       $stock->product_quantity = $request->product_quantity;
       $stock->save();
    }
}
