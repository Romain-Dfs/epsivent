<?php

namespace Festival\Presentation\User\Presenter;

use Festival\Domain\User\UseCase\UserInfo\UserInfoPresenter;
use Festival\Domain\User\UseCase\UserInfo\UserInfoResponse;
use Festival\Presentation\User\ViewModel\UserInfoJsonViewModel;

class UserInfoJsonPresenter implements UserInfoPresenter
{
	private UserInfoJsonViewModel $viewModel;

	public function present( UserInfoResponse $response ): void
	{
		$this->viewModel = new UserInfoJsonViewModel();
		$this->viewModel->roles = $response->roles();

		foreach ( $response->notification()->getErrors() as $error ) {
			$this->viewModel->errors[ $error->fieldName() ] = $error->message();
		}
	}

	public function viewModel(): UserInfoJsonViewModel
	{
		return $this->viewModel;
	}
}