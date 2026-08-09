local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local appChatModule = require(parent.AppChat)
local configModule = require(expChat.Config)
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local expChatConversationListAdapterModule = require(script.Parent.ExpChatConversationListAdapter)
local useConversationListPaginationModule = require(script.Parent.useConversationListPagination)
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
local getConversationTitle = expChatConversationListAdapterModule.getConversationTitle
local shouldBlockConversationAccess = appChatModule.Utils.shouldBlockConversationAccess
local useConversationList = appChatModule.Hooks.useConversationList
local t = {
	SearchPlaceholder = "CommonUI.Controls.Action.Search",
	Retry = "InGame.CommonUI.Button.Retry"
}
local t_1 = {
	BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = configModule.ChatWindowBackgroundTransparency
}

local function _(p0, p1) --[[ line: 60 | named "getColorStyle" ]]
	return { Color3 = p0, Transparency = p1 }
end

local _ = function(p2, p3) --[[ line: 67 | named "getTransparencyOrBindingValue" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p3) then p3:map(function(p4) --[[ line: 69 ]]
		-- upvalues: p2 (ref)
		return p2 + p4 * (1 - p2)
	end) else p3
end

local _ = function(p5, p6) --[[ line: 77 | named "getTextTransparency" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p5) then p5:map(function(p7) --[[ line: 79 ]]
		-- upvalues: p6 (ref)
		return p6 + p7 * (1 - p6)
	end) else p6
end

local _ = function(p8) --[[ line: 87 | named "normalizeSearchText" ]]
	return string.lower(p8 or "")
end

local _ = function(p9, p10) --[[ line: 91 | named "containsSearchText" ]]
	return p10 == "" or string.find(string.lower(p9 or ""), p10, 1, true) ~= nil
end

local _ = function(p11, p12, p13) --[[ line: 98 | named "getLocalizedText" ]]
	return if p11 == nil or p11 == "" or p11 == p12 then p13 else p11
end

return reactModule.memo(function(p14) --[[ line: 106 | named "FriendsChatConversationList" ]]
	-- upvalues: useTokens (ref), t_1 (ref), useLocalization (ref), t (ref), useInterpolatedClientSettingsModule (ref), configModule (ref), reactIsModule (ref), reactModule (ref), useConversationList (ref), useConversationListPaginationModule (ref), getConversationTitle (ref), shouldBlockConversationAccess (ref), textChatService (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), conversationListUltimate (ref), text (ref), button (ref), fillBehavior (ref), inputSize (ref), buttonVariant (ref)
	local var18
	local var12 = useTokens()
	local chatWindowSettings = p14.chatWindowSettings or t_1
	local var14 = useLocalization(t)
	local var15 = useInterpolatedClientSettingsModule(chatWindowSettings)
	local backgroundTransparency = var15.BackgroundTransparency
	local backgroundColor3 = var15.BackgroundColor3 or (var15.BackgroundColor or chatWindowSettings.BackgroundColor3)
	local transparencyValue = p14.transparencyValue or configModule.ChatWindowBackgroundTransparency
	
	if p14.transparencyValue == nil then
		var18 = 0
	elseif reactIsModule.isBinding(transparencyValue) then
		local var19 = 0
		var18 = transparencyValue:map(function(p15) --[[ line: 69 ]]
			-- upvalues: var19 (ref)
			return var19 + p15 * (1 - var19)
		end)
	else
		var18 = transparencyValue
	end
	local createElement_8
	local textTransparency = p14.textTransparency or reactModule.createBinding(0)
	local size1200 = var12.Size.Size_1200
	local size1400 = var12.Size.Size_1400
	local var21, var22 = reactModule.useState("")
	local var23 = p14.visible ~= false
	local var24 = useConversationList(var23)
	local var25 = useConversationListPaginationModule(var23, var24.listStatus)
	local listStatus = var24.listStatus
	local items = var24.items
	local var26 = reactModule.useMemo(function() --[[ line: 130 ]]
		-- upvalues: var21 (ref), items (ref), getConversationTitle (copy), shouldBlockConversationAccess (copy)
		local lowerText = string.lower(var21 or "")
		local t = {}
		
		for i, v in items do
			if not shouldBlockConversationAccess(v) and ((lowerText == "" or string.find(string.lower(getConversationTitle(v) or (v.title or v.titleForViewer) or ""), lowerText, 1, true) ~= nil) or (lowerText == "" or string.find(string.lower(v.previewContent or ""), lowerText, 1, true) ~= nil)) then
				table.insert(t, v)
			end
		end
		return t
	end, { items, var21 })
	local var27 = listStatus.isFetchingConversations == true and #items == 0
	local var28 = var21 ~= ""
	local var29 = listStatus.error ~= nil and #items == 0
	local var30 = #var26 == 0 and (listStatus.isFetchingConversations ~= true and (if #items <= 0 then if listStatus.hasFetchedInitialPage ~= true then var29 else true else true))
	local t_2 = {
		loadingConversations = "Loading conversations...",
		loadConversationsError = "Unable to load conversations.",
		noLoadedConversationsFound = "No loaded conversations found",
		noConversationsYet = "No conversations yet"
	}
	local searchPlaceholder = var14.SearchPlaceholder
	t_2.searchPlaceholder = if searchPlaceholder == nil or searchPlaceholder == "" or searchPlaceholder == t.SearchPlaceholder then "Search" else searchPlaceholder
	searchPlaceholder = var14.Retry
	t_2.retry = if searchPlaceholder == nil or searchPlaceholder == "" or searchPlaceholder == t.Retry then "Retry" else searchPlaceholder
	local var32 = if var27 then t_2.loadingConversations elseif var29 then t_2.loadConversationsError elseif var30 then if var28 then t_2.noLoadedConversationsFound else t_2.noConversationsYet else nil
	searchPlaceholder = reactModule.useCallback(function(p16) --[[ line: 181 ]]
		-- upvalues: p14 (ref)
		if p14.onConversationActivated == nil or p16 == nil or p16.id == nil then
			return
		end
		p14.onConversationActivated(p16.id)
	end, { p14.onConversationActivated })
	local var33 = reactModule.useCallback(function(p17) --[[ line: 189 ]]
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsoluteSizeChanged then
			p14.onAbsoluteSizeChanged(p17, chatWindowConfiguration)
		end
	end, { p14.onAbsoluteSizeChanged })
	local var34 = reactModule.useCallback(function(p18) --[[ line: 196 ]]
		-- upvalues: textChatService (copy), p14 (ref)
		local chatWindowConfiguration = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if chatWindowConfiguration and p14.onAbsolutePositionChanged then
			p14.onAbsolutePositionChanged(p18, chatWindowConfiguration)
		end
	end, { p14.onAbsolutePositionChanged })
	local createElement = reactModule.createElement
	local var35 = "Frame"
	local t_3 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = if reactIsModule.isBinding(transparencyValue) then transparencyValue:map(function(p19) --[[ line: 69 ]]
			-- upvalues: backgroundTransparency (ref)
			return backgroundTransparency + p19 * (1 - backgroundTransparency)
		end) else transparencyValue,
		BorderSizePixel = 0,
		LayoutOrder = p14.LayoutOrder or 1,
		Size = p14.size or UDim2.fromScale(1, 1),
		Visible = var23,
		[reactModule.Change.AbsoluteSize] = var33,
		[reactModule.Change.AbsolutePosition] = var34,
		[reactModule.Event.MouseEnter] = p14.onHovered,
		[reactModule.Event.MouseLeave] = p14.onUnhovered
	}
	local t_4 = {
		uiSizeConstraint = reactModule.createElement("UISizeConstraint", {
			MaxSize = Vector2.new(configModule.ChatWindowMaxWidth, configModule.ChatWindowMaxHeight)
		}),
		layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local createElement_1 = reactModule.createElement
	local t_5 = {
		Name = "SearchContainer",
		tag = "padding-small",
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, size1200)
	}
	local t_6 = {}
	local createElement_2 = reactModule.createElement
	local var40 = "CanvasGroup"
	local t_7 = {
		Name = "SearchContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = var18,
		Position = UDim2.fromOffset(-1, -1),
		Size = UDim2.new(1, 2, 1, 2)
	}
	local t_8 = {}
	local createElement_3 = reactModule.createElement
	local t_9 = {
		Name = "SearchField",
		tag = "row align-y-center gap-small padding-x-medium stroke-standard stroke-default radius-circle",
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(1, 1),
		Size = UDim2.new(1, -2, 0, var12.Size.Size_800)
	}
	local t_10 = {}
	local createElement_4 = reactModule.createElement
	local t_11 = {
		LayoutOrder = 1,
		name = iconName.MagnifyingGlass,
		size = iconSize.Small
	}
	local transparency = var12.Color.Content.Default.Transparency
	t_11.style = {
		Color3 = var12.Color.Content.Default.Color3,
		Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p20) --[[ line: 79 ]]
			-- upvalues: transparency (ref)
			return transparency + p20 * (1 - transparency)
		end) else transparency
	}
	t_10.SearchIcon = createElement_4(icon, t_11)
	local createElement_5 = reactModule.createElement
	local var46 = "TextBox"
	local t_12 = {
		Name = "FriendsChatConversationListSearchBox",
		BackgroundTransparency = 1,
		ClearTextOnFocus = false,
		Font = var12.Typography.BodySmall.Font,
		LineHeight = var12.Typography.BodySmall.LineHeight,
		LayoutOrder = 2,
		PlaceholderColor3 = var12.Color.Content.Muted.Color3,
		PlaceholderText = t_2.searchPlaceholder,
		Size = UDim2.new(0, 0, 1, 0),
		Text = var21,
		TextColor3 = var12.Color.Content.Emphasis.Color3,
		TextSize = var12.Typography.BodySmall.FontSize
	}
	local transparency_1 = var12.Color.Content.Emphasis.Transparency
	t_12.TextTransparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p21) --[[ line: 79 ]]
		-- upvalues: transparency_1 (ref)
		return transparency_1 + p21 * (1 - transparency_1)
	end) else transparency_1
	t_12.TextXAlignment = Enum.TextXAlignment.Left
	t_12.TextYAlignment = Enum.TextYAlignment.Center
	
	t_12[reactModule.Change.Text] = function(p22) --[[ line: 275 ]]
		-- upvalues: var22 (ref)
		var22(p22.Text)
	end
	
	t_10.SearchBox = createElement_5(var46, t_12, {
		Flex = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
	})
	t_8.SearchField = createElement_3(view, t_9, t_10)
	t_6.SearchContent = createElement_2(var40, t_7, t_8)
	t_4.SearchContainer = createElement_1(view, t_5, t_6)
	local createElement_6 = reactModule.createElement
	local t_13 = {
		Name = "ListArea",
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 1, -size1200)
	}
	local t_14 = {}
	local createElement_7 = reactModule.createElement
	local var50 = "CanvasGroup"
	local t_15 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = var18,
		Size = UDim2.fromScale(1, 1)
	}
	local t_16 = {
		List = reactModule.createElement(conversationListUltimate, {
			LayoutOrder = 1,
			isWideMode = false,
			showHeaderEntries = false,
			shouldLogHeaderEntryExposures = false,
			Size = UDim2.fromScale(1, 1),
			entryHeight = size1400,
			itemList = var26,
			loadNext = var25.loadNext,
			isLoadingNext = listStatus.isFetchingNextPage == true,
			oldestConversationIsFetched = if listStatus.oldestConversationIsFetched ~= true then listStatus.isExhausted == true else true,
			rowProps = { showBackground = false, localUserId = p14.localUserId },
			localUserId = p14.localUserId,
			onActivated = searchPlaceholder
		})
	}
	
	if var32 ~= nil then
		createElement_8 = reactModule.createElement
		local var53 = view
		local t_17 = {
			tag = "col align-x-center align-y-center gap-small size-full",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}
		local t_18 = {}
		local createElement_9 = reactModule.createElement
		local var56 = text
		local t_19 = {
			tag = "auto-xy text-body-medium text-align-x-center content-default",
			Text = var32
		}
		local transparency_2 = var12.Color.Content.Default.Transparency
		t_19.textStyle = {
			Color3 = var12.Color.Content.Default.Color3,
			Transparency = if reactIsModule.isBinding(textTransparency) then textTransparency:map(function(p23) --[[ line: 79 ]]
				-- upvalues: transparency_2 (ref)
				return transparency_2 + p23 * (1 - transparency_2)
			end) else transparency_2
		}
		t_18.Message = createElement_9(var56, t_19)
		t_18.Retry = var29 and reactModule.createElement(button, {
			fillBehavior = fillBehavior.Fit,
			onActivated = var25.retryInitialFetch,
			size = inputSize.Small,
			text = t_2.retry,
			variant = buttonVariant.Standard
		}) or nil
		createElement_8 = createElement_8(var53, t_17, t_18) or nil
	end
	t_16.Status = createElement_8
	t_14.ListContent = createElement_7(var50, t_15, t_16)
	t_4.ListArea = createElement_6(view, t_13, t_14)
	
	return createElement(var35, t_3, t_4)
end)