<?php

namespace Symfony5\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/login-check", name="oauth_check")
 */
class LoginCheckController
{
    public function __invoke()
    {
        return new RedirectResponse("/token?access_token=coucou");
    }
}