<?php

namespace Festival\Domain\User\UseCase\UserInfo;

interface UserInfoInterface
{
   public function execute(UserInfoRequest $request, UserInfoPresenter $presenter): void;
}
