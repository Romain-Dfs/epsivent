<?php

namespace Festival\Domain\User\UseCase\UserInfo;

interface UserInfoPresenter
{
   public function present(UserInfoResponse $response): void;
}
