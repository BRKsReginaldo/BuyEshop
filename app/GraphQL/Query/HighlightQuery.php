<?php

namespace App\GraphQL\Query;


use App\Product;
use Folklore\GraphQL\Support\Query;
use GraphQL\Type\Definition\ResolveInfo;
use GraphQL\Type\Definition\Type;

class HighlightQuery extends Query
{
    protected $attributes = [
        'name' => 'HighlightQuery',
        'description' => 'the highlight products'
    ];

    public function type()
    {
        return \GraphQL::pagination(\GraphQL::type('Product'));
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
        ];
    }

    public function resolve($root, $args, $context, ResolveInfo $info)
    {
        $query = resolve(Product::class)->newQuery();

        return $query->where('highlight', true)->paginate($args['limit'] ?? 10, ['*'], 'page', $args['page'] ?? 0);
    }
}