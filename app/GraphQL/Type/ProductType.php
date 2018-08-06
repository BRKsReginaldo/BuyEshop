<?php

namespace App\GraphQL\Type;

use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Type as BaseType;
use GraphQL;

class ProductType extends BaseType
{
    protected $attributes = [
        'name' => 'ProductType',
        'description' => 'A type'
    ];

    public function fields()
    {
        return [
            'id' => [
                'type' => Type::id(),
                'name' => 'id'
            ],
            'logo' => [
                'type' => Type::string(),
                'name' => 'logo'
            ],
            'link' => [
                'type' => Type::string(),
                'name' => 'link'
            ],
            'title' => [
                'type' => Type::string(),
                'name' => 'title'
            ],
            'short_description' => [
                'type' => Type::string(),
                'name' => 'short_description'
            ],
            'price' => [
                'type' => Type::string(),
                'name' => 'price'
            ]
        ];
    }

    public function resolvePriceField($root)
    {
        return $root->getResolver()->getPrice($root);
    }
}
