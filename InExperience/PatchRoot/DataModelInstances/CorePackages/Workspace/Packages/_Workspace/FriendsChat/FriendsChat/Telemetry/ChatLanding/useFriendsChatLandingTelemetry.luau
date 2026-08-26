local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local chatLandingTelemetryEventsModule = require(parent.AppChat.ChatLandingTelemetryEvents)
local chatLandingTelemetryLayerModule = require(parent.AppChat.ChatLandingTelemetryLayer)
local chatLandingTelemetryStateModule = require(parent.AppChat.ChatLandingTelemetryState)
local _ = require(parent.AppChat.GetConversationListStore)
local getFriendsChatSettingsStoreModule = require(parent.AppChat.GetFriendsChatSettingsStore)
local useTelemetryModule = require(parent.AppChat.useTelemetry)
local getChatLandingConversationInfoModule = require(script.Parent.getChatLandingConversationInfo)
local getChatLandingSharedCountsModule = require(script.Parent.getChatLandingSharedCounts)

local function _()
	-- upvalues: getFriendsChatSettingsStoreModule (ref)
	return getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
end

return function(p1)
	-- upvalues: useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), reactModule (ref), getChatLandingSharedCountsModule (ref), chatLandingTelemetryEventsModule (ref), getFriendsChatSettingsStoreModule (ref), getChatLandingConversationInfoModule (ref)
	local emit = useTelemetryModule(chatLandingTelemetryLayerModule.Context).emit
	local var1 = chatLandingTelemetryStateModule.useSetState()
	local var2 = reactModule.useRef(p1.displayedConversations)
	var2.current = p1.displayedConversations
	local var3 = reactModule.useRef(p1.isFiltered)
	var3.current = p1.isFiltered
	local var4 = reactModule.useRef(emit)
	var4.current = emit
	local var5 = reactModule.useMemo(function()
		-- upvalues: getChatLandingSharedCountsModule (copy), p1 (ref)
		return getChatLandingSharedCountsModule(p1.conversations)
	end, { p1.conversations })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref)
		var1(function(p2)
			-- upvalues: var5 (copy)
			local cloned = table.clone(p2)
			cloned.chatLandingListCount = var5.chatLandingListCount
			cloned.pendingConversationCount = var5.pendingConversationCount
			cloned.unfilteredConversationCount = var5.unfilteredConversationCount
			
			return cloned
		end)
	end, { var5, var1 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), chatLandingTelemetryEventsModule (copy), getFriendsChatSettingsStoreModule (copy)
		var4.current(chatLandingTelemetryEventsModule.ScreenRendered, {
			isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
		})
	end, {})
	
	return {
		fireSearchActivatedEvent = reactModule.useCallback(function()
			-- upvalues: var4 (ref), chatLandingTelemetryEventsModule (copy)
			var4.current(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
		end, {}),
		fireConversationClickedEvent = reactModule.useCallback(function(p2, _, p3)
			-- upvalues: getChatLandingConversationInfoModule (copy), var2 (ref), var3 (ref), var4 (ref), chatLandingTelemetryEventsModule (copy)
			if p2 == nil or p2.id == nil then
				return
			end
			local var6 = getChatLandingConversationInfoModule(p2, var2.current or {}, var3.current == true)
			local cloned = table.clone(var6)
			cloned.osaImpressionId = p3
			var4.current(chatLandingTelemetryEventsModule.ConversationClicked, cloned)
			var4.current(chatLandingTelemetryEventsModule.ConversationClickedIndexStat, { statValue = var6.selectedIndex })
		end, {}),
		fireConversationImpressionEvent = reactModule.useCallback(function(p2)
			-- upvalues: getChatLandingConversationInfoModule (copy), var2 (ref), var3 (ref), var4 (ref), chatLandingTelemetryEventsModule (copy)
			if p2 == nil or p2.id == nil then
				return
			end
			local var6 = getChatLandingConversationInfoModule(p2, var2.current or {}, var3.current == true)
			var4.current(chatLandingTelemetryEventsModule.ConversationCellRendered, var6)
			var4.current(chatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, { statValue = var6.selectedIndex })
		end, {})
	}
end