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
local Signal = require(Parent.AppCommonLib).Signal
local SignalsModule = require(Parent.Signals)
local SocialCarouselModule = require(Parent.SocialCarousel)
local FoundationModule = require(Parent.Foundation)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAppChatConversationListViewRecyclerConsolePropsModule = require(AppChat.Flags.FFlagAppChatConversationListViewRecyclerConsoleProps)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagFriendsChatUseViewRecyclerConversationListModule = require(AppChat.Flags.FFlagFriendsChatUseViewRecyclerConversationList)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local Constants = SocialCarouselModule.Constants
local Enums = SocialCarouselModule.Enums
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local ConversationListItemKindModule = require(script.Parent.ConversationListItemKind)
local ConversationListViewRecyclerItemsModule = require(script.Parent.ConversationListViewRecyclerItems)
local _ = require(script.Parent.ConversationListTrailingItems)
local ConversationRowLookupModule = require(script.Parent.ConversationRowLookup)
local AppChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local FFlagAppIaScrollAway = require(Parent.SharedFlags).FFlagAppIaScrollAway
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

local function buildTrailingItems(TrailingItems, p2)
	-- upvalues: ConversationListItemKindModule (copy), ConversationListViewRecyclerItemsModule (copy)
	local Buffer = table.create(#TrailingItems)
	
	for i, trailingItem in TrailingItems do
		Buffer[i] = if trailingItem.kind == ConversationListItemKindModule.SuggestedUser then ConversationListViewRecyclerItemsModule.suggestedUser(trailingItem, p2) else trailingItem
	end
	return Buffer
end

local function concatItems(UseMemoResult, UseMemoResult1)
	local Buffer = table.create(#UseMemoResult + #UseMemoResult1)
	table.move(UseMemoResult, 1, #UseMemoResult, 1, Buffer)
	table.move(UseMemoResult1, 1, #UseMemoResult1, #UseMemoResult + 1, Buffer)
	
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

local _ = function(p3, p4)
	-- upvalues: ReactModule (copy), ConversationRowLookupModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p4 (copy), ConversationRowLookupModule (upval)
		if p3 == nil then
			return nil
		else
			p3.current = {
				findRow = function(p5)
					-- upvalues: p4 (upval), ConversationRowLookupModule (upval)
					return if p4 == nil then nil else ConversationRowLookupModule.findVisibleRow(p4, p5)
				end,
				getConversationId = function(Object)
					-- upvalues: p4 (upval), ConversationRowLookupModule (upval)
					return if p4 == nil or not Object:IsDescendantOf(p4) then nil else ConversationRowLookupModule.getConversationId(Object)
				end,
				onRowReused = ConversationRowLookupModule.onConversationChanged
			}
			
			return function()
				-- upvalues: p3 (upval)
				p3.current = nil
			end
		end
	end, { p3, p4 })
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
	
	return ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = p3.Y
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
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p3)
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
	
	return UseMemoResult, UseResult1, UseResult, UseStateResult
end

local Frozen = table.freeze({
	recordMeasurementAndShouldUpdateEstimates = function(_): boolean
		return false
	end
})

local function useMeasuredLayout(EstimatedItemLength, HasRenderSuggestedUser)
	-- upvalues: ReactModule (copy), ViewRecyclerModule (copy), Frozen (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ViewRecyclerModule (upval), EstimatedItemLength (copy), HasRenderSuggestedUser (copy), Frozen (upval)
		return ViewRecyclerModule.Layout.measured({
			estimatedItemLength = EstimatedItemLength,
			estimationPolicy = if HasRenderSuggestedUser then Frozen else nil
		})
	end, {
		HasRenderSuggestedUser,
		if HasRenderSuggestedUser then EstimatedItemLength else 0
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.destroy()
		end
	end, { UseMemoResult })
	
	return UseMemoResult
end

local function useConversationListScrollbar(IsShowScrollbarOnScroll, ScrollbarThickness, EmphasisColor)
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), AppChatConversationListScrollBarIdleHideMsRatio (copy), config (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsShowScrollbarOnScroll (copy), UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), AppChatConversationListScrollBarIdleHideMsRatio (upval), config (upval)
		if not IsShowScrollbarOnScroll then return end
		if UseRefResult.current ~= nil then
			pcall(task.cancel, UseRefResult.current)
			UseRefResult.current = nil
		end
		UseAnimatedBindingResult2(ReactOtterModule.instant(0))
		UseRefResult.current = task.delay(AppChatConversationListScrollBarIdleHideMsRatio, function()
			-- upvalues: UseRefResult (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
			UseRefResult.current = nil
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
		end)
	end, { IsShowScrollbarOnScroll, UseAnimatedBindingResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current ~= nil then
				pcall(task.cancel, UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	
	return {
		ScrollBarThickness = if IsShowScrollbarOnScroll then ScrollbarThickness or 8 else 0,
		ScrollBarImageColor3 = if IsShowScrollbarOnScroll then EmphasisColor else nil,
		ScrollBarImageTransparency = if IsShowScrollbarOnScroll then UseAnimatedBindingResult else nil
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

local _ = function(p3, p4, p5)
	-- upvalues: ReactModule (copy), concatItems (copy), ConversationListViewRecyclerItemsModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p4 (copy), p3 (copy), concatItems (upval), ConversationListViewRecyclerItemsModule (upval), p5 (copy)
		return if p4 == nil or p4 <= 0 then p3 else concatItems(p3, {
			ConversationListViewRecyclerItemsModule.canvasBottomPadding(p4, p5)
		})
	end, { p3, p4, p5 })
end

local function useLegacyListRef(ListRef, p3, Callback)
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p3 (copy)
		return if p3 then { current = nil } else nil
	end, { p3 })
	ReactModule.useLayoutEffect(function()
		-- upvalues: ListRef (copy), UseMemoResult (copy)
		if ListRef == nil then
			return nil
		else
			local Config = if UseMemoResult == nil then nil else { _nativeRef = UseMemoResult }
			ListRef.current = {
				_listRef = {
					_scrollRef = {
						getNativeScrollRef = function()
							-- upvalues: Config (copy)
							return Config
						end
					}
				}
			}
			
			return function()
				-- upvalues: ListRef (upval)
				ListRef.current = nil
			end
		end
	end, { ListRef, UseMemoResult })
	
	return ReactModule.useCallback(function(Current)
		-- upvalues: UseMemoResult (copy), Callback (copy)
		if UseMemoResult ~= nil then
			UseMemoResult.current = Current
		end
		Callback(Current)
	end, { UseMemoResult, Callback })
end

return ReactModule.memo(function(p3)
	-- upvalues: CryoModule (copy), config1 (copy), UseTokensFunction (copy), usePagination (copy), useUnderfillPagination (copy), useConversationListScrollbar (copy), useScrollTracking (copy), ReactModule (copy), ConversationRowLookupModule (copy), FFlagFriendsChatUseViewRecyclerConversationListModule (copy), AppChatPerfExperimentation (copy), PartyPageCarouselExperimentation (copy), SquadQuickStartExperimentation (copy), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), FStringAppChatRemoveConversationListDividerIxpLayerModule (copy), FocusNavigationService (copy), CoreGui (copy), AppPage (copy), Constants (copy), Enums (copy), usePresentationSignal (copy), FFlagAppIaScrollAway (copy), ConversationListViewRecyclerItemsModule (copy), buildConversationItems (copy), buildTrailingItems (copy), concatItems (copy), FFlagAppChatConversationListViewRecyclerConsolePropsModule (copy), useListData (copy), useLegacyListRef (copy), useMeasuredLayout (copy), View (copy), ViewRecyclerModule (copy), AppChatPerfChatLandingPaginationOnStartReachedUnits (copy), AppChatPerfChatLandingPaginationOnEndReachedUnits (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p3)
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
	local UseScrollTrackingResult, UseScrollTrackingResult2, UseScrollTrackingResult3, UseScrollTrackingResult4 = useScrollTracking(OnScrollUpdate, UseConversationListScrollbarResult2)
	local HandleRef = JoinResult.handleRef
	ReactModule.useEffect(function()
		-- upvalues: HandleRef (copy), UseScrollTrackingResult4 (copy), ConversationRowLookupModule (upval)
		if HandleRef == nil then
			return nil
		else
			HandleRef.current = {
				findRow = function(p4)
					-- upvalues: UseScrollTrackingResult4 (upval), ConversationRowLookupModule (upval)
					return if UseScrollTrackingResult4 == nil then nil else ConversationRowLookupModule.findVisibleRow(UseScrollTrackingResult4, p4)
				end,
				getConversationId = function(Object)
					-- upvalues: UseScrollTrackingResult4 (upval), ConversationRowLookupModule (upval)
					return if UseScrollTrackingResult4 == nil or not Object:IsDescendantOf(UseScrollTrackingResult4) then nil else ConversationRowLookupModule.getConversationId(Object)
				end,
				onRowReused = ConversationRowLookupModule.onConversationChanged
			}
			
			return function()
				-- upvalues: HandleRef (upval)
				HandleRef.current = nil
			end
		end
	end, { HandleRef, UseScrollTrackingResult4 })
	ReactModule.useEffect(function()
		-- upvalues: FFlagFriendsChatUseViewRecyclerConversationListModule (upval), JoinResult (copy), AppChatPerfExperimentation (upval), PartyPageCarouselExperimentation (upval), SquadQuickStartExperimentation (upval), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (upval), IXPService (upval), FStringAppChatRemoveConversationListDividerIxpLayerModule (upval)
		if not FFlagFriendsChatUseViewRecyclerConversationListModule or JoinResult.shouldLogPerfExposure ~= false then
			AppChatPerfExperimentation.logExposure()
		end
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
	local UseResult = ReactModule.useCallback(function(p4)
		-- upvalues: NavigateToConversationFromUserIdFunction (copy)
		NavigateToConversationFromUserIdFunction(p4.id)
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
			isDebugEnabled = JoinResult.isDebugEnabled == true,
			markRows = JoinResult.handleRef ~= nil
		}
	end, {
		EntryHeight, IsCanAccessParty, JoinResult.isWideMode, JoinResult.onActivated,
		NavigateToSquadLobby, FireConversationImpressionEvent,
		FireConversationClickedEvent, RowProps.showBackground, JoinResult.localUserId,
		JoinResult.isDebugEnabled, JoinResult.handleRef
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
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: buildConversationItems (upval), ItemList (copy), UsePresentationSignalResult (copy)
		return (buildConversationItems(ItemList, UsePresentationSignalResult))
	end, { ItemList, UsePresentationSignalResult })
	local UsePresentationSignalResult1 = usePresentationSignal((ReactModule.useMemo(function()
		-- upvalues: JoinResult (copy)
		return { renderSuggestedUser = JoinResult.renderSuggestedUser }
	end, { JoinResult.renderSuggestedUser })))
	local TrailingItems = JoinResult.trailingItems
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: TrailingItems (copy), buildTrailingItems (upval), UsePresentationSignalResult1 (copy)
		return if TrailingItems == nil or #TrailingItems == 0 then nil else buildTrailingItems(TrailingItems, UsePresentationSignalResult1)
	end, { TrailingItems, UsePresentationSignalResult1 })
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult4 (copy), UseMemoResult3 (copy), concatItems (upval)
		return if UseMemoResult4 == nil then UseMemoResult3 else concatItems(UseMemoResult3, UseMemoResult4)
	end, { UseMemoResult3, UseMemoResult4 })
	local UseMemoResult6 = UseMemoResult5
	
	if FFlagAppChatConversationListViewRecyclerConsolePropsModule then
		local CanvasBottomPadding = JoinResult.canvasBottomPadding
		local None = UseTokensResult.Color.None
		UseMemoResult6 = ReactModule.useMemo(function()
			-- upvalues: CanvasBottomPadding (copy), UseMemoResult5 (copy), concatItems (upval), ConversationListViewRecyclerItemsModule (upval), None (copy)
			return if CanvasBottomPadding == nil or CanvasBottomPadding <= 0 then UseMemoResult5 else concatItems(UseMemoResult5, {
				ConversationListViewRecyclerItemsModule.canvasBottomPadding(CanvasBottomPadding, None)
			})
		end, { UseMemoResult5, CanvasBottomPadding, None })
	end
	local UseListDataResult, UseListDataResult2 = useListData(UseMemoResult2, UseMemoResult6)
	local UseLegacyListRefResult = if FFlagAppChatConversationListViewRecyclerConsolePropsModule then useLegacyListRef(JoinResult.listRef, #UseListDataResult2 > 0, UseScrollTrackingResult2) else UseScrollTrackingResult2
	local UseMeasuredLayoutResult = useMeasuredLayout(EntryHeight, JoinResult.renderSuggestedUser ~= nil)
	
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
			autoScrollThreshold = 33,
			data = UseListDataResult,
			layout = UseMeasuredLayoutResult,
			axis = ViewRecyclerModule.Axis.Y,
			itemType = ConversationListViewRecyclerItemsModule.getItemType,
			scrollingFrameRef = UseLegacyListRefResult,
			onViewportChanged = UseUnderfillPaginationResult,
			onContentLengthChanged = UseUnderfillPaginationResult2,
			onScrollOffsetChanged = UseScrollTrackingResult3,
			onStartReached = if JoinResult.loadPrevious == nil or JoinResult.isLoadingPrevious then nil else UsePaginationResult3,
			onEndReached = if UsePaginationResult then UsePaginationResult4 else nil,
			startReachedThreshold = EntryHeight * AppChatPerfChatLandingPaginationOnStartReachedUnits,
			endReachedThreshold = EntryHeight * AppChatPerfChatLandingPaginationOnEndReachedUnits,
			autoScrollOnChange = ViewRecyclerModule.AutoScrollPolicy.WhenAtStart,
			scrollingFrameProps = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = UseConversationListScrollbarResult.ScrollBarThickness,
				ScrollBarImageColor3 = UseConversationListScrollbarResult.ScrollBarImageColor3,
				ScrollBarImageTransparency = UseConversationListScrollbarResult.ScrollBarImageTransparency,
				ScrollingEnabled = if FFlagAppChatConversationListViewRecyclerConsolePropsModule then JoinResult.scrollEnabled ~= false else nil
			}
		})
	})
end)