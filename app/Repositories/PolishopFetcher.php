<?php

namespace App\Repositories;


use Goutte\Client;

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
}