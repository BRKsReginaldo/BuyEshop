<?php

namespace App;

use App\Contracts\Priceable;
use App\Scopes\UserScope;
use App\Traits\FetchInfo;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Product extends Model implements Priceable
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
        return $this->belongsTo(ProviderType::class, 'provider_type_id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function getCacheKey($append = '', $prepend = '@')
    {
        $id = $this->getKey();
        return "{$prepend}product-{$id}{$append}";
    }
}
