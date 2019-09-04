<?php

namespace App\Http\Api;

use Illuminate\Routing\Controller;

class Test extends Controller
{
    /**
     * Test constructor.
     */
    public function __construct()
    {
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function __invoke()
    {
        $test = [
            'one',
            'two'   => [
                'ni'
            ],
            'three' => [
                'san' => [
                    'sum'
                ],
            ]
        ];
        return response()->json($test);
    }
}
