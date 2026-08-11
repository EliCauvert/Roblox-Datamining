local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local configModule = require(expChat.Config)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.ExpChatShared)
local UIBloxModule = require(parent.UIBlox)
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local fFlagExpChatFocusChannelBarSupportModule = require(expChat.Flags.FFlagExpChatFocusChannelBarSupport)
local fFlagExpChatChannelBarDropdownZIndexFixModule = require(expChat.Flags.FFlagExpChatChannelBarDropdownZIndexFix)
local fFlagExpChatEnableTabsImpressionAnalyticsModule = require(expChat.Flags.FFlagExpChatEnableTabsImpressionAnalytics)
local var11 = require(expChat.Stores.GetFocusNavigationStore)(false)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local fFlagExpChatFixChannelBarInitialWidthModule = require(expChat.Flags.FFlagExpChatFixChannelBarInitialWidth)
local getChatLayoutStoreModule = require(expChat.Stores.GetChatLayoutStore)
local channelTabModule = require(script.Parent.Parent.ChannelTab)
local cycleDown = images["icons/navigation/cycleDown"]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(100, 100, 100)

local function _(value) --[[ line: 76 | named "countAllChannelTabs" ]]
	local var18 = 0
	
	for i in pairs(value) do
		var18 += 1
	end
	return var18
end

local function setTransparency(value, p0) --[[ line: 84 ]]
	return p0:map(function(p1) --[[ line: 85 ]]
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p1 * (1 - value)
	end)
end

return function(p2) --[[ line: 90 | named "ChannelBar" ]]
	-- upvalues: configModule (ref), reactModule (ref), fFlagExpChatFixChannelBarInitialWidthModule (ref), signalsReactModule (ref), getChatLayoutStoreModule (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), var11 (ref), reactFocusNavigationModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatEnableFriendsTab (ref), channelTabModule (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), setTransparency (ref), textChatService (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatChannelBarDropdownZIndexFixModule (ref), color_1 (ref), imageSetLabel (ref), cycleDown (ref), color (ref)
	local var19 = 0
	
	for i in pairs(p2.allChannelTabs) do
		var19 += 1
	end
	local var20 = configModule.ChatWindowSize.Y.Scale * p2.chatWindowSettings.HeightScale * configModule.ChatWindowMaxWidth
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25 = if fFlagExpChatFixChannelBarInitialWidthModule then signalsReactModule.useSignalState(getChatLayoutStoreModule(false).getChatWindowWidth) else nil
	local var26, var27 = reactModule.useState(1024)
	local var28 = nil
	local var29 = nil
	
	if fFlagExpChatEnableTabsImpressionAnalyticsModule then
		local var30, var31 = reactModule.useState(false)
		var28 = var30
		var29 = var31
	end
	local var32 = if fFlagExpChatFocusChannelBarSupportModule then signalsReactModule.useSignalState(var11.getChatInputBarFocused) else nil
	local var33 = if fFlagExpChatFocusChannelBarSupportModule then reactModule.useRef(nil) else nil
	local var34 = if fFlagExpChatFocusChannelBarSupportModule then reactFocusNavigationModule.useFocusGuiObject() else nil
	local var35 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.Invisible) else nil
	local var36 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var37 = if fFlagExpChatFixChannelBarInitialWidthModule then var25 or var26 else var26
	local var38 = var37 < var19 * configModule.ChannelTabsSettings.MinTabWidth
	local var39 = if not var38 then var19 else math.floor((var37 - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)
	local var40 = (var37 - (if var38 then configModule.ChannelTabsSettings.DropdownIconContainerWidth else 0)) / var39
	local var41 = (var19 - var39) * 40
	local var42 = reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: p2 (ref), var39 (ref)
		for i, v in pairs(p2.allChannelTabs) do
			if var39 < v.TabIndex and v.HasUnreadMessages then
				return true
			end
		end
		return false
	end, if fFlagExpChatEnableFriendsTab then { var39, p2.allChannelTabs } else nil)
	local t = {
		["$layout"] = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal
		})
	}
	local t_1 = {
		["$layout"] = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	
	for i_1, v in pairs(p2.allChannelTabs) do
		local var82
		local var79 = v.TabIndex <= var39
		local var80 = p2.allTextChannels[i_1]
		local type = v.Type
		local createElement = reactModule.createElement
		local t_2 = {
			channelTabsSettings = p2.channelTabsSettings,
			channelName = i_1,
			textChannel = var80,
			tabType = type,
			hasUnreadMessages = v.HasUnreadMessages
		}
		
		if v.TabIndex >= var39 then
			var82 = var38 and v.TabIndex < var19
		end
		t_2.isDividerVisible = var82
		t_2.isTabCollapsed = not var79
		t_2.isTabSelected = p2.selectedTabName and p2.selectedTabName == i_1
		t_2.tabIndex = if fFlagExpChatEnableTabsImpressionAnalyticsModule then v.TabIndex else nil
		t_2.isTabVisibleToUser = if fFlagExpChatEnableTabsImpressionAnalyticsModule then var79 or var23 else nil
		t_2.isLayoutReady = if fFlagExpChatEnableTabsImpressionAnalyticsModule then var28 else nil
		
		function t_2.onTabSelected() --[[ line: 172 ]]
			-- upvalues: expChatPerfTracker (copy), i_1 (ref), fFlagExpChatPerfTrackerTabName (copy), var79 (ref), var32 (ref), var33 (ref), var34 (ref), p2 (ref), var80 (ref), type (ref), var24 (ref)
			expChatPerfTracker.cancelAll()
			expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = i_1 }, if fFlagExpChatPerfTrackerTabName then { tabName = i_1 } else nil)
			
			if not var79 and var32 and var33.current then
				var34(var33.current)
			end
			p2.onTabSelected(var80, not var79, i_1, type)
			var24(false)
		end
		
		function t_2.setTransparency(value) --[[ line: 184 ]]
			-- upvalues: setTransparency (copy), p2 (ref)
			return setTransparency(value, p2.transparencyValue)
		end
		
		createElement = createElement(channelTabModule, t_2)
		
		if var79 then
			t[v.TabIndex] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var40, 1, 0),
				LayoutOrder = v.TabIndex
			}, { ChannelTab = createElement })
		else
			local var83 = v.TabIndex - var39
			t_1[var83] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = var83
			}, { ChannelTab = createElement })
		end
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local channelTabsSettings = p2.channelTabsSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundColor3
	local createElement = reactModule.createElement
	local var46 = "Frame"
	local t_2 = {
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p2.visible,
		BorderSizePixel = 0,
		ZIndex = if fFlagExpChatChannelBarDropdownZIndexFixModule then 3 else nil,
		[reactModule.Event.MouseEnter] = p2.onHovered,
		[reactModule.Event.MouseLeave] = p2.onUnhovered,
		[reactModule.Change.AbsoluteSize] = function(p3) --[[ line: 222 ]]
			-- upvalues: var27 (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (copy), var29 (write), channelTabsConfiguration (ref)
			var27(p3.AbsoluteSize.X)
			
			if fFlagExpChatEnableTabsImpressionAnalyticsModule then
				var29(true)
			end
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsoluteSize(p3.AbsoluteSize)
			end
		end,
		[reactModule.Change.AbsolutePosition] = function(p4) --[[ line: 231 ]]
			-- upvalues: channelTabsConfiguration (ref)
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsolutePosition(p4.AbsolutePosition)
			end
		end
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local var49 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_5 = {
		ContentContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			ClipsDescendants = if fFlagExpChatFixChannelBarInitialWidthModule then true else nil
		}, t),
		TopCorner = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
			BorderSizePixel = 0,
			ImageColor3 = backgroundColor3,
			ImageTransparency = p2.transparencyValue:map(function(p5) --[[ line: 85 ]]
				-- upvalues: backgroundTransparency (ref)
				return if backgroundTransparency == nil then 1 else backgroundTransparency + p5 * (1 - backgroundTransparency)
			end),
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32),
			Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil,
			SelectionImageObject = var35,
			ref = if fFlagExpChatFocusChannelBarSupportModule then p2.topBorderRef else nil
		})
	}
	local createElement_2 = reactModule.createElement
	local var52 = "Frame"
	local t_6 = {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1),
		BackgroundColor3 = configModule.ChannelTabsSettings.BorderColor3
	}
	local borderTransparency = configModule.ChannelTabsSettings.BorderTransparency
	t_6.BackgroundTransparency = p2.transparencyValue:map(function(p6) --[[ line: 85 ]]
		-- upvalues: borderTransparency (ref)
		return if borderTransparency == nil then 1 else borderTransparency + p6 * (1 - borderTransparency)
	end)
	t_5.BottomBorder = createElement_2(var52, t_6)
	t_5.Background = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
		Position = UDim2.new(0, 0, 0, 8),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = p2.transparencyValue:map(function(p7) --[[ line: 85 ]]
			-- upvalues: backgroundTransparency (ref)
			return if backgroundTransparency == nil then 1 else backgroundTransparency + p7 * (1 - backgroundTransparency)
		end)
	})
	t_3.HorizontalBar = createElement_1(var49, t_4, t_5)
	local var54 = var38
	
	if var54 then
		var54 = reactModule.createElement
		local var55 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 8),
			Size = UDim2.new(0, configModule.ChannelTabsSettings.DropdownIconContainerWidth, 1, -9),
			BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		}
		local t_8 = {}
		local createElement_3 = reactModule.createElement
		local var58 = "TextButton"
		local t_9 = {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -configModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
			Size = UDim2.new(0, 27, 0, 27)
		}
		local var60 = if var21 then 0.3 else 1
		t_9.BackgroundTransparency = p2.transparencyValue:map(function(p8) --[[ line: 85 ]]
			-- upvalues: var60 (ref)
			return if var60 == nil then 1 else var60 + p8 * (1 - var60)
		end)
		t_9.BackgroundColor3 = color_1
		t_9.Text = ""
		t_9.BorderSizePixel = 0
		t_9.Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil
		t_9.SelectionImageObject = var36
		t_9.ref = if fFlagExpChatFocusChannelBarSupportModule then var33 else nil
		
		t_9[reactModule.Event.MouseEnter] = function() --[[ line: 308 ]]
			-- upvalues: var22 (ref)
			var22(true)
		end
		
		t_9[reactModule.Event.MouseLeave] = function() --[[ line: 311 ]]
			-- upvalues: var22 (ref)
			var22(false)
		end
		
		t_9[reactModule.Event.Activated] = function() --[[ line: 314 ]]
			-- upvalues: var24 (ref), var23 (ref)
			var24(not var23)
		end
		
		local t_10 = {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 27) })
		}
		local createElement_4 = reactModule.createElement
		local var62 = imageSetLabel
		local t_11 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.6, 0.6),
			Image = cycleDown,
			ImageColor3 = color
		}
		local var64 = 0
		t_11.ImageTransparency = p2.transparencyValue:map(function(p9) --[[ line: 85 ]]
			-- upvalues: var64 (ref)
			return if var64 == nil then 1 else var64 + p9 * (1 - var64)
		end)
		t_11.ScaleType = Enum.ScaleType.Stretch
		t_10.DropdownIconImage = createElement_4(var62, t_11)
		t_8.TextButton = createElement_3(var58, t_9, t_10)
		local var65 = var42
		
		if var65 then
			var65 = reactModule.createElement
			local var66 = "Frame"
			local t_12 = {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3
			}
			local var68 = 0
			t_12.BackgroundTransparency = p2.transparencyValue:map(function(p10) --[[ line: 85 ]]
				-- upvalues: var68 (ref)
				return if var68 == nil then 1 else var68 + p10 * (1 - var68)
			end)
			var65 = var65(var66, t_12, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		t_8.UnreadDot = var65
		var54 = var54(var55, t_7, t_8)
	end
	t_3.DropdownButton = var54
	local var69 = var38
	
	if var69 then
		var69 = reactModule.createElement
		local var70 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, var41),
			Visible = var23
		}
		local t_8 = {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, var20) })
		}
		local createElement_3 = reactModule.createElement
		local var73 = "UIStroke"
		local t_9 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChannelTabsSettings.BorderColor3
		}
		local borderTransparency_1 = configModule.ChannelTabsSettings.BorderTransparency
		t_9.Transparency = p2.transparencyValue:map(function(p11) --[[ line: 85 ]]
			-- upvalues: borderTransparency_1 (ref)
			return if borderTransparency_1 == nil then 1 else borderTransparency_1 + p11 * (1 - borderTransparency_1)
		end)
		t_8.Border = createElement_3(var73, t_9)
		local createElement_4 = reactModule.createElement
		local var75 = "ScrollingFrame"
		local t_10 = {
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 150, 0, var41)
		}
		local var77 = 0
		t_10.BackgroundTransparency = p2.transparencyValue:map(function(p12) --[[ line: 85 ]]
			-- upvalues: var77 (ref)
			return if var77 == nil then 1 else var77 + p12 * (1 - var77)
		end)
		local var78 = 0
		t_10.ScrollBarImageTransparency = p2.transparencyValue:map(function(p13) --[[ line: 85 ]]
			-- upvalues: var78 (ref)
			return if var78 == nil then 1 else var78 + p13 * (1 - var78)
		end)
		t_10.ScrollingDirection = Enum.ScrollingDirection.Y
		t_10.ElasticBehavior = Enum.ElasticBehavior.Always
		t_10.Selectable = if fFlagExpChatFocusChannelBarSupportModule then false else nil
		t_8.ScrollView = createElement_4(var75, t_10, t_1)
		var69 = var69(var70, t_7, t_8)
	end
	t_3.DropdownMenu = var69
	
	return createElement(var46, t_2, t_3)
end