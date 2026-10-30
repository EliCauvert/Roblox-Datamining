local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoduxModule = require(Parent.Rodux)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local FFlagAppChatRemoveAliasesSliceModule = require(AppChat.Flags.FFlagAppChatRemoveAliasesSlice)
local FFlagAppChatRemovePlaceInfosAsyncModule = require(AppChat.Flags.FFlagAppChatRemovePlaceInfosAsync)
local FFlagAppChatUseDataHydrationForChatTimeoutsModule = require(AppChat.Flags.FFlagAppChatUseDataHydrationForChatTimeouts)
local FFlagAppChatUseDataHydrationForPlaceInfosModule = require(AppChat.Flags.FFlagAppChatUseDataHydrationForPlaceInfos)
local FFlagAppChatUseSignalsForAppLoadedModule = require(AppChat.Flags.FFlagAppChatUseSignalsForAppLoaded)
local FFlagAppChatUseSignalsForExternalNavigationRequestModule = require(AppChat.Flags.FFlagAppChatUseSignalsForExternalNavigationRequest)
local FFlagAppChatUseSignalsForLastEntryPointModule = require(AppChat.Flags.FFlagAppChatUseSignalsForLastEntryPoint)

return function()
	-- upvalues: RoduxModule (copy), FFlagAppChatUseDataHydrationForPlaceInfosModule (copy), Parent (copy), FFlagAppChatRemovePlaceInfosAsyncModule (copy), FFlagAppChatRemoveAliasesSliceModule (copy), FFlagAppChatUseSignalsForAppLoadedModule (copy), AppChat (copy), FFlagAppChatUseDataHydrationForChatTimeoutsModule (copy), FFlagAppChatUseSignalsForExternalNavigationRequestModule (copy), FFlagAppChatUseSignalsForLastEntryPointModule (copy), FFlagAppChatPresenceStoreMigrationModule (copy)
	return RoduxModule.combineReducers({
		PlaceInfos = if FFlagAppChatUseDataHydrationForPlaceInfosModule then nil else require(Parent.PlaceInfoRodux).Reducers.PlaceInfosReducer,
		PlaceInfosAsync = if FFlagAppChatRemovePlaceInfosAsyncModule then nil else require(Parent.PlaceInfoRodux).Reducers.PlaceInfosAsyncReducer,
		Aliases = if FFlagAppChatRemoveAliasesSliceModule then nil else require(script.Aliases),
		AppLoaded = if FFlagAppChatUseSignalsForAppLoadedModule then nil else require(AppChat.installReducer.AppLoaded),
		ChatSettings = require(AppChat.installReducer.ChatSettings),
		ChatTimeouts = if FFlagAppChatUseDataHydrationForChatTimeoutsModule then nil else require(AppChat.installReducer.ChatTimeouts),
		Conversations = require(AppChat.installReducer.Conversations),
		ConversationsAsync = require(AppChat.installReducer.ConversationsAsync),
		Friends = require(script.Friends),
		ExternalNavigationRequest = if FFlagAppChatUseSignalsForExternalNavigationRequestModule then nil else require(AppChat.installReducer.ExternalNavigationRequest),
		LastEntryPoint = if FFlagAppChatUseSignalsForLastEntryPointModule then nil else require(script.LastEntryPoint),
		Modals = require(script.Modals),
		ParticipantMetadata = require(script.ParticipantMetadata),
		Presence = if FFlagAppChatPresenceStoreMigrationModule then nil else require(script.Presence),
		networkStatus = require(AppChat.Http.RoduxNetworking).installReducer()
	})
end