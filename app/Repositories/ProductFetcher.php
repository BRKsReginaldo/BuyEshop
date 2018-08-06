<?php

namespace App\Repositories;


use App\Contracts\Priceable;
use App\Product;

abstract class ProductFetcher
{
    protected $short_description;
    protected $logo;
    protected $title;

    abstract function get($link);

    abstract function getPrice(Priceable $product);

    protected function toArray()
    {
        return [
          'short_description' => $this->short_description,
          'logo' => $this->logo,
          'title' => $this->title
        ];
    }
}