local textChatService = game:GetService("TextChatService")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local reactOtterModule = require(parent.ReactOtter)
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appChatModule = require(parent.AppChat)
local fFlagAppChatUseUltimateListConversationListModule = require(parent.AppChat.FFlagAppChatUseUltimateListConversationList)
local useConversationSearchModule = require(parent.AppChat.useConversationSearch)
local searchIntroducedConversationIdsModule = require(parent.AppChat.searchIntroducedConversationIds)
local fFlagFriendsChatConversationListFadeScrollbarModule = require(friendsChat.Flags.FFlagFriendsChatConversationListFadeScrollbar)
local fFlagFriendsChatServerSideConversationSearchModule = require(friendsChat.Flags.FFlagFriendsChatServerSideConversationSearch)
local fFlagFriendsChatConversationListFocusNav = require(parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local bidirectionalFlatList = require(parent.VirtualizedList).BidirectionalFlatList
local useChatPlatformModule = require(parent.ExpChatIntegration.useChatPlatform)
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local expChatConversationListAdapterModule = require(script.Parent.ExpChatConversationListAdapter)
local useFocusConversationListModule = require(script.Parent.useFocusConversationList)
local getConversationRowHeightModule = require(script.Parent.getConversationRowHeight)
local resolveListStateModule = require(script.Parent.resolveListState)
local useConversationListPaginationModule = require(script.Parent.useConversationListPagination)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useChatSearchSessionModule = require(parent.AppChat.useChatSearchSession)
local useChatSearchResultsTelemetryModule = require(parent.AppChat.useChatSearchResultsTelemetry)
local fFlagAppChatSearchSessionTelemetryModule = require(parent.AppChat.FFlagAppChatSearchSessionTelemetry)
local useFriendsChatLandingTelemetryModule = require(script.Parent.Parent.Telemetry.ChatLanding.useFriendsChatLandingTelemetry)
local getLandingEmptyStateTypeModule = require(script.Parent.Parent.Telemetry.ChatLanding.getLandingEmptyStateType)
local buttonVariant = foundationModule.Enums.ButtonVariant
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local useTextSizeOffset = foundationModule.Hooks.useTextSizeOffset
local useTokens = foundationModule.Hooks.useTokens
local conversationListUltimate = appChatModule.Components.ChatLanding.ConversationListUltimate
local conversationRow = appChatModule.Components.ChatLanding.ConversationRow
local getConversationTitle = expChatConversationListAdapterModule.getConversationTitle
local useConversationList = appChatModule.Hooks.useConversationList
local friendsChatConversationListAutoscrollToTopThreshold = game:DefineFastInt("FriendsChatConversationListAutoscrollToTopThreshold", 33)
local friendsChatConversationListInitialNumToRender = game:DefineFastInt("FriendsChatConversationListInitialNumToRender", 8)
local friendsChatConversationListPaginationThresholdRows = game:DefineFastInt("FriendsChatConversationListPaginationThresholdRows", 10)
local friendsChatConversationListScrollbarIdleHideMs = game:DefineFastInt("FriendsChatConversationListScrollbarIdleHideMs", 1500)
local friendsChatConversationListScrollbarThickness = game:DefineFastInt("FriendsChatConversationListScrollbarThickness", 8)
local friendsChatConversationListWindowSize = game:DefineFastInt("FriendsChatConversationListWindowSize", 2)
local fFlagFriendsChatScaleConversationRowHeightModule = require(friendsChat.Flags.FFlagFriendsChatScaleConversationRowHeight)
local fFlagFriendsChatLandingTelemetryFieldsModule = require(friendsChat.Flags.FFlagFriendsChatLandingTelemetryFields)
local var1 = fFlagFriendsChatConversationListFadeScrollbarModule and not fFlagAppChatUseUltimateListConversationListModule
local var2 = friendsChatConversationListScrollbarIdleHideMs / 1000
local t = {
	dampingRatio = 1,
	frequency = 2,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}
local t_1 = {
	NoFriends = "Feature.Chat.Text.NoFriends",
	SearchPlaceholder = "CommonUI.Controls.Action.Search",
	Loading = "Feature.Chat.Label.Loading",
	NoChatFound = "Feature.Chat.Label.NoChatFound",
	SomethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
}

local function _(p1, p2)
	return { Color3 = p1, Transparency = p2 }
end

local _ = function(p1, p2)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p2) then p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 + p3 * (1 - p1)
	end) else p2
end

local _ = function(p1, p2)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p1) then p1:map(function(p3)
		-- upvalues: p2 (ref)
		return p2 + p3 * (1 - p2)
	end) else p2
end

local function mergeTransparency(p1, p2)
	-- upvalues: reactIsModule (ref), reactModule (ref)
	local t = {}
	local var3 = p1
	
	for i, v in p2 do
		if reactIsModule.isBinding(v) then
			table.insert(t, v)
		else
			var3 += (v or 0) * (1 - var3)
		end
	end
	return if #t == 0 then var3 else reactModule.joinBindings(t):map(function(p3)
		-- upvalues: var3 (write)
		local var4 = var3
		
		for i, v in p3 do
			var4 += v * (1 - var4)
		end
		return var4
	end)
end

local _ = function(p3)
	return string.lower(p3 or "")
end

local _ = function(p3, p4)
	return p4 == "" or string.find(string.lower(p3 or ""), p4, 1, true) ~= nil
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), fFlagFriendsChatScaleConversationRowHeightModule (ref), useTextSizeOffset (ref), useChatPlatformModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useLocalization (ref), t_1 (ref), useInterpolatedClientSettingsModule (ref), reactIsModule (ref), mergeTransparency (ref), getConversationRowHeightModule (ref), useChatInputBarSettingsModule (ref), layoutConstantsModule (ref), useFocusConversationListModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), fFlagFriendsChatServerSideConversationSearchModule (ref), useConversationSearchModule (ref), fFlagAppChatSearchSessionTelemetryModule (ref), useChatSearchResultsTelemetryModule (ref), resolveListStateModule (ref), fFlagFriendsChatLandingTelemetryFieldsModule (ref), getLandingEmptyStateTypeModule (ref), useChatSearchSessionModule (ref), useFriendsChatLandingTelemetryModule (ref), searchIntroducedConversationIdsModule (ref), textChatService (ref), var1 (ref), reactOtterModule (ref), var2 (ref), t (ref), fFlagFriendsChatConversationListFocusNav (ref), conversationRow (ref), promiseModule (ref), fFlagAppChatUseUltimateListConversationListModule (ref), conversationListUltimate (ref), bidirectionalFlatList (ref), friendsChatConversationListScrollbarThickness (ref), friendsChatConversationListWindowSize (ref), friendsChatConversationListInitialNumToRender (ref), friendsChatConversationListPaginationThresholdRows (ref), friendsChatConversationListAutoscrollToTopThreshold (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), text (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var4
	local var5 = useTokens()
	local var6 = if fFlagFriendsChatScaleConversationRowHeightModule then useTextSizeOffset() else nil
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	local var7 = useChatWindowSettingsModule()
	local chatWindowSettings = p3.chatWindowSettings or reactModule.useMemo(function()
		-- upvalues: var7 (ref)
		return {
			BackgroundColor3 = var7.ChatWindowBackgroundColor3,
			BackgroundTransparency = var7.ChatWindowBackgroundTransparency
		}
	end, { var7 })
	local var8 = useLocalization(t_1)
	local var9 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local backgroundTransparency = var9.BackgroundTransparency
	local backgroundColor3 = var9.BackgroundColor3 or (var9.BackgroundColor or chatWindowSettings.BackgroundColor3)
	local transparencyValue = p3.transparencyValue or var7.ChatWindowBackgroundTransparency
	
	if p3.transparencyValue == nil then
		var4 = 0
	elseif reactIsModule.isBinding(transparencyValue) then
		local var10 = 0
		var4 = transparencyValue:map(function(p4)
			-- upvalues: var10 (ref)
			return var10 + p4 * (1 - var10)
		end)
	else
		var4 = transparencyValue
	end
	local textTransparency = p3.textTransparency or reactModule.createBinding(0)
	local var11 = mergeTransparency(var5.Color.Content.Default.Transparency, { textTransparency, var4 })
	local var12 = mergeTransparency(var5.Color.Content.Emphasis.Transparency, { textTransparency, var4 })
	local var13 = mergeTransparency(var5.Color.Stroke.Default.Transparency, { var4 })
	local size1200 = var5.Size.Size_1200
	local var14 = getConversationRowHeightModule(var5.Size.Size_1400, var6 or 0, fFlagFriendsChatScaleConversationRowHeightModule)
	local var15 = useChatInputBarSettingsModule()
	local var16 = layoutConstantsModule.InputBarTopPadding + layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.InputBarTextVerticalPadding + ((if p3.isSpatialUIEnabled and var15 and var15.SpatialPanelTextSize then var15.SpatialPanelTextSize elseif var15 then var15.TextSize else var5.Typography.CaptionMedium.FontSize) or var5.Typography.CaptionMedium.FontSize)
	local var17, var18 = reactModule.useState("")
	local var19 = reactModule.useRef(nil)
	local var20, var21 = useFocusConversationListModule(getTransparencyStore)
	local var22 = p3.visible ~= false
	local var23 = useConversationList(var22)
	local var24 = useConversationListPaginationModule(var22, var23.listStatus)
	local listStatus = var23.listStatus
	local items = var23.items
	local var25 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), items (ref), getConversationTitle (copy)
		local lowerText = string.lower(var17 or "")
		local t = {}
		
		for i, v in items do
			if (lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var17 })
	local var26 = nil
	
	if fFlagFriendsChatServerSideConversationSearchModule then
		local var27 = useConversationSearchModule(var17, var22)
		var26 = var27
		
		if fFlagAppChatSearchSessionTelemetryModule then
			useChatSearchResultsTelemetryModule(var27)
		end
	end
	local var28
	local var29 = if var26 == nil or not var26.isActive then nil else var26
	local var30 = resolveListStateModule({
		items = if fFlagFriendsChatServerSideConversationSearchModule then items else var25,
		totalCount = #items,
		isFetching = listStatus.isFetchingConversations == true,
		hasError = listStatus.error ~= nil,
		hasFetchedInitialPage = listStatus.hasFetchedInitialPage == true,
		isFetchingNextPage = listStatus.isFetchingNextPage == true,
		oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
		loadNext = var24.loadNext
	}, var29)
	local items_1 = var30.items
	local shouldOfferRetry = var30.shouldOfferRetry
	local var31 = var17 ~= ""
	
	if fFlagFriendsChatServerSideConversationSearchModule then
		var28 = var29 ~= nil
		var28 = nil
	else
		var28 = var31
	end
	local var32 = if fFlagFriendsChatLandingTelemetryFieldsModule then getLandingEmptyStateTypeModule(var30, var31) else nil
	
	if fFlagAppChatSearchSessionTelemetryModule then
		useChatSearchSessionModule(var28 and p3.visible ~= false, fFlagFriendsChatServerSideConversationSearchModule)
	end
	local var33
	local var34 = useFriendsChatLandingTelemetryModule({
		conversations = items,
		displayedConversations = items_1,
		isFiltered = var28,
		emptyStateType = var32
	})
	local t_2 = {
		searchPlaceholder = var8.SearchPlaceholder,
		loadingConversations = var8.Loading,
		loadConversationsError = var8.SomethingWentWrong,
		noLoadedConversationsFound = var8.NoChatFound,
		noFriends = var8.NoFriends
	}
	local var35 = if var30.isInitialLoading then t_2.loadingConversations elseif var30.shouldShowBlockingError then t_2.loadConversationsError elseif var30.shouldShowEmptyState then if var30.hasNoFriends then t_2.noFriends else t_2.noLoadedConversationsFound else nil
	local var36 = reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref), fFlagFriendsChatServerSideConversationSearchModule (copy), searchIntroducedConversationIdsModule (copy)
		if p3.onConversationActivated == nil or p4 == nil or p4.id == nil then return end
		if fFlagFriendsChatServerSideConversationSearchModule then
			searchIntroducedConversationIdsModule.remove(p4.id)
		end
		p3.onConversationActivated(p4.id)
	end, { p3.onConversationActivated })
	local var37 = reactModule.useCallback(function(p4)
		-- upvalues: textChatService (copy), p3 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p3.onAbsoluteSizeChanged then
			p3.onAbsoluteSizeChanged(p4, chatWindowConfiguration)
		end
	end, { p3.onAbsoluteSizeChanged })
	local var38 = reactModule.useCallback(function(p4)
		-- upvalues: textChatService (copy), p3 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p3.onAbsolutePositionChanged then
			p3.onAbsolutePositionChanged(p4, chatWindowConfiguration)
		end
	end, { p3.onAbsolutePositionChanged })
	local var39 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), getTransparencyStore (ref)
		var34.fireSearchActivatedEvent()
		getTransparencyStore(false).setTextboxFocus()
	end, { getTransparencyStore, var34.fireSearchActivatedEvent })
	local var40 = reactModule.useCallback(function()
		-- upvalues: getTransparencyStore (ref)
		getTransparencyStore(false).clearTextboxFocus()
	end, { getTransparencyStore })
	reactModule.useEffect(function()
		-- upvalues: getTransparencyStore (ref)
		return function()
			-- upvalues: getTransparencyStore (copy)
			getTransparencyStore(false).clearTextboxFocus()
		end
	end, { getTransparencyStore })
	local var41 = nil
	local var42 = nil
	
	if var1 then
		local var43 = reactModule.useRef(nil)
		local _ = nil
		local var44, var45 = reactOtterModule.useAnimatedBinding(1)
		var41 = var44
		var33 = var45
		var42 = reactModule.useCallback(function()
			-- upvalues: var43 (ref), var33 (write), reactOtterModule (copy), var2 (copy), t (copy)
			if var43.current ~= nil then
				pcall(task.cancel, var43.current)
				var43.current = nil
			end
			var33(reactOtterModule.instant(0))
			var43.current = task.delay(var2, function()
				-- upvalues: var43 (copy), var33 (copy), reactOtterModule (copy), t (copy)
				var43.current = nil
				var33(reactOtterModule.spring(1, t))
			end)
		end, { var33 })
		reactModule.useEffect(function()
			-- upvalues: var43 (ref)
			return function()
				-- upvalues: var43 (copy)
				if var43.current ~= nil then
					pcall(task.cancel, var43.current)
					var43.current = nil
				end
			end
		end, {})
	end
	local createElement_3
	local var46 = reactModule.useCallback(function(_)
		-- upvalues: var1 (copy), var42 (write), getTransparencyStore (ref)
		if var1 then
			var42()
		end
		getTransparencyStore(false).resetAllTransparency()
	end, { getTransparencyStore, if var1 then var42 else nil })
	var33 = if fFlagFriendsChatConversationListFocusNav and items_1[1] ~= nil then tostring(items_1[1].id) else nil
	local var47 = reactModule.useCallback(function(p4)
		-- upvalues: reactModule (copy), conversationRow (copy), var14 (ref), var36 (ref), var34 (ref), p3 (ref), fFlagFriendsChatConversationListFocusNav (copy), var33 (write), var21 (ref)
		local var48 = tostring(p4.item.id)
		
		return reactModule.createElement(conversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = var48,
			entryHeight = var14,
			onActivated = var36,
			fireClickEvent = var34.fireConversationClickedEvent,
			fireImpressionEvent = var34.fireConversationImpressionEvent,
			localUserId = p3.localUserId,
			ref = if fFlagFriendsChatConversationListFocusNav and var48 == var33 then var21 else nil
		})
	end, {
		var14, var34.fireConversationClickedEvent,
		var34.fireConversationImpressionEvent, var36, p3.localUserId, var33, var21
	})
	local var48 = reactModule.useCallback(function(_, p4)
		-- upvalues: var14 (ref)
		return { length = var14, offset = var14 * (p4 - 1), index = p4 }
	end, { var14 })
	local var49 = reactModule.useCallback(function()
		-- upvalues: var30 (ref)
		var30.loadNext()
	end, { var30.loadNext })
	local var50 = reactModule.useCallback(function(_, p4)
		-- upvalues: var19 (ref), var49 (ref)
		local current = var19.current
		
		if current ~= nil and p4 <= current.AbsoluteSize.Y then
			var49()
		end
	end, { var49 })
	local var51 = reactModule.useCallback(function()
		-- upvalues: var49 (ref), promiseModule (copy)
		var49()
		
		return promiseModule.resolve()
	end, { var49 })
	local var52 = reactModule.useCallback(function(p4)
		-- upvalues: var18 (ref)
		var18(p4.Text)
	end, {})
	local var53 = reactModule.useCallback(function()
		-- upvalues: var18 (ref)
		var18("")
	end, {})
	local var54 = if fFlagFriendsChatServerSideConversationSearchModule then var30.listKey else nil
	local var55 = if fFlagAppChatUseUltimateListConversationListModule then reactModule.createElement(conversationListUltimate, {
		isWideMode = false,
		showScrollbarOnScroll = true,
		showHeaderEntries = false,
		shouldLogHeaderEntryExposures = false,
		key = var54,
		Size = UDim2.fromScale(1, 1),
		entryHeight = var14,
		itemList = items_1,
		loadNext = var49,
		isLoadingNext = var30.isLoadingNextPage,
		oldestConversationIsFetched = var30.oldestConversationIsFetched,
		onScrollUpdate = var46,
		rowProps = { showBackground = false, localUserId = p3.localUserId },
		localUserId = p3.localUserId,
		onActivated = var36,
		fireConversationClickedEvent = var34.fireConversationClickedEvent,
		fireConversationImpressionEvent = var34.fireConversationImpressionEvent
	}) else reactModule.createElement(bidirectionalFlatList, {
		enableAutoscrollToTop = true,
		key = var54,
		data = items_1,
		renderItem = var47,
		getItemLayout = var48,
		keyExtractor = function(p4)
			return tostring(p4.id)
		end,
		compareItemData = function(p4, p5)
			return p4.id == p5.id
		end,
		style = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			ScrollBarImageTransparency = if var1 then var41 else nil,
			ScrollBarThickness = friendsChatConversationListScrollbarThickness
		},
		contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
		windowSize = friendsChatConversationListWindowSize,
		initialNumToRender = friendsChatConversationListInitialNumToRender,
		onScroll = var46,
		onContentSizeChange = var50,
		onEndReached = var51,
		onEndReachedThreshold = var14 * friendsChatConversationListPaginationThresholdRows,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		CanvasSize = UDim2.fromScale(0, 0),
		autoscrollToTopThreshold = friendsChatConversationListAutoscrollToTopThreshold
	})
	local createElement = reactModule.createElement
	local var56 = "Frame"
	local t_3 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p4)
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p4 * (1 - backgroundTransparency)
		end) else transparencyValue,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p3.LayoutOrder or 1,
		Size = p3.size or UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight + var16 + layoutConstantsModule.PanelBottomCornerRadius),
		Visible = var22,
		ref = var20,
		[reactModule.Change.AbsoluteSize] = var37,
		[reactModule.Change.AbsolutePosition] = var38,
		[reactModule.Event.MouseEnter] = p3.onHovered,
		[reactModule.Event.MouseLeave] = p3.onUnhovered
	}
	local t_4 = {
		bottomCorner = reactModule.createElement("UICorner", {
			BottomLeftRadius = UDim.new(0, layoutConstantsModule.PanelBottomCornerRadius),
			BottomRightRadius = UDim.new(0, layoutConstantsModule.PanelBottomCornerRadius),
			TopLeftRadius = UDim.new(0, 0),
			TopRightRadius = UDim.new(0, 0)
		}),
		layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SearchContainer = reactModule.createElement(view, {
			Name = "SearchContainer",
			tag = "padding-small",
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, size1200)
		}, {
			SearchContent = reactModule.createElement("Frame", {
				Name = "SearchContent",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(-1, -1),
				Size = UDim2.new(1, 2, 1, 2)
			}, {
				SearchField = reactModule.createElement(view, {
					Name = "SearchField",
					tag = "row align-y-center items-center gap-small padding-x-medium radius-circle clip",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(1, 1),
					Size = UDim2.new(1, -2, 0, var5.Size.Size_800),
					stroke = {
						Color = var5.Color.Stroke.Default.Color3,
						Transparency = var13,
						Thickness = var5.Stroke.Standard
					}
				}, {
					SearchIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.MagnifyingGlass,
						size = iconSize.Small,
						style = {
							Color3 = var5.Color.Content.Default.Color3,
							Transparency = var11
						}
					}),
					SearchBox = reactModule.createElement("TextBox", {
						Name = "FriendsChatConversationListSearchBox",
						BackgroundTransparency = 1,
						ClearTextOnFocus = false,
						ClipsDescendants = true,
						Font = if foundationFontFaceMigration then nil else var5.Typography.BodySmall.Font,
						FontFace = if foundationFontFaceMigration then normalizeFontFace(var5.Typography.BodySmall.Font) else nil,
						LineHeight = var5.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = var5.Color.Content.Muted.Color3,
						PlaceholderText = t_2.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = var17,
						TextColor3 = var5.Color.Content.Emphasis.Color3,
						TextSize = var5.Typography.BodySmall.FontSize,
						TextTransparency = var12,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[reactModule.Event.Focused] = var39,
						[reactModule.Event.FocusLost] = var40,
						[reactModule.Change.Text] = var52
					}, {
						Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if var31 then reactModule.createElement(view, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = var53
					}, {
						Icon = reactModule.createElement(icon, {
							name = iconName.CircleX,
							size = iconSize.Small,
							style = {
								Color3 = var5.Color.Content.Default.Color3,
								Transparency = var11
							}
						})
					}) else nil
				})
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local t_5 = {
		Name = "ListArea",
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 1, -size1200)
	}
	local t_6 = {}
	local createElement_2 = reactModule.createElement
	local var57 = "CanvasGroup"
	local t_7 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = var4,
		Size = UDim2.fromScale(1, 1)
	}
	local t_8 = {
		ListWrapper = reactModule.createElement("Frame", {
			Name = "FriendsChatConversationListWrapper",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var19
		}, { List = var55 })
	}
	
	if var35 ~= nil then
		createElement_3 = reactModule.createElement
		local var58 = view
		local t_9 = {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_10 = {}
		local createElement_4 = reactModule.createElement
		local var59 = text
		local t_11 = {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = var35
		}
		local transparency = var5.Color.Content.Default.Transparency
		t_11.textStyle = {
			Color3 = var5.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p4)
				-- upvalues: transparency (ref)
				return transparency + p4 * (1 - transparency)
			end) else transparency
		}
		t_10.Message = createElement_4(var59, t_11)
		t_10.Retry = shouldOfferRetry and reactModule.createElement(iconButton, {
			icon = iconName.ArrowSpinClockwise,
			onActivated = var24.retryInitialFetch,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		}) or nil
		createElement_3 = createElement_3(var58, t_9, t_10) or nil
	end
	t_8.Status = createElement_3
	t_6.ListContent = createElement_2(var57, t_7, t_8)
	t_4.ListArea = createElement_1(view, t_5, t_6)
	
	return createElement(var56, t_3, t_4)
end)