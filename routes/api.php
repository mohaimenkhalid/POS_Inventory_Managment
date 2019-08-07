<?php

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('signup', 'AuthController@signup');
    Route::post('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

});

Route::apiResource('/employee', 'Api\EmployeeController');
Route::apiResource('/customer', 'Api\CustomerController');
Route::apiResource('/supplier', 'Api\SupplierController');
Route::apiResource('/category', 'Api\CategoryController');
Route::apiResource('/product', 'Api\ProductController');

Route::post('/salary/paid/{id}', 'Api\SalaryController@paid');
Route::get('/salary/', 'Api\SalaryController@allSalary');
Route::get('/view-salary/{id}', 'Api\SalaryController@viewSalary');
Route::get('/salary/delete/{id}', 'Api\SalaryController@deleteSalary');
Route::post('/stock/update/{id}', 'Api\SalaryController@updatestock');

Route::get('/getting/product/{id}', 'Api\PosController@getProduct');
Route::post('/addTocart/{id}', 'Api\CartController@AddToCart');
Route::get('/cart/product', 'Api\CartController@cartProduct');
Route::get('/cart/delete/{id}', 'Api\CartController@removeCartItem');
Route::post('/cart/increment/{id}', 'Api\CartController@cartIncrement');
Route::post('/cart/decrement/{id}', 'Api\CartController@cartDecrement');

Route::get('/vat', 'Api\CartController@vats');
Route::post('/ordernow', 'Api\PosController@ordernow');
Route::get('/orders', 'Api\OrderController@allorder');

Route::get('/order/view-details/{id}', 'Api\OrderController@orderDetails');
Route::get('/order/view-order/{id}', 'Api\OrderController@order');
Route::get('/order/search', 'Api\OrderController@searchOrder');

Route::get('/today/sell', 'Api\PosController@todaySell');
Route::get('/today/income', 'Api\PosController@todayIncome');
Route::get('/today/sale', 'Api\PosController@sale');
Route::get('/today/due', 'Api\PosController@due');
Route::get('/stockout', 'Api\PosController@stockout');
