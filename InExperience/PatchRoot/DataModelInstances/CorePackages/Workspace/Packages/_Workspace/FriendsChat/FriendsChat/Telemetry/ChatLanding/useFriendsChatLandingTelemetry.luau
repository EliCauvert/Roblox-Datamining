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

return function(p0)
	-- upvalues: useTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), chatLandingTelemetryStateModule (ref), reactModule (ref), getChatLandingSharedCountsModule (ref), chatLandingTelemetryEventsModule (ref), getFriendsChatSettingsStoreModule (ref), getChatLandingConversationInfoModule (ref)
	local emit = useTelemetryModule(chatLandingTelemetryLayerModule.Context).emit
	local var8 = chatLandingTelemetryStateModule.useSetState()
	local var9 = reactModule.useRef(p0.displayedConversations)
	var9.current = p0.displayedConversations
	local var10 = reactModule.useRef(p0.isFiltered)
	var10.current = p0.isFiltered
	local var11 = reactModule.useRef(emit)
	var11.current = emit
	local var12 = reactModule.useMemo(function()
		-- upvalues: getChatLandingSharedCountsModule (copy), p0 (ref)
		return getChatLandingSharedCountsModule(p0.conversations)
	end, { p0.conversations })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var12 (ref)
		var8(function(p1)
			-- upvalues: var12 (copy)
			local cloned = table.clone(p1)
			cloned.chatLandingListCount = var12.chatLandingListCount
			cloned.pendingConversationCount = var12.pendingConversationCount
			cloned.unfilteredConversationCount = var12.unfilteredConversationCount
			
			return cloned
		end)
	end, { var12, var8 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), chatLandingTelemetryEventsModule (copy), getFriendsChatSettingsStoreModule (copy)
		var11.current(chatLandingTelemetryEventsModule.ScreenRendered, {
			isChatEnabled = getFriendsChatSettingsStoreModule(false).getChatEnabled(false)
		})
	end, {})
	
	return {
		fireSearchActivatedEvent = reactModule.useCallback(function()
			-- upvalues: var11 (ref), chatLandingTelemetryEventsModule (copy)
			var11.current(chatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
		end, {}),
		fireConversationClickedEvent = reactModule.useCallback(function(p2, _, p3)
			-- upvalues: getChatLandingConversationInfoModule (copy), var9 (ref), var10 (ref), var11 (ref), chatLandingTelemetryEventsModule (copy)
			if p2 == nil or p2.id == nil then
				return
			end
			local var14 = getChatLandingConversationInfoModule(p2, var9.current or {}, var10.current == true)
			local cloned = table.clone(var14)
			cloned.osaImpressionId = p3
			var11.current(chatLandingTelemetryEventsModule.ConversationClicked, cloned)
			var11.current(chatLandingTelemetryEventsModule.ConversationClickedIndexStat, { statValue = var14.selectedIndex })
		end, {}),
		fireConversationImpressionEvent = reactModule.useCallback(function(p4)
			-- upvalues: getChatLandingConversationInfoModule (copy), var9 (ref), var10 (ref), var11 (ref), chatLandingTelemetryEventsModule (copy)
			if p4 == nil or p4.id == nil then
				return
			end
			local var16 = getChatLandingConversationInfoModule(p4, var9.current or {}, var10.current == true)
			var11.current(chatLandingTelemetryEventsModule.ConversationCellRendered, var16)
			var11.current(chatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, { statValue = var16.selectedIndex })
		end, {})
	}
end