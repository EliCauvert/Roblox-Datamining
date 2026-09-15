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
	-- upvalues: useTokens (ref), fFlagFriendsChatScaleConversationRowHeightModule (ref), useTextSizeOffset (ref), useChatPlatformModule (ref), useChatWindowSettingsModule (ref), reactModule (ref), useLocalization (ref), t_1 (ref), useInterpolatedClientSettingsModule (ref), reactIsModule (ref), mergeTransparency (ref), getConversationRowHeightModule (ref), useChatInputBarSettingsModule (ref), layoutConstantsModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), useFriendsChatLandingTelemetryModule (ref), textChatService (ref), var1 (ref), reactOtterModule (ref), var2 (ref), t (ref), conversationRow (ref), promiseModule (ref), fFlagAppChatUseUltimateListConversationListModule (ref), conversationListUltimate (ref), bidirectionalFlatList (ref), friendsChatConversationListScrollbarThickness (ref), friendsChatConversationListWindowSize (ref), friendsChatConversationListInitialNumToRender (ref), friendsChatConversationListPaginationThresholdRows (ref), friendsChatConversationListAutoscrollToTopThreshold (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref), iconButton (ref), inputSize (ref), buttonVariant (ref)
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
	local var11
	local textTransparency = p3.textTransparency or reactModule.createBinding(0)
	local var12 = mergeTransparency(var5.Color.Content.Default.Transparency, { textTransparency, var4 })
	local var13 = mergeTransparency(var5.Color.Content.Emphasis.Transparency, { textTransparency, var4 })
	local var14 = mergeTransparency(var5.Color.Stroke.Default.Transparency, { var4 })
	local size1200 = var5.Size.Size_1200
	local var15 = getConversationRowHeightModule(var5.Size.Size_1400, var6 or 0, fFlagFriendsChatScaleConversationRowHeightModule)
	local var16 = useChatInputBarSettingsModule()
	local var17 = layoutConstantsModule.InputBarTopPadding + layoutConstantsModule.InputBarBottomPadding + layoutConstantsModule.InputBarTextVerticalPadding + ((if p3.isSpatialUIEnabled and var16 and var16.SpatialPanelTextSize then var16.SpatialPanelTextSize elseif var16 then var16.TextSize else var5.Typography.CaptionMedium.FontSize) or var5.Typography.CaptionMedium.FontSize)
	local var18, var19 = reactModule.useState("")
	local var20 = reactModule.useRef(nil)
	local var21 = p3.visible ~= false
	local var22 = useConversationList(var21)
	local var23 = useConversationListPaginationModule(var21, var22.listStatus)
	local listStatus = var22.listStatus
	local items = var22.items
	local var24 = reactModule.useMemo(function()
		-- upvalues: var18 (ref), items (ref), getConversationTitle (copy)
		local lowerText = string.lower(var18 or "")
		local t = {}
		
		for i, v in items do
			if (lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var18 })
	local var25 = #items == 0
	local var26 = listStatus.isFetchingConversations == true and var25
	local var27 = listStatus.error ~= nil
	local var28 = var18 ~= ""
	local var29 = useFriendsChatLandingTelemetryModule({
		conversations = items,
		displayedConversations = var24,
		isFiltered = var28
	})
	local var30 = var27 and var25
	local t_2 = {
		searchPlaceholder = var8.SearchPlaceholder,
		loadingConversations = var8.Loading,
		loadConversationsError = var8.SomethingWentWrong,
		noLoadedConversationsFound = var8.NoChatFound,
		noFriends = var8.NoFriends
	}
	local var31 = if var26 then t_2.loadingConversations elseif var30 then t_2.loadConversationsError elseif #var24 == 0 and (listStatus.isFetchingConversations ~= true and (if var25 then if listStatus.hasFetchedInitialPage ~= true then var30 else true else not var25)) then if var25 then t_2.noFriends else t_2.noLoadedConversationsFound else nil
	local var32 = reactModule.useCallback(function(p4)
		-- upvalues: p3 (ref)
		if p3.onConversationActivated == nil or p4 == nil or p4.id == nil then
			return
		end
		p3.onConversationActivated(p4.id)
	end, { p3.onConversationActivated })
	local var33 = reactModule.useCallback(function(p4)
		-- upvalues: textChatService (copy), p3 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p3.onAbsoluteSizeChanged then
			p3.onAbsoluteSizeChanged(p4, chatWindowConfiguration)
		end
	end, { p3.onAbsoluteSizeChanged })
	local var34 = reactModule.useCallback(function(p4)
		-- upvalues: textChatService (copy), p3 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p3.onAbsolutePositionChanged then
			p3.onAbsolutePositionChanged(p4, chatWindowConfiguration)
		end
	end, { p3.onAbsolutePositionChanged })
	local var35 = reactModule.useCallback(function()
		-- upvalues: var29 (ref), getTransparencyStore (ref)
		var29.fireSearchActivatedEvent()
		getTransparencyStore(false).setTextboxFocus()
	end, { getTransparencyStore, var29.fireSearchActivatedEvent })
	local var36 = reactModule.useCallback(function()
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
	local var37 = nil
	local var38 = nil
	
	if var1 then
		local var39 = reactModule.useRef(nil)
		local _ = nil
		local var40, var41 = reactOtterModule.useAnimatedBinding(1)
		var37 = var40
		var11 = var41
		var38 = reactModule.useCallback(function()
			-- upvalues: var39 (ref), var11 (write), reactOtterModule (copy), var2 (copy), t (copy)
			if var39.current ~= nil then
				pcall(task.cancel, var39.current)
				var39.current = nil
			end
			var11(reactOtterModule.instant(0))
			var39.current = task.delay(var2, function()
				-- upvalues: var39 (copy), var11 (copy), reactOtterModule (copy), t (copy)
				var39.current = nil
				var11(reactOtterModule.spring(1, t))
			end)
		end, { var11 })
		reactModule.useEffect(function()
			-- upvalues: var39 (ref)
			return function()
				-- upvalues: var39 (copy)
				if var39.current ~= nil then
					pcall(task.cancel, var39.current)
					var39.current = nil
				end
			end
		end, {})
	end
	local var42
	local var43 = reactModule.useCallback(function(_)
		-- upvalues: var1 (copy), var38 (write), getTransparencyStore (ref)
		if var1 then
			var38()
		end
		getTransparencyStore(false).resetAllTransparency()
	end, { getTransparencyStore, if var1 then var38 else nil })
	var11 = reactModule.useCallback(function(p4)
		-- upvalues: reactModule (copy), conversationRow (copy), var15 (ref), var32 (ref), var29 (ref), p3 (ref)
		return reactModule.createElement(conversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = tostring(p4.item.id),
			entryHeight = var15,
			onActivated = var32,
			fireClickEvent = var29.fireConversationClickedEvent,
			fireImpressionEvent = var29.fireConversationImpressionEvent,
			localUserId = p3.localUserId
		})
	end, {
		var15,
		var29.fireConversationClickedEvent,
		var29.fireConversationImpressionEvent,
		var32,
		p3.localUserId
	})
	local var44 = reactModule.useCallback(function(_, p4)
		-- upvalues: var15 (ref)
		return { length = var15, offset = var15 * (p4 - 1), index = p4 }
	end, { var15 })
	local var45 = reactModule.useCallback(function(_, p4)
		-- upvalues: var20 (ref), var23 (ref)
		local current = var20.current
		
		if current ~= nil and p4 <= current.AbsoluteSize.Y then
			var23.loadNext()
		end
	end, { var23.loadNext })
	local var46 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), promiseModule (copy)
		var23.loadNext()
		
		return promiseModule.resolve()
	end, { var23.loadNext })
	local var47 = reactModule.useCallback(function(p4)
		-- upvalues: var19 (ref)
		var19(p4.Text)
	end, {})
	local var48 = reactModule.useCallback(function()
		-- upvalues: var19 (ref)
		var19("")
	end, {})
	
	if fFlagAppChatUseUltimateListConversationListModule then
		var42 = reactModule.createElement
		var42 = var42(conversationListUltimate, {
			isWideMode = false,
			showScrollbarOnScroll = true,
			showHeaderEntries = false,
			shouldLogHeaderEntryExposures = false,
			Size = UDim2.fromScale(1, 1),
			entryHeight = var15,
			itemList = var24,
			loadNext = var23.loadNext,
			isLoadingNext = listStatus.isFetchingNextPage == true,
			oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
			onScrollUpdate = var43,
			rowProps = { showBackground = false, localUserId = p3.localUserId },
			localUserId = p3.localUserId,
			onActivated = var32,
			fireConversationClickedEvent = var29.fireConversationClickedEvent,
			fireConversationImpressionEvent = var29.fireConversationImpressionEvent
		})
	else
		var42 = reactModule.createElement(bidirectionalFlatList, {
			enableAutoscrollToTop = true,
			data = var24,
			renderItem = var11,
			getItemLayout = var44,
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
				ScrollBarImageTransparency = if var1 then var37 else nil,
				ScrollBarThickness = friendsChatConversationListScrollbarThickness
			},
			contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
			windowSize = friendsChatConversationListWindowSize,
			initialNumToRender = friendsChatConversationListInitialNumToRender,
			onScroll = var43,
			onContentSizeChange = var45,
			onEndReached = var46,
			onEndReachedThreshold = var15 * friendsChatConversationListPaginationThresholdRows,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasSize = UDim2.fromScale(0, 0),
			autoscrollToTopThreshold = friendsChatConversationListAutoscrollToTopThreshold
		})
	end
	local createElement_3
	local createElement = reactModule.createElement
	local var49 = "Frame"
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
		Size = p3.size or UDim2.new(1, 0, 1, layoutConstantsModule.PanelTopSpacerHeight + var17 + layoutConstantsModule.PanelBottomCornerRadius),
		Visible = var21,
		[reactModule.Change.AbsoluteSize] = var33,
		[reactModule.Change.AbsolutePosition] = var34,
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
						Transparency = var14,
						Thickness = var5.Stroke.Standard
					}
				}, {
					SearchIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = iconName.MagnifyingGlass,
						size = iconSize.Small,
						style = {
							Color3 = var5.Color.Content.Default.Color3,
							Transparency = var12
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
						Text = var18,
						TextColor3 = var5.Color.Content.Emphasis.Color3,
						TextSize = var5.Typography.BodySmall.FontSize,
						TextTransparency = var13,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[reactModule.Event.Focused] = var35,
						[reactModule.Event.FocusLost] = var36,
						[reactModule.Change.Text] = var47
					}, {
						Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if var28 then reactModule.createElement(view, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = var48
					}, {
						Icon = reactModule.createElement(icon, {
							name = iconName.CircleX,
							size = iconSize.Small,
							style = {
								Color3 = var5.Color.Content.Default.Color3,
								Transparency = var12
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
	local var50 = "CanvasGroup"
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
			ref = var20
		}, { List = var42 })
	}
	
	if var31 ~= nil then
		createElement_3 = reactModule.createElement
		local var51 = view
		local t_9 = {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_10 = {}
		local createElement_4 = reactModule.createElement
		local var52 = text
		local t_11 = {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
			Text = var31
		}
		local transparency = var5.Color.Content.Default.Transparency
		t_11.textStyle = {
			Color3 = var5.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p4)
				-- upvalues: transparency (ref)
				return transparency + p4 * (1 - transparency)
			end) else transparency
		}
		t_10.Message = createElement_4(var52, t_11)
		t_10.Retry = var30 and reactModule.createElement(iconButton, {
			icon = iconName.ArrowSpinClockwise,
			onActivated = var23.retryInitialFetch,
			size = inputSize.Small,
			variant = buttonVariant.Standard
		}) or nil
		createElement_3 = createElement_3(var51, t_9, t_10) or nil
	end
	t_8.Status = createElement_3
	t_6.ListContent = createElement_2(var50, t_7, t_8)
	t_4.ListArea = createElement_1(view, t_5, t_6)
	
	return createElement(var49, t_3, t_4)
end)