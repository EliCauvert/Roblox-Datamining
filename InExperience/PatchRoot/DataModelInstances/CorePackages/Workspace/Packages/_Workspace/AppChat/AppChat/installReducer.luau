local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoduxModule = require(Parent.Rodux)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local FFlagAppChatUnreadMessageCountStoreModule = require(AppChat.Flags.FFlagAppChatUnreadMessageCountStore)
local FFlagAppChatRemoveToggleChatPaused = require(Parent.SharedFlags).FFlagAppChatRemoveToggleChatPaused

return function() --[[ Line: 9 ]]
	-- upvalues: RoduxModule (copy), Parent (copy), AppChat (copy), FFlagAppChatPresenceStoreMigrationModule (copy), FFlagAppChatRemoveToggleChatPaused (copy), FFlagAppChatUnreadMessageCountStoreModule (copy)
	return RoduxModule.combineReducers({
		PlaceInfos = require(Parent.PlaceInfoRodux).Reducers.PlaceInfosReducer,
		PlaceInfosAsync = require(Parent.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer,
		Aliases = require(script.Aliases),
		AppLoaded = require(AppChat.installReducer.AppLoaded),
		ChatSettings = require(AppChat.installReducer.ChatSettings),
		ChatTimeouts = require(AppChat.installReducer.ChatTimeouts),
		Conversations = require(AppChat.installReducer.Conversations),
		ConversationsAsync = require(AppChat.installReducer.ConversationsAsync),
		Friends = require(script.Friends),
		ExternalNavigationRequest = require(AppChat.installReducer.ExternalNavigationRequest),
		LastEntryPoint = require(script.LastEntryPoint),
		Modals = require(script.Modals),
		ParticipantMetadata = require(script.ParticipantMetadata),
		Presence = if FFlagAppChatPresenceStoreMigrationModule then nil else require(script.Presence),
		ToggleChatPaused = if FFlagAppChatRemoveToggleChatPaused then nil else require(AppChat.installReducer.ToggleChatPaused),
		networkStatus = require(AppChat.Http.RoduxNetworking).installReducer(),
		unreadMessageCount = if FFlagAppChatUnreadMessageCountStoreModule then nil else require(script.UnreadMessageCount)
	})
end