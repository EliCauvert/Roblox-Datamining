return {
	GetAuthMetaData = require(script.GetAuthMetaData),
	GetCountryCodes = require(script.GetCountryCodes),
	GetGameMedia = require(script.GetGameMedia),
	GetLoggedInUsersMetadataRequest = require(script.GetLoggedInUsersMetadataRequest),
	GetUserAppLaunchInfo = require(script.GetUserAppLaunchInfo),
	GetUserByIdRequest = require(script.GetUserByIdRequest),
	LoginRequests = require(script.LoginRequests),
	PostGetUserByUsername = require(script.PostGetUserByUsername),
	PostPasswordValid = require(script.PostPasswordValid),
	LogoutAllLoggedInUsersRequest = require(script.LogoutAllLoggedInUsersRequest),
	LogoutFromAllSessionsAndReauthenticateRequest = require(script.LogoutFromAllSessionsAndReauthenticateRequest),
	PostUsernameValid = require(script.PostUsernameValid),
	TwoStepRequests = require(script.TwoStepRequests),
	AuthPlatformDisconnect = require(script.AuthPlatformDisconnect),
	AuthSessionRefresh = require(script.AuthSessionRefresh)
}