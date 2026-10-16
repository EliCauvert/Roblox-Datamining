local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local ChatLandingTelemetryEventsModule = require(Parent.AppChat.ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(Parent.AppChat.ChatLandingTelemetryLayer)
local ChatLandingTelemetryStateModule = require(Parent.AppChat.ChatLandingTelemetryState)
local _ = require(Parent.AppChat.GetConversationListStore)
local GetFriendsChatSettingsStoreModule = require(Parent.AppChat.GetFriendsChatSettingsStore)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local FFlagFriendsChatLandingTelemetryFieldsModule = require(FriendsChat.Flags.FFlagFriendsChatLandingTelemetryFields)
local GetChatLandingConversationInfoModule = require(script.Parent.getChatLandingConversationInfo)
local GetChatLandingSharedCountsModule = require(script.Parent.getChatLandingSharedCounts)

local function _() --[[ Line: 26 | Named "getIsChatEnabled" ]]
	-- upvalues: GetFriendsChatSettingsStoreModule (copy)
	return GetFriendsChatSettingsStoreModule(false).getChatEnabled(false)
end

return function(p1) --[[ Line: 48 | Named "useFriendsChatLandingTelemetry" ]]
	-- upvalues: UseTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), ChatLandingTelemetryStateModule (copy), ReactModule (copy), GetChatLandingSharedCountsModule (copy), ChatLandingTelemetryEventsModule (copy), GetFriendsChatSettingsStoreModule (copy), FFlagFriendsChatLandingTelemetryFieldsModule (copy), GetChatLandingConversationInfoModule (copy)
	local Emit = UseTelemetryModule(ChatLandingTelemetryLayerModule.Context).emit
	local UseSetStateResult = ChatLandingTelemetryStateModule.useSetState()
	local UseRefResult = ReactModule.useRef(p1.displayedConversations)
	UseRefResult.current = p1.displayedConversations
	local UseRefResult1 = ReactModule.useRef(p1.isFiltered)
	UseRefResult1.current = p1.isFiltered
	local UseRefResult2 = ReactModule.useRef(Emit)
	UseRefResult2.current = Emit
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 62 ]]
		-- upvalues: GetChatLandingSharedCountsModule (upval), p1 (copy)
		return GetChatLandingSharedCountsModule(p1.conversations)
	end, { p1.conversations })
	ReactModule.useEffect(function() --[[ Line: 66 ]]
		-- upvalues: UseSetStateResult (copy), UseMemoResult (copy)
		UseSetStateResult(function(Tbl) --[[ Line: 67 ]]
			-- upvalues: UseMemoResult (upval)
			local Copy = table.clone(Tbl)
			Copy.chatLandingListCount = UseMemoResult.chatLandingListCount
			Copy.pendingConversationCount = UseMemoResult.pendingConversationCount
			Copy.unfilteredConversationCount = UseMemoResult.unfilteredConversationCount
			
			return Copy
		end)
	end, { UseMemoResult, UseSetStateResult })
	ReactModule.useEffect(function() --[[ Line: 80 ]]
		-- upvalues: UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval), GetFriendsChatSettingsStoreModule (upval)
		UseRefResult2.current(ChatLandingTelemetryEventsModule.ScreenRendered, {
			isChatEnabled = GetFriendsChatSettingsStoreModule(false).getChatEnabled(false)
		})
	end, {})
	local EmptyStateType = p1.emptyStateType
	ReactModule.useEffect(function() --[[ Line: 90 ]]
		-- upvalues: FFlagFriendsChatLandingTelemetryFieldsModule (upval), EmptyStateType (copy), UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
		if FFlagFriendsChatLandingTelemetryFieldsModule and EmptyStateType ~= nil then
			UseRefResult2.current(ChatLandingTelemetryEventsModule.ChatEmptyStateScreenRendered, { emptyStateType = EmptyStateType })
		end
	end, { EmptyStateType })
	
	return {
		fireSearchActivatedEvent = ReactModule.useCallback(function() --[[ Line: 98 ]]
			-- upvalues: UseRefResult2 (copy), ChatLandingTelemetryEventsModule (upval)
			UseRefResult2.current(ChatLandingTelemetryEventsModule.ChatLandingSearchBtnClicked, {})
		end, {}),
		fireConversationClickedEvent = ReactModule.useCallback(function(p2, _, OsaImpressionId) --[[ Line: 103 ]]
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
		fireConversationImpressionEvent = ReactModule.useCallback(function(p2) --[[ Line: 122 ]]
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