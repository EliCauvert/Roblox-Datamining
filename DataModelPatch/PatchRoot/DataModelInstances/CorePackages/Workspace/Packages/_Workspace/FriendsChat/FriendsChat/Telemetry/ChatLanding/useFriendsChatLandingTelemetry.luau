local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local ChatLandingTelemetryEventsModule = require(Parent.AppChat.ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(Parent.AppChat.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(Parent.AppChat.ChatLandingTelemetryState)
local _ = require(Parent.AppChat.GetConversationListStore)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local GetChatLandingConversationInfoModule = require(script.Parent.getChatLandingConversationInfo)
local GetChatLandingSharedCountsModule = require(script.Parent.getChatLandingSharedCounts)

return function(p1)
	-- upvalues: UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), ChatLandingTelemetryStateModule (copy), ReactModule (copy), GetChatLandingSharedCountsModule (copy), ChatLandingTelemetryEventsModule (copy), GetChatLandingConversationInfoModule (copy)
	local Emit = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context).emit
	local UseSetStateResult = ChatLandingTelemetryStateModule.useSetState()
	local UseRefResult = ReactModule.useRef(p1.displayedConversations)
	UseRefResult.current = p1.displayedConversations
	local UseRefResult1 = ReactModule.useRef(p1.isFiltered)
	UseRefResult1.current = p1.isFiltered
	local UseRefResult2 = ReactModule.useRef(Emit)
	UseRefResult2.current = Emit
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetChatLandingSharedCountsModule (upval), p1 (copy)
		return GetChatLandingSharedCountsModule(p1.conversations)
	end, { p1.conversations })
	ReactModule.useEffect(function()
		-- upvalues: UseSetStateResult (copy), UseMemoResult (copy)
		UseSetStateResult(function(Tbl)
			-- upvalues: UseMemoResult (upval)
			local Copy = table.clone(Tbl)
			Copy.chatLandingListCount = UseMemoResult.chatLandingListCount
			Copy.pendingConversationCount = UseMemoResult.pendingConversationCount
			Copy.unfilteredConversationCount = UseMemoResult.unfilteredConversationCount
			
			return Copy
		end)
	end, { UseMemoResult, UseSetStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
		UseRefResult2.current(ChatLandingTelemetryEventsModule.ScreenRendered, { isChatEnabled = true })
	end, {})
	
	return {
		fireSearchActivatedEvent = ReactModule.useCallback(function()
			-- upvalues: UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
			UseRefResult2.current(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
		end, {}),
		fireConversationClickedEvent = ReactModule.useCallback(function(p2, _, OsaImpressionId)
			-- upvalues: GetChatLandingConversationInfoModule (upval), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
			if p2 ~= nil and p2.id ~= nil then
				local ChatLandingConversationInfoModule = GetChatLandingConversationInfoModule(p2, UseRefResult.current or {}, UseRefResult1.current == true)
				local Copy = table.clone(ChatLandingConversationInfoModule)
				Copy.osaImpressionId = OsaImpressionId
				UseRefResult2.current(ChatLandingTelemetryEventsModule.ConversationClicked, Copy)
				UseRefResult2.current(ChatLandingTelemetryEventsModule.ConversationClickedIndexStat, {
					statValue = ChatLandingConversationInfoModule.selectedIndex
				})
				
				return
			end
		end, {}),
		fireConversationImpressionEvent = ReactModule.useCallback(function(p2)
			-- upvalues: GetChatLandingConversationInfoModule (upval), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
			if p2 ~= nil and p2.id ~= nil then
				local ChatLandingConversationInfoModule = GetChatLandingConversationInfoModule(p2, UseRefResult.current or {}, UseRefResult1.current == true)
				UseRefResult2.current(ChatLandingTelemetryEventsModule.ConversationCellRendered, ChatLandingConversationInfoModule)
				UseRefResult2.current(ChatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, {
					statValue = ChatLandingConversationInfoModule.selectedIndex
				})
				
				return
			end
		end, {})
	}
end