return {
	UserProfilesRequestBegin = "UserProfilesRequestBegin",
	UserProfilesRequestSuccess = "UserProfilesRequestSuccess",
	UserProfilesRequestFail = "UserProfilesRequestFail",
	UserProfilesRequestFailAfterRetry = "UserProfilesRequestFailAfterRetry",
	UserProfilesRequestSuccessAfterRetry = "UserProfilesRequestSuccessAfterRetry",
	UserProfilesErrorCode = "UserProfilesErrorCode",
	UserProfilesUnmountEarly = "UserProfilesUnmountEarly",
	UserProfilesRequestFailDuration = game:DefineFastString("UserProfilesRequestFailDuration", "UserProfilesRequestFailDuration"),
	UserProfilesRequestFailAfterRetryDuration = game:DefineFastString("UserProfilesRequestFailAfterRetryDuration", "UserProfilesRequestFailAfterRetryDuration"),
	UserProfilesRequestSuccessDuration = game:DefineFastString("UserProfilesRequestSuccessDuration", "UserProfilesRequestSuccessDuration"),
	UserProfilesRequestSuccessAfterRetryDuration = game:DefineFastString("UserProfilesRequestSuccessAfterRetryDuration", "UserProfilesRequestSuccessAfterRetryDuration")
}