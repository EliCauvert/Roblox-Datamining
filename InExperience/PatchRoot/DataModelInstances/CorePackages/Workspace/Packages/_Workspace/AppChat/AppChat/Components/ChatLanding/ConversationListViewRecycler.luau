local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatPerfExperimentation = require(Parent.SocialExperiments).AppChatPerfExperimentation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CoreGui = require(Parent.ReactFocusNavigation).EngineInterface.CoreGui
local FocusNavigationService = require(Parent.ReactFocusNavigation).FocusNavigationService
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SharedFlagsModule = require(Parent.SharedFlags)
local Signal = require(Parent.AppCommonLib).Signal
local SignalsModule = require(Parent.Signals)
local SocialCarouselModule = require(Parent.SocialCarousel)
local FoundationModule = require(Parent.Foundation)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local Constants = SocialCarouselModule.Constants
local Enums = SocialCarouselModule.Enums
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local ConversationListViewRecyclerItemsModule = require(script.Parent.ConversationListViewRecyclerItems)
local AppChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagFriendsChatConversationListShowScrollBar = SharedFlagsModule.FFlagFriendsChatConversationListShowScrollBar
local FFlagViewRecyclerReact06 = SharedFlagsModule.FFlagViewRecyclerReact06
local AppChatChatLandingInitialFetchMinimumConversations = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local FFlagAppChatRemoveConversationListDividerIxpEnabledModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDividerIxpEnabled)
local FStringAppChatRemoveConversationListDividerIxpLayerModule = require(AppChat.Flags.FStringAppChatRemoveConversationListDividerIxpLayer)
local AppChatPerfChatLandingPaginationOnStartReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local AppChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 10)
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local NewResult = require(script.Parent.Logger):new(script.Name)
local AppChatConversationListScrollBarIdleHideMsRatio = game:DefineFastInt("AppChatConversationListScrollBarIdleHideMs", 1500) / 1000
local config = {
	dampingRatio = 1,
	frequency = 2,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

local function noop() end

local config1 = {
	entryHeight = 64,
	LayoutOrder = 1,
	showHeaderEntries = true,
	itemList = {},
	Size = UDim2.fromScale(1, 1),
	onScrollUpdate = noop,
	navigateToConversationFromUserId = noop,
	navigateToQuickStartSquadInviteFriends = noop,
	navigateToSquadLobby = noop,
	fireConversationImpressionEvent = noop,
	fireConversationClickedEvent = noop,
	rowProps = {}
}

local function _(Entry): string
	return `{#Entry}:{tostring(if Entry[1] == nil then nil else Entry[1].id)}:{tostring(if Entry[#Entry] == nil then nil else Entry[#Entry].id)}`
end

local function buildConversationItems(ItemList, p1)
	-- upvalues: ConversationListViewRecyclerItemsModule (copy)
	local Buffer = table.create(#ItemList)
	
	for i, value in ItemList do
		Buffer[i] = ConversationListViewRecyclerItemsModule.conversation(value.id, p1)
	end
	return Buffer
end

local function concatItems(p2, p3)
	local Buffer = table.create(#p2 + #p3)
	table.move(p2, 1, #p2, 1, Buffer)
	table.move(p3, 1, #p3, #p2 + 1, Buffer)
	
	return Buffer
end

local function usePresentationSignal(UseMemoResult)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval), UseMemoResult (copy)
		local Signal, Signal2 = SignalsModule.createSignal(UseMemoResult)
		
		return { get = Signal, set = Signal2 }
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), UseMemoResult (copy)
		UseStateResult.set(UseMemoResult)
	end, { UseStateResult, UseMemoResult })
	
	return UseStateResult.get
end

local _ = function(p2, p3)
	local v1 = p2[p3]
	
	return if v1 == nil then nil else v1.id
end

local _ = function(p2, p3, p4)
	-- upvalues: ViewRecyclerModule (copy)
	return function(p5, p6)
		-- upvalues: p4 (copy), p3 (copy), ViewRecyclerModule (upval), p2 (copy)
		local Current = p4.current
		local Current1 = p3.current
		p3.current = Current
		
		if p6.scrollOffset > 33 then
			return false
		end
		for _, change in p5.changes do
			if change.type == ViewRecyclerModule.DataSourceChangeType.Insert and change.index == p2 then
				return ViewRecyclerModule.AutoScrollTarget.Start
			elseif change.type == ViewRecyclerModule.DataSourceChangeType.Reset and Current1 ~= nil and Current ~= nil and Current1 ~= Current then
				return ViewRecyclerModule.AutoScrollTarget.Start
			end
		end
		return false
	end
end

local function usePagination(JoinResult, Entry)
	-- upvalues: ReactModule (copy), AppChatChatLandingInitialFetchLimit (copy), AppChatChatLandingInitialFetchMinimumConversations (copy), NewResult (copy)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseMemoResult = ReactModule.useMemo(function(): string
		-- upvalues: Entry (copy)
		return `{#Entry}:{tostring(if Entry[1] == nil then nil else Entry[1].id)}:{tostring(if Entry[#Entry] == nil then nil else Entry[#Entry].id)}`
	end, { Entry })
	local NoOldestConversationIsFetched: boolean = JoinResult.loadNext ~= nil and (not JoinResult.isLoadingNext and not JoinResult.oldestConversationIsFetched)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), JoinResult (copy), UseRefResult1 (copy)
		if UseRefResult2.current and not JoinResult.isLoadingNext then
			UseRefResult1.current = nil
		end
		UseRefResult2.current = JoinResult.isLoadingNext == true
	end, { JoinResult.isLoadingNext })
	local UseResult = ReactModule.useCallback(function(): boolean
		-- upvalues: NoOldestConversationIsFetched (copy), UseRefResult1 (copy), UseMemoResult (copy), JoinResult (copy)
		if NoOldestConversationIsFetched and UseRefResult1.current ~= UseMemoResult then
			UseRefResult1.current = UseMemoResult
			JoinResult.loadNext()
			
			return true
		else
			return false
		end
	end, {
		NoOldestConversationIsFetched,
		UseMemoResult,
		JoinResult.loadNext
	})
	ReactModule.useEffect(function()
		-- upvalues: NoOldestConversationIsFetched (copy), UseRefResult (copy), AppChatChatLandingInitialFetchLimit (upval), Entry (copy), AppChatChatLandingInitialFetchMinimumConversations (upval), UseResult (copy), NewResult (upval)
		if NoOldestConversationIsFetched and UseRefResult.current < AppChatChatLandingInitialFetchLimit and #Entry < AppChatChatLandingInitialFetchMinimumConversations then
			local NewCurrent = UseRefResult.current + 1
			
			if UseResult() then
				UseRefResult.current = NewCurrent
				NewResult:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #Entry, AppChatChatLandingInitialFetchMinimumConversations, UseRefResult.current, AppChatChatLandingInitialFetchLimit)
			end
		end
	end, { Entry, NoOldestConversationIsFetched, UseResult })
	
	return NoOldestConversationIsFetched, UseResult, ReactModule.useCallback(function()
		-- upvalues: JoinResult (copy), NewResult (upval)
		if JoinResult.loadPrevious ~= nil and not JoinResult.isLoadingPrevious then
			NewResult:debug("ViewRecycler onStartReached - Loading previous conversations")
			JoinResult.loadPrevious()
		end
	end, { JoinResult.loadPrevious, JoinResult.isLoadingPrevious }), (ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), NewResult (upval)
		if UseResult() then
			NewResult:debug("ViewRecycler onEndReached - Loading more conversations")
		end
	end, { UseResult }))
end

local function useUnderfillPagination(Callback)
	-- upvalues: ReactModule (copy), NewResult (copy)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), Callback (copy), NewResult (upval)
		if UseRefResult1.current > 0 and UseRefResult.current > 0 and UseRefResult1.current <= UseRefResult.current and Callback() then
			NewResult:info("Loading more conversations because ViewRecycler content does not fill the viewport")
		end
	end, { Callback })
	
	return ReactModule.useCallback(function(p5)
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = p5.Y
		UseResult()
	end, { UseResult }), (ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		UseRefResult1.current = Current
		UseResult()
	end, { UseResult }))
end

local function useScrollTracking(Callback1, Callback)
	-- upvalues: ReactModule (copy), Signal (copy), FFlagAppChatPerfTrackingModule (copy), CreateScrollIntervalTrackerModule (copy), AppChatPerfTrackerModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Y)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), UseRefResult (copy), Callback (copy), UseMemoResult (copy), Callback1 (copy)
		if FFlagAppChatPerfTrackingModule and UseRefResult.current then
			UseRefResult.current.onScrollTick()
		end
		if Callback ~= nil then
			Callback()
		end
		UseMemoResult:fire()
		Callback1({ CanvasPosition = Vector2.new(0, Y) })
	end, { UseMemoResult, Callback1, Callback })
	local UseResult1 = ReactModule.useCallback(function(p5)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p5)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), FFlagAppChatPerfTrackingModule (upval), UseRefResult (copy), CreateScrollIntervalTrackerModule (upval), AppChatPerfTrackerModule (upval)
		if UseStateResult == nil then
			return nil
		end
		UseStateResult.Selectable = false
		
		if FFlagAppChatPerfTrackingModule then
			UseRefResult.current = CreateScrollIntervalTrackerModule(AppChatPerfTrackerModule.Events.ScrollConversationList, UseStateResult)
		end
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current.cleanup()
				UseRefResult.current = nil
			end
		end
	end, { UseStateResult })
	
	return UseMemoResult, UseResult1, UseResult
end

local function useMeasuredLayout(EstimatedItemLength)
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: ViewRecyclerModule (upval), EstimatedItemLength (copy)
		return ViewRecyclerModule.Layout.measured({ estimatedItemLength = EstimatedItemLength })
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy)
		return function()
			-- upvalues: UseStateResult (upval)
			UseStateResult.destroy()
		end
	end, { UseStateResult })
	
	return UseStateResult
end

local function useConversationListScrollbar(IsShowScrollbarOnScroll, ScrollbarThickness, EmphasisColor)
	-- upvalues: FFlagFriendsChatConversationListShowScrollBar (copy), ReactModule (copy), ReactOtterModule (copy), AppChatConversationListScrollBarIdleHideMsRatio (copy), config (copy)
	local UseRefResult = nil
	local v1 = nil
	local Callback = nil
	
	if FFlagFriendsChatConversationListShowScrollBar then
		UseRefResult = ReactModule.useRef(nil)
		v1, Callback = ReactOtterModule.useAnimatedBinding(1)
	end
	local UseResult = nil
	
	if FFlagFriendsChatConversationListShowScrollBar then
		UseResult = ReactModule.useCallback(function()
			-- upvalues: IsShowScrollbarOnScroll (copy), UseRefResult (ref), Callback (ref), ReactOtterModule (upval), AppChatConversationListScrollBarIdleHideMsRatio (upval), config (upval)
			if not IsShowScrollbarOnScroll then return end
			if UseRefResult.current ~= nil then
				pcall(task.cancel, UseRefResult.current)
				UseRefResult.current = nil
			end
			Callback(ReactOtterModule.instant(0))
			UseRefResult.current = task.delay(AppChatConversationListScrollBarIdleHideMsRatio, function()
				-- upvalues: UseRefResult (upval), Callback (upval), ReactOtterModule (upval), config (upval)
				UseRefResult.current = nil
				Callback(ReactOtterModule.spring(1, config))
			end)
		end, { IsShowScrollbarOnScroll, Callback })
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (ref)
			return function()
				-- upvalues: UseRefResult (upval)
				if UseRefResult.current ~= nil then
					pcall(task.cancel, UseRefResult.current)
					UseRefResult.current = nil
				end
			end
		end, {})
	end
	local IsShowScrollbarOnScroll1 = FFlagFriendsChatConversationListShowScrollBar and IsShowScrollbarOnScroll
	
	return {
		ScrollBarThickness = if IsShowScrollbarOnScroll1 then ScrollbarThickness or 8 else 0,
		ScrollBarImageColor3 = if IsShowScrollbarOnScroll1 then EmphasisColor else nil,
		ScrollBarImageTransparency = if IsShowScrollbarOnScroll1 then v1 else nil
	}, UseResult
end

local function useListData(UseMemoResult, UseMemoResult1)
	-- upvalues: ReactModule (copy), concatItems (copy), ConversationListViewRecyclerItemsModule (copy)
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: concatItems (upval), UseMemoResult (copy), UseMemoResult1 (copy)
		return (concatItems(UseMemoResult, UseMemoResult1))
	end, { UseMemoResult, UseMemoResult1 })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), ConversationListViewRecyclerItemsModule (upval)
		return {
			items = UseMemoResult2,
			getItemKey = ConversationListViewRecyclerItemsModule.getItemKey
		}
	end, { UseMemoResult2 }), UseMemoResult2
end

return ReactModule.memo(function(p5)
	-- upvalues: CryoModule (copy), config1 (copy), UseTokensFunction (copy), usePagination (copy), useUnderfillPagination (copy), useConversationListScrollbar (copy), useScrollTracking (copy), ReactModule (copy), AppChatPerfExperimentation (copy), PartyPageCarouselExperimentation (copy), SquadQuickStartExperimentation (copy), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), FStringAppChatRemoveConversationListDividerIxpLayerModule (copy), FocusNavigationService (copy), CoreGui (copy), AppPage (copy), Constants (copy), Enums (copy), usePresentationSignal (copy), FFlagAppIaScrollAway (copy), ConversationListViewRecyclerItemsModule (copy), buildConversationItems (copy), useListData (copy), useMeasuredLayout (copy), ViewRecyclerModule (copy), View (copy), AppChatPerfChatLandingPaginationOnStartReachedUnits (copy), AppChatPerfChatLandingPaginationOnEndReachedUnits (copy), FFlagViewRecyclerReact06 (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p5)
	local EntryHeight = JoinResult.entryHeight
	local ItemList = JoinResult.itemList
	local Size = JoinResult.Size
	local LayoutOrder = JoinResult.LayoutOrder
	local OnScrollUpdate = JoinResult.onScrollUpdate
	local NavigateToConversationFromUserIdFunction = JoinResult.navigateToConversationFromUserId
	local NavigateToQuickStartSquadInviteFriends = JoinResult.navigateToQuickStartSquadInviteFriends
	local NavigateToSquadLobby = JoinResult.navigateToSquadLobby
	local FireConversationImpressionEvent = JoinResult.fireConversationImpressionEvent
	local FireConversationClickedEvent = JoinResult.fireConversationClickedEvent
	local ShowHeaderEntries = JoinResult.showHeaderEntries
	local RowProps = JoinResult.rowProps
	local UseTokensResult = UseTokensFunction()
	local UsePaginationResult, UsePaginationResult2, UsePaginationResult3, UsePaginationResult4 = usePagination(JoinResult, ItemList)
	local UseUnderfillPaginationResult, UseUnderfillPaginationResult2 = useUnderfillPagination(UsePaginationResult2)
	local UseConversationListScrollbarResult, UseConversationListScrollbarResult2 = useConversationListScrollbar(JoinResult.showScrollbarOnScroll == true, JoinResult.scrollbarThickness, UseTokensResult.Color.Content.Emphasis.Color3)
	local UseScrollTrackingResult, UseScrollTrackingResult2, UseScrollTrackingResult3 = useScrollTracking(OnScrollUpdate, UseConversationListScrollbarResult2)
	ReactModule.useEffect(function()
		-- upvalues: AppChatPerfExperimentation (upval), JoinResult (copy), PartyPageCarouselExperimentation (upval), SquadQuickStartExperimentation (upval), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (upval), IXPService (upval), FStringAppChatRemoveConversationListDividerIxpLayerModule (upval)
		AppChatPerfExperimentation.logExposure()
		
		if JoinResult.shouldLogHeaderEntryExposures ~= false then
			PartyPageCarouselExperimentation.logExposure()
			
			if SquadQuickStartExperimentation.isLogExposureEnabled then
				SquadQuickStartExperimentation.logExposure()
			end
			if FFlagAppChatRemoveConversationListDividerIxpEnabledModule then
				IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatRemoveConversationListDividerIxpLayerModule)
			end
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FocusNavigationService (upval), CoreGui (upval)
		local NewFocusNavigationService = FocusNavigationService.new(CoreGui)
		
		return function()
			-- upvalues: NewFocusNavigationService (copy)
			NewFocusNavigationService:teardown()
		end
	end, {})
	local IsCanAccessParty = JoinResult.canAccessParty == true
	local IsPartyQuickStartEnabled = JoinResult.isPartyQuickStartEnabled
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AppPage (upval), JoinResult (copy), Constants (upval), UseScrollTrackingResult (copy)
		return {
			sortId = 0,
			sortIndex = 1,
			appPage = AppPage.Chat,
			impressionTag = if JoinResult.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else Constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			scrollViewPositionChangedSignal = UseScrollTrackingResult
		}
	end, { JoinResult.isInExperience, UseScrollTrackingResult })
	local UseResult = ReactModule.useCallback(function(p6)
		-- upvalues: NavigateToConversationFromUserIdFunction (copy)
		NavigateToConversationFromUserIdFunction(p6.id)
	end, { NavigateToConversationFromUserIdFunction })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Enums (upval), NavigateToQuickStartSquadInviteFriends (copy), UseResult (copy)
		return {
			{
				tileGroup = Enums.TileGroup.StartSquad,
				onActivated = NavigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = Enums.TileGroup.FriendsList,
				onActivated = UseResult
			}
		}
	end, { NavigateToQuickStartSquadInviteFriends, UseResult })
	local UsePresentationSignalResult = usePresentationSignal((ReactModule.useMemo(function()
		-- upvalues: EntryHeight (copy), IsCanAccessParty (copy), JoinResult (copy), NavigateToSquadLobby (copy), FireConversationImpressionEvent (copy), FireConversationClickedEvent (copy), RowProps (copy)
		return {
			entryHeight = EntryHeight,
			isSquadEnabled = IsCanAccessParty,
			isWideMode = JoinResult.isWideMode,
			onActivated = JoinResult.onActivated,
			onSquadJoinButtonActivated = NavigateToSquadLobby,
			fireImpressionEvent = FireConversationImpressionEvent,
			fireClickEvent = FireConversationClickedEvent,
			showBackground = RowProps.showBackground,
			localUserId = JoinResult.localUserId,
			isDebugEnabled = JoinResult.isDebugEnabled == true
		}
	end, {
		EntryHeight, IsCanAccessParty, JoinResult.isWideMode, JoinResult.onActivated,
		NavigateToSquadLobby, FireConversationImpressionEvent,
		FireConversationClickedEvent, RowProps.showBackground, JoinResult.localUserId,
		JoinResult.isDebugEnabled
	})))
	local IsFilterTextMatch: boolean = JoinResult.filterText == "" or JoinResult.filterText == nil
	local IsFilterTextMatch1: boolean = ShowHeaderEntries and IsFilterTextMatch
	local PartyPageCarouselEnabled = PartyPageCarouselExperimentation.getPartyPageCarouselEnabled()
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagAppIaScrollAway (upval), JoinResult (copy), ConversationListViewRecyclerItemsModule (upval), UseTokensResult (copy), IsFilterTextMatch1 (copy), IsPartyQuickStartEnabled (copy), PartyPageCarouselEnabled (copy), UseMemoResult1 (copy), UseMemoResult (copy), EntryHeight (copy)
		local List = {}
		
		if FFlagAppIaScrollAway and JoinResult.canvasTopPadding ~= nil and JoinResult.canvasTopPadding > 0 then
			table.insert(List, ConversationListViewRecyclerItemsModule.canvasTopPadding(JoinResult.canvasTopPadding, UseTokensResult.Color.None))
		end
		if IsFilterTextMatch1 then
			table.insert(List, ConversationListViewRecyclerItemsModule.chatLandingModal())
			
			if IsPartyQuickStartEnabled and PartyPageCarouselEnabled and (JoinResult.isWideMode or not JoinResult.isInExperience) then
				table.insert(List, ConversationListViewRecyclerItemsModule.socialCarousel(UseMemoResult1, JoinResult.isInExperience, UseMemoResult))
			elseif IsPartyQuickStartEnabled and not PartyPageCarouselEnabled then
				table.insert(List, ConversationListViewRecyclerItemsModule.quickStart(EntryHeight))
			end
			if JoinResult.showGroupsLink == true then
				table.insert(List, ConversationListViewRecyclerItemsModule.groupLink(EntryHeight))
			end
		end
		return List
	end, {
		IsFilterTextMatch1, IsPartyQuickStartEnabled, PartyPageCarouselEnabled,
		JoinResult.isWideMode, JoinResult.isInExperience, JoinResult.showGroupsLink,
		JoinResult.canvasTopPadding, UseTokensResult.Color.None, UseMemoResult1,
		UseMemoResult, EntryHeight
	})
	local UseListDataResult, UseListDataResult2 = useListData(UseMemoResult2, (ReactModule.useMemo(function()
		-- upvalues: buildConversationItems (upval), ItemList (copy), UsePresentationSignalResult (copy)
		return (buildConversationItems(ItemList, UsePresentationSignalResult))
	end, { ItemList, UsePresentationSignalResult })))
	local UseMeasuredLayoutResult = useMeasuredLayout(EntryHeight)
	local Index = #UseMemoResult2 + 1
	local UseListDataResultEntry = UseListDataResult2[Index]
	local Id = if UseListDataResultEntry == nil then nil else UseListDataResultEntry.id
	local UseRefResult = ReactModule.useRef(Id)
	local UseRefResult1 = ReactModule.useRef(Id)
	UseRefResult1.current = Id
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: Index (copy), UseRefResult (copy), UseRefResult1 (copy), ViewRecyclerModule (upval)
		return function(p6, p7)
			-- upvalues: UseRefResult1 (copy), UseRefResult (copy), ViewRecyclerModule (upval), Index (copy)
			local Current = UseRefResult1.current
			local Current1 = UseRefResult.current
			UseRefResult.current = Current
			
			if p7.scrollOffset > 33 then
				return false
			end
			for _, change in p6.changes do
				if change.type == ViewRecyclerModule.DataSourceChangeType.Insert and change.index == Index then
					return ViewRecyclerModule.AutoScrollTarget.Start
				elseif change.type == ViewRecyclerModule.DataSourceChangeType.Reset and Current1 ~= nil and Current ~= nil and Current1 ~= Current then
					return ViewRecyclerModule.AutoScrollTarget.Start
				end
			end
			return false
		end
	end, { Index })
	
	return if #UseListDataResult2 == 0 then ReactModule.createElement(View, {
		BorderSizePixel = 0,
		Size = Size,
		backgroundStyle = UseTokensResult.Color.None,
		LayoutOrder = LayoutOrder
	}) else ReactModule.createElement(View, {
		BorderSizePixel = 0,
		Size = Size,
		backgroundStyle = UseTokensResult.Color.None,
		LayoutOrder = LayoutOrder
	}, {
		List = ReactModule.createElement(ViewRecyclerModule.VirtualList, {
			overscan = 2,
			data = UseListDataResult,
			layout = UseMeasuredLayoutResult,
			axis = ViewRecyclerModule.Axis.Y,
			itemType = ConversationListViewRecyclerItemsModule.getItemType,
			scrollingFrameRef = UseScrollTrackingResult2,
			onViewportChanged = UseUnderfillPaginationResult,
			onContentLengthChanged = UseUnderfillPaginationResult2,
			onScrollOffsetChanged = UseScrollTrackingResult3,
			onStartReached = if JoinResult.loadPrevious == nil or JoinResult.isLoadingPrevious then nil else UsePaginationResult3,
			onEndReached = if UsePaginationResult then UsePaginationResult4 else nil,
			startReachedThreshold = EntryHeight * AppChatPerfChatLandingPaginationOnStartReachedUnits,
			endReachedThreshold = EntryHeight * AppChatPerfChatLandingPaginationOnEndReachedUnits,
			autoScrollOnChange = if FFlagViewRecyclerReact06 then ViewRecyclerModule.AutoScrollPolicy.WhenAtStart else UseMemoResult3,
			autoScrollThreshold = if FFlagViewRecyclerReact06 then 33 else nil,
			scrollingFrameProps = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = UseConversationListScrollbarResult.ScrollBarThickness,
				ScrollBarImageColor3 = UseConversationListScrollbarResult.ScrollBarImageColor3,
				ScrollBarImageTransparency = UseConversationListScrollbarResult.ScrollBarImageTransparency
			}
		})
	})
end)