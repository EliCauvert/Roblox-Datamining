local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local HttpService = game:GetService("HttpService")
local CryoModule = require(Parent.Cryo)
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactPaginator = require(AppChat.SocialLibraries).RoactPaginator
local SearchFilterPredicateFunction = require(AppChat.SocialLibraries).Utils.searchFilterPredicate
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local WithAnalyticsModule = require(AppChat.LegacyAnalytics.withAnalytics)
local WithTelemetryModule = require(AppChat.Telemetry.withTelemetry)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local ChatLandingTelemetryEventsModule = require(script:FindFirstAncestor("ChatLanding").ChatLandingTelemetryEvents)
local ChatLandingTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ResponsiveModule = require(Parent.Responsive)
local UseAnimateScrollViewToSelectionFunction = require(Parent.AppBlox).useAnimateScrollViewToSelection
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagEnableStickyShortcutBarOnAllPlatforms = SharedFlagsModule.FFlagEnableStickyShortcutBarOnAllPlatforms
local GetShortcutBarStatusStore = if FFlagEnableStickyShortcutBarOnAllPlatforms then require(Parent.AppShortcutBar).GetShortcutBarStatusStore else nil
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local FFlagAppChatUseUltimateListConversationListModule = require(AppChat.Flags.FFlagAppChatUseUltimateListConversationList)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local FFlagAppChatUseViewRecyclerConversationListModule = require(AppChat.Flags.FFlagAppChatUseViewRecyclerConversationList)
local ConversationListWithTopBar = RoactModule.PureComponent:extend("ConversationListWithTopBar")
local ShouldUseFoundationConversationRow = require(AppChat.Flags.SignalsMigrationConfig).shouldUseFoundationConversationRow
local FFlagAppChatUseUltimateListConversationListModule1 = ShouldUseFoundationConversationRow and FFlagAppChatUseUltimateListConversationListModule
local FFlagAppChatUseViewRecyclerConversationListModule1 = ShouldUseFoundationConversationRow and FFlagAppChatUseViewRecyclerConversationListModule
local ConversationListModule = require(script.Parent.ConversationList)
local SearchLoadingModule = require(script.Parent.SearchLoading)
local SearchNoResultsModule = require(script.Parent.SearchNoResults)
local Flag = false
local v1 = nil
local Flag1 = false
local v2 = nil

local function _()
	-- upvalues: Flag (ref), v1 (ref)
	if Flag then
		return v1
	end
	Flag = true
	local Success, Result = pcall(function()
		return require(script.Parent.ConversationListUltimate)
	end)
	
	if Success then
		v1 = Result
	end
	return v1
end

local _ = function()
	-- upvalues: Flag1 (ref), v2 (ref)
	if Flag1 then
		return v2
	end
	Flag1 = true
	local Success, Result = pcall(function()
		return require(script.Parent.ConversationListViewRecycler)
	end)
	
	if Success then
		v2 = Result
	end
	return v2
end

ConversationListWithTopBar.defaultProps = {
	filterText = nil,
	isDebugEnabled = false,
	topBarHeight = 0,
	entryHeight = 64,
	canAccessParty = false,
	isPartyQuickStartEnabled = false,
	isSearchActive = false,
	itemList = {},
	navigateToSquadLobby = function() end,
	canvasTopPadding = if FFlagAppIaScrollAway then 0 else nil
}

function ConversationListWithTopBar.getDerivedStateFromProps(DefaultProps)
	-- upvalues: CryoModule (copy), SearchFilterPredicateFunction (copy)
	local FilterText = DefaultProps.filterText
	local ItemList = DefaultProps.itemList
	
	return if DefaultProps.isSearchActive then { filteredItemList = ItemList } else {
		filteredItemList = CryoModule.List.filterMap(ItemList, function(p1)
			-- upvalues: SearchFilterPredicateFunction (upval), FilterText (copy)
			return if SearchFilterPredicateFunction(FilterText, p1.title) then p1 else nil
		end)
	}
end

function ConversationListWithTopBar.init(p1)
	-- upvalues: MemoizeFunction (copy), RoactPaginator (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), CryoModule (copy), HttpService (copy), ChatLandingTelemetryEventsModule (copy)
	function p1.showErrorToast(ToastTitle)
		-- upvalues: p1 (copy)
		p1.props.navigateToToast({
			toastProps = { toastContent = { toastTitle = ToastTitle } }
		})
	end
	
	function p1.reportAnalytics(p2)
		-- upvalues: p1 (copy)
		if not p1.props.conversationsIsFetching and not p1.props.oldestConversationIsFetched then
			p2:userFetchedOlderConversations(p1.props.localUserId)
		end
	end
	
	p1.loadNext = MemoizeFunction(function(p2)
		-- upvalues: p1 (copy), RoactPaginator (upval), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval)
		return function(p3)
			-- upvalues: p1 (upval), RoactPaginator (upval), p2 (copy), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval)
			if p1.props[RoactPaginator.loadNext] then
				p1.reportAnalytics(p2)
				
				if FFlagAppChatPerfTrackingModule then
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.PaginationConversationList)
				end
				p1.props[RoactPaginator.loadNext](p3)
			end
		end
	end)
	p1.isFiltered = p1.props.filterText and p1.props.filterText:match("%S")
	p1.indexOfList = MemoizeFunction(function(p2, Value): number
		-- upvalues: CryoModule (upval)
		local FoundIndex: number? = table.find(CryoModule.List.map(p2, function(p3)
			return p3.id
		end), Value)
		
		return if FoundIndex then FoundIndex else 0
	end)
	
	function p1.formatParticipantIds(Participants)
		-- upvalues: CryoModule (upval), HttpService (upval)
		local FilterMapResult = CryoModule.List.filterMap(Participants or {}, function(p2)
			return if p2.id then tonumber(p2.id) else nil
		end)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), FilterMapResult (copy)
			return HttpService:JSONEncode(FilterMapResult)
		end)
		
		return if Success then Result else "[]"
	end
	
	function p1.fireClickEvent(p2, p3, OsaImpressionId)
		-- upvalues: ChatLandingTelemetryEventsModule (upval), p1 (copy)
		local Id = p2.id
		p3.emit(ChatLandingTelemetryEventsModule.ConversationClicked, {
			isFiltered = p1.isFiltered ~= nil,
			conversationListCount = #p1.state.filteredItemList,
			selectedConversationId = Id,
			selectedIndex = p1.indexOfList(p1.state.filteredItemList, Id),
			hasUnreadMessages = p2.hasUnreadMessages,
			selectedConversationModerationType = if p2 then p2.moderationType else nil,
			selectedConversationUserPendingStatus = if p2 then p2.userPendingStatus else nil,
			participantUserIds = p1.formatParticipantIds(p2.participants),
			osaAcknowledgementStatus = p2.osaAcknowledgementStatus,
			osaImpressionId = OsaImpressionId
		})
		p3.emit(ChatLandingTelemetryEventsModule.ConversationClickedIndexStat, {
			statValue = p1.indexOfList(p1.state.filteredItemList, Id) or 0
		})
	end
	
	p1.fireConversationImpressionEvent = MemoizeFunction(function(p2)
		-- upvalues: ChatLandingTelemetryEventsModule (upval), p1 (copy)
		return function(p3)
			-- upvalues: p2 (copy), ChatLandingTelemetryEventsModule (upval), p1 (upval)
			local Id = p3.id
			p2.emit(ChatLandingTelemetryEventsModule.ConversationCellRendered, {
				isFiltered = p1.isFiltered ~= nil,
				conversationListCount = #p1.state.filteredItemList,
				selectedConversationId = Id,
				selectedIndex = p1.indexOfList(p1.state.filteredItemList, Id),
				hasUnreadMessages = p3.hasUnreadMessages,
				selectedConversationModerationType = p3.moderationType,
				selectedConversationUserPendingStatus = p3.userPendingStatus,
				participantUserIds = p1.formatParticipantIds(p3.participants),
				osaAcknowledgementStatus = p3.osaAcknowledgementStatus
			})
			p2.emit(ChatLandingTelemetryEventsModule.ConversationCellRenderedIndexStat, {
				statValue = p1.indexOfList(p1.state.filteredItemList, Id) or 0
			})
		end
	end)
	
	function p1.onActivated(p2)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), p1 (copy)
		if FFlagAppChatPerfTrackingModule then
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = tostring(p2.id) })
		end
		p1.props.navigateToConversation(p2.id)
	end
end

function ConversationListWithTopBar.render(p1)
	-- upvalues: WithAnalyticsModule (copy), WithTelemetryModule (copy), ChatLandingTelemetryLayerModule (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (copy), PartyPageCarouselExperimentation (copy), ShouldUseFoundationConversationRow (copy), FFlagAppChatConsoleFocusFixesModule (copy), FFlagAppIaScrollAway (copy), FFlagAppChatUseUltimateListConversationListModule1 (copy), FFlagAppChatUseViewRecyclerConversationListModule1 (copy), ConversationListModule (copy), Flag1 (ref), v2 (ref), Flag (ref), v1 (ref), RoactModule (copy), SearchLoadingModule (copy), SearchNoResultsModule (copy)
	return WithAnalyticsModule(function(p2)
		-- upvalues: WithTelemetryModule (upval), ChatLandingTelemetryLayerModule (upval), p1 (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (upval), PartyPageCarouselExperimentation (upval), ShouldUseFoundationConversationRow (upval), FFlagAppChatConsoleFocusFixesModule (upval), FFlagAppIaScrollAway (upval), FFlagAppChatUseUltimateListConversationListModule1 (upval), FFlagAppChatUseViewRecyclerConversationListModule1 (upval), ConversationListModule (upval), Flag1 (upval), v2 (upval), Flag (upval), v1 (upval), RoactModule (upval), SearchLoadingModule (upval), SearchNoResultsModule (upval)
		return WithTelemetryModule(ChatLandingTelemetryLayerModule.Context)(function(p3)
			-- upvalues: p1 (upval), FFlagEnableStickyShortcutBarOnAllPlatforms (upval), p2 (copy), PartyPageCarouselExperimentation (upval), ShouldUseFoundationConversationRow (upval), FFlagAppChatConsoleFocusFixesModule (upval), FFlagAppIaScrollAway (upval), FFlagAppChatUseUltimateListConversationListModule1 (upval), FFlagAppChatUseViewRecyclerConversationListModule1 (upval), ConversationListModule (upval), Flag1 (upval), v2 (upval), Flag (upval), v1 (upval), RoactModule (upval), SearchLoadingModule (upval), SearchNoResultsModule (upval)
			local IsShortcutBarVisible = if FFlagEnableStickyShortcutBarOnAllPlatforms then p1.props.isShortcutBarVisible else false
			local config = {
				Size = UDim2.fromScale(1, 1),
				itemList = p1.props.filterText and p1.props.filterText:match("%S") and p1.state.filteredItemList or p1.props.itemList,
				loadNext = p1.loadNext(p2),
				isDebugEnabled = p1.props.isDebugEnabled,
				isWideMode = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() or ShouldUseFoundationConversationRow then p1.props.isWideMode else nil,
				filterText = p1.props.filterText,
				onActivated = p1.onActivated,
				entryHeight = p1.props.entryHeight,
				navigateToSquadLobby = p1.props.navigateToSquadLobby,
				isInExperience = p1.props.isInExperience,
				localUserId = p1.props.localUserId,
				navigateToConversationFromUserId = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p1.props.navigateToConversationFromUserId else nil,
				navigateToQuickStartSquadInviteFriends = if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then p1.props.navigateToQuickStartSquadInviteFriends else nil,
				shouldShowPhoneVerificationUpsell = p1.props.shouldShowPhoneVerificationUpsell,
				shouldShowUnfilteredAccessFtux = p1.props.shouldShowUnfilteredAccessFtux,
				shouldShowPartyUpsellFtux = p1.props.shouldShowPartyUpsellFtux,
				dismissUnfilteredThreadsFtux = p1.props.dismissUnfilteredThreadsFtux,
				showGroupsLink = p1.props.showGroupsLink,
				listRef = if FFlagAppChatConsoleFocusFixesModule then p1.props.listRef else nil,
				canvasTopPadding = if FFlagAppIaScrollAway then p1.props.canvasTopPadding else nil,
				pageBackgroundTransparency = p1.props.pageBackgroundTransparency,
				canvasBottomPadding = if FFlagAppChatConsoleFocusFixesModule and not p1.props.isInExperience and (not FFlagEnableStickyShortcutBarOnAllPlatforms or not IsShortcutBarVisible) then p1.props.deviceSafePadding.bottom else nil,
				scrollEnabled = if FFlagAppChatConsoleFocusFixesModule then p1.props.scrollEnabled else nil,
				fireConversationImpressionEvent = p1.fireConversationImpressionEvent(p3),
				isPartyQuickStartEnabled = p1.props.isPartyQuickStartEnabled,
				fireConversationClickedEvent = p1.fireClickEvent
			}
			
			if ShouldUseFoundationConversationRow then
				config.canAccessParty = p1.props.canAccessParty
			end
			if FFlagAppChatUseUltimateListConversationListModule1 or FFlagAppChatUseViewRecyclerConversationListModule1 then
				config.isLoadingNext = p1.props.conversationsIsFetching
				config.isLoadingPrevious = p1.props.conversationsIsFetching
				config.oldestConversationIsFetched = p1.props.oldestConversationIsFetched
			end
			local ConversationListModule1 = ConversationListModule
			
			if FFlagAppChatUseViewRecyclerConversationListModule1 then
				local v3 = nil
				if Flag1 then
					v3 = v2
				else
					Flag1 = true
					local Success1, Result1 = pcall(function()
						return require(script.Parent.ConversationListViewRecycler)
					end)
					
					if Success1 then
						v2 = Result1
					end
					v3 = v2
				end
				if not v3 then
					v3 = ConversationListModule
				end
				ConversationListModule1 = v3
			elseif FFlagAppChatUseUltimateListConversationListModule1 then
				local v4 = nil
				if Flag then
					v4 = v1
				else
					Flag = true
					local Success, Result = pcall(function()
						return require(script.Parent.ConversationListUltimate)
					end)
					
					if Success then
						v1 = Result
					end
					v4 = v1
				end
				if not v4 then
					v4 = ConversationListModule
				end
				ConversationListModule1 = v4
			end
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = if FFlagAppChatConsoleFocusFixesModule and not p1.props.isInExperience and (not FFlagEnableStickyShortcutBarOnAllPlatforms or not IsShortcutBarVisible) then UDim2.new(1, 0, 1, p1.props.deviceSafePadding.bottom) else UDim2.new(1, 0, 1, 0)
			}, {
				conversationList = if p1.props.isSearchActive and p1.props.isSearchAwaitingResults and #p1.props.itemList == 0 then RoactModule.createElement(SearchLoadingModule, {
					entryHeight = p1.props.entryHeight,
					topPadding = p1.props.canvasTopPadding
				}) elseif p1.props.isSearchActive and not p1.props.isSearchAwaitingResults and #p1.props.itemList == 0 and p1.props.oldestConversationIsFetched then RoactModule.createElement(SearchNoResultsModule, { topPadding = p1.props.canvasTopPadding }) else RoactModule.createElement(ConversationListModule1, config)
			})
		end)
	end)
end

function ConversationListWithTopBar.didMount(p1)
	p1.isMounted = true
end

function ConversationListWithTopBar.didUpdate(p1, p2)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy)
	if FFlagAppChatPerfTrackingModule and #p2.itemList < #p1.props.itemList then
		AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.PaginationConversationList)
	end
end

function ConversationListWithTopBar.willUnmount(p1)
	p1.isMounted = false
end

local function ConversationListWithTopBarFunctional(Tbl)
	-- upvalues: UseSignalStateFunction (copy), DisplayModule (copy), ReactModule (copy), ResponsiveModule (copy), UseAnimateScrollViewToSelectionFunction (copy), FFlagEnableStickyShortcutBarOnAllPlatforms (copy), GetShortcutBarStatusStore (copy), ConversationListWithTopBar (copy)
	local UseSignalStateResult = UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local IsUseLastInputResultMatch = ResponsiveModule.useLastInput() == ResponsiveModule.Input.Directional
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseStateResult2(UseRefResult.current and (UseRefResult.current._listRef._scrollRef.getNativeScrollRef() and UseRefResult.current._listRef._scrollRef.getNativeScrollRef()._nativeRef))
	end)
	UseAnimateScrollViewToSelectionFunction(UseStateResult, 0.2)
	local UseSignalStateResult1 = if FFlagEnableStickyShortcutBarOnAllPlatforms then UseSignalStateFunction(GetShortcutBarStatusStore(false).getShortcutBarVisible) else false
	local Copy = table.clone(Tbl)
	Copy.deviceSafePadding = UseSignalStateResult
	Copy.listRef = UseRefResult
	Copy.scrollEnabled = not IsUseLastInputResultMatch or (UseStateResult == nil or UseStateResult.current == nil)
	Copy.isShortcutBarVisible = if FFlagEnableStickyShortcutBarOnAllPlatforms then UseSignalStateResult1 else nil
	
	return ReactModule.createElement(ConversationListWithTopBar, Copy)
end

return if FFlagAppChatConsoleFocusFixesModule then ConversationListWithTopBarFunctional else ConversationListWithTopBar