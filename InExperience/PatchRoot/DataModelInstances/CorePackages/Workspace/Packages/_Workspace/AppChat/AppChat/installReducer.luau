local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoduxModule = require(Parent.Rodux)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local FFlagAppChatRemovePlaceInfosAsyncModule = require(AppChat.Flags.FFlagAppChatRemovePlaceInfosAsync)

return function()
	-- upvalues: RoduxModule (copy), Parent (copy), FFlagAppChatRemovePlaceInfosAsyncModule (copy), AppChat (copy), FFlagAppChatPresenceStoreMigrationModule (copy)
	return RoduxModule.combineReducers({
		PlaceInfos = require(Parent.PlaceInfoRodux).Reducers.PlaceInfosReducer,
		PlaceInfosAsync = if FFlagAppChatRemovePlaceInfosAsyncModule then nil else require(Parent.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer,
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
		networkStatus = require(AppChat.Http.RoduxNetworking).installReducer()
	})
end