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