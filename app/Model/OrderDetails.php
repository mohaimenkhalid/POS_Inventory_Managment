<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class OrderDetails extends Model
{
    public function product()
    {
    	return $this->belongsTo(Product::class);
    }
}
