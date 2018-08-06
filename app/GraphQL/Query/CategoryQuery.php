<?php

namespace App\GraphQL\Query;

use App\Category;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;

class CategoryQuery extends Query
{
    protected $attributes = [
        'name' => 'CategoryQuery',
        'description' => 'A query'
    ];

    public function type()
    {
        return GraphQL::type('Category');
    }

    public function args()
    {
        return [
            'slug' => [
                'type' => Type::nonNull(Type::string()),
                'name' => 'slug'
            ]
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        $query = Category::where('slug', $args['slug']);

        if (!$query->exists()) return null;

        return $query->first();
    }
}
