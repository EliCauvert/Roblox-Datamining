return {
	PostUserSendTrustedConnectionRequest = require(script.PostUserSendTrustedConnectionRequest),
	PostUserAcceptTrustedConnectionRequest = require(script.PostUserAcceptTrustedConnectionRequest),
	PostUserIgnoreTrustedConnectionRequest = require(script.PostUserIgnoreTrustedConnectionRequest),
	PostUserIgnoreAllTrustedFriendRequests = require(script.PostUserIgnoreAllTrustedFriendRequests),
	PostUserRemoveTrustedConnection = require(script.PostUserRemoveTrustedConnection),
	PostUserCreateTrustedFriendLink = require(script.PostUserCreateTrustedFriendLink),
	PostUserValidateTrustedFriendLink = require(script.PostUserValidateTrustedFriendLink),
	PostUserAddTrustedFriendFromLink = require(script.PostUserAddTrustedFriendFromLink),
	GetUserTrustedConnectionStatus = require(script.GetUserTrustedConnectionStatus),
	MultiGetUsersAreTrustedConnections = require(script.MultiGetUsersAreTrustedConnections),
	GetUserTrustedConnections = require(script.GetUserTrustedConnections),
	GetTrustedFriendRequests = require(script.GetTrustedFriendRequests),
	GetTrustedFriendRequestsCount = require(script.GetTrustedFriendRequestsCount)
}