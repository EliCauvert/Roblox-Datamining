local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local AppTelemetryLayerModule = require(Parent.AppChat.AppTelemetryLayer)
local GetConversationListStoreModule = require(Parent.AppChat.GetConversationListStore)
local GetFriendsChatSettingsStoreModule = require(Parent.AppChat.GetFriendsChatSettingsStore)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local FFlagAppChatVisibleIsInConversationModule = require(Parent.AppChat.FFlagAppChatVisibleIsInConversation)
local FFlagFriendsChatLandingTelemetryFieldsModule = require(FriendsChat.Flags.FFlagFriendsChatLandingTelemetryFields)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local IsInboxInitialLoadingModule = require(FriendsChat.ConversationList.isInboxInitialLoading)
local AppLevelTelemetryEventsModule = require(script.Parent.AppLevelTelemetryEvents)

local function _() --[[ Line: 27 | Named "getIsChatEnabled" ]]
	-- upvalues: GetFriendsChatSettingsStoreModule (copy)
	return GetFriendsChatSettingsStoreModule(false).getChatEnabled(false)
end

local function getEmittedInfo() --[[ Line: 33 ]]
	-- upvalues: GetFriendsChatSettingsStoreModule (copy), FFlagFriendsChatLandingTelemetryFieldsModule (copy), GetFriendsChatNavigationStoreModule (copy), GetConversationListStoreModule (copy), IsInboxInitialLoadingModule (copy), FFlagAppChatVisibleIsInConversationModule (copy)
	local config = {
		isChatEnabled = GetFriendsChatSettingsStoreModule(false).getChatEnabled(false)
	}
	
	if FFlagFriendsChatLandingTelemetryFieldsModule then
		local NoEffectiveConversationId = GetFriendsChatNavigationStoreModule(false).getEffectiveConversationId(false) == nil
		local ConversationListStoreModule = GetConversationListStoreModule(false)
		local ListStatus = ConversationListStoreModule.getListStatus(false)
		local Count = #ConversationListStoreModule.getConversations(false)
		config.isChatLoading = NoEffectiveConversationId and IsInboxInitialLoadingModule(ListStatus.isFetchingConversations == true, Count)
	end
	if FFlagAppChatVisibleIsInConversationModule then
		config.isInConversation = GetFriendsChatNavigationStoreModule(false).getEffectiveConversationId(false) ~= nil
	end
	return config
end

return function() --[[ Line: 51 | Named "useFriendsChatVisibilityTelemetry" ]]
	-- upvalues: UseTelemetryModule (copy), AppTelemetryLayerModule (copy), ReactModule (copy), AppLevelTelemetryEventsModule (copy), getEmittedInfo (copy)
	local EmitFunction = UseTelemetryModule(AppTelemetryLayerModule.Context).emit
	ReactModule.useEffect(function() --[[ Line: 59 ]]
		-- upvalues: EmitFunction (copy), AppLevelTelemetryEventsModule (upval), getEmittedInfo (upval)
		EmitFunction(AppLevelTelemetryEventsModule.AppChatVisible, (getEmittedInfo()))
		
		return function() --[[ Line: 61 ]]
			-- upvalues: EmitFunction (upval), AppLevelTelemetryEventsModule (upval), getEmittedInfo (upval)
			EmitFunction(AppLevelTelemetryEventsModule.AppChatClosed, (getEmittedInfo()))
		end
	end, {})
end