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
local appChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 1)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local name = require(script.Parent.Logger):new(script.Name)
local fFlagAppChatSignalsMessageStore = require(appChat.Flags.FFlagAppChatUseNewConversationRow) and (require(appChat.Flags.FFlagAppChatConversationStore) and require(appChat.Flags.FFlagAppChatSignalsMessageStore))
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
	navigateToQuickStartSquadInviteFriends = function() --[[ line: 79 ]] end,
	navigateToSquadLobby = function() --[[ line: 80 ]] end,
	Size = UDim2.fromScale(1, 1),
	onScrollUpdate = function() --[[ line: 84 ]] end,
	dismissUnfilteredThreadsFtux = function() --[[ line: 89 ]] end,
	canvasTopPadding = if fFlagAppIaScrollAway then 0 else nil,
	fireConversationImpressionEvent = function() --[[ line: 91 ]] end,
	fireConversationClickedEvent = function() --[[ line: 93 ]] end
}

local function _(p0) --[[ line: 97 | named "getIsSquadEnabledForRows" ]]
	return p0.canAccessParty == true
end

function conversationList.init(p1) --[[ line: 101 ]]
	-- upvalues: conversationList (ref), fFlagAppChatPerfTrackingModule (ref), signal (ref), appPage (ref), constants (ref), fFlagAppIaScrollAway (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref), partyPageCarouselExperimentation (ref), memoize (ref), enums (ref), roactModule (ref), chatLandingModalContainerModule (ref), conversationGroupsEntryContainerModule (ref), partyQuickStartContainerModule (ref), reactModule (ref), socialCarouselModule (ref), fFlagAppChatSignalsMessageStore (ref), conversationRowModule (ref), conversationEntryModule (ref), focusNavigationService (ref), coreGui (ref), appChatPerfExperimentation (ref), squadQuickStartExperimentation (ref), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (ref), IXPService (ref), fStringAppChatRemoveConversationListDividerIxpLayerModule (ref), fFlagAppChatTimestampInSubtitleIxpEnabledModule (ref), fStringAppChatTimestampInSubtitleIxpLayerModule (ref)
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
	
	function p1.onScrollUpdate(p2) --[[ line: 118 ]]
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
		
		function p1.onViewportAbsoluteSizeChange(p3) --[[ line: 131 ]]
			-- upvalues: visibilityControl (copy), p1 (ref)
			visibilityControl.setContentScrollable(p3.AbsoluteSize.Y < p1.lastContentHeight)
		end
	end
	p1.focusLock = p1.props.focusLock
	
	if partyPageCarouselExperimentation.getPartyPageCarouselEnabled() then
		function p1.navigateToConversationFromSocialCarousel(p4) --[[ line: 139 ]]
			-- upvalues: p1 (ref)
			p1.props.navigateToConversationFromUserId(p4.id)
		end
	end
	function p1.identifier(p5) --[[ line: 144 ]]
		return if p5 then p5.id .. tostring(p5.unixTime) else nil
	end
	
	local var30 = memoize(function() --[[ line: 152 ]]
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
	
	function p1.isPartyQuickStartEnabled() --[[ line: 165 ]]
		-- upvalues: p1 (ref)
		return p1.props.isPartyQuickStartEnabled
	end
	
	function p1.renderItem(p6, _) --[[ line: 170 ]]
		-- upvalues: roactModule (copy), chatLandingModalContainerModule (copy), conversationGroupsEntryContainerModule (copy), p1 (ref), partyQuickStartContainerModule (copy), partyPageCarouselExperimentation (copy), reactModule (copy), socialCarouselModule (copy), var30 (ref), constants (copy), fFlagAppIaScrollAway (copy), fFlagAppChatSignalsMessageStore (copy), conversationRowModule (copy), conversationEntryModule (copy)
		local item = p6.item
		
		return if item.isChatLandingModal then roactModule.createElement(chatLandingModalContainerModule, {}) elseif item.isGroupLink then roactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = p1.ENTRY_HEIGHT }) elseif p1.isPartyQuickStartEnabled() and item.isQuickStartLink then roactModule.createElement(partyQuickStartContainerModule, { entryHeight = p1.ENTRY_HEIGHT }) elseif partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and item.isSocialCarousel then reactModule.createElement(socialCarouselModule.Entry, {
			roduxKey = "ChatAppReducer",
			hideCarouselHeader = true,
			customTileList = var30(),
			source = if p1.props.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			unifiedLogging = p1.unifiedLogging
		}) elseif fFlagAppIaScrollAway and item.isCanvasTopPadding then roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, item.height)
		}) elseif fFlagAppChatSignalsMessageStore then reactModule.createElement(conversationRowModule, {
			entryHeight = p1.ENTRY_HEIGHT,
			conversationId = tostring(item.id),
			isSquadEnabled = p1.props.canAccessParty == true,
			isWideMode = p1.props.isWideMode,
			onActivated = p1.props.onActivated,
			onSquadJoinButtonActivated = p1.props.navigateToSquadLobby,
			key = "ConversationEntry" .. tostring(item.id),
			fireImpressionEvent = p1.props.fireConversationImpressionEvent,
			fireClickEvent = p1.props.fireConversationClickedEvent,
			showBackground = (p1.props.rowProps or {}).showBackground,
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
	
	p1.ref = roactModule.createRef()
	p1.viewRef = roactModule.createRef()
	p1.initialFetchesAttempted = 0
	p1.focusNavigationService = focusNavigationService.new(coreGui)
	
	function p1.getScrollRef() --[[ line: 243 ]]
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

function conversationList.didMount(p7) --[[ line: 272 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref)
	if fFlagAppChatPerfTrackingModule and p7.getScrollRef then
		local scrollRef = p7.getScrollRef()
		
		if scrollRef ~= nil then
			p7.scrollIntervalTracker = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollConversationList, scrollRef)
		end
	end
	local scrollRef = p7.getScrollRef()
	
	if scrollRef ~= nil then
		scrollRef.Selectable = false
	end
end

function conversationList.willUnmount(p8) --[[ line: 286 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), fFlagAppIaScrollAway (ref), fFlagEnableScrollAwayContentScrollableFix (ref), visibilityControl (ref)
	if fFlagAppChatPerfTrackingModule and p8.scrollIntervalTracker then
		p8.scrollIntervalTracker.cleanup()
	end
	if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
		visibilityControl.setContentScrollable(true)
	end
	p8.focusNavigationService:teardown()
end

function conversationList.willUpdate(p9, p10, _) --[[ line: 296 ]]
	-- upvalues: appChatChatLandingInitialFetchLimit (ref), appChatChatLandingInitialFetchMinimumConversations (ref), name (ref), conversationList (ref)
	if p10.filterText and p10.filterText ~= "" and p10.filterText ~= p9.props.filterText then
		p9.focusLock = p10.filterText
	elseif p10.itemList[1] and p9.props.itemList[1] and (p10.itemList[1].id ~= p9.props.itemList[1].id and p9.currentAnchor == 1) then
		p9.focusLock = {}
	end
	if p10.itemList and p9.props.itemList ~= p10.itemList and (p9.initialFetchesAttempted < appChatChatLandingInitialFetchLimit and #p10.itemList < appChatChatLandingInitialFetchMinimumConversations) then
		p9.initialFetchesAttempted += 1
		name:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #p10.itemList, appChatChatLandingInitialFetchMinimumConversations, p9.initialFetchesAttempted, appChatChatLandingInitialFetchLimit)
		p9.props.loadNext()
	end
	if p10.entryHeight ~= p9.props.entryHeight then
		conversationList.ENTRY_HEIGHT = p10.entryHeight
	end
end

function conversationList.render(p11) --[[ line: 331 ]]
	-- upvalues: cryoModule (ref), partyPageCarouselExperimentation (ref), fFlagAppIaScrollAway (ref), roactModule (ref), fFlagEnableScrollAwayContentScrollableFix (ref), bidirectionalFlatList (ref), appChatPerfChatLandingPaginationWindowSize (ref), appChatPerfChatLandingPaginationInitialRender (ref), name (ref), promiseModule (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (ref), appChatPerfChatLandingPaginationOnStartReachedUnits (ref), withStyle (ref)
	local itemList = p11.props.itemList
	local var34 = if p11.props.filterText ~= "" then p11.props.filterText == nil else true
	
	if var34 and p11.props.showGroupsLink then
		itemList = cryoModule.List.join({
			{
				id = "ConversationGroupsEntryContainer",
				isGroupLink = true
			}
		}, itemList)
	end
	if not partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p11.isPartyQuickStartEnabled() then
		itemList = cryoModule.List.join({
			{ id = "PartyQuickStartContainer", isQuickStartLink = true }
		}, itemList)
	end
	if var34 then
		if p11.isPartyQuickStartEnabled() and partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p11.props.isWideMode or not p11.props.isInExperience) then
			itemList = cryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, itemList)
		end
		itemList = cryoModule.List.join({
			{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
		}, itemList)
	end
	if fFlagAppIaScrollAway and p11.props.canvasTopPadding > 0 then
		itemList = cryoModule.List.join({
			{
				id = "CanvasTopPadding",
				isCanvasTopPadding = true,
				height = p11.props.canvasTopPadding
			}
		}, itemList)
	end
	local var35 = if fFlagAppIaScrollAway then function(_, p12) --[[ line: 389 ]]
		-- upvalues: p11 (ref)
		local canvasTopPadding, var37
		local _ = nil
		local _ = nil
		
		if p11.props.canvasTopPadding <= 0 then
			canvasTopPadding = p11.ENTRY_HEIGHT
			var37 = p11.ENTRY_HEIGHT * (p12 - 1)
		elseif p12 == 1 then
			canvasTopPadding = p11.props.canvasTopPadding
			var37 = 0
		else
			canvasTopPadding = p11.ENTRY_HEIGHT
			var37 = p11.props.canvasTopPadding + p11.ENTRY_HEIGHT * (p12 - 2)
		end
		return { length = canvasTopPadding, offset = var37, index = p12 }
	end else nil
	
	local function renderScroller(p13) --[[ line: 413 ]]
		-- upvalues: roactModule (copy), p11 (ref), fFlagAppIaScrollAway (copy), fFlagEnableScrollAwayContentScrollableFix (copy), bidirectionalFlatList (copy), itemList (write), var35 (ref), appChatPerfChatLandingPaginationWindowSize (copy), appChatPerfChatLandingPaginationInitialRender (copy), name (copy), promiseModule (copy), appChatPerfChatLandingPaginationOnEndReachedUnits (copy), appChatPerfChatLandingPaginationOnStartReachedUnits (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p11.props.Size,
			[roactModule.Ref] = p11.viewRef,
			[roactModule.Change.AbsoluteSize] = if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then p11.onViewportAbsoluteSizeChange else nil
		}, {
			scroller = roactModule.createElement(bidirectionalFlatList, {
				data = itemList,
				renderItem = p11.renderItem,
				getItemLayout = if fFlagAppIaScrollAway then var35 else function(_, p14) --[[ line: 427 ]]
					-- upvalues: p11 (copy)
					return {
						length = p11.ENTRY_HEIGHT,
						offset = p11.ENTRY_HEIGHT * (p14 - 1),
						index = p14
					}
				end,
				style = {
					ScrollBarThickness = 0,
					BorderSizePixel = 0,
					BackgroundColor3 = p13.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p13.Tokens.Color.None.Transparency
				},
				contentContainerStyle = {
					BorderSizePixel = 0,
					BackgroundColor3 = p13.Theme.BackgroundDefault.Color,
					BackgroundTransparency = p13.Tokens.Color.None.Transparency
				},
				windowSize = appChatPerfChatLandingPaginationWindowSize,
				initialNumToRender = appChatPerfChatLandingPaginationInitialRender,
				onScroll = p11.onScrollUpdate,
				onContentSizeChange = function(_, p15) --[[ line: 449 ]]
					-- upvalues: p11 (copy), name (copy), fFlagAppIaScrollAway (copy), fFlagEnableScrollAwayContentScrollableFix (copy)
					local current = p11.viewRef.current
					
					if current then
						name:debug("onContentSizeChange - Window height: {} vs Content height: {}", current.AbsoluteSize.Y, p15)
						
						if fFlagAppIaScrollAway and fFlagEnableScrollAwayContentScrollableFix then
							p11.lastContentHeight = p15
							p11.onViewportAbsoluteSizeChange(current)
						end
						if p15 <= current.AbsoluteSize.Y then
							name:info("Not enough content to fill the view, loading more conversations")
							p11.props.loadNext()
						end
					end
				end,
				onEndReached = function() --[[ line: 467 ]]
					-- upvalues: name (copy), p11 (copy), promiseModule (copy)
					name:debug("onEndReached - Loading more conversations")
					p11.props.loadNext()
					
					return promiseModule.resolve()
				end,
				onStartReached = function() --[[ line: 472 ]]
					-- upvalues: name (copy), p11 (copy), promiseModule (copy)
					name:debug("onStartReached - Loading previous conversations")
					
					if p11.props.loadPrevious then
						p11.props.loadPrevious()
					end
					return promiseModule.resolve()
				end,
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromScale(0, 0),
				onEndReachedThreshold = p11.ENTRY_HEIGHT * appChatPerfChatLandingPaginationOnEndReachedUnits,
				onStartReachedThreshold = p11.ENTRY_HEIGHT * appChatPerfChatLandingPaginationOnStartReachedUnits,
				compareItemData = function(p16, p17) --[[ line: 483 ]]
					return p16.id == p17.id
				end,
				[roactModule.Ref] = p11.ref,
				autoscrollToTopThreshold = 33,
				enableAutoscrollToTop = true
			})
		})
	end
	
	return withStyle(function(p18) --[[ line: 493 ]]
		-- upvalues: itemList (write), roactModule (copy), p11 (ref), renderScroller (ref)
		return if #itemList == 0 then roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p11.props.Size,
			BackgroundColor3 = p18.Theme.BackgroundDefault.Color,
			BackgroundTransparency = p18.Tokens.Color.None.Transparency,
			LayoutOrder = p11.props.LayoutOrder
		}) else renderScroller(p18)
	end)
end

return conversationList