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
local var1 = appChatConversationListScrollBarIdleHideMs / 1000
local t = {
	dampingRatio = 1,
	frequency = 2,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

local function noop() end

local function _(p1)
	return p1.isPartyQuickStartEnabled
end

local _ = function(p1)
	return p1.canAccessParty == true
end

local function getConversationRowListItems(p1)
	local t = {}
	
	for i, v in p1 do
		t[i] = { id = tostring(v.id) }
	end
	return t
end

local _ = function(p2)
	return if p2 and p2[1] then p2[1].id else nil
end

local _ = function(p2)
	return if p2 and p2[#p2] then p2[#p2].id else nil
end

local _ = function(p2)
	return `{#p2}:{tostring(if p2 and p2[1] then p2[1].id else nil)}:{tostring(if p2 and p2[#p2] then p2[#p2].id else nil)}`
end

local function getKey(p2)
	return tostring(p2.id)
end

local function MeasuredChatLandingModal(p2)
	-- upvalues: reactModule (ref), chatLandingModalContainerModule (ref)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p2 (ref)
		local current = var2.current
		
		if current ~= nil then
			p2.onHeightChanged(p2.itemId, current.AbsoluteSize.Y)
		end
	end, { p2.itemId, p2.onHeightChanged })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = var2,
		[reactModule.Change.AbsoluteSize] = function(p3)
			-- upvalues: p2 (ref)
			p2.onHeightChanged(p2.itemId, p3.AbsoluteSize.Y)
		end
	}, {
		ChatLandingModal = reactModule.createElement(chatLandingModalContainerModule, {})
	})
end

return reactModule.memo(function(p2)
	-- upvalues: noop (ref), reactModule (ref), signal (ref), fFlagFriendsChatConversationListShowScrollBar (ref), reactOtterModule (ref), useTokens (ref), cryoModule (ref), appChatPerfExperimentation (ref), partyPageCarouselExperimentation (ref), squadQuickStartExperimentation (ref), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (ref), IXPService (ref), fStringAppChatRemoveConversationListDividerIxpLayerModule (ref), focusNavigationService (ref), coreGui (ref), fFlagAppChatPerfTrackingModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref), appPage (ref), constants (ref), enums (ref), getConversationRowListItems (ref), fFlagAppIaScrollAway (ref), appChatChatLandingInitialFetchLimit (ref), appChatChatLandingInitialFetchMinimumConversations (ref), name (ref), var1 (ref), t (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (ref), MeasuredChatLandingModal (ref), conversationGroupsEntryContainerModule (ref), partyQuickStartContainerModule (ref), socialCarouselModule (ref), view (ref), conversationRowModule (ref), ultimateListModule (ref), getKey (ref), appChatPerfChatLandingPaginationOnStartReachedUnits (ref)
	local entryHeight = p2.entryHeight or 64
	local itemList = p2.itemList or {}
	local size = p2.Size or UDim2.fromScale(1, 1)
	local layoutOrder = p2.LayoutOrder or 1
	local onScrollUpdate = p2.onScrollUpdate or noop
	local navigateToConversationFromUserId = p2.navigateToConversationFromUserId or noop
	local navigateToQuickStartSquadInviteFriends = p2.navigateToQuickStartSquadInviteFriends or noop
	local navigateToSquadLobby = p2.navigateToSquadLobby or noop
	local fireConversationImpressionEvent = p2.fireConversationImpressionEvent or noop
	local fireConversationClickedEvent = p2.fireConversationClickedEvent or noop
	local var2 = p2.showHeaderEntries ~= false
	local rowProps = p2.rowProps or {}
	local var3 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagFriendsChatConversationListShowScrollBar then
		var6 = reactModule.useRef(nil)
		local var9, var10 = reactOtterModule.useAnimatedBinding(1)
		var7 = var9
		var8 = var10
	end
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(0)
	local var13 = reactModule.useMemo(function()
		-- upvalues: itemList (ref)
		return `{#itemList}:{tostring(if itemList and itemList[1] then itemList[1].id else nil)}:{tostring(if itemList and itemList[#itemList] then itemList[#itemList].id else nil)}`
	end, { itemList })
	local var14 = reactModule.useRef(nil)
	local var15 = reactModule.useRef(false)
	local var16, var17 = reactModule.useState(Vector2.new(0, 0))
	local var18, var19 = reactModule.useState(nil)
	local var20 = useTokens()
	local var21, var22 = reactModule.useState({})
	local var23 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var22 (ref), cryoModule (copy)
		if p4 < 0 then
			return
		end
		var22(function(p5)
			-- upvalues: p3 (ref), p4 (ref), cryoModule (copy)
			return if p5[p3] == p4 then p5 else cryoModule.Dictionary.join(p5, { [p3] = p4 })
		end)
	end, {})
	local var24 = p2.loadNext ~= nil and (not p2.isLoadingNext and not p2.oldestConversationIsFetched)
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), p2 (ref), var14 (ref)
		if var15.current and not p2.isLoadingNext then
			var14.current = nil
		end
		var15.current = p2.isLoadingNext == true
	end, { p2.isLoadingNext })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), var14 (ref), var13 (ref), p2 (ref)
		if var24 and var14.current ~= var13 then
			var14.current = var13
			p2.loadNext()
			
			return true
		end
		return false
	end, { var24, var13, p2.loadNext })
	reactModule.useEffect(function()
		-- upvalues: appChatPerfExperimentation (copy), p2 (ref), partyPageCarouselExperimentation (copy), squadQuickStartExperimentation (copy), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), fStringAppChatRemoveConversationListDividerIxpLayerModule (copy)
		appChatPerfExperimentation.logExposure()
		
		if p2.shouldLogHeaderEntryExposures ~= false then
			partyPageCarouselExperimentation.logExposure()
			
			if squadQuickStartExperimentation.isLogExposureEnabled then
				squadQuickStartExperimentation.logExposure()
			end
			if fFlagAppChatRemoveConversationListDividerIxpEnabledModule then
				IXPService:LogFlagLinkedUserLayerExposure(fStringAppChatRemoveConversationListDividerIxpLayerModule)
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: focusNavigationService (copy), coreGui (copy)
		local var26 = focusNavigationService.new(coreGui)
		
		return function()
			-- upvalues: var26 (ref)
			var26:teardown()
		end
	end, {})
	local var26 = p2.canAccessParty == true
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), fFlagAppChatPerfTrackingModule (copy), var4 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy)
		if var18 == nil then
			return nil
		end
		var18.Selectable = false
		
		if fFlagAppChatPerfTrackingModule then
			var4.current = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollConversationList, var18)
			
			return function()
				-- upvalues: var4 (copy)
				if var4.current then
					var4.current.cleanup()
					var4.current = nil
				end
			end
		end
		return nil
	end, { var18 })
	local isPartyQuickStartEnabled = p2.isPartyQuickStartEnabled
	local var27 = reactModule.useMemo(function()
		-- upvalues: appPage (copy), p2 (ref), constants (copy), var3 (ref)
		return {
			sortId = 0,
			sortIndex = 1,
			appPage = appPage.Chat,
			impressionTag = if p2.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			scrollViewPositionChangedSignal = var3
		}
	end, { p2.isInExperience, var3 })
	local var28 = reactModule.useCallback(function(p3)
		-- upvalues: navigateToConversationFromUserId (ref)
		navigateToConversationFromUserId(p3.id)
	end, { navigateToConversationFromUserId })
	local var29 = reactModule.useMemo(function()
		-- upvalues: enums (copy), navigateToQuickStartSquadInviteFriends (ref), var28 (ref)
		return {
			{
				tileGroup = enums.TileGroup.StartSquad,
				onActivated = navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = enums.TileGroup.FriendsList,
				onActivated = var28
			}
		}
	end, { navigateToQuickStartSquadInviteFriends, var28 })
	local var30 = reactModule.useMemo(function()
		-- upvalues: getConversationRowListItems (copy), itemList (ref), p2 (ref), var2 (ref), cryoModule (copy), partyPageCarouselExperimentation (copy), isPartyQuickStartEnabled (ref), fFlagAppIaScrollAway (copy)
		local var31 = getConversationRowListItems(itemList)
		local var32 = var2 and (if p2.filterText ~= "" then p2.filterText == nil else true)
		
		if var32 and p2.showGroupsLink then
			var31 = cryoModule.List.join({
				{
					id = "ConversationGroupsEntryContainer",
					isGroupLink = true
				}
			}, var31)
		end
		if var32 and not partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and isPartyQuickStartEnabled then
			var31 = cryoModule.List.join({
				{ id = "PartyQuickStartContainer", isQuickStartLink = true }
			}, var31)
		end
		if var32 then
			if isPartyQuickStartEnabled and partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and (p2.isWideMode or not p2.isInExperience) then
				var31 = cryoModule.List.join({ { id = "SocialCarousel", isSocialCarousel = true } }, var31)
			end
			var31 = cryoModule.List.join({
				{ id = "UnfilteredThreadsFtux", isChatLandingModal = true }
			}, var31)
		end
		if fFlagAppIaScrollAway and (p2.canvasTopPadding or 0) > 0 then
			var31 = cryoModule.List.join({
				{
					id = "CanvasTopPadding",
					isCanvasTopPadding = true,
					height = p2.canvasTopPadding
				}
			}, var31)
		end
		return var31
	end, {
		itemList, p2.filterText, p2.showGroupsLink, p2.isWideMode, p2.isInExperience,
		p2.canvasTopPadding, var2, isPartyQuickStartEnabled
	})
	local var31 = reactModule.useMemo(function()
		-- upvalues: var30 (ref), var21 (ref), fFlagAppIaScrollAway (copy), entryHeight (ref), cryoModule (copy)
		local t = {}
		local var32 = 0
		
		for i, v in var30 do
			local var33 = if v.isChatLandingModal then var21[v.id] or 200 elseif fFlagAppIaScrollAway and v.isCanvasTopPadding then v.height else entryHeight
			t[i] = cryoModule.Dictionary.join(v, { height = var33, yOffset = var32 })
			var32 += var33
		end
		return { items = t, contentHeight = var32 }
	end, { var30, entryHeight, var21 })
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var12 (ref), appChatChatLandingInitialFetchLimit (copy), itemList (ref), appChatChatLandingInitialFetchMinimumConversations (copy), var25 (ref), name (copy)
		if var24 and var12.current < appChatChatLandingInitialFetchLimit and #itemList < appChatChatLandingInitialFetchMinimumConversations then
			local var34 = var12.current + 1
			
			if var25() then
				var12.current = var34
				name:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #itemList, appChatChatLandingInitialFetchMinimumConversations, var12.current, appChatChatLandingInitialFetchLimit)
			end
		end
	end, { itemList, var24, var25 })
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var31 (ref), var16 (ref), var25 (ref), name (copy)
		if var24 and var31.contentHeight > 0 and (var16.Y > 0 and var31.contentHeight <= var16.Y) and var25() then
			name:info("Not enough UltimateList content to fill the view, loading more conversations")
		end
	end, { var31.contentHeight, var16.Y, var24, var25 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: var25 (ref), name (copy)
		if var25() then
			name:debug("UltimateList onEndReached - Loading more conversations")
		end
	end, { var25 })
	local var35 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), name (copy)
		if p2.loadPrevious and not p2.isLoadingPrevious then
			name:debug("UltimateList onStartReached - Loading previous conversations")
			p2.loadPrevious()
		end
	end, { p2.loadPrevious, p2.isLoadingPrevious })
	local var36 = reactModule.useCallback(function(p3)
		-- upvalues: var17 (ref)
		var17(p3)
	end, {})
	local var37 = nil
	
	if fFlagFriendsChatConversationListShowScrollBar then
		var37 = reactModule.useCallback(function()
			-- upvalues: var6 (write), var8 (write), reactOtterModule (copy), var1 (copy), t (copy)
			if var6.current ~= nil then
				pcall(task.cancel, var6.current)
				var6.current = nil
			end
			var8(reactOtterModule.instant(0))
			var6.current = task.delay(var1, function()
				-- upvalues: var6 (copy), var8 (copy), reactOtterModule (copy), t (copy)
				var6.current = nil
				var8(reactOtterModule.spring(1, t))
			end)
		end, { var8 })
		reactModule.useEffect(function()
			-- upvalues: var6 (write)
			return function()
				-- upvalues: var6 (copy)
				if var6.current ~= nil then
					pcall(task.cancel, var6.current)
					var6.current = nil
				end
			end
		end, {})
	end
	local var38 = reactModule.useCallback(function(p3)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), var4 (ref), fFlagFriendsChatConversationListShowScrollBar (copy), p2 (ref), var37 (write), var3 (ref), entryHeight (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (copy), var31 (ref), var16 (ref), var25 (ref), onScrollUpdate (ref)
		if fFlagAppChatPerfTrackingModule and var4.current then
			var4.current.onScrollTick()
		end
		if fFlagFriendsChatConversationListShowScrollBar and p2.showScrollbarOnScroll then
			var37()
		end
		var3:fire()
		
		if var31.contentHeight - var16.Y - p3 <= entryHeight * appChatPerfChatLandingPaginationOnEndReachedUnits then
			var25()
		end
		onScrollUpdate({ CanvasPosition = Vector2.new(0, p3) })
	end, {
		var3, onScrollUpdate, entryHeight, var31.contentHeight, var16.Y, var25,
		if fFlagFriendsChatConversationListShowScrollBar then p2.showScrollbarOnScroll else nil,
		if fFlagFriendsChatConversationListShowScrollBar then var37 else nil
	})
	local var39 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var19 (ref)
		var5.current = p3
		var19(p3)
	end, {})
	local var40 = if itemList and itemList[1] then itemList[1].id else nil
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var40 (ref), var11 (ref)
		local current = var5.current
		
		if current ~= nil and var40 ~= nil and (var11.current ~= nil and var11.current ~= var40) and current.CanvasPosition.Y <= 33 then
			current.CanvasPosition = Vector2.new(0, 0)
		end
		var11.current = var40
	end, { var40 })
	
	return if #var30 == 0 then reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var20.Color.None,
		LayoutOrder = layoutOrder
	}) else reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var20.Color.None,
		LayoutOrder = layoutOrder
	}, {
		scroller = reactModule.createElement(ultimateListModule.Components.ScrollingFrame, {
			direction = "y",
			dataSource = ultimateListModule.DataSources.array(if var16.X > 0 or var16.Y > 0 then var31.items else {}),
			dimensions = ultimateListModule.Dimensions.getter(function(p3)
				return {
					size = UDim2.new(1, 0, 0, p3.height),
					position = UDim2.fromOffset(0, p3.yOffset)
				}
			end),
			renderer = ultimateListModule.Renderers.byState(reactModule.useCallback(function(p3)
				-- upvalues: reactModule (copy), MeasuredChatLandingModal (copy), var23 (ref), conversationGroupsEntryContainerModule (copy), entryHeight (ref), isPartyQuickStartEnabled (ref), partyQuickStartContainerModule (copy), partyPageCarouselExperimentation (copy), socialCarouselModule (copy), var29 (ref), p2 (ref), constants (copy), var27 (ref), fFlagAppIaScrollAway (copy), view (copy), var20 (ref), conversationRowModule (copy), var26 (ref), navigateToSquadLobby (ref), fireConversationImpressionEvent (ref), fireConversationClickedEvent (ref), rowProps (ref)
				return if p3.isChatLandingModal then reactModule.createElement(MeasuredChatLandingModal, { itemId = p3.id, onHeightChanged = var23 }) elseif p3.isGroupLink then reactModule.createElement(conversationGroupsEntryContainerModule, { entryHeight = entryHeight }) elseif isPartyQuickStartEnabled and p3.isQuickStartLink then reactModule.createElement(partyQuickStartContainerModule, { entryHeight = entryHeight }) elseif partyPageCarouselExperimentation.getPartyPageCarouselEnabled() and p3.isSocialCarousel then reactModule.createElement(socialCarouselModule.Entry, {
					roduxKey = "ChatAppReducer",
					hideCarouselHeader = true,
					customTileList = var29,
					source = if p2.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
					unifiedLogging = var27
				}) elseif fFlagAppIaScrollAway and p3.isCanvasTopPadding then reactModule.createElement(view, {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, p3.height),
					backgroundStyle = var20.Color.None
				}) else reactModule.createElement(conversationRowModule, {
					entryHeight = entryHeight,
					conversationId = p3.id,
					isSquadEnabled = var26,
					isWideMode = p2.isWideMode,
					onActivated = p2.onActivated,
					onSquadJoinButtonActivated = navigateToSquadLobby,
					key = "ConversationEntry" .. tostring(p3.id),
					fireImpressionEvent = fireConversationImpressionEvent,
					fireClickEvent = fireConversationClickedEvent,
					showBackground = rowProps.showBackground,
					localUserId = p2.localUserId,
					debugCellValue = if p2.isDebugEnabled then tostring(p3.id) else nil
				})
			end, {
				entryHeight, var26, isPartyQuickStartEnabled, var29, p2.isInExperience, var27,
				p2.onActivated, navigateToSquadLobby, fireConversationImpressionEvent,
				fireConversationClickedEvent, rowProps, p2.isDebugEnabled, p2.localUserId,
				p2.isWideMode, var23, var20
			})),
			getKey = getKey,
			scrollingFrameRef = var39,
			onAbsoluteWindowSizeChanged = var36,
			onScrollAxisChanged = var38,
			onStartReached = var35,
			onEndReached = var34,
			onStartReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnStartReachedUnits,
			onEndReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnEndReachedUnits,
			native = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = if fFlagFriendsChatConversationListShowScrollBar and p2.showScrollbarOnScroll then p2.scrollbarThickness or 8 else 0,
				ScrollBarImageColor3 = if fFlagFriendsChatConversationListShowScrollBar and p2.showScrollbarOnScroll then var20.Color.Content.Emphasis.Color3 else nil,
				ScrollBarImageTransparency = if fFlagFriendsChatConversationListShowScrollBar and p2.showScrollbarOnScroll then var7 else nil
			}
		})
	})
end)