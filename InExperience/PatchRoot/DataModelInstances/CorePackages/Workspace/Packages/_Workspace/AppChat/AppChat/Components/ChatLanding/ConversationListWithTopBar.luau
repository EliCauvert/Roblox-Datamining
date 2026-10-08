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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagEnableStickyShortcutBarOnAllPlatforms = sharedFlagsModule.FFlagEnableStickyShortcutBarOnAllPlatforms
local var1 = if fFlagEnableStickyShortcutBarOnAllPlatforms then require(parent.AppShortcutBar).GetShortcutBarStatusStore else nil
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
local chatLoadingContainerModule = require(script.Parent.ChatLoading.ChatLoadingContainer)
local searchNoResultsModule = require(script.Parent.SearchNoResults)
local var2 = false
local var3 = nil
local var4 = false
local var5 = nil

local function _()
	-- upvalues: var2 (write), var3 (write)
	if var2 then
		return var3
	end
	var2 = true
	local ok, status = pcall(function()
		return require(script.Parent.ConversationListUltimate)
	end)
	
	if ok then
		var3 = status
	end
	return var3
end

local _ = function()
	-- upvalues: var4 (write), var5 (write)
	if var4 then
		return var5
	end
	var4 = true
	local ok, status = pcall(function()
		return require(script.Parent.ConversationListViewRecycler)
	end)
	
	if ok then
		var5 = status
	end
	return var5
end

conversationListWithTopBar.defaultProps = {
	filterText = nil,
	isDebugEnabled = false,
	topBarHeight = 0,
	entryHeight = 64,
	canAccessParty = false,
	isPartyQuickStartEnabled = false,
	isSearchActive = false,
	itemList = {},
	navigateToSquadLobby = function() end,
	canvasTopPadding = if fFlagAppIaScrollAway then 0 else nil
}

function conversationListWithTopBar.getDerivedStateFromProps(p1)
	-- upvalues: cryoModule (ref), searchFilterPredicate (ref)
	local filterText = p1.filterText
	local itemList = p1.itemList
	
	return if p1.isSearchActive then { filteredItemList = itemList } else {
		filteredItemList = cryoModule.List.filterMap(itemList, function(p2)
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
		local var6 = cryoModule.List.filterMap(p2 or {}, function(p3)
			return if p3.id then tonumber(p3.id) else nil
		end)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), var6 (ref)
			return httpService:JSONEncode(var6)
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
	-- upvalues: withAnalyticsModule (ref), withTelemetryModule (ref), chatLandingTelemetryLayerModule (ref), fFlagEnableStickyShortcutBarOnAllPlatforms (ref), partyPageCarouselExperimentation (ref), shouldUseFoundationConversationRow (ref), fFlagAppChatConsoleFocusFixesModule (ref), fFlagAppIaScrollAway (ref), fFlagAppChatUseUltimateListConversationListModule_1 (ref), fFlagAppChatUseViewRecyclerConversationListModule_1 (ref), conversationListModule (ref), var4 (write), var5 (write), var2 (write), var3 (write), roactModule (ref), chatLoadingContainerModule (ref), searchNoResultsModule (ref)
	return withAnalyticsModule(function(p2)
		-- upvalues: withTelemetryModule (copy), chatLandingTelemetryLayerModule (copy), p1 (ref), fFlagEnableStickyShortcutBarOnAllPlatforms (copy), partyPageCarouselExperimentation (copy), shouldUseFoundationConversationRow (copy), fFlagAppChatConsoleFocusFixesModule (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), fFlagAppChatUseViewRecyclerConversationListModule_1 (copy), conversationListModule (copy), var4 (copy), var5 (copy), var2 (copy), var3 (copy), roactModule (copy), chatLoadingContainerModule (copy), searchNoResultsModule (copy)
		return withTelemetryModule(chatLandingTelemetryLayerModule.Context)(function(p3)
			-- upvalues: p1 (copy), fFlagEnableStickyShortcutBarOnAllPlatforms (copy), p2 (ref), partyPageCarouselExperimentation (copy), shouldUseFoundationConversationRow (copy), fFlagAppChatConsoleFocusFixesModule (copy), fFlagAppIaScrollAway (copy), fFlagAppChatUseUltimateListConversationListModule_1 (copy), fFlagAppChatUseViewRecyclerConversationListModule_1 (copy), conversationListModule (copy), var4 (copy), var5 (copy), var2 (copy), var3 (copy), roactModule (copy), chatLoadingContainerModule (copy), searchNoResultsModule (copy)
			local var6 = if fFlagEnableStickyShortcutBarOnAllPlatforms then p1.props.isShortcutBarVisible else false
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
				canvasBottomPadding = if fFlagAppChatConsoleFocusFixesModule and not p1.props.isInExperience and (if fFlagEnableStickyShortcutBarOnAllPlatforms then not var6 else true) then p1.props.deviceSafePadding.bottom else nil,
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
			local var7 = conversationListModule
			
			if fFlagAppChatUseViewRecyclerConversationListModule_1 then
				local var8
				if var4 then
					var8 = var5
				else
					var4 = true
					local ok, status = pcall(function()
						return require(script.Parent.ConversationListViewRecycler)
					end)
					
					if ok then
						var5 = status
					end
					var8 = var5
				end
				if not var8 then
					var8 = conversationListModule
				end
				var7 = var8
			elseif fFlagAppChatUseUltimateListConversationListModule_1 then
				local var9
				if var2 then
					var9 = var3
				else
					var2 = true
					local ok, status = pcall(function()
						return require(script.Parent.ConversationListUltimate)
					end)
					
					if ok then
						var3 = status
					end
					var9 = var3
				end
				if not var9 then
					var9 = conversationListModule
				end
				var7 = var9
			end
			local var10 = roactModule.createElement(var7, t)
			
			if p1.props.isSearchActive and p1.props.isSearchAwaitingResults and #p1.props.itemList == 0 then
				var10 = roactModule.createElement(chatLoadingContainerModule, {
					cellHeight = p1.props.entryHeight,
					topPadding = p1.props.canvasTopPadding
				})
			elseif p1.props.isSearchActive and not p1.props.isSearchAwaitingResults and (#p1.props.itemList == 0 and p1.props.oldestConversationIsFetched) then
				var10 = roactModule.createElement(searchNoResultsModule, { topPadding = p1.props.canvasTopPadding })
			end
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if fFlagAppChatConsoleFocusFixesModule and not p1.props.isInExperience and (if fFlagEnableStickyShortcutBarOnAllPlatforms then not var6 else true) then UDim2.new(1, 0, 1, p1.props.deviceSafePadding.bottom) else UDim2.new(1, 0, 1, 0)
			}, { conversationList = var10 })
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
	-- upvalues: useSignalState (ref), displayModule (ref), reactModule (ref), responsiveModule (ref), useAnimateScrollViewToSelection (ref), fFlagEnableStickyShortcutBarOnAllPlatforms (ref), var1 (ref), conversationListWithTopBar (ref)
	local var6 = useSignalState(displayModule.GetDisplayStore().getDeviceSafePadding)
	local var7, var8 = reactModule.useState(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = responsiveModule.useLastInput() == responsiveModule.Input.Directional
	reactModule.useLayoutEffect(function()
		-- upvalues: var9 (ref), var8 (ref)
		var8(var9.current and (var9.current._listRef._scrollRef.getNativeScrollRef() and var9.current._listRef._scrollRef.getNativeScrollRef()._nativeRef))
	end)
	useAnimateScrollViewToSelection(var7, 0.2)
	local var11 = if fFlagEnableStickyShortcutBarOnAllPlatforms then useSignalState(var1(false).getShortcutBarVisible) else false
	local cloned = table.clone(p1)
	cloned.deviceSafePadding = var6
	cloned.listRef = var9
	cloned.scrollEnabled = if var10 then if var7 ~= nil then var7.current == nil else true else not var10
	cloned.isShortcutBarVisible = if fFlagEnableStickyShortcutBarOnAllPlatforms then var11 else nil
	
	return reactModule.createElement(conversationListWithTopBar, cloned)
end else conversationListWithTopBar