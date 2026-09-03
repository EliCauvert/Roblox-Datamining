local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local httpService = game:GetService("HttpService")
local cryoModule = require(parent.Cryo)
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local roactPaginator = require(appChat.SocialLibraries).RoactPaginator
local searchFilterPredicate = require(appChat.SocialLibraries).Utils.searchFilterPredicate
local memoize = require(parent.AppCommonLib).memoize
local withAnalyticsModule = require(appChat.LegacyAnalytics.withAnalytics)
local withTelemetryModule = require(appChat.Telemetry.withTelemetry)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local chatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local chatLandingTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local displayModule = require(parent.Display)
local useSignalState = require(parent.SignalsReact).useSignalState
local responsiveModule = require(parent.Responsive)
local useAnimateScrollViewToSelection = require(parent.AppBlox).useAnimateScrollViewToSelection
local fFlagAppIaScrollAway = require(parent.SharedFlags).FFlagAppIaScrollAway
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local signalsMigrationConfigModule = require(appChat.Flags.SignalsMigrationConfig)
local fFlagAppChatUseUltimateListConversationListModule = require(appChat.Flags.FFlagAppChatUseUltimateListConversationList)
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local fFlagAppChatUseViewRecyclerConversationListModule = require(appChat.Flags.FFlagAppChatUseViewRecyclerConversationList)
local conversationListWithTopBar = roactModule.PureComponent:extend("ConversationListWithTopBar")
local shouldUseFoundationConversationRow = signalsMigrationConfigModule.shouldUseFoundationConversationRow
local fFlagAppChatUseUltimateListConversationListModule_1 = shouldUseFoundationConversationRow and fFlagAppChatUseUltimateListConversationListModule
local fFlagAppChatUseViewRecyclerConversationListModule_1 = shouldUseFoundationConversationRow and fFlagAppChatUseViewRecyclerConversationListModule
local conversationListModule = require(script.Parent.ConversationList)
local var1 = false
local var2 = nil
local var3 = false
local var4 = nil

local function _()
	-- upvalues: var1 (write), var2 (write)
	if var1 then
		return var2
	end
	var1 = true
	local ok, status = pcall(function()
		return require(script.Parent.ConversationListUltimate)
	end)
	
	if ok then
		var2 = status
	end
	return var2
end

local _ = function()
	-- upvalues: var3 (write), var4 (write)
	if var3 then
		return var4
	end
	var3 = true
	local ok, status = pcall(function()
		return require(script.Parent.ConversationListViewRecycler)
	end)
	
	if ok then
		var4 = status
	end
	return var4
end

conversationListWithTopBar.defaultProps = {
	filterText = nil,
	isDebugEnabled = false,
	topBarHeight = 0,
	entryHeight = 64,
	canAccessParty = false,
	isPartyQuickStartEnabled = false,
	itemList = {},
	navigateToSquadLobby = function() end,
	canvasTopPadding = if fFlagAppIaScrollAway then 0 else nil
}

function conversationListWithTopBar.getDerivedStateFromProps(p1)
	-- upvalues: cryoModule (ref), searchFilterPredicate (ref)
	local filterText = p1.filterText
	
	return {
		filteredItemList = cryoModule.List.filterMap(p1.itemList, function(p2)
			-- upvalues: searchFilterPredicate (copy), filterText (ref)
			return if searchFilterPredicate(filterText, p2.title) then p2 else nil
		end)
	}
end

function conversationListWithTopBar.init(p1)
	-- upvalues: memoize (ref), roactPaginator (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), cryoModule (ref), httpService (ref), chatLandingTelemetryEventsModule (ref)
	function p2.showErrorToast(p2)
		-- upvalues: p1 (ref)
		p1.props.navigateToToast({ toastProps = { toastContent = { toastTitle = p2 } } })
	end
	
	function p2.reportAnalytics(p2)
		-- upvalues: p1 (ref)
		if not p1.props.conversationsIsFetching and not p1.props.oldestConversationIsFetched then
			p2:userFetchedOlderConversations(p1.props.localUserId)
		end
	end
	
	p1.loadNext = memoize(function(p2)
		-- upvalues: p1 (ref), roactPaginator (copy), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
		return function(p3)
			-- upvalues: p1 (copy), roactPaginator (copy), p2 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy)
			if p1.props[roactPaginator.loadNext] then
				p1.reportAnalytics(p2)
				
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.PaginationConversationList)
				end
				p1.props[roactPaginator.loadNext](p3)
			end
		end
	end)
	p1.isFiltered = p1.props.filterText and p1.props.filterText:match("%S")
	p1.indexOfList = memoize(function(p2, p3)
		-- upvalues: cryoModule (copy)
		local index = table.find(cryoModule.List.map(p2, function(p4)
			return p4.id
		end), p3)
		
		return index or 0
	end)
	
	function p2.formatParticipantIds(p2)
		-- upvalues: cryoModule (copy), httpService (copy)
		local var5 = cryoModule.List.filterMap(p2 or {}, function(p3)
			return if p3.id then tonumber(p3.id) else nil
		end)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var5 (ref)
			return httpService:JSONEncode(var5)
		end)
		
		return if ok then status else "[]"
	end
	
	function p2.fireClickEvent(p2, p3, p4)
		-- upvalues: chatLandingTelemetryEventsModule (copy), p1 (ref)
		local id = p2.id
		p3.emit(chatLandingTelemetryEventsModule.ConversationClicked, {
			isFiltered = p1.isFiltered ~= nil,
			conversationListCount = #p1.state.filteredItemList,
			selectedConversationId = id,
			selectedIndex = p1.indexOfList(p1.state.filteredItemList, id),
			hasUnreadMessages = p2.hasUnreadMessages,
			selectedConversationModerationType = if p2 then p2.moderationType else nil,
			selectedConversationUserPendingStatus = if p2 then p2.userPendingStatus else nil,
			participantUserIds = p1.formatParticipantIds(p2.participants),
			osaAcknowledgementStatus = p2.osaAcknowledgementStatus,
			osaImpressionId = p4
		})
		p3.emit(chatLandingTelemetryEventsModule.ConversationClickedIndexStat, {
			statValue = p1.indexOfList(p1.state.filteredItemList, id) or 0
		})
	end
	
	p1.fireConversationImpressionEvent = memoize(function(p2)
		-- upvalues: chatLandingTelemetryEventsModule (copy), p1 (ref)
		return function(p3)
			-- upvalues: p2 (ref), chatLandingTelemetryEventsModule (copy), p1 (copy)
			local id = p3.id
			p2.emit(chatLandingTelemetryEventsModule.ConversationCellRendered, {
				isFiltered = p1.isFiltered ~= nil,
				conversationListCount = #p1.state.filteredItemList,
				selectedConversationId = id,
				selectedIndex = p1.indexOfList(p1.state.filteredItemList, id),
				hasUnreadMessages = p3.hasUnreadMessages,
				selectedConversationModerationType = p3.moderationType,
				selectedConversationUserPendingStatus = p3.userPendingStatus,
				participantUserIds = p1.formatParticipantIds(p3.participants),
				osaAcknowledgementStatus = p3.osaAcknowledgementStatus
			})
			p2.emit(chatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, {
				statValue = p1.indexOfList(p1.state.filteredItemList, id) or 0
			})
		end
	end)
	
	function p2.onActivated(p2)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), p1 (ref)
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = tostring(p2.id) })
		end
		p1.props.navigateToConversation(p2.id)
	end
end

function conversationListWithTopBar.render(p1)
	-- upvalues: withAnalyticsModule (ref), withTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), partyPageCarouselExperimentation (ref), shouldUseFoundationConversationRow (ref), fFlagAppChatConsoleFocusFixesModule (ref), fFlagAppIaScrollAway (ref), fFlagAppChatUseUltimateListConversationListModule_1 (ref), fFlagAppChatUseViewRecyclerConversationListModule_1 (ref), conversationListModule (ref), var3 (write), var4 (write), var1 (write), var2 (write), roactModule (ref)
	return withAnalyticsModule(function(p2)
		-- upvalues: withTelemetryModule (copy), chatLandingTelemetryLayerModule (copy), p1 (ref), partyPageCarouselExperimentation (copy), shouldUseFoundationConversationRow (copy), fFlagAppChatConsoleFocusFixesModule (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), fFlagAppChatUseViewRecyclerConversationListModule_1 (copy), conversationListModule (copy), var3 (copy), var4 (copy), var1 (copy), var2 (copy), roactModule (copy)
		return withTelemetryModule(chatLandingTelemetryLayerModule.Context)(function(p3)
			-- upvalues: p1 (copy), p2 (ref), partyPageCarouselExperimentation (copy), shouldUseFoundationConversationRow (copy), fFlagAppChatConsoleFocusFixesModule (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), fFlagAppChatUseViewRecyclerConversationListModule_1 (copy), conversationListModule (copy), var3 (copy), var4 (copy), var1 (copy), var2 (copy), roactModule (copy)
			local t = {
				Size = UDim2.fromScale(1, 1),
				itemList = if p1.props.filterText and p1.props.filterText:match("%S") then p1.state.filteredItemList else p1.props.itemList,
				loadNext = p1.loadNext(p2),
				isDebugEnabled = p1.props.isDebugEnabled,
				isWideMode = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() or shouldUseFoundationConversationRow then p1.props.isWideMode else nil,
				filterText = p1.props.filterText,
				onActivated = p1.onActivated,
				entryHeight = p1.props.entryHeight,
				navigateToSquadLobby = p1.props.navigateToSquadLobby,
				isInExperience = p1.props.isInExperience,
				localUserId = p1.props.localUserId,
				navigateToConversationFromUserId = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p1.props.navigateToConversationFromUserId else nil,
				navigateToQuickStartSquadInviteFriends = if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p1.props.navigateToQuickStartSquadInviteFriends else nil,
				shouldShowPhoneVerificationUpsell = p1.props.shouldShowPhoneVerificationUpsell,
				shouldShowUnfilteredAccessFtux = p1.props.shouldShowUnfilteredAccessFtux,
				shouldShowPartyUpsellFtux = p1.props.shouldShowPartyUpsellFtux,
				dismissUnfilteredThreadsFtux = p1.props.dismissUnfilteredThreadsFtux,
				showGroupsLink = p1.props.showGroupsLink,
				listRef = if fFlagAppChatConsoleFocusFixesModule then p1.props.listRef else nil,
				canvasTopPadding = if fFlagAppIaScrollAway then p1.props.canvasTopPadding else nil,
				canvasBottomPadding = if fFlagAppChatConsoleFocusFixesModule and not p1.props.isInExperience then p1.props.deviceSafePadding.bottom else nil,
				scrollEnabled = if fFlagAppChatConsoleFocusFixesModule then p1.props.scrollEnabled else nil,
				fireConversationImpressionEvent = p1.fireConversationImpressionEvent(p3),
				isPartyQuickStartEnabled = p1.props.isPartyQuickStartEnabled,
				fireConversationClickedEvent = p1.fireClickEvent
			}
			
			if shouldUseFoundationConversationRow then
				t.canAccessParty = p1.props.canAccessParty
			end
			if fFlagAppChatUseUltimateListConversationListModule_1 or fFlagAppChatUseViewRecyclerConversationListModule_1 then
				t.isLoadingNext = p1.props.conversationsIsFetching
				t.isLoadingPrevious = p1.props.conversationsIsFetching
				t.oldestConversationIsFetched = p1.props.oldestConversationIsFetched
			end
			local var5 = conversationListModule
			
			if fFlagAppChatUseViewRecyclerConversationListModule_1 then
				local var6
				if var3 then
					var6 = var4
				else
					var3 = true
					local ok, status = pcall(function()
						return require(script.Parent.ConversationListViewRecycler)
					end)
					
					if ok then
						var4 = status
					end
					var6 = var4
				end
				if not var6 then
					var6 = conversationListModule
				end
				var5 = var6
			elseif fFlagAppChatUseUltimateListConversationListModule_1 then
				local var7
				if var1 then
					var7 = var2
				else
					var1 = true
					local ok, status = pcall(function()
						return require(script.Parent.ConversationListUltimate)
					end)
					
					if ok then
						var2 = status
					end
					var7 = var2
				end
				if not var7 then
					var7 = conversationListModule
				end
				var5 = var7
			end
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if fFlagAppChatConsoleFocusFixesModule and not p1.props.isInExperience then UDim2.new(1, 0, 1, p1.props.deviceSafePadding.bottom) else UDim2.new(1, 0, 1, 0)
			}, { conversationList = roactModule.createElement(var5, t) })
		end)
	end)
end

function conversationListWithTopBar.didMount(p1)
	p1.isMounted = true
end

function conversationListWithTopBar.didUpdate(p1, p2)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref)
	if fFlagAppChatPerfTrackingModule and #p2.itemList < #p1.props.itemList then
		appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.PaginationConversationList)
	end
end

function conversationListWithTopBar.willUnmount(p1)
	p1.isMounted = false
end

return if fFlagAppChatConsoleFocusFixesModule then function(p1)
	-- upvalues: useSignalState (ref), displayModule (ref), reactModule (ref), responsiveModule (ref), useAnimateScrollViewToSelection (ref), conversationListWithTopBar (ref)
	local var5 = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = responsiveModule.useLastInput() == responsiveModule.Input.Directional
	reactModule.useLayoutEffect(function()
		-- upvalues: var8 (ref), var7 (ref)
		var7(var8.current and (var8.current._listRef._scrollRef.getNativeScrollRef() and var8.current._listRef._scrollRef.getNativeScrollRef()._nativeRef))
	end)
	useAnimateScrollViewToSelection(var6, 0.2)
	local cloned = table.clone(p1)
	cloned.deviceSafePadding = var5
	cloned.listRef = var8
	cloned.scrollEnabled = if var9 then if var6 ~= nil then var6.current == nil else true else not var9
	
	return reactModule.createElement(conversationListWithTopBar, cloned)
end else conversationListWithTopBar