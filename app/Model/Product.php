<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
     protected $fillable = [
        'category_id', 'supplier_id', 'product_name',  'product_code', 'root', 'buying_price', 'selling_price', 'buying_date', 'product_quantity', 'image'
    ];


     public function category()
    {
    	return $this->belongsTo(Category::class);
    }

     public function supplier()
    {
    	return $this->belongsTo(Supplier::class);
    }
}
