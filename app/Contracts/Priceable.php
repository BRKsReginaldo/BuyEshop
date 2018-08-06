<?php

namespace App\Contracts;

interface Priceable {
    public function getCacheKey($append = '', $prepend = '@');
}