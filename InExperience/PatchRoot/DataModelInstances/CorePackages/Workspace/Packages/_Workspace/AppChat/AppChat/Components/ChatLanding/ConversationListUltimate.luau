local IXPService = game:GetService("IXPService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerfExperimentation = require(parent.SocialExperiments).AppChatPerfExperimentation
local appPage = require(parent.RobloxAppEnums).AppPage
local coreGui = require(parent.ReactFocusNavigation).EngineInterface.CoreGui
local cryoModule = require(parent.Cryo)
local focusNavigationService = require(parent.ReactFocusNavigation).FocusNavigationService
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local sharedFlagsModule = require(parent.SharedFlags)
local signal = require(parent.AppCommonLib).Signal
local socialCarouselModule = require(parent.SocialCarousel)
local socialExperimentsModule = require(parent.SocialExperiments)
local foundationModule = require(parent.Foundation)
local ultimateListModule = require(parent.UltimateList)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local createScrollIntervalTrackerModule = require(appChat.Telemetry.createScrollIntervalTracker)
local constants = socialCarouselModule.Constants
local enums = socialCarouselModule.Enums
local squadQuickStartExperimentation = socialExperimentsModule.SquadQuickStartExperimentation
local chatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local conversationRowModule = require(script.Parent.ConversationRow)
local conversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local partyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local appChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagFriendsChatConversationListShowScrollBar = sharedFlagsModule.FFlagFriendsChatConversationListShowScrollBar
local appChatChatLandingInitialFetchMinimumConversations = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local fFlagAppChatRemoveConversationListDividerIxpEnabledModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDividerIxpEnabled)
local fStringAppChatRemoveConversationListDividerIxpLayerModule = require(appChat.Flags.FStringAppChatRemoveConversationListDividerIxpLayer)
local appChatPerfChatLandingPaginationOnStartReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local appChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 10)
local appChatConversationListScrollBarIdleHideMs = game:DefineFastInt("AppChatConversationListScrollBarIdleHideMs", 1500)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local name = require(script.Parent.Logger):new(script.Name)
local var25 = appChatConversationListScrollBarIdleHideMs / 1000
local t = {
	dampingRatio = 1,
	frequency = 2,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

local function noop() --[[ line: 67 ]] end

local function _(p0) --[[ line: 69 | named "isPartyQuickStartEnabled" ]]
	return p0.isPartyQuickStartEnabled
end

local _ = function(p1) --[[ line: 73 | named "getIsSquadEnabledForRows" ]]
	return p1.canAccessParty == true
end

local function getConversationRowListItems(p2) --[[ line: 77 ]]
	local t = {}
	
	for i, v in p2 do
		t[i] = { id = tostring(v.id) }
	end
	return t
end

local _ = function(p3) --[[ line: 87 | named "getFirstId" ]]
	return if p3 and p3[1] then p3[1].id else nil
end

local _ = function(p4) --[[ line: 91 | named "getLastId" ]]
	return if p4 and p4[#p4] then p4[#p4].id else nil
end

local _ = function(p5) --[[ line: 95 | named "getAutoLoadNextRequestKey" ]]
	return `{#p5}:{tostring(if p5 and p5[1] then p5[1].id else nil)}:{tostring(if p5 and p5[#p5] then p5[#p5].id else nil)}`
end

local function getKey(p6) --[[ line: 99 ]]
	return tostring(p6.id)
end

local function MeasuredChatLandingModal(p7) --[[ line: 103 ]]
	-- upvalues: reactModule (ref), chatLandingModalContainerModule (ref)
	local var32 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 106 ]]
		-- upvalues: var32 (ref), p7 (ref)
		local current = var32.current
		
		if current ~= nil then
			p7.onHeightChanged(p7.itemId, current.AbsoluteSize.Y)
		end
	end, { p7.itemId, p7.onHeightChanged })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = var32,
		[reactModule.Change.AbsoluteSize] = function(p8) --[[ line: 118 ]]
			-- upvalues: p7 (ref)
			p7.onHeightChanged(p7.itemId, p8.AbsoluteSize.Y)
		end
	}, {
		ChatLandingModal = reactModule.createElement(chatLandingModalContainerModule, {})
	})
end

return reactModule.memo(function(p9) --[[ line: 126 | named "ConversationListUltimate" ]]
	-- upvalues: noop (ref), reactModule (ref), signal (ref), fFlagFriendsChatConversationListShowScrollBar (ref), reactOtterModule (ref), useTokens (ref), cryoModule (ref), appChatPerfExperimentation (ref), partyPageCarouselExperimentation (ref), squadQuickStartExperimentation (ref), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (ref), IXPService (ref), fStringAppChatRemoveConversationListDividerIxpLayerModule (ref), focusNavigationService (ref), coreGui (ref), fFlagAppChatPerfTrackingModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref), appPage (ref), constants (ref), enums (ref), getConversationRowListItems (ref), fFlagAppIaScrollAway (ref), appChatChatLandingInitialFetchLimit (ref), appChatChatLandingInitialFetchMinimumConversations (ref), name (ref), var25 (ref), t (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (ref), MeasuredChatLandingModal (ref), conversationGroupsEntryContainerModule (ref), partyQuickStartContainerModule (ref), socialCarouselModule (ref), view (ref), conversationRowModule (ref), ultimateListModule (ref), getKey (ref), appChatPerfChatLandingPaginationOnStartReachedUnits (ref)
	local entryHeight = p9.entryHeight or 64
	local itemList = p9.itemList or {}
	local size = p9.Size or UDim2.fromScale(1, 1)
	local layoutOrder = p9.LayoutOrder or 1
	local onScrollUpdate = p9.onScrollUpdate or noop
	local navigateToConversationFromUserId = p9.navigateToConversationFromUserId or noop
	local navigateToQuickStartSquadInviteFriends = p9.navigateToQuickStartSquadInviteFriends or noop
	local navigateToSquadLobby = p9.navigateToSquadLobby or noop
	local fireConversationImpressionEvent = p9.fireConversationImpressionEvent or noop
	local fireConversationClickedEvent = p9.fireConversationClickedEvent or noop
	local var43 = p9.showHeaderEntries ~= false
	local rowProps = p9.rowProps or {}
	local var45 = reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var46 = reactModule.useRef(nil)
	local var47 = reactModule.useRef(nil)
	local var48 = nil
	local var49 = nil
	local var50 = nil
	
	if fFlagFriendsChatConversationListShowScrollBar then
		var48 = reactModule.useRef(nil)
		local var51, var52 = reactOtterModule.useAnimatedBinding(1)
		var49 = var51
		var50 = var52
	end
	local var53 = reactModule.useRef(nil)
	local var54 = reactModule.useRef(0)
	local var55 = reactModule.useMemo(function() --[[ line: 153 ]]
		-- upvalues: itemList (ref)
		return `{#itemList}:{tostring(if itemList and itemList[1] then itemList[1].id else nil)}:{tostring(if itemList and itemList[#itemList] then itemList[#itemList].id else nil)}`
	end, { itemList })
	local var56 = reactModule.useRef(nil)
	local var57 = reactModule.useRef(false)
	local var58, var59 = reactModule.useState(Vector2.new(0, 0))
	local var60, var61 = reactModule.useState(nil)
	local var62 = useTokens()
	local var63, var64 = reactModule.useState({})
	local var65 = reactModule.useCallback(function(p10, p11) --[[ line: 162 ]]
		-- upvalues: var64 (ref), cryoModule (copy)
		if p11 < 0 then
			return
		end
		var64(function(p12) --[[ line: 167 ]]
			-- upvalues: p10 (ref), p11 (ref), cryoModule (copy)
			return if p12[p10] == p11 then p12 else cryoModule.Dictionary.join(p12, { [p10] = p11 })
		end)
	end, {})
	local var66 = p9.loadNext ~= nil and (not p9.isLoadingNext and not p9.oldestConversationIsFetched)
	reactModule.useEffect(function() --[[ line: 178 ]]
		-- upvalues: var57 (ref), p9 (ref), var56 (ref)
		if var57.current and not p9.isLoadingNext then
			var56.current = nil
		end
		var57.current = p9.isLoadingNext == true
	end, { p9.isLoadingNext })
	local var67 = reactModule.useCallback(function() --[[ line: 186 ]]
		-- upvalues: var66 (ref), var56 (ref), var55 (ref), p9 (ref)
		if var66 and var56.current ~= var55 then
			var56.current = var55
			p9.loadNext()
			
			return true
		end
		return false
	end, { var66, var55, p9.loadNext })
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: appChatPerfExperimentation (copy), p9 (ref), partyPageCarouselExperimentation (copy), squadQuickStartExperimentation (copy), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), fStringAppChatRemoveConversationListDividerIxpLayerModule (copy)
		appChatPerfExperimentation.logExposure()
		
		if p9.shouldLogHeaderEntryExposures ~= false then
			partyPageCarouselExperimentation.logExposure()
			
			if squadQuickStartExperimentation.isLogExposureEnabled then
				squadQuickStartExperimentation.logExposure()
			end
			if fFlagAppChatRemoveConversationListDividerIxpEnabledModule then
				IXPService:LogFlagLinkedUserLayerExposure(fStringAppChatRemoveConversationListDividerIxpLayerModule)
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 212 ]]
		-- upvalues: focusNavigationService (copy), coreGui (copy)
		local var81 = focusNavigationService.new(coreGui)
		
		return function() --[[ line: 214 ]]
			-- upvalues: var81 (ref)
			var81:teardown()
		end
	end, {})
	local var68 = p9.canAccessParty == true
	reactModule.useEffect(function() --[[ line: 221 ]]
		-- upvalues: var60 (ref), fFlagAppChatPerfTrackingModule (copy), var46 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy)
		if var60 == nil then
			return nil
		end
		var60.Selectable = false
		
		if fFlagAppChatPerfTrackingModule then
			var46.current = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollConversationList, var60)
			
			return function() --[[ line: 232 ]]
				-- upvalues: var46 (copy)
				if var46.current then
					var46.current.cleanup()
					var46.current = nil
				end
			end
		end
		return nil
	end, { var60 })
	local isPartyQuickStartEnabled = p9.isPartyQuickStartEnabled
	local var69 = reactModule.useMemo(function() --[[ line: 244 ]]
		-- upvalues: appPage (copy), p9 (ref), constants (copy), var45 (ref)
		return {
			sortId = 0,
			sortIndex = 1,
			appPage = appPage.Chat,
			impressionTag = if p9.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			scrollViewPositionChangedSignal = var45
		}
	end, { p9.isInExperience, var45 })
	local var70 = reactModule.useCallback(function(p13) --[[ line: 256 ]]
		-- upvalues: navigateToConversationFromUserId (ref)
		navigateToConversationFromUserId(p13.id)
	end, { navigateToConversationFromUserId })
	local var71 = reactModule.useMemo(function() --[[ line: 260 ]]
		-- upvalues: enums (copy), navigateToQuickStartSquadInviteFriends (ref), var70 (ref)
		return {
			{
				tileGroup = enums.TileGroup.StartSquad,
				onActivated = navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = enums.TileGroup.FriendsList,
				onActivated = var70
			}
		}
	end, { navigateToQuickStartSquadInviteFriends, var70 })
	local var72 = reactModule.useMemo(function() --[[ line: 274 ]]
		-- upvalues: getConversationRowListItems (copy), itemList (ref), p9 (ref), var43 (ref), cryoModule (copy), partyPageCarouselExperimentation (copy), isPartyQuickStartEnabled (ref), fFlagAppIaScrollAway (copy)
		local var82 = getConversationRowListItems(itemList)
		local var83 = var43 and (if p9.filterText ~= "" then p9.filterText == nil else true)
		
		if var83 and p9.showGroupsLink then
			var82 = cryoModule.List.join({
				{
					id = "ConversationGroupsEntryContainer",
					isGroupLink = true
				}
			}, var82)
		end
		if var83 and not partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and isPartyQuickStartEnabled then
			var82 = cryoModule.List.join({
				{ id = "PartyQuickStartContainer", isQuickStartLink = true }
			}, var82)
		end
		if var83 then
			if isPartyQuickStartEnabled and partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p9.isWideMode or not p9.isInExperience) then
				var82 = cryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, var82)
			end
			var82 = cryoModule.List.join({
				{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
			}, var82)
		end
		if fFlagAppIaScrollAway and (p9.canvasTopPadding or 0) > 0 then
			var82 = cryoModule.List.join({
				{
					id = "CanvasTopPadding",
					isCanvasTopPadding = true,
					height = p9.canvasTopPadding
				}
			}, var82)
		end
		return var82
	end, {
		itemList, p9.filterText, p9.showGroupsLink, p9.isWideMode, p9.isInExperience,
		p9.canvasTopPadding, var43, isPartyQuickStartEnabled
	})
	local var73 = reactModule.useMemo(function() --[[ line: 347 ]]
		-- upvalues: var72 (ref), var63 (ref), fFlagAppIaScrollAway (copy), entryHeight (ref), cryoModule (copy)
		local t = {}
		local var85 = 0
		
		for i, v in var72 do
			local var86 = if v.isChatLandingModal then var63[v.id] or 200 elseif fFlagAppIaScrollAway and v.isCanvasTopPadding then v.height else entryHeight
			t[i] = cryoModule.Dictionary.join(v, { height = var86, yOffset = var85 })
			var85 += var86
		end
		return { items = t, contentHeight = var85 }
	end, { var72, entryHeight, var63 })
	reactModule.useEffect(function() --[[ line: 370 ]]
		-- upvalues: var66 (ref), var54 (ref), appChatChatLandingInitialFetchLimit (copy), itemList (ref), appChatChatLandingInitialFetchMinimumConversations (copy), var67 (ref), name (copy)
		if var66 and var54.current < appChatChatLandingInitialFetchLimit and #itemList < appChatChatLandingInitialFetchMinimumConversations then
			local var87 = var54.current + 1
			
			if var67() then
				var54.current = var87
				name:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #itemList, appChatChatLandingInitialFetchMinimumConversations, var54.current, appChatChatLandingInitialFetchLimit)
			end
		end
	end, { itemList, var66, var67 })
	reactModule.useEffect(function() --[[ line: 390 ]]
		-- upvalues: var66 (ref), var73 (ref), var58 (ref), var67 (ref), name (copy)
		if var66 and var73.contentHeight > 0 and (var58.Y > 0 and var73.contentHeight <= var58.Y) and var67() then
			name:info("Not enough UltimateList content to fill the view, loading more conversations")
		end
	end, { var73.contentHeight, var58.Y, var66, var67 })
	local var74 = reactModule.useCallback(function() --[[ line: 398 ]]
		-- upvalues: var67 (ref), name (copy)
		if var67() then
			name:debug("UltimateList onEndReached - Loading more conversations")
		end
	end, { var67 })
	local var75 = reactModule.useCallback(function() --[[ line: 404 ]]
		-- upvalues: p9 (ref), name (copy)
		if p9.loadPrevious and not p9.isLoadingPrevious then
			name:debug("UltimateList onStartReached - Loading previous conversations")
			p9.loadPrevious()
		end
	end, { p9.loadPrevious, p9.isLoadingPrevious })
	local var76 = reactModule.useCallback(function(p14) --[[ line: 411 ]]
		-- upvalues: var59 (ref)
		var59(p14)
	end, {})
	local var77 = nil
	
	if fFlagFriendsChatConversationListShowScrollBar then
		var77 = reactModule.useCallback(function() --[[ line: 417 ]]
			-- upvalues: var48 (write), var50 (write), reactOtterModule (copy), var25 (copy), t (copy)
			if var48.current ~= nil then
				pcall(task.cancel, var48.current)
				var48.current = nil
			end
			var50(reactOtterModule.instant(0))
			var48.current = task.delay(var25, function() --[[ line: 425 ]]
				-- upvalues: var48 (copy), var50 (copy), reactOtterModule (copy), t (copy)
				var48.current = nil
				var50(reactOtterModule.spring(1, t))
			end)
		end, { var50 })
		reactModule.useEffect(function() --[[ line: 431 ]]
			-- upvalues: var48 (write)
			return function() --[[ line: 432 ]]
				-- upvalues: var48 (copy)
				if var48.current ~= nil then
					pcall(task.cancel, var48.current)
					var48.current = nil
				end
			end
		end, {})
	end
	local var78 = reactModule.useCallback(function(p15) --[[ line: 441 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), var46 (ref), fFlagFriendsChatConversationListShowScrollBar (copy), p9 (ref), var77 (write), var45 (ref), entryHeight (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (copy), var73 (ref), var58 (ref), var67 (ref), onScrollUpdate (ref)
		if fFlagAppChatPerfTrackingModule and var46.current then
			var46.current.onScrollTick()
		end
		if fFlagFriendsChatConversationListShowScrollBar and p9.showScrollbarOnScroll then
			var77()
		end
		var45:fire()
		
		if var73.contentHeight - var58.Y - p15 <= entryHeight * appChatPerfChatLandingPaginationOnEndReachedUnits then
			var67()
		end
		onScrollUpdate({ CanvasPosition = Vector2.new(0, p15) })
	end, {
		var45, onScrollUpdate, entryHeight, var73.contentHeight, var58.Y, var67,
		if fFlagFriendsChatConversationListShowScrollBar then p9.showScrollbarOnScroll else nil,
		if fFlagFriendsChatConversationListShowScrollBar then var77 else nil
	})
	local var79 = reactModule.useCallback(function(p16) --[[ line: 473 ]]
		-- upvalues: var47 (ref), var61 (ref)
		var47.current = p16
		var61(p16)
	end, {})
	local var80 = if itemList and itemList[1] then itemList[1].id else nil
	reactModule.useEffect(function() --[[ line: 479 ]]
		-- upvalues: var47 (ref), var80 (ref), var53 (ref)
		local current = var47.current
		
		if current ~= nil and var80 ~= nil and (var53.current ~= nil and var53.current ~= var80) and current.CanvasPosition.Y <= 33 then
			current.CanvasPosition = Vector2.new(0, 0)
		end
		var53.current = var80
	end, { var80 })
	
	return if #var72 == 0 then reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var62.Color.None,
		LayoutOrder = layoutOrder
	}) else reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var62.Color.None,
		LayoutOrder = layoutOrder
	}, {
		scroller = reactModule.createElement(ultimateListModule.Components.ScrollingFrame, {
			direction = "y",
			dataSource = ultimateListModule.DataSources.array(if var58.X > 0 or var58.Y > 0 then var73.items else {}),
			dimensions = ultimateListModule.Dimensions.getter(function(p17) --[[ line: 606 ]]
				return {
					size = UDim2.new(1, 0, 0, p17.height),
					position = UDim2.fromOffset(0, p17.yOffset)
				}
			end),
			renderer = ultimateListModule.Renderers.byState(reactModule.useCallback(function(p18) --[[ line: 495 ]]
				-- upvalues: reactModule (copy), MeasuredChatLandingModal (copy), var65 (ref), conversationGroupsEntryContainerModule (copy), entryHeight (ref), isPartyQuickStartEnabled (ref), partyQuickStartContainerModule (copy), partyPageCarouselExperimentation (copy), socialCarouselModule (copy), var71 (ref), p9 (ref), constants (copy), var69 (ref), fFlagAppIaScrollAway (copy), view (copy), var62 (ref), conversationRowModule (copy), var68 (ref), navigateToSquadLobby (ref), fireConversationImpressionEvent (ref), fireConversationClickedEvent (ref), rowProps (ref)
				return if p18.isChatLandingModal then reactModule.createElement(MeasuredChatLandingModal, { itemId = p18.id, onHeightChanged = var65 }) elseif p18.isGroupLink then reactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = entryHeight }) elseif isPartyQuickStartEnabled and p18.isQuickStartLink then reactModule.createElement(partyQuickStartContainerModule, { entryHeight = entryHeight }) elseif partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p18.isSocialCarousel then reactModule.createElement(socialCarouselModule.Entry, {
					roduxKey = "ChatAppReducer",
					hideCarouselHeader = true,
					customTileList = var71,
					source = if p9.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
					unifiedLogging = var69
				}) elseif fFlagAppIaScrollAway and p18.isCanvasTopPadding then reactModule.createElement(view, {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, p18.height),
					backgroundStyle = var62.Color.None
				}) else reactModule.createElement(conversationRowModule, {
					entryHeight = entryHeight,
					conversationId = p18.id,
					isSquadEnabled = var68,
					isWideMode = p9.isWideMode,
					onActivated = p9.onActivated,
					onSquadJoinButtonActivated = navigateToSquadLobby,
					key = "ConversationEntry" .. tostring(p18.id),
					fireImpressionEvent = fireConversationImpressionEvent,
					fireClickEvent = fireConversationClickedEvent,
					showBackground = rowProps.showBackground,
					localUserId = p9.localUserId,
					debugCellValue = if p9.isDebugEnabled then tostring(p18.id) else nil
				})
			end, {
				entryHeight, var68, isPartyQuickStartEnabled, var71, p9.isInExperience, var69,
				p9.onActivated, navigateToSquadLobby, fireConversationImpressionEvent,
				fireConversationClickedEvent, rowProps, p9.isDebugEnabled, p9.localUserId,
				p9.isWideMode, var65, var62
			})),
			getKey = getKey,
			scrollingFrameRef = var79,
			onAbsoluteWindowSizeChanged = var76,
			onScrollAxisChanged = var78,
			onStartReached = var75,
			onEndReached = var74,
			onStartReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnStartReachedUnits,
			onEndReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnEndReachedUnits,
			native = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = if fFlagFriendsChatConversationListShowScrollBar and p9.showScrollbarOnScroll then p9.scrollbarThickness or 8 else 0,
				ScrollBarImageColor3 = if fFlagFriendsChatConversationListShowScrollBar and p9.showScrollbarOnScroll then var62.Color.Content.Emphasis.Color3 else nil,
				ScrollBarImageTransparency = if fFlagFriendsChatConversationListShowScrollBar and p9.showScrollbarOnScroll then var49 else nil
			}
		})
	})
end)