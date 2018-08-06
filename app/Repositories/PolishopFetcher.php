<?php

namespace App\Repositories;


use App\Contracts\Priceable;
use Carbon\Carbon;
use Goutte\Client;
use Illuminate\Support\Facades\Cache;

class PolishopFetcher extends ProductFetcher
{

    function get($link)
    {
        $client = new Client;
        $crawler = $client->request('GET', $link);

        $title = $crawler->filterXPath('//meta[@property="og:title"]')->extract(['content']);

        $this->title = $title[0] ?? '';

        $description = $crawler->filterXPath('//meta[@property="og:description"]')->extract(['content']);

        $this->short_description = $description[0] ?? '';

        $image = $crawler->filterXPath('//meta[@property="og:image"]')->extract(['content']);

        $this->logo = $image[0] ?? '';

        return $this->toArray();
    }

    function getPrice(Priceable $product)
    {
        if (Cache::has($product->getCacheKey(':price'))) {
            return Cache::get($product->getCacheKey(':price'));
        }


        $client = new Client;
        $crawler = $client->request('GET', $product->link);
        $price = $crawler->filterXPath('//meta[@property="product:price:amount"]')->extract(['content']);

        return Cache::remember($product->getCacheKey(':price'),Carbon::now()->addHours(2), function() use($price) {
            return $price[0] ?? 0;
        });
    }
}