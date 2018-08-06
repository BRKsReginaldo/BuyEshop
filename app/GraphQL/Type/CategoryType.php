<?php

namespace App\GraphQL\Type;

use GraphQL\Type\Definition\Type;
use Folklore\GraphQL\Support\Type as BaseType;
use GraphQL;

class CategoryType extends BaseType
{
    protected $attributes = [
        'name' => 'CategoryType',
        'description' => 'A type'
    ];

    public function fields()
    {
        return [
            'id' => [
                'type' => Type::id(),
                'name' => 'id'
            ],
            'name' => [
                'type' => Type::string(),
                'name' => 'name'
            ],
            'slug' => [
                'type' => Type::string(),
                'name' => 'slug'
            ],
        ];
    }
}
