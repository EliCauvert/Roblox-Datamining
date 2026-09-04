local IXPService = game:GetService("IXPService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerfExperimentation = require(parent.SocialExperiments).AppChatPerfExperimentation
local visibilityControl = require(parent.AppNavBar).VisibilityControl
local appPage = require(parent.RobloxAppEnums).AppPage
local bidirectionalFlatList = require(parent.VirtualizedList).BidirectionalFlatList
local coreGui = require(parent.ReactFocusNavigation).EngineInterface.CoreGui
local cryoModule = require(parent.Cryo)
local focusNavigationService = require(parent.ReactFocusNavigation).FocusNavigationService
local memoize = require(parent.AppCommonLib).memoize
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local signal = require(parent.AppCommonLib).Signal
local socialCarouselModule = require(parent.SocialCarousel)
local socialExperimentsModule = require(parent.SocialExperiments)
local withStyle = require(parent.UIBlox).Style.withStyle
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local createScrollIntervalTrackerModule = require(appChat.Telemetry.createScrollIntervalTracker)
local constants = socialCarouselModule.Constants
local enums = socialCarouselModule.Enums
local squadQuickStartExperimentation = socialExperimentsModule.SquadQuickStartExperimentation
local chatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local conversationEntryModule = require(script.Parent.ConversationEntry)
local conversationRowModule = require(script.Parent.ConversationRow)
local conversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local partyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local appChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagEnableScrollAwayContentScrollableFix = sharedFlagsModule.FFlagEnableScrollAwayContentScrollableFix
local appChatChatLandingInitialFetchMinimumConversations = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local fFlagAppChatRemoveConversationListDividerIxpEnabledModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDividerIxpEnabled)
local fStringAppChatRemoveConversationListDividerIxpLayerModule = require(appChat.Flags.FStringAppChatRemoveConversationListDividerIxpLayer)
local fFlagAppChatTimestampInSubtitleIxpEnabledModule = require(appChat.Flags.FFlagAppChatTimestampInSubtitleIxpEnabled)
local fStringAppChatTimestampInSubtitleIxpLayerModule = require(appChat.Flags.FStringAppChatTimestampInSubtitleIxpLayer)
local appChatPerfChatLandingPaginationWindowSize = game:DefineFastInt("AppChatPerfChatLandingPaginationWindowSize", 2)
local appChatPerfChatLandingPaginationInitialRender = game:DefineFastInt("AppChatPerfChatLandingPaginationInitialRender", 8)
local appChatPerfChatLandingPaginationOnStartReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local appChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 10)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local name = require(script.Parent.Logger):new(script.Name)
local shouldUseFoundationConversationRow = require(appChat.Flags.SignalsMigrationConfig).shouldUseFoundationConversationRow
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local conversationList = roactModule.PureComponent:extend("ConversationList")
conversationList.defaultProps = {
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
	canvasTopPadding = if fFlagAppIaScrollAway then 0 else nil,
	fireConversationImpressionEvent = function() end,
	fireConversationClickedEvent = function() end
}

local function _(p1)
	return p1.canAccessParty == true
end

function conversationList.init(p1)
	-- upvalues: conversationList (ref), fFlagAppChatPerfTrackingModule (ref), signal (ref), appPage (ref), constants (ref), fFlagAppIaScrollAway (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref), partyPageCarouselExperimentation (ref), memoize (ref), enums (ref), roactModule (ref), chatLandingModalContainerModule (ref), conversationGroupsEntryContainerModule (ref), partyQuickStartContainerModule (ref), reactModule (ref), socialCarouselModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), shouldUseFoundationConversationRow (ref), conversationRowModule (ref), conversationEntryModule (ref), focusNavigationService (ref), coreGui (ref), appChatPerfExperimentation (ref), squadQuickStartExperimentation (ref), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (ref), IXPService (ref), fStringAppChatRemoveConversationListDividerIxpLayerModule (ref), fFlagAppChatTimestampInSubtitleIxpEnabledModule (ref), fStringAppChatTimestampInSubtitleIxpLayerModule (ref)
	conversationList.ENTRY_HEIGHT = p1.props.entryHeight
	
	if fFlagAppChatPerfTrackingModule then
		p1.scrollIntervalTracker = nil
	end
	p1.scrollViewPositionChangedSignal = signal.new()
	p1.unifiedLogging = {
		sortId = 0,
		sortIndex = 1,
		appPage = appPage.Chat,
		impressionTag = if p1.props.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal
	}
	
	function p1.onScrollUpdate(p2)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), p1 (ref)
		if fFlagAppChatPerfTrackingModule and p1.scrollIntervalTracker then
			p1.scrollIntervalTracker.onScrollTick()
		end
		p1.currentAnchor = math.floor(p2.CanvasPosition.Y / 64)
		p1.scrollViewPositionChangedSignal:fire()
		p1.props.onScrollUpdate(p2)
	end
	
	if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
		p1.lastContentHeight = 0
		
		function p1.onViewportAbsoluteSizeChange(p2)
			-- upvalues: visibilityControl (copy), p1 (ref)
			visibilityControl.setContentScrollable(p2.AbsoluteSize.Y < p1.lastContentHeight)
		end
	end
	p1.focusLock = p1.props.focusLock
	
	if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
		function p1.navigateToConversationFromSocialCarousel(p2)
			-- upvalues: p1 (ref)
			p1.props.navigateToConversationFromUserId(p2.id)
		end
	end
	function p1.identifier(p2)
		return if p2 then p2.id .. tostring(p2.unixTime) else nil
	end
	
	local var1 = memoize(function()
		-- upvalues: enums (copy), p1 (ref)
		return {
			{
				tileGroup = enums.TileGroup.StartSquad,
				onActivated = p1.props.navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = enums.TileGroup.FriendsList,
				onActivated = p1.navigateToConversationFromSocialCarousel
			}
		}
	end)
	
	function p1.isPartyQuickStartEnabled()
		-- upvalues: p1 (ref)
		return p1.props.isPartyQuickStartEnabled
	end
	
	function p1.renderItem(p2, _)
		-- upvalues: roactModule (copy), chatLandingModalContainerModule (copy), conversationGroupsEntryContainerModule (copy), p1 (ref), partyQuickStartContainerModule (copy), partyPageCarouselExperimentation (copy), reactModule (copy), socialCarouselModule (copy), var1 (ref), constants (copy), fFlagAppIaScrollAway (copy), fFlagAppChatConsoleFocusFixesModule (copy), shouldUseFoundationConversationRow (copy), conversationRowModule (copy), conversationEntryModule (copy)
		local item = p2.item
		
		return if item.isChatLandingModal then roactModule.createElement(chatLandingModalContainerModule, {}) elseif item.isGroupLink then roactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = p1.ENTRY_HEIGHT }) elseif p1.isPartyQuickStartEnabled() and item.isQuickStartLink then roactModule.createElement(partyQuickStartContainerModule, { entryHeight = p1.ENTRY_HEIGHT }) elseif partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and item.isSocialCarousel then reactModule.createElement(socialCarouselModule.Entry, {
			roduxKey = "ChatAppReducer",
			hideCarouselHeader = true,
			customTileList = var1(),
			source = if p1.props.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			unifiedLogging = p1.unifiedLogging
		}) elseif fFlagAppIaScrollAway and item.isCanvasTopPadding then roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, item.height)
		}) elseif fFlagAppChatConsoleFocusFixesModule and item.isCanvasBottomPadding then roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, item.height)
		}) elseif shouldUseFoundationConversationRow then reactModule.createElement(conversationRowModule, {
			entryHeight = p1.ENTRY_HEIGHT,
			conversationId = tostring(item.id),
			isSquadEnabled = p1.props.canAccessParty == true,
			isWideMode = p1.props.isWideMode,
			onActivated = p1.props.onActivated,
			onSquadJoinButtonActivated = p1.props.navigateToSquadLobby,
			key = "ConversationEntry" .. tostring(item.id),
			fireImpressionEvent = p1.props.fireConversationImpressionEvent,
			fireClickEvent = p1.props.fireConversationClickedEvent,
			localUserId = p1.props.localUserId,
			debugCellValue = if p1.props.isDebugEnabled then tostring(item.id) else nil
		}) else roactModule.createElement(conversationEntryModule, {
			boldTitle = false,
			entryHeight = p1.ENTRY_HEIGHT,
			conversation = item,
			onActivated = p1.props.onActivated,
			onSquadJoinButtonActivated = p1.props.navigateToSquadLobby,
			key = "ConversationEntry" .. tostring(item.id),
			fireImpressionEvent = p1.props.fireConversationImpressionEvent,
			fireClickEvent = p1.props.fireConversationClickedEvent
		}, p1.props.isDebugEnabled and {
			debugCell = roactModule.createElement("StringValue", { Value = tostring(item.id) })
		})
	end
	
	p1.ref = if fFlagAppChatConsoleFocusFixesModule and p1.props.listRef then p1.props.listRef else roactModule.createRef()
	p1.viewRef = roactModule.createRef()
	p1.initialFetchesAttempted = 0
	p1.focusNavigationService = focusNavigationService.new(coreGui)
	
	function p1.getScrollRef()
		-- upvalues: p1 (ref)
		if p1.ref.current == nil then
			return nil
		end
		local nativeScrollRef = p1.ref.current._listRef._scrollRef.getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef.current
	end
	
	appChatPerfExperimentation.logExposure()
	partyPageCarouselExperimentation.logExposure()
	
	if squadQuickStartExperimentation.isLogExposureEnabled then
		squadQuickStartExperimentation.logExposure()
	end
	if fFlagAppChatRemoveConversationListDividerIxpEnabledModule then
		IXPService:LogFlagLinkedUserLayerExposure(fStringAppChatRemoveConversationListDividerIxpLayerModule)
	end
	if fFlagAppChatTimestampInSubtitleIxpEnabledModule and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
		IXPService:LogFlagLinkedUserLayerExposure(fStringAppChatTimestampInSubtitleIxpLayerModule)
	end
end

function conversationList.didMount(p1)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref)
	if fFlagAppChatPerfTrackingModule and p1.getScrollRef then
		local scrollRef = p1.getScrollRef()
		
		if scrollRef ~= nil then
			p1.scrollIntervalTracker = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollConversationList, scrollRef)
		end
	end
	local scrollRef = p1.getScrollRef()
	
	if scrollRef ~= nil then
		scrollRef.Selectable = false
	end
end

function conversationList.willUnmount(p1)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), fFlagAppIaScrollAway (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref)
	if fFlagAppChatPerfTrackingModule and p1.scrollIntervalTracker then
		p1.scrollIntervalTracker.cleanup()
	end
	if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
		visibilityControl.setContentScrollable(true)
	end
	p1.focusNavigationService:teardown()
end

function conversationList.willUpdate(p1, p2, _)
	-- upvalues: appChatChatLandingInitialFetchLimit (ref), appChatChatLandingInitialFetchMinimumConversations (ref), name (ref), conversationList (ref)
	if p2.filterText and p2.filterText ~= "" and p2.filterText ~= p1.props.filterText then
		p1.focusLock = p2.filterText
	elseif p2.itemList[1] and p1.props.itemList[1] and (p2.itemList[1].id ~= p1.props.itemList[1].id and p1.currentAnchor == 1) then
		p1.focusLock = {}
	end
	if p2.itemList and p1.props.itemList ~= p2.itemList and (p1.initialFetchesAttempted < appChatChatLandingInitialFetchLimit and #p2.itemList < appChatChatLandingInitialFetchMinimumConversations) then
		p1.initialFetchesAttempted += 1
		name:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #p2.itemList, appChatChatLandingInitialFetchMinimumConversations, p1.initialFetchesAttempted, appChatChatLandingInitialFetchLimit)
		p1.props.loadNext()
	end
	if p2.entryHeight ~= p1.props.entryHeight then
		conversationList.ENTRY_HEIGHT = p2.entryHeight
	end
end

function conversationList.render(p1)
	-- upvalues: cryoModule (ref), partyPageCarouselExperimentation (ref), fFlagAppIaScrollAway (ref), fFlagAppChatConsoleFocusFixesModule (ref), roactModule (ref), fFlagEnableScrollAwayContentScrollableFix (ref), bidirectionalFlatList (ref), appChatPerfChatLandingPaginationWindowSize (ref), appChatPerfChatLandingPaginationInitialRender (ref), name (ref), promiseModule (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (ref), appChatPerfChatLandingPaginationOnStartReachedUnits (ref), withStyle (ref)
	local itemList = p1.props.itemList
	local var1 = if p1.props.filterText ~= "" then p1.props.filterText == nil else true
	
	if var1 and p1.props.showGroupsLink then
		itemList = cryoModule.List.join({
			{
				id = "ConversationGroupsEntryContainer",
				isGroupLink = true
			}
		}, itemList)
	end
	if not partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p1.isPartyQuickStartEnabled() then
		itemList = cryoModule.List.join({
			{ id = "PartyQuickStartContainer", isQuickStartLink = true }
		}, itemList)
	end
	if var1 then
		if p1.isPartyQuickStartEnabled() and partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p1.props.isWideMode or not p1.props.isInExperience) then
			itemList = cryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, itemList)
		end
		itemList = cryoModule.List.join({
			{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
		}, itemList)
	end
	if fFlagAppIaScrollAway and p1.props.canvasTopPadding > 0 then
		itemList = cryoModule.List.join({
			{
				id = "CanvasTopPadding",
				isCanvasTopPadding = true,
				height = p1.props.canvasTopPadding
			}
		}, itemList)
	end
	if fFlagAppChatConsoleFocusFixesModule and (p1.props.canvasBottomPadding or 0) > 0 then
		itemList = cryoModule.List.join(itemList, {
			{
				id = "CanvasBottomPadding",
				isCanvasBottomPadding = true,
				height = p1.props.canvasBottomPadding
			}
		})
	end
	local var2 = if fFlagAppIaScrollAway then function(_, p2)
		-- upvalues: p1 (ref)
		local canvasTopPadding, var3
		local _ = nil
		local _ = nil
		
		if p1.props.canvasTopPadding <= 0 then
			canvasTopPadding = p1.ENTRY_HEIGHT
			var3 = p1.ENTRY_HEIGHT * (p2 - 1)
		elseif p2 == 1 then
			canvasTopPadding = p1.props.canvasTopPadding
			var3 = 0
		else
			canvasTopPadding = p1.ENTRY_HEIGHT
			var3 = p1.props.canvasTopPadding + p1.ENTRY_HEIGHT * (p2 - 2)
		end
		return { length = canvasTopPadding, offset = var3, index = p2 }
	end else nil
	
	local function renderScroller(p2)
		-- upvalues: roactModule (copy), p1 (ref), fFlagAppIaScrollAway (copy), fFlagEnableScrollAwayContentScrollableFix (copy), bidirectionalFlatList (copy), itemList (write), var2 (ref), appChatPerfChatLandingPaginationWindowSize (copy), appChatPerfChatLandingPaginationInitialRender (copy), name (copy), promiseModule (copy), appChatPerfChatLandingPaginationOnEndReachedUnits (copy), appChatPerfChatLandingPaginationOnStartReachedUnits (copy), fFlagAppChatConsoleFocusFixesModule (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p1.props.Size,
			[roactModule.Ref] = p1.viewRef,
			[roactModule.Change.AbsoluteSize] = if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then p1.onViewportAbsoluteSizeChange else nil
		}, {
			scroller = roactModule.createElement(bidirectionalFlatList, {
				data = itemList,
				renderItem = p1.renderItem,
				getItemLayout = if fFlagAppIaScrollAway then var2 else function(_, p3)
					-- upvalues: p1 (copy)
					return {
						length = p1.ENTRY_HEIGHT,
						offset = p1.ENTRY_HEIGHT * (p3 - 1),
						index = p3
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
				windowSize = appChatPerfChatLandingPaginationWindowSize,
				initialNumToRender = appChatPerfChatLandingPaginationInitialRender,
				onScroll = p1.onScrollUpdate,
				onContentSizeChange = function(_, p3)
					-- upvalues: p1 (copy), name (copy), fFlagAppIaScrollAway (copy), fFlagEnableScrollAwayContentScrollableFix (copy)
					local current = p1.viewRef.current
					
					if current then
						name:debug("onContentSizeChange - Window height: {} vs Content height: {}", current.AbsoluteSize.Y, p3)
						
						if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
							p1.lastContentHeight = p3
							p1.onViewportAbsoluteSizeChange(current)
						end
						if p3 <= current.AbsoluteSize.Y then
							name:info("Not enough content to fill the view, loading more conversations")
							p1.props.loadNext()
						end
					end
				end,
				onEndReached = function()
					-- upvalues: name (copy), p1 (copy), promiseModule (copy)
					name:debug("onEndReached - Loading more conversations")
					p1.props.loadNext()
					
					return promiseModule.resolve()
				end,
				onStartReached = function()
					-- upvalues: name (copy), p1 (copy), promiseModule (copy)
					name:debug("onStartReached - Loading previous conversations")
					
					if p1.props.loadPrevious then
						p1.props.loadPrevious()
					end
					return promiseModule.resolve()
				end,
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromScale(0, 0),
				onEndReachedThreshold = p1.ENTRY_HEIGHT * appChatPerfChatLandingPaginationOnEndReachedUnits,
				onStartReachedThreshold = p1.ENTRY_HEIGHT * appChatPerfChatLandingPaginationOnStartReachedUnits,
				compareItemData = function(p3, p4)
					return p3.id == p4.id
				end,
				[roactModule.Ref] = p1.ref,
				autoscrollToTopThreshold = 33,
				enableAutoscrollToTop = true,
				scrollEnabled = if fFlagAppChatConsoleFocusFixesModule then p1.props.scrollEnabled else nil
			})
		})
	end
	
	return withStyle(function(p2)
		-- upvalues: itemList (write), roactModule (copy), p1 (ref), renderScroller (ref)
		return if #itemList == 0 then roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p1.props.Size,
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p2.Tokens.Color.None.Transparency,
			LayoutOrder = p1.props.LayoutOrder
		}) else renderScroller(p2)
	end)
end

return conversationList