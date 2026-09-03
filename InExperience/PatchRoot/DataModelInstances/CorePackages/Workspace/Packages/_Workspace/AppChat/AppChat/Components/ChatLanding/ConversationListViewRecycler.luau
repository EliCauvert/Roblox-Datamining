local IXPService = game:GetService("IXPService")
local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatPerfExperimentation = require(parent.SocialExperiments).AppChatPerfExperimentation
local appPage = require(parent.RobloxAppEnums).AppPage
local coreGui = require(parent.ReactFocusNavigation).EngineInterface.CoreGui
local focusNavigationService = require(parent.ReactFocusNavigation).FocusNavigationService
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local sharedFlagsModule = require(parent.SharedFlags)
local signal = require(parent.AppCommonLib).Signal
local signalsModule = require(parent.Signals)
local socialCarouselModule = require(parent.SocialCarousel)
local socialExperimentsModule = require(parent.SocialExperiments)
local foundationModule = require(parent.Foundation)
local viewRecyclerModule = require(parent.ViewRecycler)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local createScrollIntervalTrackerModule = require(appChat.Telemetry.createScrollIntervalTracker)
local constants = socialCarouselModule.Constants
local enums = socialCarouselModule.Enums
local squadQuickStartExperimentation = socialExperimentsModule.SquadQuickStartExperimentation
local conversationListViewRecyclerItemsModule = require(script.Parent.ConversationListViewRecyclerItems)
local appChatChatLandingInitialFetchLimit = game:DefineFastInt("AppChatChatLandingInitialFetchLimit", 5)
local fFlagAppIaScrollAway = sharedFlagsModule.FFlagAppIaScrollAway
local fFlagFriendsChatConversationListShowScrollBar = sharedFlagsModule.FFlagFriendsChatConversationListShowScrollBar
local appChatChatLandingInitialFetchMinimumConversations = game:DefineFastInt("AppChatChatLandingInitialFetchMinimumConversations", 30)
local fFlagAppChatRemoveConversationListDividerIxpEnabledModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDividerIxpEnabled)
local fStringAppChatRemoveConversationListDividerIxpLayerModule = require(appChat.Flags.FStringAppChatRemoveConversationListDividerIxpLayer)
local appChatPerfChatLandingPaginationOnStartReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnStartReachedUnits", 1)
local appChatPerfChatLandingPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatLandingPaginationOnEndReachedUnits", 10)
local partyPageCarouselExperimentation = require(parent.SocialExperiments).PartyPageCarouselExperimentation
local name = require(script.Parent.Logger):new(script.Name)
local var1 = game:DefineFastInt("AppChatConversationListScrollBarIdleHideMs", 1500) / 1000
local t = {
	dampingRatio = 1,
	frequency = 2,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}

local function noop() end

local t_1 = {
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

local function _(p1)
	return `{#p1}:{tostring(if p1[1] ~= nil then nil else p1[1].id)}:{tostring(if p1[#p1] ~= nil then nil else p1[#p1].id)}`
end

local function buildConversationItems(p1, p2)
	-- upvalues: conversationListViewRecyclerItemsModule (ref)
	local list = table.create(#p1)
	
	for i, v in p1 do
		list[i] = conversationListViewRecyclerItemsModule.conversation(v.id, p2)
	end
	return list
end

local function concatItems(p3, p4)
	local list = table.create(#p3 + #p4)
	table.move(p3, 1, #p3, 1, list)
	table.move(p4, 1, #p4, #p3 + 1, list)
	
	return list
end

local function usePresentationSignal(value)
	-- upvalues: reactModule (ref), signalsModule (ref)
	local var2 = reactModule.useState(function()
		-- upvalues: signalsModule (copy), value (ref)
		local var3, var4 = signalsModule.createSignal(value)
		
		return { get = var3, set = var4 }
	end)
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), value (ref)
		var2.set(value)
	end, { var2, value })
	
	return var2.get
end

local _ = function(p3, p4)
	local var2 = p3[p4]
	
	return if var2 == nil then nil else var2.id
end

local _ = function(p3, p4, p5)
	-- upvalues: viewRecyclerModule (ref)
	return function(p6, p7)
		-- upvalues: p5 (ref), p4 (ref), viewRecyclerModule (copy), p3 (ref)
		local current = p5.current
		local current_1 = p4.current
		p4.current = current
		
		if p7.scrollOffset > 33 then
			return false
		end
		for i, v in p6.changes do
			if v.type ~= viewRecyclerModule.DataSourceChangeType.Insert or v.index ~= p3 then
				if v.type == viewRecyclerModule.DataSourceChangeType.Reset and current_1 ~= nil and (current ~= nil and current_1 ~= current) then
					return viewRecyclerModule.AutoScrollTarget.Start
				end
			end
			return viewRecyclerModule.AutoScrollTarget.Start
		end
		return false
	end
end

local function usePagination(p6, p7)
	-- upvalues: reactModule (ref), appChatChatLandingInitialFetchLimit (ref), appChatChatLandingInitialFetchMinimumConversations (ref), name (ref)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useMemo(function()
		-- upvalues: p7 (ref)
		return `{#p7}:{tostring(if p7[1] ~= nil then nil else p7[1].id)}:{tostring(if p7[#p7] ~= nil then nil else p7[#p7].id)}`
	end, { p7 })
	local var6 = p6.loadNext ~= nil and (not p6.isLoadingNext and not p6.oldestConversationIsFetched)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p6 (ref), var3 (ref)
		if var4.current and not p6.isLoadingNext then
			var3.current = nil
		end
		var4.current = p6.isLoadingNext == true
	end, { p6.isLoadingNext })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var3 (ref), var5 (ref), p6 (ref)
		if var6 and var3.current ~= var5 then
			var3.current = var5
			p6.loadNext()
			
			return true
		end
		return false
	end, { var6, var5, p6.loadNext })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var2 (ref), appChatChatLandingInitialFetchLimit (copy), p7 (ref), appChatChatLandingInitialFetchMinimumConversations (copy), var7 (ref), name (copy)
		if var6 and var2.current < appChatChatLandingInitialFetchLimit and #p7 < appChatChatLandingInitialFetchMinimumConversations then
			local var8 = var2.current + 1
			
			if var7() then
				var2.current = var8
				name:info("Loading more conversations because the list (count: {} out of {}) is not enough (attempt {} out of {})", #p7, appChatChatLandingInitialFetchMinimumConversations, var2.current, appChatChatLandingInitialFetchLimit)
			end
		end
	end, { p7, var6, var7 })
	
	return var6, var7, reactModule.useCallback(function()
		-- upvalues: p6 (ref), name (copy)
		if p6.loadPrevious ~= nil and not p6.isLoadingPrevious then
			name:debug("ViewRecycler onStartReached - Loading previous conversations")
			p6.loadPrevious()
		end
	end, { p6.loadPrevious, p6.isLoadingPrevious }), reactModule.useCallback(function()
		-- upvalues: var7 (ref), name (copy)
		if var7() then
			name:debug("ViewRecycler onEndReached - Loading more conversations")
		end
	end, { var7 })
end

local function useUnderfillPagination(p6)
	-- upvalues: reactModule (ref), name (ref)
	local var2 = reactModule.useRef(0)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), p6 (ref), name (copy)
		if var3.current > 0 and var2.current > 0 and (var3.current <= var2.current and p6()) then
			name:info("Loading more conversations because ViewRecycler content does not fill the viewport")
		end
	end, { p6 })
	
	return reactModule.useCallback(function(p7)
		-- upvalues: var2 (ref), var4 (ref)
		var2.current = p7.Y
		var4()
	end, { var4 }), reactModule.useCallback(function(p7)
		-- upvalues: var3 (ref), var4 (ref)
		var3.current = p7
		var4()
	end, { var4 })
end

local function useScrollTracking(p6, p7)
	-- upvalues: reactModule (ref), signal (ref), fFlagAppChatPerfTrackingModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: signal (copy)
		return signal.new()
	end, {})
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useCallback(function(p8)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), var3 (ref), p7 (ref), var2 (ref), p6 (ref)
		if fFlagAppChatPerfTrackingModule and var3.current then
			var3.current.onScrollTick()
		end
		if p7 ~= nil then
			p7()
		end
		var2:fire()
		p6({ CanvasPosition = Vector2.new(0, p8) })
	end, { var2, p6, p7 })
	local var7 = reactModule.useCallback(function(p8)
		-- upvalues: var5 (ref)
		var5(p8)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), fFlagAppChatPerfTrackingModule (copy), var3 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy)
		if var4 == nil then
			return nil
		end
		var4.Selectable = false
		
		if fFlagAppChatPerfTrackingModule then
			var3.current = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollConversationList, var4)
		end
		return function()
			-- upvalues: var3 (copy)
			if var3.current then
				var3.current.cleanup()
				var3.current = nil
			end
		end
	end, { var4 })
	
	return var2, var7, var6
end

local function useMeasuredLayout(p6)
	-- upvalues: reactModule (ref), viewRecyclerModule (ref)
	local var2 = reactModule.useState(function()
		-- upvalues: viewRecyclerModule (copy), p6 (ref)
		return viewRecyclerModule.Layout.measured({ estimatedItemLength = p6 })
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2.destroy()
		end
	end, { var2 })
	
	return var2
end

local function useConversationListScrollbar(p6, p7, p8)
	-- upvalues: fFlagFriendsChatConversationListShowScrollBar (ref), reactModule (ref), reactOtterModule (ref), var1 (ref), t (ref)
	local var2 = nil
	local var3 = nil
	local var4 = nil
	
	if fFlagFriendsChatConversationListShowScrollBar then
		var2 = reactModule.useRef(nil)
		local var5, var6 = reactOtterModule.useAnimatedBinding(1)
		var3 = var5
		var4 = var6
	end
	local var7 = nil
	
	if fFlagFriendsChatConversationListShowScrollBar then
		var7 = reactModule.useCallback(function()
			-- upvalues: p6 (ref), var2 (write), var4 (write), reactOtterModule (copy), var1 (copy), t (copy)
			if not p6 then return end
			if var2.current ~= nil then
				pcall(task.cancel, var2.current)
				var2.current = nil
			end
			var4(reactOtterModule.instant(0))
			var2.current = task.delay(var1, function()
				-- upvalues: var2 (copy), var4 (copy), reactOtterModule (copy), t (copy)
				var2.current = nil
				var4(reactOtterModule.spring(1, t))
			end)
		end, { p6, var4 })
		reactModule.useEffect(function()
			-- upvalues: var2 (write)
			return function()
				-- upvalues: var2 (copy)
				if var2.current ~= nil then
					pcall(task.cancel, var2.current)
					var2.current = nil
				end
			end
		end, {})
	end
	p6 = fFlagFriendsChatConversationListShowScrollBar and p6
	
	return {
		ScrollBarThickness = if p6 then p7 or 8 else 0,
		ScrollBarImageColor3 = if p6 then p8 else nil,
		ScrollBarImageTransparency = if p6 then var3 else nil
	}, var7
end

local function useListData(p6, p7)
	-- upvalues: reactModule (ref), concatItems (ref), conversationListViewRecyclerItemsModule (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: concatItems (copy), p6 (ref), p7 (ref)
		return concatItems(p6, p7)
	end, { p6, p7 })
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), conversationListViewRecyclerItemsModule (copy)
		return {
			items = var2,
			getItemKey = conversationListViewRecyclerItemsModule.getItemKey
		}
	end, { var2 }), var2
end

return reactModule.memo(function(p6)
	-- upvalues: cryoModule (ref), t_1 (ref), useTokens (ref), usePagination (ref), useUnderfillPagination (ref), useConversationListScrollbar (ref), useScrollTracking (ref), reactModule (ref), appChatPerfExperimentation (ref), partyPageCarouselExperimentation (ref), squadQuickStartExperimentation (ref), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (ref), IXPService (ref), fStringAppChatRemoveConversationListDividerIxpLayerModule (ref), focusNavigationService (ref), coreGui (ref), appPage (ref), constants (ref), enums (ref), usePresentationSignal (ref), fFlagAppIaScrollAway (ref), conversationListViewRecyclerItemsModule (ref), buildConversationItems (ref), useListData (ref), useMeasuredLayout (ref), viewRecyclerModule (ref), view (ref), appChatPerfChatLandingPaginationOnStartReachedUnits (ref), appChatPerfChatLandingPaginationOnEndReachedUnits (ref)
	local var2 = cryoModule.Dictionary.join(t_1, p6)
	local entryHeight = var2.entryHeight
	local itemList = var2.itemList
	local size = var2.Size
	local layoutOrder = var2.LayoutOrder
	local onScrollUpdate = var2.onScrollUpdate
	local navigateToConversationFromUserId = var2.navigateToConversationFromUserId
	local navigateToQuickStartSquadInviteFriends = var2.navigateToQuickStartSquadInviteFriends
	local navigateToSquadLobby = var2.navigateToSquadLobby
	local fireConversationImpressionEvent = var2.fireConversationImpressionEvent
	local fireConversationClickedEvent = var2.fireConversationClickedEvent
	local showHeaderEntries = var2.showHeaderEntries
	local rowProps = var2.rowProps
	local var3 = useTokens()
	local var4, var5, var6, var7 = usePagination(var2, itemList)
	local var8, var9 = useUnderfillPagination(var5)
	local var10, var11 = useConversationListScrollbar(var2.showScrollbarOnScroll == true, var2.scrollbarThickness, var3.Color.Content.Emphasis.Color3)
	local var12, var13, var14 = useScrollTracking(onScrollUpdate, var11)
	reactModule.useEffect(function()
		-- upvalues: appChatPerfExperimentation (copy), var2 (ref), partyPageCarouselExperimentation (copy), squadQuickStartExperimentation (copy), fFlagAppChatRemoveConversationListDividerIxpEnabledModule (copy), IXPService (copy), fStringAppChatRemoveConversationListDividerIxpLayerModule (copy)
		appChatPerfExperimentation.logExposure()
		
		if var2.shouldLogHeaderEntryExposures ~= false then
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
		local var15 = focusNavigationService.new(coreGui)
		
		return function()
			-- upvalues: var15 (ref)
			var15:teardown()
		end
	end, {})
	local var15 = var2.canAccessParty == true
	local isPartyQuickStartEnabled = var2.isPartyQuickStartEnabled
	local var16 = reactModule.useMemo(function()
		-- upvalues: appPage (copy), var2 (ref), constants (copy), var12 (ref)
		return {
			sortId = 0,
			sortIndex = 1,
			appPage = appPage.Chat,
			impressionTag = if var2.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			scrollViewPositionChangedSignal = var12
		}
	end, { var2.isInExperience, var12 })
	local var17 = reactModule.useCallback(function(p7)
		-- upvalues: navigateToConversationFromUserId (ref)
		navigateToConversationFromUserId(p7.id)
	end, { navigateToConversationFromUserId })
	local var18 = reactModule.useMemo(function()
		-- upvalues: enums (copy), navigateToQuickStartSquadInviteFriends (ref), var17 (ref)
		return {
			{
				tileGroup = enums.TileGroup.StartSquad,
				onActivated = navigateToQuickStartSquadInviteFriends
			},
			{
				tileGroup = enums.TileGroup.FriendsList,
				onActivated = var17
			}
		}
	end, { navigateToQuickStartSquadInviteFriends, var17 })
	local var19 = usePresentationSignal(reactModule.useMemo(function()
		-- upvalues: entryHeight (ref), var15 (ref), var2 (ref), navigateToSquadLobby (ref), fireConversationImpressionEvent (ref), fireConversationClickedEvent (ref), rowProps (ref)
		return {
			entryHeight = entryHeight,
			isSquadEnabled = var15,
			isWideMode = var2.isWideMode,
			onActivated = var2.onActivated,
			onSquadJoinButtonActivated = navigateToSquadLobby,
			fireImpressionEvent = fireConversationImpressionEvent,
			fireClickEvent = fireConversationClickedEvent,
			showBackground = rowProps.showBackground,
			localUserId = var2.localUserId,
			isDebugEnabled = var2.isDebugEnabled == true
		}
	end, {
		entryHeight, var15, var2.isWideMode, var2.onActivated, navigateToSquadLobby,
		fireConversationImpressionEvent, fireConversationClickedEvent,
		rowProps.showBackground, var2.localUserId, var2.isDebugEnabled
	}))
	local var20 = showHeaderEntries and (if var2.filterText ~= "" then var2.filterText == nil else true)
	local partyPageCarouselEnabled = partyPageCarouselExperimentation.getPartyPageCarouselEnabled()
	local var21 = reactModule.useMemo(function()
		-- upvalues: fFlagAppIaScrollAway (copy), var2 (ref), conversationListViewRecyclerItemsModule (copy), var3 (ref), var20 (ref), isPartyQuickStartEnabled (ref), partyPageCarouselEnabled (ref), var18 (ref), var16 (ref), entryHeight (ref)
		local t = {}
		
		if fFlagAppIaScrollAway and var2.canvasTopPadding ~= nil and var2.canvasTopPadding > 0 then
			table.insert(t, conversationListViewRecyclerItemsModule.canvasTopPadding(var2.canvasTopPadding, var3.Color.None))
		end
		if var20 then
			table.insert(t, conversationListViewRecyclerItemsModule.chatLandingModal())
			
			if isPartyQuickStartEnabled and partyPageCarouselEnabled and (var2.isWideMode or not var2.isInExperience) then
				table.insert(t, conversationListViewRecyclerItemsModule.socialCarousel(var18, var2.isInExperience, var16))
			elseif isPartyQuickStartEnabled and not partyPageCarouselEnabled then
				table.insert(t, conversationListViewRecyclerItemsModule.quickStart(entryHeight))
			end
			if var2.showGroupsLink == true then
				table.insert(t, conversationListViewRecyclerItemsModule.groupLink(entryHeight))
			end
		end
		return t
	end, {
		var20, isPartyQuickStartEnabled, partyPageCarouselEnabled, var2.isWideMode,
		var2.isInExperience, var2.showGroupsLink, var2.canvasTopPadding,
		var3.Color.None, var18, var16, entryHeight
	})
	local var22, var23 = useListData(var21, reactModule.useMemo(function()
		-- upvalues: buildConversationItems (copy), itemList (ref), var19 (ref)
		return buildConversationItems(itemList, var19)
	end, { itemList, var19 }))
	local var24 = useMeasuredLayout(entryHeight)
	local var25 = #var21 + 1
	local var26 = var23[var25]
	local var27 = if var26 == nil then nil else var26.id
	local var28 = reactModule.useRef(var27)
	local var29 = reactModule.useRef(var27)
	var29.current = var27
	
	return if #var23 == 0 then reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var3.Color.None,
		LayoutOrder = layoutOrder
	}) else reactModule.createElement(view, {
		BorderSizePixel = 0,
		Size = size,
		backgroundStyle = var3.Color.None,
		LayoutOrder = layoutOrder
	}, {
		List = reactModule.createElement(viewRecyclerModule.VirtualList, {
			overscan = 2,
			data = var22,
			layout = var24,
			axis = viewRecyclerModule.Axis.Y,
			itemType = conversationListViewRecyclerItemsModule.getItemType,
			scrollingFrameRef = var13,
			onViewportChanged = var8,
			onContentLengthChanged = var9,
			onScrollOffsetChanged = var14,
			onStartReached = if var2.loadPrevious == nil or var2.isLoadingPrevious then nil else var6,
			onEndReached = if var4 then var7 else nil,
			startReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnStartReachedUnits,
			endReachedThreshold = entryHeight * appChatPerfChatLandingPaginationOnEndReachedUnits,
			autoScrollOnChange = reactModule.useMemo(function()
				-- upvalues: var25 (ref), var28 (ref), var29 (ref), viewRecyclerModule (copy)
				return function(p7, p8)
					-- upvalues: var29 (ref), var28 (ref), viewRecyclerModule (copy), var25 (ref)
					local current = var29.current
					local current_1 = var28.current
					var28.current = current
					
					if p8.scrollOffset > 33 then
						return false
					end
					for i, v in p7.changes do
						if v.type ~= viewRecyclerModule.DataSourceChangeType.Insert or v.index ~= var25 then
							if v.type == viewRecyclerModule.DataSourceChangeType.Reset and current_1 ~= nil and (current ~= nil and current_1 ~= current) then
								return viewRecyclerModule.AutoScrollTarget.Start
							end
						end
						return viewRecyclerModule.AutoScrollTarget.Start
					end
					return false
				end
			end, { var25 }),
			scrollingFrameProps = {
				Name = "RCTScrollView",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = var10.ScrollBarThickness,
				ScrollBarImageColor3 = var10.ScrollBarImageColor3,
				ScrollBarImageTransparency = var10.ScrollBarImageTransparency
			}
		})
	})
end)