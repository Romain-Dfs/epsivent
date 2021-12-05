<?php

namespace Symfony5\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/tokeninfo", name="tokeninfo_endpoint")
 */
class TokenInfoController
{
    public function __invoke()
    {
        return new Response();
    }
}