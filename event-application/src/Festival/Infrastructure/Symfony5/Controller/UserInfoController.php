<?php

namespace Symfony5\Controller;

use Festival\Domain\User\UseCase\UserInfo\UserInfo;
use Festival\Domain\User\UseCase\UserInfo\UserInfoRequest;
use Festival\Presentation\User\Presenter\UserInfoJsonPresenter;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\HttpClient\HttpClientInterface;

/**
 * @Route("/userinfo", methods={"GET"})
 */
class UserInfoController
{
	public function __invoke(
		Request $request, UserInfo $userInfo, UserInfoJsonPresenter $presenter, HttpClientInterface $client
	) {
		$accessTokenJson = substr( $request->headers->get( "Authorization" ), 7 );

		// On explode l'accessToken et on récupère son sub
		$userKeycloakId = json_decode( base64_decode( str_replace( '_', '/',
				str_replace( '-', '+', explode( '.', $accessTokenJson )[ 1 ] ) ) ) )->{"sub"} ?? "";

		$userInfoRequest = new UserInfoRequest();
		$userInfoRequest->keycloakId = $userKeycloakId;
		$userInfoRequest->accessToken = "coucou";

		$userInfo->execute( $userInfoRequest, $presenter );

		return new JsonResponse( $presenter->viewModel() );
	}
}