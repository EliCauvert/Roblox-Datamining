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
local fFlagFriendsChatConversationListFadeScrollbarModule = require(friendsChat.Flags.FFlagFriendsChatConversationListFadeScrollbar)
local bidirectionalFlatList = require(parent.VirtualizedList).BidirectionalFlatList
local useChatPlatformModule = require(parent.ExpChatIntegration.useChatPlatform)
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local expChatConversationListAdapterModule = require(script.Parent.ExpChatConversationListAdapter)
local getConversationRowHeightModule = require(script.Parent.getConversationRowHeight)
local useConversationListPaginationModule = require(script.Parent.useConversationListPagination)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useFriendsChatLandingTelemetryModule = require(script.Parent.Parent.Telemetry.ChatLanding.useFriendsChatLandingTelemetry)
local buttonVariant = foundationModule.Enums.ButtonVariant
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
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
local var26 = fFlagFriendsChatConversationListFadeScrollbarModule and not fFlagAppChatUseUltimateListConversationListModule
local var27 = friendsChatConversationListScrollbarIdleHideMs / 1000
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

local function _(p0, p1)
	return { Color3 = p0, Transparency = p1 }
end

local _ = function(p2, p3)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4)
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p3
end

local _ = function(p5, p6)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p5) then p5:map(function(p7)
		-- upvalues: p6 (ref)
		return p6 + p7 * (1 - p6)
	end) else p6
end

local function mergeTransparency(p8, p9)
	-- upvalues: reactIsModule (ref), reactModule (ref)
	local t = {}
	local var32 = p8
	
	for i, v in p9 do
		if reactIsModule.isBinding(v) then
			table.insert(t, v)
		else
			var32 += (v or 0) * (1 - var32)
		end
	end
	return if #t == 0 then var32 else reactModule.joinBindings(t):map(function(p10)
		-- upvalues: var32 (write)
		local var33 = var32
		
		for i, v in p10 do
			var33 += v * (1 - var33)
		end
		return var33
	end)
end

local _ = function(p11)
	return string.lower(p11 or "")
end

local _ = function(p12, p13)
	return p13 == "" or string.find(string.lower(p12 or ""), p13, 1, true) ~= nil
end

return reactModule.memo(function(p14)
	-- upvalues: useTokens (ref), fFlagFriendsChatScaleConversationRowHeightModule (ref), useTextSizeOffset (ref), useChatPlatformModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useLocalization (ref), t_1 (ref), useInterpolatedClientSettingsModule (ref), reactIsModule (ref), mergeTransparency (ref), getConversationRowHeightModule (ref), useChatInputBarSettingsModule (ref), layoutConstantsModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), useFriendsChatLandingTelemetryModule (ref), textChatService (ref), var26 (ref), reactOtterModule (ref), var27 (ref), t (ref), conversationRow (ref), promiseModule (ref), fFlagAppChatUseUltimateListConversationListModule (ref), conversationListUltimate (ref), bidirectionalFlatList (ref), friendsChatConversationListScrollbarThickness (ref), friendsChatConversationListWindowSize (ref), friendsChatConversationListInitialNumToRender (ref), friendsChatConversationListPaginationThresholdRows (ref), friendsChatConversationListAutoscrollToTopThreshold (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var42
	local var34 = useTokens()
	local var35 = if fFlagFriendsChatScaleConversationRowHeightModule then useTextSizeOffset() else nil
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	local var36 = useChatWindowSettingsModule()
	local chatWindowSettings = p14.chatWindowSettings or reactModule.useMemo(function()
		-- upvalues: var36 (ref)
		return {
			BackgroundColor3 = var36.ChatWindowBackgroundColor3,
			BackgroundTransparency = var36.ChatWindowBackgroundTransparency
		}
	end, { var36 })
	local var38 = useLocalization(t_1)
	local var39 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local backgroundTransparency = var39.BackgroundTransparency
	local backgroundColor3 = var39.BackgroundColor3 or (var39.BackgroundColor or chatWindowSettings.BackgroundColor3)
	local transparencyValue = p14.transparencyValue or var36.ChatWindowBackgroundTransparency
	
	if p14.transparencyValue == nil then
		var42 = 0
	elseif reactIsModule.isBinding(transparencyValue) then
		local var43 = 0
		var42 = transparencyValue:map(function(p15)
			-- upvalues: var43 (ref)
			return var43 + p15 * (1 - var43)
		end)
	else
		var42 = transparencyValue
	end
	local var76
	local textTransparency = p14.textTransparency or reactModule.createBinding(0)
	local var45 = mergeTransparency(var34.Color.Content.Default.Transparency, { textTransparency, var42 })
	local var46 = mergeTransparency(var34.Color.Content.Emphasis.Transparency, { textTransparency, var42 })
	local var47 = mergeTransparency(var34.Color.Stroke.Default.Transparency, { var42 })
	local size1200 = var34.Size.Size_1200
	local var48 = getConversationRowHeightModule(var34.Size.Size_1400, var35 or 0, fFlagFriendsChatScaleConversationRowHeightModule)
	local var49 = useChatInputBarSettingsModule()
	local var50 = layoutConstantsModule.InputBarTopPadding + layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.InputBarTextVerticalPadding + ((if p14.isSpatialUIEnabled and var49 and var49.SpatialPanelTextSize then var49.SpatialPanelTextSize elseif var49 then var49.TextSize else var34.Typography.CaptionMedium.FontSize) or var34.Typography.CaptionMedium.FontSize)
	local var51, var52 = reactModule.useState("")
	local var53 = reactModule.useRef(nil)
	local var54 = p14.visible ~= false
	local var55 = useConversationList(var54)
	local var56 = useConversationListPaginationModule(var54, var55.listStatus)
	local listStatus = var55.listStatus
	local items = var55.items
	local var57 = reactModule.useMemo(function()
		-- upvalues: var51 (ref), items (ref), getConversationTitle (copy)
		local lowerText = string.lower(var51 or "")
		local t = {}
		
		for i, v in items do
			if (lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var51 })
	local var58 = #items == 0
	local var59 = listStatus.isFetchingConversations == true and var58
	local var60 = listStatus.error ~= nil
	local var61 = var51 ~= ""
	local var62 = useFriendsChatLandingTelemetryModule({
		conversations = items,
		displayedConversations = var57,
		isFiltered = var61
	})
	local var58_1 = var60 and var58
	local t_2 = {
		searchPlaceholder = var38.SearchPlaceholder,
		loadingConversations = var38.Loading,
		loadConversationsError = var38.SomethingWentWrong,
		noLoadedConversationsFound = var38.NoChatFound,
		noFriends = var38.NoFriends
	}
	local var65 = if var59 then t_2.loadingConversations elseif var58_1 then t_2.loadConversationsError elseif #var57 == 0 and (listStatus.isFetchingConversations ~= true and (if var58 then if listStatus.hasFetchedInitialPage ~= true then var58_1 else true else not var58)) then if var58 then t_2.noFriends else t_2.noLoadedConversationsFound else nil
	local var66 = reactModule.useCallback(function(p16)
		-- upvalues: p14 (ref)
		if p14.onConversationActivated == nil or p16 == nil or p16.id == nil then
			return
		end
		p14.onConversationActivated(p16.id)
	end, { p14.onConversationActivated })
	local var67 = reactModule.useCallback(function(p17)
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsoluteSizeChanged then
			p14.onAbsoluteSizeChanged(p17, chatWindowConfiguration)
		end
	end, { p14.onAbsoluteSizeChanged })
	local var68 = reactModule.useCallback(function(p18)
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsolutePositionChanged then
			p14.onAbsolutePositionChanged(p18, chatWindowConfiguration)
		end
	end, { p14.onAbsolutePositionChanged })
	local var69 = reactModule.useCallback(function()
		-- upvalues: var62 (ref), getTransparencyStore (ref)
		var62.fireSearchActivatedEvent()
		getTransparencyStore(false).setTextboxFocus()
	end, { getTransparencyStore, var62.fireSearchActivatedEvent })
	local var70 = reactModule.useCallback(function()
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
	local var71 = nil
	local var72 = nil
	
	if var26 then
		local var73 = reactModule.useRef(nil)
		local _ = nil
		local var74, var75 = reactOtterModule.useAnimatedBinding(1)
		var71 = var74
		var76 = var75
		var72 = reactModule.useCallback(function()
			-- upvalues: var73 (ref), var76 (write), reactOtterModule (copy), var27 (copy), t (copy)
			if var73.current ~= nil then
				pcall(task.cancel, var73.current)
				var73.current = nil
			end
			var76(reactOtterModule.instant(0))
			var73.current = task.delay(var27, function()
				-- upvalues: var73 (copy), var76 (copy), reactOtterModule (copy), t (copy)
				var73.current = nil
				var76(reactOtterModule.spring(1, t))
			end)
		end, { var76 })
		reactModule.useEffect(function()
			-- upvalues: var73 (ref)
			return function()
				-- upvalues: var73 (copy)
				if var73.current ~= nil then
					pcall(task.cancel, var73.current)
					var73.current = nil
				end
			end
		end, {})
	end
	local var83
	local var77 = reactModule.useCallback(function(_)
		-- upvalues: var26 (copy), var72 (write), getTransparencyStore (ref)
		if var26 then
			var72()
		end
		getTransparencyStore(false).resetAllTransparency()
	end, { getTransparencyStore, if var26 then var72 else nil })
	var76 = reactModule.useCallback(function(p19)
		-- upvalues: reactModule (copy), conversationRow (copy), var48 (ref), var66 (ref), var62 (ref), p14 (ref)
		return reactModule.createElement(conversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = tostring(p19.item.id),
			entryHeight = var48,
			onActivated = var66,
			fireClickEvent = var62.fireConversationClickedEvent,
			fireImpressionEvent = var62.fireConversationImpressionEvent,
			localUserId = p14.localUserId
		})
	end, {
		var48,
		var62.fireConversationClickedEvent,
		var62.fireConversationImpressionEvent,
		var66,
		p14.localUserId
	})
	local var78 = reactModule.useCallback(function(_, p20)
		-- upvalues: var48 (ref)
		return { length = var48, offset = var48 * (p20 - 1), index = p20 }
	end, { var48 })
	local var79 = reactModule.useCallback(function(_, p21)
		-- upvalues: var53 (ref), var56 (ref)
		local current = var53.current
		
		if current ~= nil and p21 <= current.AbsoluteSize.Y then
			var56.loadNext()
		end
	end, { var56.loadNext })
	local var80 = reactModule.useCallback(function()
		-- upvalues: var56 (ref), promiseModule (copy)
		var56.loadNext()
		
		return promiseModule.resolve()
	end, { var56.loadNext })
	local var81 = reactModule.useCallback(function(p22)
		-- upvalues: var52 (ref)
		var52(p22.Text)
	end, {})
	local var82 = reactModule.useCallback(function()
		-- upvalues: var52 (ref)
		var52("")
	end, {})
	
	if fFlagAppChatUseUltimateListConversationListModule then
		var83 = reactModule.createElement
		var83 = var83(conversationListUltimate, {
			isWideMode = false,
			showScrollbarOnScroll = true,
			showHeaderEntries = false,
			shouldLogHeaderEntryExposures = false,
			Size = UDim2.fromScale(1, 1),
			entryHeight = var48,
			itemList = var57,
			loadNext = var56.loadNext,
			isLoadingNext = listStatus.isFetchingNextPage == true,
			oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
			onScrollUpdate = var77,
			rowProps = { showBackground = false, localUserId = p14.localUserId },
			localUserId = p14.localUserId,
			onActivated = var66,
			fireConversationClickedEvent = var62.fireConversationClickedEvent,
			fireConversationImpressionEvent = var62.fireConversationImpressionEvent
		})
	else
		var83 = reactModule.createElement(bidirectionalFlatList, {
			enableAutoscrollToTop = true,
			data = var57,
			renderItem = var76,
			getItemLayout = var78,
			keyExtractor = function(p23)
				return tostring(p23.id)
			end,
			compareItemData = function(p24, p25)
				return p24.id == p25.id
			end,
			style = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ScrollBarImageTransparency = if var26 then var71 else nil,
				ScrollBarThickness = friendsChatConversationListScrollbarThickness
			},
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			windowSize = friendsChatConversationListWindowSize,
			initialNumToRender = friendsChatConversationListInitialNumToRender,
			onScroll = var77,
			onContentSizeChange = var79,
			onEndReached = var80,
			onEndReachedThreshold = var48 * friendsChatConversationListPaginationThresholdRows,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasSize = UDim2.fromScale(0, 0),
			autoscrollToTopThreshold = friendsChatConversationListAutoscrollToTopThreshold
		})
	end
	local createElement_3
	local createElement = reactModule.createElement
	local var84 = "Frame"
	local t_3 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p26)
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p26 * (1 - backgroundTransparency)
		end) else transparencyValue,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p14.LayoutOrder or 1,
		Size = p14.size or UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight + var50 + layoutConstantsModule.PanelBottomCornerRadius),
		Visible = var54,
		[reactModule.Change.AbsoluteSize] = var67,
		[reactModule.Change.AbsolutePosition] = var68,
		[reactModule.Event.MouseEnter] = p14.onHovered,
		[reactModule.Event.MouseLeave] = p14.onUnhovered
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
					Size = UDim2.new(1, -2, 0, var34.Size.Size_800),
					stroke = {
						Color = var34.Color.Stroke.Default.Color3,
						Transparency = var47,
						Thickness = var34.Stroke.Standard
					}
				}, {
					SearchIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.MagnifyingGlass,
						size = iconSize.Small,
						style = {
							Color3 = var34.Color.Content.Default.Color3,
							Transparency = var45
						}
					}),
					SearchBox = reactModule.createElement("TextBox", {
						Name = "FriendsChatConversationListSearchBox",
						BackgroundTransparency = 1,
						ClearTextOnFocus = false,
						ClipsDescendants = true,
						Font = var34.Typography.BodySmall.Font,
						LineHeight = var34.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = var34.Color.Content.Muted.Color3,
						PlaceholderText = t_2.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = var51,
						TextColor3 = var34.Color.Content.Emphasis.Color3,
						TextSize = var34.Typography.BodySmall.FontSize,
						TextTransparency = var46,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[reactModule.Event.Focused] = var69,
						[reactModule.Event.FocusLost] = var70,
						[reactModule.Change.Text] = var81
					}, {
						Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if var61 then reactModule.createElement(view, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = var82
					}, {
						Icon = reactModule.createElement(icon, {
							name = iconName.CircleX,
							size = iconSize.Small,
							style = {
								Color3 = var34.Color.Content.Default.Color3,
								Transparency = var45
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
	local var89 = "CanvasGroup"
	local t_7 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = var42,
		Size = UDim2.fromScale(1, 1)
	}
	local t_8 = {
		ListWrapper = reactModule.createElement("Frame", {
			Name = "FriendsChatConversationListWrapper",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var53
		}, { List = var83 })
	}
	
	if var65 ~= nil then
		createElement_3 = reactModule.createElement
		local var92 = view
		local t_9 = {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_10 = {}
		local createElement_4 = reactModule.createElement
		local var95 = text
		local t_11 = {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = var65
		}
		local transparency = var34.Color.Content.Default.Transparency
		t_11.textStyle = {
			Color3 = var34.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p27)
				-- upvalues: transparency (ref)
				return transparency + p27 * (1 - transparency)
			end) else transparency
		}
		t_10.Message = createElement_4(var95, t_11)
		t_10.Retry = var58_1 and reactModule.createElement(iconButton, {
			icon = iconName.ArrowSpinClockwise,
			onActivated = var56.retryInitialFetch,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		}) or nil
		createElement_3 = createElement_3(var92, t_9, t_10) or nil
	end
	t_8.Status = createElement_3
	t_6.ListContent = createElement_2(var89, t_7, t_8)
	t_4.ListArea = createElement_1(view, t_5, t_6)
	
	return createElement(var84, t_3, t_4)
end)