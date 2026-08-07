local textChatService = game:GetService("TextChatService")
local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appChatModule = require(parent.AppChat)
local fFlagAppChatUseUltimateListConversationListModule = require(parent.AppChat.FFlagAppChatUseUltimateListConversationList)
local bidirectionalFlatList = require(parent.VirtualizedList).BidirectionalFlatList
local useChatPlatformModule = require(parent.ExpChatIntegration.useChatPlatform)
local useChatInputBarSettingsModule = require(parent.ExpChatIntegration.useChatInputBarSettings)
local useInterpolatedClientSettingsModule = require(parent.ExpChatIntegration.useInterpolatedClientSettings)
local useChatWindowSettingsModule = require(parent.ExpChatIntegration.useChatWindowSettings)
local expChatConversationListAdapterModule = require(script.Parent.ExpChatConversationListAdapter)
local useConversationListPaginationModule = require(script.Parent.useConversationListPagination)
local layoutConstantsModule = require(friendsChat.LayoutConstants)
local useFriendsChatLandingTelemetryModule = require(script.Parent.Parent.Telemetry.ChatLanding.useFriendsChatLandingTelemetry)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local conversationListUltimate = appChatModule.Components.ChatLanding.ConversationListUltimate
local conversationRow = appChatModule.Components.ChatLanding.ConversationRow
local getConversationTitle = expChatConversationListAdapterModule.getConversationTitle
local useConversationList = appChatModule.Hooks.useConversationList
local friendsChatConversationListAutoscrollToTopThreshold = game:DefineFastInt("FriendsChatConversationListAutoscrollToTopThreshold", 33)
local friendsChatConversationListInitialNumToRender = game:DefineFastInt("FriendsChatConversationListInitialNumToRender", 8)
local friendsChatConversationListPaginationThresholdRows = game:DefineFastInt("FriendsChatConversationListPaginationThresholdRows", 10)
local friendsChatConversationListScrollbarThickness = game:DefineFastInt("FriendsChatConversationListScrollbarThickness", 8)
local friendsChatConversationListWindowSize = game:DefineFastInt("FriendsChatConversationListWindowSize", 2)
local t = {
	NoFriends = "Feature.Chat.Text.NoFriends",
	SearchPlaceholder = "CommonUI.Controls.Action.Search",
	Retry = "InGame.CommonUI.Button.Retry",
	Loading = "Feature.Chat.Label.Loading",
	TryAgain = "Feature.Chat.Label.TryAgain",
	NoChatFound = "Feature.Chat.Label.NoChatFound"
}

local function _(p0, p1) --[[ line: 85 | named "getColorStyle" ]]
	return { Color3 = p0, Transparency = p1 }
end

local _ = function(p2, p3) --[[ line: 92 | named "getTransparencyOrBindingValue" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4) --[[ line: 94 ]]
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p3
end

local _ = function(p5, p6) --[[ line: 102 | named "getTextTransparency" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p5) then p5:map(function(p7) --[[ line: 104 ]]
		-- upvalues: p6 (ref)
		return p6 + p7 * (1 - p6)
	end) else p6
end

local function mergeTransparency(p8, p9) --[[ line: 112 ]]
	-- upvalues: reactIsModule (ref), reactModule (ref)
	local t = {}
	local var24 = p8
	
	for i, v in p9 do
		if reactIsModule.isBinding(v) then
			table.insert(t, v)
		else
			var24 += (v or 0) * (1 - var24)
		end
	end
	return if #t == 0 then var24 else reactModule.joinBindings(t):map(function(p10) --[[ line: 128 ]]
		-- upvalues: var24 (write)
		local var25 = var24
		
		for i, v in p10 do
			var25 += v * (1 - var25)
		end
		return var25
	end)
end

local _ = function(p11) --[[ line: 137 | named "normalizeSearchText" ]]
	return string.lower(p11 or "")
end

local _ = function(p12, p13) --[[ line: 141 | named "containsSearchText" ]]
	return p13 == "" or string.find(string.lower(p12 or ""), p13, 1, true) ~= nil
end

return reactModule.memo(function(p14) --[[ line: 148 | named "FriendsChatConversationList" ]]
	-- upvalues: useTokens (ref), useChatPlatformModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useLocalization (ref), t (ref), useInterpolatedClientSettingsModule (ref), reactIsModule (ref), mergeTransparency (ref), useChatInputBarSettingsModule (ref), layoutConstantsModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), useFriendsChatLandingTelemetryModule (ref), textChatService (ref), conversationRow (ref), promiseModule (ref), fFlagAppChatUseUltimateListConversationListModule (ref), conversationListUltimate (ref), bidirectionalFlatList (ref), friendsChatConversationListScrollbarThickness (ref), friendsChatConversationListWindowSize (ref), friendsChatConversationListInitialNumToRender (ref), friendsChatConversationListPaginationThresholdRows (ref), friendsChatConversationListAutoscrollToTopThreshold (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), button (ref), fillBehavior (ref), inputSize (ref), buttonVariant (ref)
	local var33
	local var26 = useTokens()
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	local var27 = useChatWindowSettingsModule()
	local chatWindowSettings = p14.chatWindowSettings or reactModule.useMemo(function() --[[ line: 152 ]]
		-- upvalues: var27 (ref)
		return {
			BackgroundColor3 = var27.ChatWindowBackgroundColor3,
			BackgroundTransparency = var27.ChatWindowBackgroundTransparency
		}
	end, { var27 })
	local var29 = useLocalization(t)
	local var30 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local backgroundTransparency = var30.BackgroundTransparency
	local backgroundColor3 = var30.BackgroundColor3 or (var30.BackgroundColor or chatWindowSettings.BackgroundColor3)
	local transparencyValue = p14.transparencyValue or var27.ChatWindowBackgroundTransparency
	
	if p14.transparencyValue == nil then
		var33 = 0
	elseif reactIsModule.isBinding(transparencyValue) then
		local var34 = 0
		var33 = transparencyValue:map(function(p15) --[[ line: 94 ]]
			-- upvalues: var34 (ref)
			return var34 + p15 * (1 - var34)
		end)
	else
		var33 = transparencyValue
	end
	local var68
	local textTransparency = p14.textTransparency or reactModule.createBinding(0)
	local var36 = mergeTransparency(var26.Color.Content.Default.Transparency, { textTransparency, var33 })
	local var37 = mergeTransparency(var26.Color.Content.Emphasis.Transparency, { textTransparency, var33 })
	local var38 = mergeTransparency(var26.Color.Stroke.Default.Transparency, { var33 })
	local size1200 = var26.Size.Size_1200
	local size1400 = var26.Size.Size_1400
	local var39 = useChatInputBarSettingsModule()
	local var40 = layoutConstantsModule.InputBarTopPadding + layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.InputBarTextVerticalPadding + ((if p14.isSpatialUIEnabled and var39 and var39.SpatialPanelTextSize then var39.SpatialPanelTextSize elseif var39 then var39.TextSize else var26.Typography.CaptionMedium.FontSize) or var26.Typography.CaptionMedium.FontSize)
	local var41, var42 = reactModule.useState("")
	local var43 = reactModule.useRef(nil)
	local var44 = p14.visible ~= false
	local var45 = useConversationList(var44)
	local var46 = useConversationListPaginationModule(var44, var45.listStatus)
	local listStatus = var45.listStatus
	local items = var45.items
	local var47 = reactModule.useMemo(function() --[[ line: 199 ]]
		-- upvalues: var41 (ref), items (ref), getConversationTitle (copy)
		local lowerText = string.lower(var41 or "")
		local t = {}
		
		for i, v in items do
			if (lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var41 })
	local var48 = #items == 0
	local var49 = listStatus.isFetchingConversations == true and var48
	local var50 = listStatus.error ~= nil
	local var51 = var41 ~= ""
	local var52 = useFriendsChatLandingTelemetryModule({
		conversations = items,
		displayedConversations = var47,
		isFiltered = var51
	})
	local var48_1 = var50 and var48
	local t_1 = {
		searchPlaceholder = var29.SearchPlaceholder,
		loadingConversations = var29.Loading,
		loadConversationsError = var29.TryAgain,
		noLoadedConversationsFound = var29.NoChatFound,
		noFriends = var29.NoFriends,
		retry = var29.Retry
	}
	local var55 = if var49 then t_1.loadingConversations elseif var48_1 then t_1.loadConversationsError elseif #var47 == 0 and (listStatus.isFetchingConversations ~= true and (if var48 then if listStatus.hasFetchedInitialPage ~= true then var48_1 else true else not var48)) then if var48 then t_1.noFriends else t_1.noLoadedConversationsFound else nil
	local var56 = reactModule.useCallback(function(p16) --[[ line: 248 ]]
		-- upvalues: p14 (ref)
		if p14.onConversationActivated == nil or p16 == nil or p16.id == nil then
			return
		end
		p14.onConversationActivated(p16.id)
	end, { p14.onConversationActivated })
	local var57 = reactModule.useCallback(function(p17) --[[ line: 256 ]]
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsoluteSizeChanged then
			p14.onAbsoluteSizeChanged(p17, chatWindowConfiguration)
		end
	end, { p14.onAbsoluteSizeChanged })
	local var58 = reactModule.useCallback(function(p18) --[[ line: 263 ]]
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsolutePositionChanged then
			p14.onAbsolutePositionChanged(p18, chatWindowConfiguration)
		end
	end, { p14.onAbsolutePositionChanged })
	local var59 = reactModule.useCallback(function() --[[ line: 270 ]]
		-- upvalues: var52 (ref), getTransparencyStore (ref)
		var52.fireSearchActivatedEvent()
		getTransparencyStore(false).setTextboxFocus()
	end, { getTransparencyStore, var52.fireSearchActivatedEvent })
	local var60 = reactModule.useCallback(function() --[[ line: 275 ]]
		-- upvalues: getTransparencyStore (ref)
		getTransparencyStore(false).clearTextboxFocus()
	end, { getTransparencyStore })
	reactModule.useEffect(function() --[[ line: 279 ]]
		-- upvalues: getTransparencyStore (ref)
		return function() --[[ line: 280 ]]
			-- upvalues: getTransparencyStore (copy)
			getTransparencyStore(false).clearTextboxFocus()
		end
	end, { getTransparencyStore })
	local var61 = reactModule.useCallback(function(_) --[[ line: 285 ]]
		-- upvalues: getTransparencyStore (ref)
		getTransparencyStore(false).resetAllTransparency()
	end, { getTransparencyStore })
	local var62 = reactModule.useCallback(function(p19) --[[ line: 290 ]]
		-- upvalues: reactModule (copy), conversationRow (copy), size1400 (ref), var56 (ref), var52 (ref), p14 (ref)
		return reactModule.createElement(conversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = tostring(p19.item.id),
			entryHeight = size1400,
			onActivated = var56,
			fireClickEvent = var52.fireConversationClickedEvent,
			fireImpressionEvent = var52.fireConversationImpressionEvent,
			localUserId = p14.localUserId
		})
	end, {
		size1400,
		var52.fireConversationClickedEvent,
		var52.fireConversationImpressionEvent,
		var56,
		p14.localUserId
	})
	local var63 = reactModule.useCallback(function(_, p20) --[[ line: 312 ]]
		-- upvalues: size1400 (ref)
		return {
			length = size1400,
			offset = size1400 * (p20 - 1),
			index = p20
		}
	end, { size1400 })
	local var64 = reactModule.useCallback(function(_, p21) --[[ line: 320 ]]
		-- upvalues: var43 (ref), var46 (ref)
		local current = var43.current
		
		if current ~= nil and p21 <= current.AbsoluteSize.Y then
			var46.loadNext()
		end
	end, { var46.loadNext })
	local var65 = reactModule.useCallback(function() --[[ line: 327 ]]
		-- upvalues: var46 (ref), promiseModule (copy)
		var46.loadNext()
		
		return promiseModule.resolve()
	end, { var46.loadNext })
	local var66 = reactModule.useCallback(function(p22) --[[ line: 332 ]]
		-- upvalues: var42 (ref)
		var42(p22.Text)
	end, {})
	local var67 = reactModule.useCallback(function() --[[ line: 336 ]]
		-- upvalues: var42 (ref)
		var42("")
	end, {})
	
	if fFlagAppChatUseUltimateListConversationListModule then
		var68 = reactModule.createElement
		var68 = var68(conversationListUltimate, {
			isWideMode = false,
			showScrollbarOnScroll = true,
			showHeaderEntries = false,
			shouldLogHeaderEntryExposures = false,
			Size = UDim2.fromScale(1, 1),
			entryHeight = size1400,
			itemList = var47,
			loadNext = var46.loadNext,
			isLoadingNext = listStatus.isFetchingNextPage == true,
			oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
			onScrollUpdate = var61,
			rowProps = { showBackground = false, localUserId = p14.localUserId },
			localUserId = p14.localUserId,
			onActivated = var56,
			fireConversationClickedEvent = var52.fireConversationClickedEvent,
			fireConversationImpressionEvent = var52.fireConversationImpressionEvent
		})
	else
		var68 = reactModule.createElement(bidirectionalFlatList, {
			enableAutoscrollToTop = true,
			data = var47,
			renderItem = var62,
			getItemLayout = var63,
			keyExtractor = function(p23) --[[ line: 367 ]]
				return tostring(p23.id)
			end,
			compareItemData = function(p24, p25) --[[ line: 370 ]]
				return p24.id == p25.id
			end,
			style = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ScrollBarThickness = friendsChatConversationListScrollbarThickness
			},
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			windowSize = friendsChatConversationListWindowSize,
			initialNumToRender = friendsChatConversationListInitialNumToRender,
			onScroll = var61,
			onContentSizeChange = var64,
			onEndReached = var65,
			onEndReachedThreshold = size1400 * friendsChatConversationListPaginationThresholdRows,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasSize = UDim2.fromScale(0, 0),
			autoscrollToTopThreshold = friendsChatConversationListAutoscrollToTopThreshold
		})
	end
	local createElement_3
	local createElement = reactModule.createElement
	local var69 = "Frame"
	local t_2 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p26) --[[ line: 94 ]]
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p26 * (1 - backgroundTransparency)
		end) else transparencyValue,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p14.LayoutOrder or 1,
		Size = p14.size or UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight + var40 + layoutConstantsModule.PanelBottomCornerRadius),
		Visible = var44,
		[reactModule.Change.AbsoluteSize] = var57,
		[reactModule.Change.AbsolutePosition] = var58,
		[reactModule.Event.MouseEnter] = p14.onHovered,
		[reactModule.Event.MouseLeave] = p14.onUnhovered
	}
	local t_3 = {
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
					Size = UDim2.new(1, -2, 0, var26.Size.Size_800),
					stroke = {
						Color = var26.Color.Stroke.Default.Color3,
						Transparency = var38,
						Thickness = var26.Stroke.Standard
					}
				}, {
					SearchIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.MagnifyingGlass,
						size = iconSize.Small,
						style = {
							Color3 = var26.Color.Content.Default.Color3,
							Transparency = var36
						}
					}),
					SearchBox = reactModule.createElement("TextBox", {
						Name = "FriendsChatConversationListSearchBox",
						BackgroundTransparency = 1,
						ClearTextOnFocus = false,
						ClipsDescendants = true,
						Font = var26.Typography.BodySmall.Font,
						LineHeight = var26.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = var26.Color.Content.Muted.Color3,
						PlaceholderText = t_1.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = var41,
						TextColor3 = var26.Color.Content.Emphasis.Color3,
						TextSize = var26.Typography.BodySmall.FontSize,
						TextTransparency = var37,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[reactModule.Event.Focused] = var59,
						[reactModule.Event.FocusLost] = var60,
						[reactModule.Change.Text] = var66
					}, {
						Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if var51 then reactModule.createElement(view, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = var67
					}, {
						Icon = reactModule.createElement(icon, {
							name = iconName.CircleX,
							size = iconSize.Small,
							style = {
								Color3 = var26.Color.Content.Default.Color3,
								Transparency = var36
							}
						})
					}) else nil
				})
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local t_4 = {
		Name = "ListArea",
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 1, -size1200)
	}
	local t_5 = {}
	local createElement_2 = reactModule.createElement
	local var74 = "CanvasGroup"
	local t_6 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = var33,
		Size = UDim2.fromScale(1, 1)
	}
	local t_7 = {
		ListWrapper = reactModule.createElement("Frame", {
			Name = "FriendsChatConversationListWrapper",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var43
		}, { List = var68 })
	}
	
	if var55 ~= nil then
		createElement_3 = reactModule.createElement
		local var77 = view
		local t_8 = {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_9 = {}
		local createElement_4 = reactModule.createElement
		local var80 = text
		local t_10 = {
			tag = "size-full-0 auto-y text-wrap text-body-medium text-align-x-center content-default",
			Text = var55
		}
		local transparency = var26.Color.Content.Default.Transparency
		t_10.textStyle = {
			Color3 = var26.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p27) --[[ line: 104 ]]
				-- upvalues: transparency (ref)
				return transparency + p27 * (1 - transparency)
			end) else transparency
		}
		t_9.Message = createElement_4(var80, t_10)
		t_9.Retry = var48_1 and reactModule.createElement(button, {
			fillBehavior = fillBehavior.Fit,
			onActivated = var46.retryInitialFetch,
			size = inputSize.Small,
			text = t_1.retry,
			variant = buttonVariant.Standard
		}) or nil
		createElement_3 = createElement_3(var77, t_8, t_9) or nil
	end
	t_7.Status = createElement_3
	t_5.ListContent = createElement_2(var74, t_6, t_7)
	t_3.ListArea = createElement_1(view, t_4, t_5)
	
	return createElement(var69, t_2, t_3)
end)