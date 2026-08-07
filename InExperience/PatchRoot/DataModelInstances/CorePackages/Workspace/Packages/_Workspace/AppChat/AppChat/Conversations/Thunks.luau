return {
	createConversation = require(script.createConversation),
	SendPolicies = require(script.SendPolicies),
	SendTextMessage = require(script.SendTextMessage),
	SendMessageUsingPolicy = require(script.SendMessageUsingPolicy),
	ReceivedChatResponse = require(script.ReceivedChatResponse),
	getAllFriendsAsync = require(script.getAllFriendsAsync),
	getLocalUserFriendsCount = require(script.getLocalUserFriendsCount),
	getAllUserPresences = require(script.getAllUserPresences),
	paginateAndRefreshConversations = require(script.paginateAndRefreshConversations),
	DEPRECATED_getLocalUserConversations = require(script.DEPRECATED_getLocalUserConversations),
	fetchChatMetadata = require(script.fetchChatMetadata),
	FetchInitialChatData = require(script.FetchInitialChatData),
	FetchChatSettings = require(script.FetchChatSettings),
	NavigateIntoChat = require(script.NavigateIntoChat),
	NavigateIntoSquadLobby = require(script.NavigateIntoSquadLobby),
	NavigateIntoSquadLobbyIfExists = require(script.NavigateIntoSquadLobbyIfExists)
}