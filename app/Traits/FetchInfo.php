<?php

namespace App\Traits;


use App\ProviderType;
use Illuminate\Database\Eloquent\Model;

trait FetchInfo
{
    protected static function bootFetchInfo()
    {
        $fillValues = function (Model $model) {
            $host = $model->getHost();
            $fetcher = $model->getResolver();

            collect($fetcher->get($model->link))
                ->each(function ($value, $key) use ($model) {
                    $model->setAttribute($key, $value);
                });

            $model->setAttribute('provider_type_id', ProviderType::where('host', $host)->first()->id ?? null);
        };

        static::creating($fillValues);

        static::updating($fillValues);
    }

    public function getHost()
    {
        return parse_url($this->link)['host'];
    }

    public function getResolver()
    {
        $host = $this->getHost();

        if (!isset(config('fetchers.hosts')[$host])) {
            return false;
        }

        return resolve(config('fetchers.hosts')[$host]);
    }
}