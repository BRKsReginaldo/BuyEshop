<?php

namespace App\Traits;


use App\ProviderType;
use Illuminate\Database\Eloquent\Model;

trait FetchInfo
{
    protected static function bootFetchInfo()
    {
        $fillValues = function (Model $model) {
            $host = parse_url($model->link)['host'];

            if (!isset(config('fetchers.hosts')[$host])) {
                return false;
            }

            $fetcher = resolve(config('fetchers.hosts')[$host]);

            collect($fetcher->get($model->link))
                ->each(function ($value, $key) use ($model) {
                    $model->setAttribute($key, $value);
                });

            $model->setAttribute('provider_type_id', ProviderType::where('host', $host)->first()->id ?? null);
        };

        static::creating($fillValues);

        static::updating($fillValues);
    }
}