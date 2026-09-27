local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local appTelemetryLayerModule = require(parent.AppChat.AppTelemetryLayer)
local getConversationListStoreModule = require(parent.AppChat.GetConversationListStore)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local useTelemetryModule = require(parent.AppChat.useTelemetry)
local fFlagFriendsChatLandingTelemetryFieldsModule = require(friendsChat.Flags.FFlagFriendsChatLandingTelemetryFields)
local getFriendsChatNavigationStoreModule = require(friendsChat.Stores.GetFriendsChatNavigationStore)
local isInboxInitialLoadingModule = require(friendsChat.ConversationList.isInboxInitialLoading)
local appLevelTelemetryEventsModule = require(script.Parent.AppLevelTelemetryEvents)

local function _()
	-- upvalues: getFriendsChatSettingsStoreModule (ref)
	return getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
end

local function getEmittedInfo()
	-- upvalues: getFriendsChatSettingsStoreModule (ref), fFlagFriendsChatLandingTelemetryFieldsModule (ref), getFriendsChatNavigationStoreModule (ref), getConversationListStoreModule (ref), isInboxInitialLoadingModule (ref)
	local t = {
		isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
	}
	
	if fFlagFriendsChatLandingTelemetryFieldsModule then
		local var1 = getConversationListStoreModule(false)
		t.isChatLoading = getFriendsChatNavigationStoreModule(false).getEffectiveConversationId(false) == nil and isInboxInitialLoadingModule(var1.getListStatus(false).isFetchingConversations == true, #var1.getConversations(false))
	end
	return t
end

return function()
	-- upvalues: useTelemetryModule (ref), appTelemetryLayerModule (ref), reactModule (ref), appLevelTelemetryEventsModule (ref), getEmittedInfo (ref)
	local emit = useTelemetryModule(appTelemetryLayerModule.Context).emit
	reactModule.useEffect(function()
		-- upvalues: emit (ref), appLevelTelemetryEventsModule (copy), getEmittedInfo (copy)
		emit(appLevelTelemetryEventsModule.AppChatVisible, getEmittedInfo())
		
		return function()
			-- upvalues: emit (copy), appLevelTelemetryEventsModule (copy), getEmittedInfo (copy)
			emit(appLevelTelemetryEventsModule.AppChatClosed, getEmittedInfo())
		end
	end, {})
end