local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roduxModule = require(parent.Rodux)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local fFlagAppChatUnreadMessageCountStoreModule = require(appChat.Flags.FFlagAppChatUnreadMessageCountStore)
local fFlagAppChatRemoveToggleChatPaused = require(parent.SharedFlags).FFlagAppChatRemoveToggleChatPaused

return function() --[[ line: 9 ]]
	-- upvalues: roduxModule (ref), parent (ref), appChat (ref), fFlagAppChatPresenceStoreMigrationModule (ref), fFlagAppChatRemoveToggleChatPaused (ref), fFlagAppChatUnreadMessageCountStoreModule (ref)
	return roduxModule.combineReducers({
		PlaceInfos = require(parent.PlaceInfoRodux).Reducers.PlaceInfosReducer,
		PlaceInfosAsync = require(parent.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer,
		Aliases = require(script.Aliases),
		AppLoaded = require(appChat.installReducer.AppLoaded),
		ChatSettings = require(appChat.installReducer.ChatSettings),
		ChatTimeouts = require(appChat.installReducer.ChatTimeouts),
		Conversations = require(appChat.installReducer.Conversations),
		ConversationsAsync = require(appChat.installReducer.ConversationsAsync),
		Friends = require(script.Friends),
		ExternalNavigationRequest = require(appChat.installReducer.ExternalNavigationRequest),
		LastEntryPoint = require(script.LastEntryPoint),
		Modals = require(script.Modals),
		ParticipantMetadata = require(script.ParticipantMetadata),
		Presence = if fFlagAppChatPresenceStoreMigrationModule then nil else require(script.Presence),
		ToggleChatPaused = if fFlagAppChatRemoveToggleChatPaused then nil else require(appChat.installReducer.ToggleChatPaused),
		networkStatus = require(appChat.Http.RoduxNetworking).installReducer(),
		unreadMessageCount = if fFlagAppChatUnreadMessageCountStoreModule then nil else require(script.UnreadMessageCount)
	})
end