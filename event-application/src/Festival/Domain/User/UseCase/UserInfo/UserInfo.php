<?php

namespace Festival\Domain\User\UseCase\UserInfo;

use Festival\Domain\User\Entity\UserRepository;

class UserInfo implements UserInfoInterface
{
	public function __construct( private UserRepository $repository )
	{
	}

	public function execute( UserInfoRequest $request, UserInfoPresenter $presenter ): void
	{
		$response = new UserInfoResponse();

		$user = $this->repository->getUser( $request->keycloakId );

		if ( !$user ) {
			$response->addError( 'noUser', 'No user match with the keycloak id' );
		} else {
			$response->addRole( $user->role() );
		}

		$presenter->present( $response );
	}
}
