local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatPerfExperimentation = require(Parent.SocialExperiments).AppChatPerfExperimentation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CoreGui = require(Parent.ReactFocusNavigation).EngineInterface.CoreGui
local CryoModule = require(Parent.Cryo)
local FocusNavigationService = require(Parent.ReactFocusNavigation).FocusNavigationService
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SharedFlagsModule = require(Parent.SharedFlags)
local Signal = require(Parent.AppCommonLib).Signal
local SocialCarouselModule = require(Parent.SocialCarousel)
local FoundationModule = require(Parent.Foundation)
local UltimateListModule = require(Parent.UltimateList)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local Constants = SocialCarouselModule.Constants
local Enums = SocialCarouselModule.Enums
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local ChatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local ConversationRowModule = require(script.Parent.ConversationRow)
local ConversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local PartyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local AppChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagFriendsChatConversationListShowScrollBar = SharedFlagsModule.FFlagFriendsChatConversationListShowScrollBar
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

local function noop() --[[ Line: 67 ]] end

local function _(p1) --[[ Line: 69 | Named "isPartyQuickStartEnabled" ]]
	return p1.isPartyQuickStartEnabled
end

local _ = function(p1): boolean --[[ Line: 73 | Named "getIsSquadEnabledForRows" ]]
	return p1.canAccessParty == true
end

local function getConversationRowListItems(ItemList) --[[ Line: 77 ]]
	local t = {}
	
	for i, value in ItemList do
		t[i] = { id = tostring(value.id) }
	end
	return t
end

local _ = function(Entry) --[[ Line: 87 | Named "getFirstId" ]]
	return if Entry and Entry[1] then Entry[1].id else nil
end

local _ = function(p1) --[[ Line: 91 | Named "getLastId" ]]
	return if p1 and p1[#p1] then p1[#p1].id else nil
end

local _ = function(Entry): string --[[ Line: 95 | Named "getAutoLoadNextRequestKey" ]]
	return `{#Entry}:{tostring(if Entry and Entry[1] then Entry[1].id else nil)}:{tostring(if Entry and Entry[#Entry] then Entry[#Entry].id else nil)}`
end

local function getKey(p1): string --[[ Line: 99 ]]
	return (tostring(p1.id))
end

local function MeasuredChatLandingModal(p1) --[[ Line: 103 ]]
	-- upvalues: ReactModule (copy), ChatLandingModalContainerModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 106 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil then
			p1.onHeightChanged(p1.itemId, Current.AbsoluteSize.Y)
		end
	end, { p1.itemId, p1.onHeightChanged })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = UseRefResult,
		[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 118 ]]
			-- upvalues: p1 (copy)
			p1.onHeightChanged(p1.itemId, Frame.AbsoluteSize.Y)
		end
	}, {
		ChatLandingModal = ReactModule.createElement(ChatLandingModalContainerModule, {})
	})
end

return ReactModule.memo(function(Frame) --[[ Line: 126 | Named "ConversationListUltimate" ]]
	-- upvalues: noop (copy), ReactModule (copy), Signal (copy), FFlagFriendsChatConversationListShowScrollBar (copy), ReactOtterModule (copy), UseTokensFunction (copy), CryoModule (copy), AppChatPerfExperimentation (copy), PartyPageCarouselExperimentation (copy), SquadQuickStartExperimentation (copy), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), FStringAppChatRemoveConversationListDividerIxpLayerModule (copy), FocusNavigationService (copy), CoreGui (copy), FFlagAppChatPerfTrackingModule (copy), CreateScrollIntervalTrackerModule (copy), AppChatPerfTrackerModule (copy), AppPage (copy), Constants (copy), Enums (copy), getConversationRowListItems (copy), FFlagAppIaScrollAway (copy), AppChatChatLandingInitialFetchLimit (copy), AppChatChatLandingInitialFetchMinimumConversations (copy), NewResult (copy), AppChatConversationListScrollBarIdleHideMsRatio (copy), config (copy), AppChatPerfChatLandingPaginationOnEndReachedUnits (copy), MeasuredChatLandingModal (copy), ConversationGroupsEntryContainerModule (copy), PartyQuickStartContainerModule (copy), SocialCarouselModule (copy), View (copy), ConversationRowModule (copy), UltimateListModule (copy), getKey (copy), AppChatPerfChatLandingPaginationOnStartReachedUnits (copy)
	local EntryHeight = Frame.entryHeight or 64
	local ItemList = Frame.itemList or {}
	local Size = Frame.Size or UDim2.fromScale(1, 1)
	local LayoutOrder = Frame.LayoutOrder or 1
	local OnScrollUpdate = Frame.onScrollUpdate or noop
	local NavigateToConversationFromUserId = Frame.navigateToConversationFromUserId or noop
	local NavigateToQuickStartSquadInviteFriends = Frame.navigateToQuickStartSquadInviteFriends or noop
	local NavigateToSquadLobby = Frame.navigateToSquadLobby or noop
	local FireConversationImpressionEvent = Frame.fireConversationImpressionEvent or noop
	local FireConversationClickedEvent = Frame.fireConversationClickedEvent or noop
	local IsShowHeaderEntries = Frame.showHeaderEntries ~= false
	local RowProps = Frame.rowProps or {}
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 139 ]]
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = nil
	local v1 = nil
	local Callback = nil
	
	if FFlagFriendsChatConversationListShowScrollBar then
		UseRefResult2 = ReactModule.useRef(nil)
		v1, Callback = ReactOtterModule.useAnimatedBinding(1)
	end
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseMemoResult1 = ReactModule.useMemo(function(): string --[[ Line: 153 ]]
		-- upvalues: ItemList (copy)
		return `{#ItemList}:{tostring(if ItemList and ItemList[1] then ItemList[1].id else nil)}:{tostring(if ItemList and ItemList[#ItemList] then ItemList[#ItemList].id else nil)}`
	end, { ItemList })
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseResult = ReactModule.useCallback(function(p1, p2: number) --[[ Line: 162 ]]
		-- upvalues: UseStateResult2_2 (copy), CryoModule (upval)
		if p2 >= 0 then
			UseStateResult2_2(function(p3) --[[ Line: 167 ]]
				-- upvalues: p1 (copy), p2 (copy), CryoModule (upval)
				return if p3[p1] == p2 then p3 else CryoModule.Dictionary.join(p3, { [p1] = p2 })
			end)
			
			return
		end
	end, {})
	local NoOldestConversationIsFetched: boolean = Frame.loadNext ~= nil and (not Frame.isLoadingNext and not Frame.oldestConversationIsFetched)
	ReactModule.useEffect(function() --[[ Line: 178 ]]
		-- upvalues: UseRefResult6 (copy), Frame (copy), UseRefResult5 (copy)
		if UseRefResult6.current and not Frame.isLoadingNext then
			UseRefResult5.current = nil
		end
		UseRefResult6.current = Frame.isLoadingNext == true
	end, { Frame.isLoadingNext })
	local UseResult1 = ReactModule.useCallback(function(): boolean --[[ Line: 186 ]]
		-- upvalues: NoOldestConversationIsFetched (copy), UseRefResult5 (copy), UseMemoResult1 (copy), Frame (copy)
		if NoOldestConversationIsFetched and UseRefResult5.current ~= UseMemoResult1 then
			UseRefResult5.current = UseMemoResult1
			Frame.loadNext()
			
			return true
		else
			return false
		end
	end, {
		NoOldestConversationIsFetched,
		UseMemoResult1,
		Frame.loadNext
	})
	ReactModule.useEffect(function() --[[ Line: 198 ]]
		-- upvalues: AppChatPerfExperimentation (upval), Frame (copy), PartyPageCarouselExperimentation (upval), SquadQuickStartExperimentation (upval), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (upval), IXPService (upval), FStringAppChatRemoveConversationListDividerIxpLayerModule (upval)
		AppChatPerfExperimentation.logExposure()
		
		if Frame.shouldLogHeaderEntryExposures ~= false then
			PartyPageCarouselExperimentation.logExposure()
			SquadQuickStartExperimentation.logExposure()
			
			if FFlagAppChatRemoveConversationListDividerIxpEnabledModule then
				IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatRemoveConversationListDividerIxpLayerModule)
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 210 ]]
		-- upvalues: FocusNavigationService (upval), CoreGui (upval)
		local NewFocusNavigationService = FocusNavigationService.new(CoreGui)
		
		return function() --[[ Line: 212 ]]
			-- upvalues: NewFocusNavigationService (copy)
			NewFocusNavigationService:teardown()
		end
	end, {})
	local IsCanAccessParty = Frame.canAccessParty == true
	ReactModule.useEffect(function() --[[ Line: 219 ]]
		-- upvalues: UseStateResult1 (copy), FFlagAppChatPerfTrackingModule (upval), UseRefResult (copy), CreateScrollIntervalTrackerModule (upval), AppChatPerfTrackerModule (upval)
		if UseStateResult1 == nil then
			return nil
		end
		UseStateResult1.Selectable = false
		
		if FFlagAppChatPerfTrackingModule then
			UseRefResult.current = CreateScrollIntervalTrackerModule(AppChatPerfTrackerModule.Events.ScrollConversationList, UseStateResult1)
			
			return function() --[[ Line: 230 ]]
				-- upvalues: UseRefResult (upval)
				if UseRefResult.current then
					UseRefResult.current.cleanup()
					UseRefResult.current = nil
				end
			end
		else
			return nil
		end
	end, { UseStateResult1 })
	local IsPartyQuickStartEnabled = Frame.isPartyQuickStartEnabled
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 242 ]]
		-- upvalues: AppPage (upval), Frame (copy), Constants (upval), UseMemoResult (copy)
		return {
			sortId = 0,
			sortIndex = 1,
			appPage = AppPage.Chat,
			impressionTag = if Frame.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else Constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			scrollViewPositionChangedSignal = UseMemoResult
		}
	end, { Frame.isInExperience, UseMemoResult })
	local UseResult2 = ReactModule.useCallback(function(p1) --[[ Line: 254 ]]
		-- upvalues: NavigateToConversationFromUserId (copy)
		NavigateToConversationFromUserId(p1.id)
	end, { NavigateToConversationFromUserId })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 258 ]]
		-- upvalues: Enums (upval), NavigateToQuickStartSquadInviteFriends (copy), UseResult2 (copy)
		return {
			{
				tileGroup = Enums.TileGroup.StartSquad,
				onActivated = NavigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = Enums.TileGroup.FriendsList,
				onActivated = UseResult2
			}
		}
	end, { NavigateToQuickStartSquadInviteFriends, UseResult2 })
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 272 ]]
		-- upvalues: getConversationRowListItems (upval), ItemList (copy), Frame (copy), IsShowHeaderEntries (copy), CryoModule (upval), PartyPageCarouselExperimentation (upval), IsPartyQuickStartEnabled (copy), FFlagAppIaScrollAway (upval)
		local ConversationRowListItems = getConversationRowListItems(ItemList)
		local IsFilterTextMatch: boolean = Frame.filterText == "" or Frame.filterText == nil
		local IsFilterTextMatch1: boolean = IsShowHeaderEntries and IsFilterTextMatch
		
		if IsFilterTextMatch1 and Frame.showGroupsLink then
			ConversationRowListItems = CryoModule.List.join({
				{
					id = "ConversationGroupsEntryContainer",
					isGroupLink = true
				}
			}, ConversationRowListItems)
		end
		if IsFilterTextMatch1 and not PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and IsPartyQuickStartEnabled then
			ConversationRowListItems = CryoModule.List.join({
				{ id = "PartyQuickStartContainer", isQuickStartLink = true }
			}, ConversationRowListItems)
		end
		if IsFilterTextMatch1 then
			if IsPartyQuickStartEnabled and PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (Frame.isWideMode or not Frame.isInExperience) then
				ConversationRowListItems = CryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, ConversationRowListItems)
			end
			ConversationRowListItems = CryoModule.List.join({
				{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
			}, ConversationRowListItems)
		end
		if FFlagAppIaScrollAway and (Frame.canvasTopPadding or 0) > 0 then
			ConversationRowListItems = CryoModule.List.join({
				{
					id = "CanvasTopPadding",
					isCanvasTopPadding = true,
					height = Frame.canvasTopPadding
				}
			}, ConversationRowListItems)
		end
		return ConversationRowListItems
	end, {
		ItemList, Frame.filterText, Frame.showGroupsLink, Frame.isWideMode,
		Frame.isInExperience, Frame.canvasTopPadding, IsShowHeaderEntries,
		IsPartyQuickStartEnabled
	})
	local UseMemoResult5 = ReactModule.useMemo(function() --[[ Line: 345 ]]
		-- upvalues: UseMemoResult4 (copy), UseStateResult3 (copy), FFlagAppIaScrollAway (upval), EntryHeight (copy), CryoModule (upval)
		local Items = {}
		local ContentHeight = 0
		
		for i, value in UseMemoResult4 do
			local UseStateResultEntry = if value.isChatLandingModal then UseStateResult3[value.id] or 200 elseif FFlagAppIaScrollAway and value.isCanvasTopPadding then value.height else EntryHeight
			Items[i] = CryoModule.Dictionary.join(value, { height = UseStateResultEntry, yOffset = ContentHeight })
			ContentHeight += UseStateResultEntry
		end
		return { items = Items, contentHeight = ContentHeight }
	end, { UseMemoResult4, EntryHeight, UseStateResult3 })
	ReactModule.useEffect(function() --[[ Line: 368 ]]
		-- upvalues: NoOldestConversationIsFetched (copy), UseRefResult4 (copy), AppChatChatLandingInitialFetchLimit (upval), ItemList (copy), AppChatChatLandingInitialFetchMinimumConversations (upval), UseResult1 (copy), NewResult (upval)
		if NoOldestConversationIsFetched and UseRefResult4.current < AppChatChatLandingInitialFetchLimit and #ItemList < AppChatChatLandingInitialFetchMinimumConversations then
			local NewCurrent = UseRefResult4.current + 1
			
			if UseResult1() then
				UseRefResult4.current = NewCurrent
				NewResult:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #ItemList, AppChatChatLandingInitialFetchMinimumConversations, UseRefResult4.current, AppChatChatLandingInitialFetchLimit)
			end
		end
	end, { ItemList, NoOldestConversationIsFetched, UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 388 ]]
		-- upvalues: NoOldestConversationIsFetched (copy), UseMemoResult5 (copy), UseStateResult (copy), UseResult1 (copy), NewResult (upval)
		if NoOldestConversationIsFetched and UseMemoResult5.contentHeight > 0 and UseStateResult.Y > 0 and UseMemoResult5.contentHeight <= UseStateResult.Y and UseResult1() then
			NewResult:info("Not enough UltimateList content to fill the view, loading more conversations")
		end
	end, {
		UseMemoResult5.contentHeight,
		UseStateResult.Y,
		NoOldestConversationIsFetched,
		UseResult1
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 396 ]]
		-- upvalues: UseResult1 (copy), NewResult (upval)
		if UseResult1() then
			NewResult:debug("UltimateList onEndReached - Loading more conversations")
		end
	end, { UseResult1 })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 402 ]]
		-- upvalues: Frame (copy), NewResult (upval)
		if Frame.loadPrevious and not Frame.isLoadingPrevious then
			NewResult:debug("UltimateList onStartReached - Loading previous conversations")
			Frame.loadPrevious()
		end
	end, { Frame.loadPrevious, Frame.isLoadingPrevious })
	local UseResult5 = ReactModule.useCallback(function(p1) --[[ Line: 409 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1)
	end, {})
	local Callback1 = nil
	
	if FFlagFriendsChatConversationListShowScrollBar then
		Callback1 = ReactModule.useCallback(function() --[[ Line: 415 ]]
			-- upvalues: UseRefResult2 (ref), Callback (ref), ReactOtterModule (upval), AppChatConversationListScrollBarIdleHideMsRatio (upval), config (upval)
			if UseRefResult2.current ~= nil then
				pcall(task.cancel, UseRefResult2.current)
				UseRefResult2.current = nil
			end
			Callback(ReactOtterModule.instant(0))
			UseRefResult2.current = task.delay(AppChatConversationListScrollBarIdleHideMsRatio, function() --[[ Line: 423 ]]
				-- upvalues: UseRefResult2 (upval), Callback (upval), ReactOtterModule (upval), config (upval)
				UseRefResult2.current = nil
				Callback(ReactOtterModule.spring(1, config))
			end)
		end, { Callback })
		ReactModule.useEffect(function() --[[ Line: 429 ]]
			-- upvalues: UseRefResult2 (ref)
			return function() --[[ Line: 430 ]]
				-- upvalues: UseRefResult2 (upval)
				if UseRefResult2.current ~= nil then
					pcall(task.cancel, UseRefResult2.current)
					UseRefResult2.current = nil
				end
			end
		end, {})
	end
	local UseResult6 = ReactModule.useCallback(function(Y) --[[ Line: 439 ]]
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), UseRefResult (copy), FFlagFriendsChatConversationListShowScrollBar (upval), Frame (copy), Callback1 (ref), UseMemoResult (copy), EntryHeight (copy), AppChatPerfChatLandingPaginationOnEndReachedUnits (upval), UseMemoResult5 (copy), UseStateResult (copy), UseResult1 (copy), OnScrollUpdate (copy)
		if FFlagAppChatPerfTrackingModule and UseRefResult.current then
			UseRefResult.current.onScrollTick()
		end
		if FFlagFriendsChatConversationListShowScrollBar and Frame.showScrollbarOnScroll then
			Callback1()
		end
		UseMemoResult:fire()
		
		if UseMemoResult5.contentHeight - UseStateResult.Y - Y <= EntryHeight * AppChatPerfChatLandingPaginationOnEndReachedUnits then
			UseResult1()
		end
		OnScrollUpdate({ CanvasPosition = Vector2.new(0, Y) })
	end, {
		UseMemoResult, OnScrollUpdate, EntryHeight, UseMemoResult5.contentHeight,
		UseStateResult.Y, UseResult1,
		if FFlagFriendsChatConversationListShowScrollBar then Frame.showScrollbarOnScroll else nil,
		if FFlagFriendsChatConversationListShowScrollBar then Callback1 else nil
	})
	local UseResult7 = ReactModule.useCallback(function(Current) --[[ Line: 471 ]]
		-- upvalues: UseRefResult1 (copy), UseStateResult2_1 (copy)
		UseRefResult1.current = Current
		UseStateResult2_1(Current)
	end, {})
	local Id = if ItemList and ItemList[1] then ItemList[1].id else nil
	ReactModule.useEffect(function() --[[ Line: 477 ]]
		-- upvalues: UseRefResult1 (copy), Id (copy), UseRefResult3 (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil and Id ~= nil and UseRefResult3.current ~= nil and UseRefResult3.current ~= Id and Current.CanvasPosition.Y <= 33 then
			Current.CanvasPosition = Vector2.new(0, 0)
		end
		UseRefResult3.current = Id
	end, { Id })
	local UseResult8 = ReactModule.useCallback(function(p1) --[[ Line: 493 ]]
		-- upvalues: ReactModule (upval), MeasuredChatLandingModal (upval), UseResult (copy), ConversationGroupsEntryContainerModule (upval), EntryHeight (copy), IsPartyQuickStartEnabled (copy), PartyQuickStartContainerModule (upval), PartyPageCarouselExperimentation (upval), SocialCarouselModule (upval), UseMemoResult3 (copy), Frame (copy), Constants (upval), UseMemoResult2 (copy), FFlagAppIaScrollAway (upval), View (upval), UseTokensResult (copy), ConversationRowModule (upval), IsCanAccessParty (copy), NavigateToSquadLobby (copy), FireConversationImpressionEvent (copy), FireConversationClickedEvent (copy), RowProps (copy)
		return if p1.isChatLandingModal then ReactModule.createElement(MeasuredChatLandingModal, { itemId = p1.id, onHeightChanged = UseResult }) elseif p1.isGroupLink then ReactModule.createElement(ConversationGroupsEntryContainerModule, { entryHeight = EntryHeight }) elseif IsPartyQuickStartEnabled and p1.isQuickStartLink then ReactModule.createElement(PartyQuickStartContainerModule, { entryHeight = EntryHeight }) elseif PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p1.isSocialCarousel then ReactModule.createElement(SocialCarouselModule.Entry, {
			roduxKey = "ChatAppReducer",
			hideCarouselHeader = true,
			customTileList = UseMemoResult3,
			source = if Frame.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else Constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			unifiedLogging = UseMemoResult2
		}) elseif FFlagAppIaScrollAway and p1.isCanvasTopPadding then ReactModule.createElement(View, {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, p1.height),
			backgroundStyle = UseTokensResult.Color.None
		}) else ReactModule.createElement(ConversationRowModule, {
			entryHeight = EntryHeight,
			conversationId = p1.id,
			isSquadEnabled = IsCanAccessParty,
			isWideMode = Frame.isWideMode,
			onActivated = Frame.onActivated,
			onSquadJoinButtonActivated = NavigateToSquadLobby,
			key = "ConversationEntry" .. tostring(p1.id),
			fireImpressionEvent = FireConversationImpressionEvent,
			fireClickEvent = FireConversationClickedEvent,
			showBackground = RowProps.showBackground,
			localUserId = Frame.localUserId,
			debugCellValue = if Frame.isDebugEnabled then tostring(p1.id) else nil
		})
	end, {
		EntryHeight, IsCanAccessParty, IsPartyQuickStartEnabled, UseMemoResult3,
		Frame.isInExperience, UseMemoResult2, Frame.onActivated, NavigateToSquadLobby,
		FireConversationImpressionEvent, FireConversationClickedEvent, RowProps,
		Frame.isDebugEnabled, Frame.localUserId, Frame.isWideMode, UseResult,
		UseTokensResult
	})
	
	return if #UseMemoResult4 == 0 then ReactModule.createElement(View, {
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
		scroller = ReactModule.createElement(UltimateListModule.Components.ScrollingFrame, {
			direction = "y",
			dataSource = UltimateListModule.DataSources.array(if UseStateResult.X > 0 or UseStateResult.Y > 0 then UseMemoResult5.items else {}),
			dimensions = UltimateListModule.Dimensions.getter(function(p1) --[[ Line: 604 ]]
				return {
					size = UDim2.new(1, 0, 0, p1.height),
					position = UDim2.fromOffset(0, p1.yOffset)
				}
			end),
			renderer = UltimateListModule.Renderers.byState(UseResult8),
			getKey = getKey,
			scrollingFrameRef = UseResult7,
			onAbsoluteWindowSizeChanged = UseResult5,
			onScrollAxisChanged = UseResult6,
			onStartReached = UseResult4,
			onEndReached = UseResult3,
			onStartReachedThreshold = EntryHeight * AppChatPerfChatLandingPaginationOnStartReachedUnits,
			onEndReachedThreshold = EntryHeight * AppChatPerfChatLandingPaginationOnEndReachedUnits,
			native = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = if FFlagFriendsChatConversationListShowScrollBar and Frame.showScrollbarOnScroll then Frame.scrollbarThickness or 8 else 0,
				ScrollBarImageColor3 = if FFlagFriendsChatConversationListShowScrollBar and Frame.showScrollbarOnScroll then UseTokensResult.Color.Content.Emphasis.Color3 else nil,
				ScrollBarImageTransparency = if FFlagFriendsChatConversationListShowScrollBar and Frame.showScrollbarOnScroll then v1 else nil
			}
		})
	})
end)