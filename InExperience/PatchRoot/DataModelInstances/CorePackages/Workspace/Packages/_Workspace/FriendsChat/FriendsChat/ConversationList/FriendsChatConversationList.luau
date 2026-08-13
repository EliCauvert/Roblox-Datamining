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
local var24 = fFlagFriendsChatConversationListFadeScrollbarModule and not fFlagAppChatUseUltimateListConversationListModule
local var25 = friendsChatConversationListScrollbarIdleHideMs / 1000
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

local function _(p0, p1) --[[ line: 98 | named "getColorStyle" ]]
	return { Color3 = p0, Transparency = p1 }
end

local _ = function(p2, p3) --[[ line: 105 | named "getTransparencyOrBindingValue" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4) --[[ line: 107 ]]
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p3
end

local _ = function(p5, p6) --[[ line: 115 | named "getTextTransparency" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p5) then p5:map(function(p7) --[[ line: 117 ]]
		-- upvalues: p6 (ref)
		return p6 + p7 * (1 - p6)
	end) else p6
end

local function mergeTransparency(p8, p9) --[[ line: 125 ]]
	-- upvalues: reactIsModule (ref), reactModule (ref)
	local t = {}
	local var30 = p8
	
	for i, v in p9 do
		if reactIsModule.isBinding(v) then
			table.insert(t, v)
		else
			var30 += (v or 0) * (1 - var30)
		end
	end
	return if #t == 0 then var30 else reactModule.joinBindings(t):map(function(p10) --[[ line: 141 ]]
		-- upvalues: var30 (write)
		local var31 = var30
		
		for i, v in p10 do
			var31 += v * (1 - var31)
		end
		return var31
	end)
end

local _ = function(p11) --[[ line: 150 | named "normalizeSearchText" ]]
	return string.lower(p11 or "")
end

local _ = function(p12, p13) --[[ line: 154 | named "containsSearchText" ]]
	return p13 == "" or string.find(string.lower(p12 or ""), p13, 1, true) ~= nil
end

return reactModule.memo(function(p14) --[[ line: 161 | named "FriendsChatConversationList" ]]
	-- upvalues: useTokens (ref), useChatPlatformModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useLocalization (ref), t_1 (ref), useInterpolatedClientSettingsModule (ref), reactIsModule (ref), mergeTransparency (ref), useChatInputBarSettingsModule (ref), layoutConstantsModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), useFriendsChatLandingTelemetryModule (ref), textChatService (ref), var24 (ref), reactOtterModule (ref), var25 (ref), t (ref), conversationRow (ref), promiseModule (ref), fFlagAppChatUseUltimateListConversationListModule (ref), conversationListUltimate (ref), bidirectionalFlatList (ref), friendsChatConversationListScrollbarThickness (ref), friendsChatConversationListWindowSize (ref), friendsChatConversationListInitialNumToRender (ref), friendsChatConversationListPaginationThresholdRows (ref), friendsChatConversationListAutoscrollToTopThreshold (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var39
	local var32 = useTokens()
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	local var33 = useChatWindowSettingsModule()
	local chatWindowSettings = p14.chatWindowSettings or reactModule.useMemo(function() --[[ line: 165 ]]
		-- upvalues: var33 (ref)
		return {
			BackgroundColor3 = var33.ChatWindowBackgroundColor3,
			BackgroundTransparency = var33.ChatWindowBackgroundTransparency
		}
	end, { var33 })
	local var35 = useLocalization(t_1)
	local var36 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local backgroundTransparency = var36.BackgroundTransparency
	local backgroundColor3 = var36.BackgroundColor3 or (var36.BackgroundColor or chatWindowSettings.BackgroundColor3)
	local transparencyValue = p14.transparencyValue or var33.ChatWindowBackgroundTransparency
	
	if p14.transparencyValue == nil then
		var39 = 0
	elseif reactIsModule.isBinding(transparencyValue) then
		local var40 = 0
		var39 = transparencyValue:map(function(p15) --[[ line: 107 ]]
			-- upvalues: var40 (ref)
			return var40 + p15 * (1 - var40)
		end)
	else
		var39 = transparencyValue
	end
	local var72
	local textTransparency = p14.textTransparency or reactModule.createBinding(0)
	local var42 = mergeTransparency(var32.Color.Content.Default.Transparency, { textTransparency, var39 })
	local var43 = mergeTransparency(var32.Color.Content.Emphasis.Transparency, { textTransparency, var39 })
	local var44 = mergeTransparency(var32.Color.Stroke.Default.Transparency, { var39 })
	local size1200 = var32.Size.Size_1200
	local size1400 = var32.Size.Size_1400
	local var45 = useChatInputBarSettingsModule()
	local var46 = layoutConstantsModule.InputBarTopPadding + layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.InputBarTextVerticalPadding + ((if p14.isSpatialUIEnabled and var45 and var45.SpatialPanelTextSize then var45.SpatialPanelTextSize elseif var45 then var45.TextSize else var32.Typography.CaptionMedium.FontSize) or var32.Typography.CaptionMedium.FontSize)
	local var47, var48 = reactModule.useState("")
	local var49 = reactModule.useRef(nil)
	local var50 = p14.visible ~= false
	local var51 = useConversationList(var50)
	local var52 = useConversationListPaginationModule(var50, var51.listStatus)
	local listStatus = var51.listStatus
	local items = var51.items
	local var53 = reactModule.useMemo(function() --[[ line: 212 ]]
		-- upvalues: var47 (ref), items (ref), getConversationTitle (copy)
		local lowerText = string.lower(var47 or "")
		local t = {}
		
		for i, v in items do
			if (lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var47 })
	local var54 = #items == 0
	local var55 = listStatus.isFetchingConversations == true and var54
	local var56 = listStatus.error ~= nil
	local var57 = var47 ~= ""
	local var58 = useFriendsChatLandingTelemetryModule({
		conversations = items,
		displayedConversations = var53,
		isFiltered = var57
	})
	local var54_1 = var56 and var54
	local t_2 = {
		searchPlaceholder = var35.SearchPlaceholder,
		loadingConversations = var35.Loading,
		loadConversationsError = var35.SomethingWentWrong,
		noLoadedConversationsFound = var35.NoChatFound,
		noFriends = var35.NoFriends
	}
	local var61 = if var55 then t_2.loadingConversations elseif var54_1 then t_2.loadConversationsError elseif #var53 == 0 and (listStatus.isFetchingConversations ~= true and (if var54 then if listStatus.hasFetchedInitialPage ~= true then var54_1 else true else not var54)) then if var54 then t_2.noFriends else t_2.noLoadedConversationsFound else nil
	local var62 = reactModule.useCallback(function(p16) --[[ line: 260 ]]
		-- upvalues: p14 (ref)
		if p14.onConversationActivated == nil or p16 == nil or p16.id == nil then
			return
		end
		p14.onConversationActivated(p16.id)
	end, { p14.onConversationActivated })
	local var63 = reactModule.useCallback(function(p17) --[[ line: 268 ]]
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsoluteSizeChanged then
			p14.onAbsoluteSizeChanged(p17, chatWindowConfiguration)
		end
	end, { p14.onAbsoluteSizeChanged })
	local var64 = reactModule.useCallback(function(p18) --[[ line: 275 ]]
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsolutePositionChanged then
			p14.onAbsolutePositionChanged(p18, chatWindowConfiguration)
		end
	end, { p14.onAbsolutePositionChanged })
	local var65 = reactModule.useCallback(function() --[[ line: 282 ]]
		-- upvalues: var58 (ref), getTransparencyStore (ref)
		var58.fireSearchActivatedEvent()
		getTransparencyStore(false).setTextboxFocus()
	end, { getTransparencyStore, var58.fireSearchActivatedEvent })
	local var66 = reactModule.useCallback(function() --[[ line: 287 ]]
		-- upvalues: getTransparencyStore (ref)
		getTransparencyStore(false).clearTextboxFocus()
	end, { getTransparencyStore })
	reactModule.useEffect(function() --[[ line: 291 ]]
		-- upvalues: getTransparencyStore (ref)
		return function() --[[ line: 292 ]]
			-- upvalues: getTransparencyStore (copy)
			getTransparencyStore(false).clearTextboxFocus()
		end
	end, { getTransparencyStore })
	local var67 = nil
	local var68 = nil
	
	if var24 then
		local var69 = reactModule.useRef(nil)
		local _ = nil
		local var70, var71 = reactOtterModule.useAnimatedBinding(1)
		var67 = var70
		var72 = var71
		var68 = reactModule.useCallback(function() --[[ line: 307 ]]
			-- upvalues: var69 (ref), var72 (write), reactOtterModule (copy), var25 (copy), t (copy)
			if var69.current ~= nil then
				pcall(task.cancel, var69.current)
				var69.current = nil
			end
			var72(reactOtterModule.instant(0))
			var69.current = task.delay(var25, function() --[[ line: 315 ]]
				-- upvalues: var69 (copy), var72 (copy), reactOtterModule (copy), t (copy)
				var69.current = nil
				var72(reactOtterModule.spring(1, t))
			end)
		end, { var72 })
		reactModule.useEffect(function() --[[ line: 322 ]]
			-- upvalues: var69 (ref)
			return function() --[[ line: 323 ]]
				-- upvalues: var69 (copy)
				if var69.current ~= nil then
					pcall(task.cancel, var69.current)
					var69.current = nil
				end
			end
		end, {})
	end
	local var79
	local var73 = reactModule.useCallback(function(_) --[[ line: 333 ]]
		-- upvalues: var24 (copy), var68 (write), getTransparencyStore (ref)
		if var24 then
			var68()
		end
		getTransparencyStore(false).resetAllTransparency()
	end, { getTransparencyStore, if var24 then var68 else nil })
	var72 = reactModule.useCallback(function(p19) --[[ line: 347 ]]
		-- upvalues: reactModule (copy), conversationRow (copy), size1400 (ref), var62 (ref), var58 (ref), p14 (ref)
		return reactModule.createElement(conversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = tostring(p19.item.id),
			entryHeight = size1400,
			onActivated = var62,
			fireClickEvent = var58.fireConversationClickedEvent,
			fireImpressionEvent = var58.fireConversationImpressionEvent,
			localUserId = p14.localUserId
		})
	end, {
		size1400,
		var58.fireConversationClickedEvent,
		var58.fireConversationImpressionEvent,
		var62,
		p14.localUserId
	})
	local var74 = reactModule.useCallback(function(_, p20) --[[ line: 369 ]]
		-- upvalues: size1400 (ref)
		return {
			length = size1400,
			offset = size1400 * (p20 - 1),
			index = p20
		}
	end, { size1400 })
	local var75 = reactModule.useCallback(function(_, p21) --[[ line: 377 ]]
		-- upvalues: var49 (ref), var52 (ref)
		local current = var49.current
		
		if current ~= nil and p21 <= current.AbsoluteSize.Y then
			var52.loadNext()
		end
	end, { var52.loadNext })
	local var76 = reactModule.useCallback(function() --[[ line: 384 ]]
		-- upvalues: var52 (ref), promiseModule (copy)
		var52.loadNext()
		
		return promiseModule.resolve()
	end, { var52.loadNext })
	local var77 = reactModule.useCallback(function(p22) --[[ line: 389 ]]
		-- upvalues: var48 (ref)
		var48(p22.Text)
	end, {})
	local var78 = reactModule.useCallback(function() --[[ line: 393 ]]
		-- upvalues: var48 (ref)
		var48("")
	end, {})
	
	if fFlagAppChatUseUltimateListConversationListModule then
		var79 = reactModule.createElement
		var79 = var79(conversationListUltimate, {
			isWideMode = false,
			showScrollbarOnScroll = true,
			showHeaderEntries = false,
			shouldLogHeaderEntryExposures = false,
			Size = UDim2.fromScale(1, 1),
			entryHeight = size1400,
			itemList = var53,
			loadNext = var52.loadNext,
			isLoadingNext = listStatus.isFetchingNextPage == true,
			oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
			onScrollUpdate = var73,
			rowProps = { showBackground = false, localUserId = p14.localUserId },
			localUserId = p14.localUserId,
			onActivated = var62,
			fireConversationClickedEvent = var58.fireConversationClickedEvent,
			fireConversationImpressionEvent = var58.fireConversationImpressionEvent
		})
	else
		var79 = reactModule.createElement(bidirectionalFlatList, {
			enableAutoscrollToTop = true,
			data = var53,
			renderItem = var72,
			getItemLayout = var74,
			keyExtractor = function(p23) --[[ line: 424 ]]
				return tostring(p23.id)
			end,
			compareItemData = function(p24, p25) --[[ line: 427 ]]
				return p24.id == p25.id
			end,
			style = {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Selectable = false,
				ScrollBarImageTransparency = if var24 then var67 else nil,
				ScrollBarThickness = friendsChatConversationListScrollbarThickness
			},
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			windowSize = friendsChatConversationListWindowSize,
			initialNumToRender = friendsChatConversationListInitialNumToRender,
			onScroll = var73,
			onContentSizeChange = var75,
			onEndReached = var76,
			onEndReachedThreshold = size1400 * friendsChatConversationListPaginationThresholdRows,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasSize = UDim2.fromScale(0, 0),
			autoscrollToTopThreshold = friendsChatConversationListAutoscrollToTopThreshold
		})
	end
	local createElement_3
	local createElement = reactModule.createElement
	local var80 = "Frame"
	local t_3 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p26) --[[ line: 107 ]]
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p26 * (1 - backgroundTransparency)
		end) else transparencyValue,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p14.LayoutOrder or 1,
		Size = p14.size or UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight + var46 + layoutConstantsModule.PanelBottomCornerRadius),
		Visible = var50,
		[reactModule.Change.AbsoluteSize] = var63,
		[reactModule.Change.AbsolutePosition] = var64,
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
					Size = UDim2.new(1, -2, 0, var32.Size.Size_800),
					stroke = {
						Color = var32.Color.Stroke.Default.Color3,
						Transparency = var44,
						Thickness = var32.Stroke.Standard
					}
				}, {
					SearchIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.MagnifyingGlass,
						size = iconSize.Small,
						style = {
							Color3 = var32.Color.Content.Default.Color3,
							Transparency = var42
						}
					}),
					SearchBox = reactModule.createElement("TextBox", {
						Name = "FriendsChatConversationListSearchBox",
						BackgroundTransparency = 1,
						ClearTextOnFocus = false,
						ClipsDescendants = true,
						Font = var32.Typography.BodySmall.Font,
						LineHeight = var32.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = var32.Color.Content.Muted.Color3,
						PlaceholderText = t_2.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = var47,
						TextColor3 = var32.Color.Content.Emphasis.Color3,
						TextSize = var32.Typography.BodySmall.FontSize,
						TextTransparency = var43,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[reactModule.Event.Focused] = var65,
						[reactModule.Event.FocusLost] = var66,
						[reactModule.Change.Text] = var77
					}, {
						Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if var57 then reactModule.createElement(view, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = var78
					}, {
						Icon = reactModule.createElement(icon, {
							name = iconName.CircleX,
							size = iconSize.Small,
							style = {
								Color3 = var32.Color.Content.Default.Color3,
								Transparency = var42
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
	local var85 = "CanvasGroup"
	local t_7 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = var39,
		Size = UDim2.fromScale(1, 1)
	}
	local t_8 = {
		ListWrapper = reactModule.createElement("Frame", {
			Name = "FriendsChatConversationListWrapper",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var49
		}, { List = var79 })
	}
	
	if var61 ~= nil then
		createElement_3 = reactModule.createElement
		local var88 = view
		local t_9 = {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_10 = {}
		local createElement_4 = reactModule.createElement
		local var91 = text
		local t_11 = {
			tag = "size-full-0 auto-y text-wrap text-body-medium text-align-x-center content-default",
			Text = var61
		}
		local transparency = var32.Color.Content.Default.Transparency
		t_11.textStyle = {
			Color3 = var32.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p27) --[[ line: 117 ]]
				-- upvalues: transparency (ref)
				return transparency + p27 * (1 - transparency)
			end) else transparency
		}
		t_10.Message = createElement_4(var91, t_11)
		t_10.Retry = var54_1 and reactModule.createElement(iconButton, {
			icon = iconName.ArrowSpinClockwise,
			onActivated = var52.retryInitialFetch,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		}) or nil
		createElement_3 = createElement_3(var88, t_9, t_10) or nil
	end
	t_8.Status = createElement_3
	t_6.ListContent = createElement_2(var85, t_7, t_8)
	t_4.ListArea = createElement_1(view, t_5, t_6)
	
	return createElement(var80, t_3, t_4)
end)