<?php

namespace App\GraphQL\Query;

use App\Product;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;
use GraphQL;

class ProductQuery extends Query
{
    protected $attributes = [
        'name' => 'ProductQuery',
        'description' => 'A query'
    ];

    public function type()
    {
        return GraphQL::pagination(GraphQL::type('Product'));
    }

    public function args()
    {
        return [
            'page' => [
                'type' => Type::int()
            ],
            'limit' => [
                'type' => Type::int()
            ],
            'category' => [
                'type' => Type::int()
            ]
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        $query = Product::newQuery();

        if (isset($args['category'])) {
            $query->where('category_id', $args['category_id']);
        }

        return $query->paginate($args['limit'] ?? 10, ['*'], 'page', $args['page'] ?? 0);
    }
}
