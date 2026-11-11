local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoduxModule = require(Parent.Rodux)

return function()
	-- upvalues: RoduxModule (copy), Parent (copy), AppChat (copy)
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
		Presence = require(script.Presence),
		ToggleChatPaused = require(AppChat.installReducer.ToggleChatPaused),
		networkStatus = require(AppChat.Http.RoduxNetworking).installReducer(),
		unreadMessageCount = require(script.UnreadMessageCount)
	})
end