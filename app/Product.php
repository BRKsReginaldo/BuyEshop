<?php

namespace App;

use App\Scopes\UserScope;
use App\Traits\FetchInfo;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Product extends Model
{
    use SoftDeletes, FetchInfo;

    protected $dates = ['deleted_at'];

    public $timestamps = false;

    protected static function boot()
    {
        parent::boot();

        if (auth()->check()) {
            static::addGlobalScope(new UserScope);
        }

        static::creating(function (Product $product) {
            $product->setAttribute('user_id', auth()->id());
        });
    }

    public function provider()
    {
        return $this->belongsTo(ProviderType::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
