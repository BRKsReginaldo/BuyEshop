<?php

namespace App\GraphQL\Query;

use App\Category;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;

class CategoriesQuery extends Query
{
    protected $attributes = [
        'name' => 'CategoriesQuery',
        'description' => 'A query'
    ];

    public function type()
    {
        return Type::listOf(GraphQL::type('Category'));
    }

    public function args()
    {
        return [

        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        return Category::get();
    }
}
