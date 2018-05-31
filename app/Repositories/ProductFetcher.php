<?php

namespace App\Repositories;


abstract class ProductFetcher
{
    protected $short_description;
    protected $logo;
    protected $title;

    abstract function get($link);

    protected function toArray()
    {
        return [
          'short_description' => $this->short_description,
          'logo' => $this->logo,
          'title' => $this->title
        ];
    }
}