local IXPService = game:GetService("IXPService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatPerfExperimentation = require(Parent.SocialExperiments).AppChatPerfExperimentation
local VisibilityControl = require(Parent.AppNavBar).VisibilityControl
local AppPage = require(Parent.RobloxAppEnums).AppPage
local BidirectionalFlatList = require(Parent.VirtualizedList).BidirectionalFlatList
local CoreGui = require(Parent.ReactFocusNavigation).EngineInterface.CoreGui
local CryoModule = require(Parent.Cryo)
local FocusNavigationService = require(Parent.ReactFocusNavigation).FocusNavigationService
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local Signal = require(Parent.AppCommonLib).Signal
local SocialCarouselModule = require(Parent.SocialCarousel)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local Constants = SocialCarouselModule.Constants
local Enums = SocialCarouselModule.Enums
local SquadQuickStartExperimentation = require(Parent.SocialExperiments).SquadQuickStartExperimentation
local ChatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local ConversationEntryModule = require(script.Parent.ConversationEntry)
local ConversationRowModule = require(script.Parent.ConversationRow)
local ConversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local PartyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local AppChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagEnableScrollAwayContentScrollableFix = SharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local AppChatChatLandingInitialFetchMinimumConversations = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local FFlagAppChatRemoveConversationListDividerIxpEnabledModule = require(AppChat.Flags.FFlagAppChatRemoveConversationListDividerIxpEnabled)
local FStringAppChatRemoveConversationListDividerIxpLayerModule = require(AppChat.Flags.FStringAppChatRemoveConversationListDividerIxpLayer)
local FFlagAppChatTimestampInSubtitleIxpEnabledModule = require(AppChat.Flags.FFlagAppChatTimestampInSubtitleIxpEnabled)
local FStringAppChatTimestampInSubtitleIxpLayerModule = require(AppChat.Flags.FStringAppChatTimestampInSubtitleIxpLayer)
local AppChatPerfChatLandingPaginationWindowSize = game:DefineFastInt("AppChatPerfChatLandingPaginationWindowSize", 2)
local AppChatPerfChatLandingPaginationInitialRender = game:DefineFastInt("AppChatPerfChatLandingPaginationInitialRender", 8)
local AppChatPerfChatLandingPaginationOnStartReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local AppChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 10)
local PartyPageCarouselExperimentation = require(Parent.SocialExperiments).PartyPageCarouselExperimentation
local NewResult = require(script.Parent.Logger):new(script.Name)
local FFlagAppChatConversationStoreModule = require(AppChat.Flags.FFlagAppChatConversationStore)
local FFlagAppChatSignalsMessageStoreModule = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)
local FFlagAppChatSignalsMessageStoreModule1 = require(AppChat.Flags.FFlagAppChatUseNewConversationRow) and (FFlagAppChatConversationStoreModule and FFlagAppChatSignalsMessageStoreModule)
local ConversationList = RoactModule.PureComponent:extend("ConversationList")
ConversationList.defaultProps = {
	focusIndex = 1,
	loadNext = nil,
	loadPrevious = nil,
	onActivated = nil,
	isDebugEnabled = false,
	LayoutOrder = 1,
	entryHeight = 64,
	shouldShowPhoneVerificationUpsell = false,
	shouldShowUnfilteredAccessFtux = false,
	shouldShowPartyUpsellFtux = false,
	isPartyQuickStartEnabled = false,
	canAccessParty = false,
	focusLock = {},
	itemList = {},
	navigateToQuickStartSquadInviteFriends = function() end,
	navigateToSquadLobby = function() end,
	Size = UDim2.fromScale(1, 1),
	onScrollUpdate = function() end,
	dismissUnfilteredThreadsFtux = function() end,
	canvasTopPadding = if FFlagAppIaScrollAway then 0 else nil,
	fireConversationImpressionEvent = function() end,
	fireConversationClickedEvent = function() end
}

local function _(p1): boolean
	return p1.canAccessParty == true
end

function ConversationList.init(p1)
	-- upvalues: ConversationList (copy), FFlagAppChatPerfTrackingModule (copy), Signal (copy), AppPage (copy), Constants (copy), FFlagAppIaScrollAway (copy), FFlagEnableScrollAwayContentScrollableFix (copy), VisibilityControl (copy), PartyPageCarouselExperimentation (copy), MemoizeFunction (copy), Enums (copy), RoactModule (copy), ChatLandingModalContainerModule (copy), ConversationGroupsEntryContainerModule (copy), PartyQuickStartContainerModule (copy), ReactModule (copy), SocialCarouselModule (copy), FFlagAppChatSignalsMessageStoreModule1 (copy), ConversationRowModule (copy), ConversationEntryModule (copy), FocusNavigationService (copy), CoreGui (copy), AppChatPerfExperimentation (copy), SquadQuickStartExperimentation (copy), FFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), FStringAppChatRemoveConversationListDividerIxpLayerModule (copy), FFlagAppChatTimestampInSubtitleIxpEnabledModule (copy), FStringAppChatTimestampInSubtitleIxpLayerModule (copy)
	ConversationList.ENTRY_HEIGHT = p1.props.entryHeight
	
	if FFlagAppChatPerfTrackingModule then
		p1.scrollIntervalTracker = nil
	end
	p1.scrollViewPositionChangedSignal = Signal.new()
	p1.unifiedLogging = {
		sortId = 0,
		sortIndex = 1,
		appPage = AppPage.Chat,
		impressionTag = if p1.props.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else Constants.ANALYTICS.SRC.PARTY_PAGE_UA,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	}
	
	function p1.onScrollUpdate(ScrollFrame)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), p1 (copy)
		if FFlagAppChatPerfTrackingModule and p1.scrollIntervalTracker then
			p1.scrollIntervalTracker.onScrollTick()
		end
		p1.currentAnchor = math.floor(ScrollFrame.CanvasPosition.Y / 64)
		p1.scrollViewPositionChangedSignal:fire()
		p1.props.onScrollUpdate(ScrollFrame)
	end
	
	if FFlagAppIaScrollAway and FFlagEnableScrollAwayContentScrollableFix then
		p1.lastContentHeight = 0
		
		function p1.onViewportAbsoluteSizeChange(Frame)
			-- upvalues: VisibilityControl (upval), p1 (copy)
			VisibilityControl.setContentScrollable(Frame.AbsoluteSize.Y < p1.lastContentHeight)
		end
	end
	p1.focusLock = p1.props.focusLock
	
	if PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
		function p1.navigateToConversationFromSocialCarousel(p2)
			-- upvalues: p1 (copy)
			p1.props.navigateToConversationFromUserId(p2.id)
		end
	end
	function p1.identifier(p2)
		return if p2 then p2.id .. tostring(p2.unixTime) else nil
	end
	
	local MemoizeResult = MemoizeFunction(function()
		-- upvalues: Enums (upval), p1 (copy)
		return {
			{
				tileGroup = Enums.TileGroup.StartSquad,
				onActivated = p1.props.navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = Enums.TileGroup.FriendsList,
				onActivated = p1.navigateToConversationFromSocialCarousel
			}
		}
	end)
	
	function p1.isPartyQuickStartEnabled()
		-- upvalues: p1 (copy)
		return p1.props.isPartyQuickStartEnabled
	end
	
	function p1.renderItem(p2, _)
		-- upvalues: RoactModule (upval), ChatLandingModalContainerModule (upval), ConversationGroupsEntryContainerModule (upval), p1 (copy), PartyQuickStartContainerModule (upval), PartyPageCarouselExperimentation (upval), ReactModule (upval), SocialCarouselModule (upval), MemoizeResult (copy), Constants (upval), FFlagAppIaScrollAway (upval), FFlagAppChatSignalsMessageStoreModule1 (upval), ConversationRowModule (upval), ConversationEntryModule (upval)
		local Item = p2.item
		
		return if Item.isChatLandingModal then RoactModule.createElement(ChatLandingModalContainerModule, {}) elseif Item.isGroupLink then RoactModule.createElement(ConversationGroupsEntryContainerModule, { entryHeight = p1.ENTRY_HEIGHT }) elseif p1.isPartyQuickStartEnabled() and Item.isQuickStartLink then RoactModule.createElement(PartyQuickStartContainerModule, { entryHeight = p1.ENTRY_HEIGHT }) elseif PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and Item.isSocialCarousel then ReactModule.createElement(SocialCarouselModule.Entry, {
			roduxKey = "ChatAppReducer",
			hideCarouselHeader = true,
			customTileList = MemoizeResult(),
			source = if p1.props.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else Constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			unifiedLogging = p1.unifiedLogging
		}) elseif FFlagAppIaScrollAway and Item.isCanvasTopPadding then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, Item.height)
		}) elseif FFlagAppChatSignalsMessageStoreModule1 then ReactModule.createElement(ConversationRowModule, {
			entryHeight = p1.ENTRY_HEIGHT,
			conversationId = tostring(Item.id),
			isSquadEnabled = p1.props.canAccessParty == true,
			isWideMode = p1.props.isWideMode,
			onActivated = p1.props.onActivated,
			onSquadJoinButtonActivated = p1.props.navigateToSquadLobby,
			key = "ConversationEntry" .. tostring(Item.id),
			fireImpressionEvent = p1.props.fireConversationImpressionEvent,
			fireClickEvent = p1.props.fireConversationClickedEvent,
			showBackground = (p1.props.rowProps or {}).showBackground,
			localUserId = p1.props.localUserId,
			debugCellValue = if p1.props.isDebugEnabled then tostring(Item.id) else nil
		}) else RoactModule.createElement(ConversationEntryModule, {
			boldTitle = false,
			entryHeight = p1.ENTRY_HEIGHT,
			conversation = Item,
			onActivated = p1.props.onActivated,
			onSquadJoinButtonActivated = p1.props.navigateToSquadLobby,
			key = "ConversationEntry" .. tostring(Item.id),
			fireImpressionEvent = p1.props.fireConversationImpressionEvent,
			fireClickEvent = p1.props.fireConversationClickedEvent
		}, p1.props.isDebugEnabled and {
			debugCell = RoactModule.createElement("StringValue", { Value = tostring(Item.id) })
		})
	end
	
	p1.ref = RoactModule.createRef()
	p1.viewRef = RoactModule.createRef()
	p1.initialFetchesAttempted = 0
	p1.focusNavigationService = FocusNavigationService.new(CoreGui)
	
	function p1.getScrollRef()
		-- upvalues: p1 (copy)
		if p1.ref.current == nil then
			return nil
		else
			local NativeScrollRef = p1.ref.current._listRef._scrollRef.getNativeScrollRef()
			
			return if NativeScrollRef == nil then nil else NativeScrollRef._nativeRef.current
		end
	end
	
	AppChatPerfExperimentation.logExposure()
	PartyPageCarouselExperimentation.logExposure()
	
	if SquadQuickStartExperimentation.isLogExposureEnabled then
		SquadQuickStartExperimentation.logExposure()
	end
	if FFlagAppChatRemoveConversationListDividerIxpEnabledModule then
		IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatRemoveConversationListDividerIxpLayerModule)
	end
	if FFlagAppChatTimestampInSubtitleIxpEnabledModule and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
		IXPService:LogFlagLinkedUserLayerExposure(FStringAppChatTimestampInSubtitleIxpLayerModule)
	end
end

function ConversationList.didMount(p1)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), CreateScrollIntervalTrackerModule (copy), AppChatPerfTrackerModule (copy)
	if FFlagAppChatPerfTrackingModule and p1.getScrollRef then
		local ScrollRef1 = p1.getScrollRef()
		
		if ScrollRef1 ~= nil then
			p1.scrollIntervalTracker = CreateScrollIntervalTrackerModule(AppChatPerfTrackerModule.Events.ScrollConversationList, ScrollRef1)
		end
	end
	local ScrollRef = p1.getScrollRef()
	
	if ScrollRef ~= nil then
		ScrollRef.Selectable = false
	end
end

function ConversationList.willUnmount(p1)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), FFlagAppIaScrollAway (copy), FFlagEnableScrollAwayContentScrollableFix (copy), VisibilityControl (copy)
	if FFlagAppChatPerfTrackingModule and p1.scrollIntervalTracker then
		p1.scrollIntervalTracker.cleanup()
	end
	if FFlagAppIaScrollAway and FFlagEnableScrollAwayContentScrollableFix then
		VisibilityControl.setContentScrollable(true)
	end
	p1.focusNavigationService:teardown()
end

function ConversationList.willUpdate(p1, DefaultProps, _)
	-- upvalues: AppChatChatLandingInitialFetchLimit (copy), AppChatChatLandingInitialFetchMinimumConversations (copy), NewResult (copy), ConversationList (copy)
	if DefaultProps.filterText and DefaultProps.filterText ~= "" and DefaultProps.filterText ~= p1.props.filterText then
		p1.focusLock = DefaultProps.filterText
	elseif DefaultProps.itemList[1] and p1.props.itemList[1] and DefaultProps.itemList[1].id ~= p1.props.itemList[1].id and p1.currentAnchor == 1 then
		p1.focusLock = {}
	end
	if DefaultProps.itemList and p1.props.itemList ~= DefaultProps.itemList and p1.initialFetchesAttempted < AppChatChatLandingInitialFetchLimit and #DefaultProps.itemList < AppChatChatLandingInitialFetchMinimumConversations then
		p1.initialFetchesAttempted += 1
		NewResult:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #DefaultProps.itemList, AppChatChatLandingInitialFetchMinimumConversations, p1.initialFetchesAttempted, AppChatChatLandingInitialFetchLimit)
		p1.props.loadNext()
	end
	if DefaultProps.entryHeight ~= p1.props.entryHeight then
		ConversationList.ENTRY_HEIGHT = DefaultProps.entryHeight
	end
end

function ConversationList.render(p1)
	-- upvalues: CryoModule (copy), PartyPageCarouselExperimentation (copy), FFlagAppIaScrollAway (copy), RoactModule (copy), FFlagEnableScrollAwayContentScrollableFix (copy), BidirectionalFlatList (copy), AppChatPerfChatLandingPaginationWindowSize (copy), AppChatPerfChatLandingPaginationInitialRender (copy), NewResult (copy), PromiseModule (copy), AppChatPerfChatLandingPaginationOnEndReachedUnits (copy), AppChatPerfChatLandingPaginationOnStartReachedUnits (copy), WithStyleFunction (copy)
	local ItemList = p1.props.itemList
	local IsFilterTextMatch: boolean = p1.props.filterText == "" or p1.props.filterText == nil
	local ShowGroupsLink = p1.props.showGroupsLink
	
	if IsFilterTextMatch and ShowGroupsLink then
		ItemList = CryoModule.List.join({
			{
				id = "ConversationGroupsEntryContainer",
				isGroupLink = true
			}
		}, ItemList)
	end
	if not PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p1.isPartyQuickStartEnabled() then
		ItemList = CryoModule.List.join({
			{ id = "PartyQuickStartContainer", isQuickStartLink = true }
		}, ItemList)
	end
	if IsFilterTextMatch then
		if p1.isPartyQuickStartEnabled() and PartyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p1.props.isWideMode or not p1.props.isInExperience) then
			ItemList = CryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, ItemList)
		end
		ItemList = CryoModule.List.join({
			{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
		}, ItemList)
	end
	if FFlagAppIaScrollAway and p1.props.canvasTopPadding > 0 then
		ItemList = CryoModule.List.join({
			{
				id = "CanvasTopPadding",
				isCanvasTopPadding = true,
				height = p1.props.canvasTopPadding
			}
		}, ItemList)
	end
	local v1 = if FFlagAppIaScrollAway then function(_, Index: number)
		-- upvalues: p1 (copy)
		local ENTRYHEIGHT = nil
		local ScaledENTRYHEIGHT = nil
		if p1.props.canvasTopPadding > 0 then
			if Index == 1 then
				ENTRYHEIGHT = p1.props.canvasTopPadding
				ScaledENTRYHEIGHT = 0
			else
				ENTRYHEIGHT = p1.ENTRY_HEIGHT
				ScaledENTRYHEIGHT = p1.props.canvasTopPadding + p1.ENTRY_HEIGHT * (Index - 2)
			end
		else
			ENTRYHEIGHT = p1.ENTRY_HEIGHT
			ScaledENTRYHEIGHT = p1.ENTRY_HEIGHT * (Index - 1)
		end
		return {
			length = ENTRYHEIGHT,
			offset = ScaledENTRYHEIGHT,
			index = Index
		}
	end else nil
	
	local function renderScroller(p2)
		-- upvalues: RoactModule (upval), p1 (copy), FFlagAppIaScrollAway (upval), FFlagEnableScrollAwayContentScrollableFix (upval), BidirectionalFlatList (upval), ItemList (ref), v1 (copy), AppChatPerfChatLandingPaginationWindowSize (upval), AppChatPerfChatLandingPaginationInitialRender (upval), NewResult (upval), PromiseModule (upval), AppChatPerfChatLandingPaginationOnEndReachedUnits (upval), AppChatPerfChatLandingPaginationOnStartReachedUnits (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.props.Size,
			[RoactModule.Ref] = p1.viewRef,
			[RoactModule.Change.AbsoluteSize] = if FFlagAppIaScrollAway and FFlagEnableScrollAwayContentScrollableFix then p1.onViewportAbsoluteSizeChange else nil
		}, {
			scroller = RoactModule.createElement(BidirectionalFlatList, {
				data = ItemList,
				renderItem = p1.renderItem,
				getItemLayout = if FFlagAppIaScrollAway then v1 else function(_, Index: number)
					-- upvalues: p1 (upval)
					return {
						length = p1.ENTRY_HEIGHT,
						offset = p1.ENTRY_HEIGHT * (Index - 1),
						index = Index
					}
				end,
				style = {
					ScrollBarThickness = 0,
					BorderSizePixel = 0,
					BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p2.Tokens.Color.None.Transparency
				},
				contentContainerStyle = {
					BorderSizePixel = 0,
					BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p2.Tokens.Color.None.Transparency
				},
				windowSize = AppChatPerfChatLandingPaginationWindowSize,
				initialNumToRender = AppChatPerfChatLandingPaginationInitialRender,
				onScroll = p1.onScrollUpdate,
				onContentSizeChange = function(_, LastContentHeight)
					-- upvalues: p1 (upval), NewResult (upval), FFlagAppIaScrollAway (upval), FFlagEnableScrollAwayContentScrollableFix (upval)
					local Current = p1.viewRef.current
					
					if Current then
						NewResult:debug("onContentSizeChange - Window height: {} vs Content height: {}", Current.AbsoluteSize.Y, LastContentHeight)
						
						if FFlagAppIaScrollAway and FFlagEnableScrollAwayContentScrollableFix then
							p1.lastContentHeight = LastContentHeight
							p1.onViewportAbsoluteSizeChange(Current)
						end
						if LastContentHeight <= Current.AbsoluteSize.Y then
							NewResult:info("Not enough content to fill the view, loading more conversations")
							p1.props.loadNext()
						end
					end
				end,
				onEndReached = function()
					-- upvalues: NewResult (upval), p1 (upval), PromiseModule (upval)
					NewResult:debug("onEndReached - Loading more conversations")
					p1.props.loadNext()
					
					return PromiseModule.resolve()
				end,
				onStartReached = function()
					-- upvalues: NewResult (upval), p1 (upval), PromiseModule (upval)
					NewResult:debug("onStartReached - Loading previous conversations")
					
					if p1.props.loadPrevious then
						p1.props.loadPrevious()
					end
					return PromiseModule.resolve()
				end,
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromScale(0, 0),
				onEndReachedThreshold = p1.ENTRY_HEIGHT * AppChatPerfChatLandingPaginationOnEndReachedUnits,
				onStartReachedThreshold = p1.ENTRY_HEIGHT * AppChatPerfChatLandingPaginationOnStartReachedUnits,
				compareItemData = function(p3, p4): boolean
					return p3.id == p4.id
				end,
				[RoactModule.Ref] = p1.ref,
				autoscrollToTopThreshold = 33,
				enableAutoscrollToTop = true
			})
		})
	end
	
	return WithStyleFunction(function(p2)
		-- upvalues: ItemList (ref), RoactModule (upval), p1 (copy), renderScroller (copy)
		return if #ItemList == 0 then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p1.props.Size,
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Tokens.Color.None.Transparency,
			LayoutOrder = p1.props.LayoutOrder
		}) else renderScroller(p2)
	end)
end

return ConversationList