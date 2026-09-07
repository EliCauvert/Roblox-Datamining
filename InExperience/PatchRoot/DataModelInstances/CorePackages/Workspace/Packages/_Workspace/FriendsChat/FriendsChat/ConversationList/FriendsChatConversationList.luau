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
	-- upvalues: useTokens (ref), useChatPlatformModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useLocalization (ref), t_1 (ref), useInterpolatedClientSettingsModule (ref), reactIsModule (ref), mergeTransparency (ref), useChatInputBarSettingsModule (ref), layoutConstantsModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), useFriendsChatLandingTelemetryModule (ref), textChatService (ref), var1 (ref), reactOtterModule (ref), var2 (ref), t (ref), conversationRow (ref), promiseModule (ref), fFlagAppChatUseUltimateListConversationListModule (ref), conversationListUltimate (ref), bidirectionalFlatList (ref), friendsChatConversationListScrollbarThickness (ref), friendsChatConversationListWindowSize (ref), friendsChatConversationListInitialNumToRender (ref), friendsChatConversationListPaginationThresholdRows (ref), friendsChatConversationListAutoscrollToTopThreshold (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
	local var4
	local var5 = useTokens()
	local getTransparencyStore = useChatPlatformModule().getTransparencyStore
	local var6 = useChatWindowSettingsModule()
	local chatWindowSettings = p3.chatWindowSettings or reactModule.useMemo(function()
		-- upvalues: var6 (ref)
		return {
			BackgroundColor3 = var6.ChatWindowBackgroundColor3,
			BackgroundTransparency = var6.ChatWindowBackgroundTransparency
		}
	end, { var6 })
	local var7 = useLocalization(t_1)
	local var8 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local backgroundTransparency = var8.BackgroundTransparency
	local backgroundColor3 = var8.BackgroundColor3 or (var8.BackgroundColor or chatWindowSettings.BackgroundColor3)
	local transparencyValue = p3.transparencyValue or var6.ChatWindowBackgroundTransparency
	
	if p3.transparencyValue == nil then
		var4 = 0
	elseif reactIsModule.isBinding(transparencyValue) then
		local var9 = 0
		var4 = transparencyValue:map(function(p4)
			-- upvalues: var9 (ref)
			return var9 + p4 * (1 - var9)
		end)
	else
		var4 = transparencyValue
	end
	local var10
	local textTransparency = p3.textTransparency or reactModule.createBinding(0)
	local var11 = mergeTransparency(var5.Color.Content.Default.Transparency, { textTransparency, var4 })
	local var12 = mergeTransparency(var5.Color.Content.Emphasis.Transparency, { textTransparency, var4 })
	local var13 = mergeTransparency(var5.Color.Stroke.Default.Transparency, { var4 })
	local size1200 = var5.Size.Size_1200
	local size1400 = var5.Size.Size_1400
	local var14 = useChatInputBarSettingsModule()
	local var15 = layoutConstantsModule.InputBarTopPadding + layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.InputBarTextVerticalPadding + ((if p3.isSpatialUIEnabled and var14 and var14.SpatialPanelTextSize then var14.SpatialPanelTextSize elseif var14 then var14.TextSize else var5.Typography.CaptionMedium.FontSize) or var5.Typography.CaptionMedium.FontSize)
	local var16, var17 = reactModule.useState("")
	local var18 = reactModule.useRef(nil)
	local var19 = p3.visible ~= false
	local var20 = useConversationList(var19)
	local var21 = useConversationListPaginationModule(var19, var20.listStatus)
	local listStatus = var20.listStatus
	local items = var20.items
	local var22 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), items (ref), getConversationTitle (copy)
		local lowerText = string.lower(var16 or "")
		local t = {}
		
		for i, v in items do
			if (lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var16 })
	local var23 = #items == 0
	local var24 = listStatus.isFetchingConversations == true and var23
	local var25 = listStatus.error ~= nil
	local var26 = var16 ~= ""
	local var27 = useFriendsChatLandingTelemetryModule({
		conversations = items,
		displayedConversations = var22,
		isFiltered = var26
	})
	local var28 = var25 and var23
	local t_2 = {
		searchPlaceholder = var7.SearchPlaceholder,
		loadingConversations = var7.Loading,
		loadConversationsError = var7.SomethingWentWrong,
		noLoadedConversationsFound = var7.NoChatFound,
		noFriends = var7.NoFriends
	}
	local var29 = if var24 then t_2.loadingConversations elseif var28 then t_2.loadConversationsError elseif #var22 == 0 and (listStatus.isFetchingConversations ~= true and (if var23 then if listStatus.hasFetchedInitialPage ~= true then var28 else true else not var23)) then if var23 then t_2.noFriends else t_2.noLoadedConversationsFound else nil
	local var30 = reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref)
		if p3.onConversationActivated == nil or p4 == nil or p4.id == nil then
			return
		end
		p3.onConversationActivated(p4.id)
	end, { p3.onConversationActivated })
	local var31 = reactModule.useCallback(function(p4)
		-- upvalues: textChatService (copy), p3 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p3.onAbsoluteSizeChanged then
			p3.onAbsoluteSizeChanged(p4, chatWindowConfiguration)
		end
	end, { p3.onAbsoluteSizeChanged })
	local var32 = reactModule.useCallback(function(p4)
		-- upvalues: textChatService (copy), p3 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p3.onAbsolutePositionChanged then
			p3.onAbsolutePositionChanged(p4, chatWindowConfiguration)
		end
	end, { p3.onAbsolutePositionChanged })
	local var33 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), getTransparencyStore (ref)
		var27.fireSearchActivatedEvent()
		getTransparencyStore(false).setTextboxFocus()
	end, { getTransparencyStore, var27.fireSearchActivatedEvent })
	local var34 = reactModule.useCallback(function()
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
	local var35 = nil
	local var36 = nil
	
	if var1 then
		local var37 = reactModule.useRef(nil)
		local _ = nil
		local var38, var39 = reactOtterModule.useAnimatedBinding(1)
		var35 = var38
		var10 = var39
		var36 = reactModule.useCallback(function()
			-- upvalues: var37 (ref), var10 (write), reactOtterModule (copy), var2 (copy), t (copy)
			if var37.current ~= nil then
				pcall(task.cancel, var37.current)
				var37.current = nil
			end
			var10(reactOtterModule.instant(0))
			var37.current = task.delay(var2, function()
				-- upvalues: var37 (copy), var10 (copy), reactOtterModule (copy), t (copy)
				var37.current = nil
				var10(reactOtterModule.spring(1, t))
			end)
		end, { var10 })
		reactModule.useEffect(function()
			-- upvalues: var37 (ref)
			return function()
				-- upvalues: var37 (copy)
				if var37.current ~= nil then
					pcall(task.cancel, var37.current)
					var37.current = nil
				end
			end
		end, {})
	end
	local var40
	local var41 = reactModule.useCallback(function(_)
		-- upvalues: var1 (copy), var36 (write), getTransparencyStore (ref)
		if var1 then
			var36()
		end
		getTransparencyStore(false).resetAllTransparency()
	end, { getTransparencyStore, if var1 then var36 else nil })
	var10 = reactModule.useCallback(function(p4)
		-- upvalues: reactModule (copy), conversationRow (copy), size1400 (ref), var30 (ref), var27 (ref), p3 (ref)
		return reactModule.createElement(conversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = tostring(p4.item.id),
			entryHeight = size1400,
			onActivated = var30,
			fireClickEvent = var27.fireConversationClickedEvent,
			fireImpressionEvent = var27.fireConversationImpressionEvent,
			localUserId = p3.localUserId
		})
	end, {
		size1400,
		var27.fireConversationClickedEvent,
		var27.fireConversationImpressionEvent,
		var30,
		p3.localUserId
	})
	local var42 = reactModule.useCallback(function(_, p4)
		-- upvalues: size1400 (ref)
		return {
			length = size1400,
			offset = size1400 * (p4 - 1),
			index = p4
		}
	end, { size1400 })
	local var43 = reactModule.useCallback(function(_, p4)
		-- upvalues: var18 (ref), var21 (ref)
		local current = var18.current
		
		if current ~= nil and p4 <= current.AbsoluteSize.Y then
			var21.loadNext()
		end
	end, { var21.loadNext })
	local var44 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), promiseModule (copy)
		var21.loadNext()
		
		return promiseModule.resolve()
	end, { var21.loadNext })
	local var45 = reactModule.useCallback(function(p4)
		-- upvalues: var17 (ref)
		var17(p4.Text)
	end, {})
	local var46 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17("")
	end, {})
	
	if fFlagAppChatUseUltimateListConversationListModule then
		var40 = reactModule.createElement
		var40 = var40(conversationListUltimate, {
			isWideMode = false,
			showScrollbarOnScroll = true,
			showHeaderEntries = false,
			shouldLogHeaderEntryExposures = false,
			Size = UDim2.fromScale(1, 1),
			entryHeight = size1400,
			itemList = var22,
			loadNext = var21.loadNext,
			isLoadingNext = listStatus.isFetchingNextPage == true,
			oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
			onScrollUpdate = var41,
			rowProps = { showBackground = false, localUserId = p3.localUserId },
			localUserId = p3.localUserId,
			onActivated = var30,
			fireConversationClickedEvent = var27.fireConversationClickedEvent,
			fireConversationImpressionEvent = var27.fireConversationImpressionEvent
		})
	else
		var40 = reactModule.createElement(bidirectionalFlatList, {
			enableAutoscrollToTop = true,
			data = var22,
			renderItem = var10,
			getItemLayout = var42,
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
				ScrollBarImageTransparency = if var1 then var35 else nil,
				ScrollBarThickness = friendsChatConversationListScrollbarThickness
			},
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			windowSize = friendsChatConversationListWindowSize,
			initialNumToRender = friendsChatConversationListInitialNumToRender,
			onScroll = var41,
			onContentSizeChange = var43,
			onEndReached = var44,
			onEndReachedThreshold = size1400 * friendsChatConversationListPaginationThresholdRows,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasSize = UDim2.fromScale(0, 0),
			autoscrollToTopThreshold = friendsChatConversationListAutoscrollToTopThreshold
		})
	end
	local createElement_3
	local createElement = reactModule.createElement
	local var47 = "Frame"
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
		Size = p3.size or UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight + var15 + layoutConstantsModule.PanelBottomCornerRadius),
		Visible = var19,
		[reactModule.Change.AbsoluteSize] = var31,
		[reactModule.Change.AbsolutePosition] = var32,
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
						Font = var5.Typography.BodySmall.Font,
						LineHeight = var5.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = var5.Color.Content.Muted.Color3,
						PlaceholderText = t_2.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = var16,
						TextColor3 = var5.Color.Content.Emphasis.Color3,
						TextSize = var5.Typography.BodySmall.FontSize,
						TextTransparency = var12,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[reactModule.Event.Focused] = var33,
						[reactModule.Event.FocusLost] = var34,
						[reactModule.Change.Text] = var45
					}, {
						Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if var26 then reactModule.createElement(view, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = var46
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
	local var48 = "CanvasGroup"
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
			ref = var18
		}, { List = var40 })
	}
	
	if var29 ~= nil then
		createElement_3 = reactModule.createElement
		local var49 = view
		local t_9 = {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_10 = {}
		local createElement_4 = reactModule.createElement
		local var50 = text
		local t_11 = {
			tag = "size-full-0 auto-y text-wrap text-body-medium text-align-x-center content-default",
			Text = var29
		}
		local transparency = var5.Color.Content.Default.Transparency
		t_11.textStyle = {
			Color3 = var5.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p4)
				-- upvalues: transparency (ref)
				return transparency + p4 * (1 - transparency)
			end) else transparency
		}
		t_10.Message = createElement_4(var50, t_11)
		t_10.Retry = var28 and reactModule.createElement(iconButton, {
			icon = iconName.ArrowSpinClockwise,
			onActivated = var21.retryInitialFetch,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		}) or nil
		createElement_3 = createElement_3(var49, t_9, t_10) or nil
	end
	t_8.Status = createElement_3
	t_6.ListContent = createElement_2(var48, t_7, t_8)
	t_4.ListArea = createElement_1(view, t_5, t_6)
	
	return createElement(var47, t_3, t_4)
end)