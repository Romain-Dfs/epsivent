<?php

namespace Festival\Domain\User\UseCase\UserInfo;

use Festival\SharedKernel\Error\Notification;

class UserInfoResponse
{
	public string $keycloakId;
	public string $accessToken;
	private $note;
	private array $roles = [];

	public function __construct()
	{
		$this->note = new Notification();
	}

	public function addError( string $fieldName, string $error )
	{
		$this->note->addError( $fieldName, $error, );
	}

	public function notification(): Notification
	{
		return $this->note;
	}

	public function addRole( array $role ): void
	{
		$this->roles[] = $role;
	}

	public function roles(): array
	{
		return $this->roles;
	}
}
