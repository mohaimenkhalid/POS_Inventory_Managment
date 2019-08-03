<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\Category;

class CategoryController extends Controller
{
    public function index()
    {
        $category = Category::all();
        return response()->json($category);
    }


     public function store(Request $request)
	    {
	        $validatedData = $request->validate([
	            'category_name' => ['required', 'string', 'max:255'],
	        ]);

	            $category = new Category;
	            $category->category_name = $request->category_name;
	            $category->save();

	    }

     public function show($id)
	    {
	        $category = Category::find($id);
	        return response()->json($category);
	    }


     public function update(Request $request, $id)
	    {

	        $validatedData = $request->validate([
	            'category_name' => ['required', 'string', 'max:255'], 
	        ]);

	        $category = Category::find($id);
	        $category->category_name = $request->category_name;
	        $category->save();
	    }


	   public function destroy($id)
	    {
	        $category = Category::find($id);
	        $category->delete();
	    }


}
