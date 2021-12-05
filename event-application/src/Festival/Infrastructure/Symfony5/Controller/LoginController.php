<?php

namespace Symfony5\Controller;

use KnpU\OAuth2ClientBundle\Client\ClientRegistry;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/login", name="login")
 */
class LoginController
{
    public function __invoke(ClientRegistry $clientRegistry)
    {
        $client = $clientRegistry->getClient('keycloak');
        return $client->redirect(['openid', 'profile', 'email']);
    }
}

// http://172.17.0.1:28080/auth/realms/master/protocol/openid-connect/registrations?client_id=epsivent&response_type=code&scope=openid%20profile%20email&redirect_uri=http%3A%2F%2Flocalhost%3A8000%2Flogin-check&client_id=epsivent&approval_prompt=auto&state=a1c320974dbd17bbee38f794562ceed0
// http://172.17.0.1:28080/auth/realms/master/protocol/openid-connect/auth?scope=openid%20profile%20email&state=75cacaf36762f716c41515a4881b7d02&response_type=code&approval_prompt=auto&redirect_uri=http%3A%2F%2Flocalhost%3A8000%2Flogin-check&client_id=epsivent
// http://172.17.0.1:28080/auth/realms/master/protocol/openid-connect/registratilons?client_id=epsivent&response_type=code&scope=openid%20email%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8000%2Flogin-check&approval_prompt=auto&state=abd6892a676b27691736e03d8bd6d4f8