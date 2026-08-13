local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local configModule = require(expChat.Config)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsReactModule = require(parent.SignalsReact)
local expChatSharedModule = require(parent.ExpChatShared)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local analytics = expChatSharedModule.Analytics
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local fFlagExpChatFocusChannelBarSupportModule = require(expChat.Flags.FFlagExpChatFocusChannelBarSupport)
local fFlagExpChatChannelBarDropdownZIndexFixModule = require(expChat.Flags.FFlagExpChatChannelBarDropdownZIndexFix)
local fFlagExpChatEnableTabsImpressionAnalyticsModule = require(expChat.Flags.FFlagExpChatEnableTabsImpressionAnalytics)
local var13 = require(expChat.Stores.GetFocusNavigationStore)(false)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local fFlagExpChatFixChannelBarInitialWidthModule = require(expChat.Flags.FFlagExpChatFixChannelBarInitialWidth)
local fFlagExpChatLogTabClickedModule = require(expChat.Flags.FFlagExpChatLogTabClicked)
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local getChatLayoutStoreModule = require(expChat.Stores.GetChatLayoutStore)
local channelTabModule = require(script.Parent.Parent.ChannelTab)
local var19 = cryoModule.List.join(analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if fFlagGlobalTextChatAddPlaySessionFieldModule then { "addPlaySessionId" } else {})
local cycleDown = images["icons/navigation/cycleDown"]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(100, 100, 100)

local function _(value) --[[ line: 87 | named "countAllChannelTabs" ]]
	local var23 = 0
	
	for i in pairs(value) do
		var23 += 1
	end
	return var23
end

local function setTransparency(value, p0) --[[ line: 95 ]]
	return p0:map(function(p1) --[[ line: 96 ]]
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p1 * (1 - value)
	end)
end

return function(p2) --[[ line: 101 | named "ChannelBar" ]]
	-- upvalues: configModule (ref), reactModule (ref), fFlagExpChatFixChannelBarInitialWidthModule (ref), signalsReactModule (ref), getChatLayoutStoreModule (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), var13 (ref), reactFocusNavigationModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatEnableFriendsTab (ref), channelTabModule (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), fFlagExpChatLogTabClickedModule (ref), analytics (ref), var19 (ref), setTransparency (ref), textChatService (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatChannelBarDropdownZIndexFixModule (ref), color_1 (ref), imageSetLabel (ref), cycleDown (ref), color (ref)
	local var24 = 0
	
	for i in pairs(p2.allChannelTabs) do
		var24 += 1
	end
	local var25 = configModule.ChatWindowSize.Y.Scale * p2.chatWindowSettings.HeightScale * configModule.ChatWindowMaxWidth
	local var26, var27 = reactModule.useState(false)
	local var28, var29 = reactModule.useState(false)
	local var30 = if fFlagExpChatFixChannelBarInitialWidthModule then signalsReactModule.useSignalState(getChatLayoutStoreModule(false).getChatWindowWidth) else nil
	local var31, var32 = reactModule.useState(1024)
	local var33 = nil
	local var34 = nil
	
	if fFlagExpChatEnableTabsImpressionAnalyticsModule then
		local var35, var36 = reactModule.useState(false)
		var33 = var35
		var34 = var36
	end
	local var37 = if fFlagExpChatFocusChannelBarSupportModule then signalsReactModule.useSignalState(var13.getChatInputBarFocused) else nil
	local var38 = if fFlagExpChatFocusChannelBarSupportModule then reactModule.useRef(nil) else nil
	local var39 = if fFlagExpChatFocusChannelBarSupportModule then reactFocusNavigationModule.useFocusGuiObject() else nil
	local var40 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.Invisible) else nil
	local var41 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var42 = if fFlagExpChatFixChannelBarInitialWidthModule then var30 or var31 else var31
	local var43 = var42 < var24 * configModule.ChannelTabsSettings.MinTabWidth
	local var44 = if not var43 then var24 else math.floor((var42 - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)
	local var45 = (var42 - (if var43 then configModule.ChannelTabsSettings.DropdownIconContainerWidth else 0)) / var44
	local var46 = (var24 - var44) * 40
	local var47 = reactModule.useMemo(function() --[[ line: 140 ]]
		-- upvalues: p2 (ref), var44 (ref)
		for i, v in pairs(p2.allChannelTabs) do
			if var44 < v.TabIndex and v.HasUnreadMessages then
				return true
			end
		end
		return false
	end, if fFlagExpChatEnableFriendsTab then { var44, p2.allChannelTabs } else nil)
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
		local var87
		local var84 = v.TabIndex <= var44
		local var85 = p2.allTextChannels[i_1]
		local type = v.Type
		local createElement = reactModule.createElement
		local t_2 = {
			channelTabsSettings = p2.channelTabsSettings,
			channelName = i_1,
			textChannel = var85,
			tabType = type,
			hasUnreadMessages = v.HasUnreadMessages
		}
		
		if v.TabIndex >= var44 then
			var87 = var43 and v.TabIndex < var24
		end
		t_2.isDividerVisible = var87
		t_2.isTabCollapsed = not var84
		t_2.isTabSelected = p2.selectedTabName and p2.selectedTabName == i_1
		t_2.tabIndex = if fFlagExpChatEnableTabsImpressionAnalyticsModule then v.TabIndex else nil
		t_2.isTabVisibleToUser = if fFlagExpChatEnableTabsImpressionAnalyticsModule then var84 or var28 else nil
		t_2.isLayoutReady = if fFlagExpChatEnableTabsImpressionAnalyticsModule then var33 else nil
		
		function t_2.onTabSelected() --[[ line: 183 ]]
			-- upvalues: expChatPerfTracker (copy), i_1 (ref), fFlagExpChatPerfTrackerTabName (copy), var84 (ref), var37 (ref), var38 (ref), var39 (ref), fFlagExpChatLogTabClickedModule (copy), analytics (copy), type (ref), v (ref), p2 (ref), var19 (copy), var85 (ref), var29 (ref)
			expChatPerfTracker.cancelAll()
			expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = i_1 }, if fFlagExpChatPerfTrackerTabName then { tabName = i_1 } else nil)
			
			if not var84 and var37 and var38.current then
				var39(var38.current)
			end
			if fFlagExpChatLogTabClickedModule then
				analytics:TelemetryLogEvent(analytics.ExpChatTabClickedConfig, {
					name = i_1,
					type = type or "Unknown",
					index = v.TabIndex,
					in_overflow = not var84,
					badge_count = if v.HasUnreadMessages then 1 else 0,
					previous_tab_name = p2.selectedTabName
				}, var19)
			end
			p2.onTabSelected(var85, not var84, i_1, type)
			var29(false)
		end
		
		function t_2.setTransparency(value) --[[ line: 205 ]]
			-- upvalues: setTransparency (copy), p2 (ref)
			return setTransparency(value, p2.transparencyValue)
		end
		
		createElement = createElement(channelTabModule, t_2)
		
		if var84 then
			t[v.TabIndex] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var45, 1, 0),
				LayoutOrder = v.TabIndex
			}, { ChannelTab = createElement })
		else
			local var88 = v.TabIndex - var44
			t_1[var88] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = var88
			}, { ChannelTab = createElement })
		end
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local channelTabsSettings = p2.channelTabsSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundColor3
	local createElement = reactModule.createElement
	local var51 = "Frame"
	local t_2 = {
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p2.visible,
		BorderSizePixel = 0,
		ZIndex = if fFlagExpChatChannelBarDropdownZIndexFixModule then 3 else nil,
		[reactModule.Event.MouseEnter] = p2.onHovered,
		[reactModule.Event.MouseLeave] = p2.onUnhovered,
		[reactModule.Change.AbsoluteSize] = function(p3) --[[ line: 243 ]]
			-- upvalues: var32 (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (copy), var34 (write), channelTabsConfiguration (ref)
			var32(p3.AbsoluteSize.X)
			
			if fFlagExpChatEnableTabsImpressionAnalyticsModule then
				var34(true)
			end
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsoluteSize(p3.AbsoluteSize)
			end
		end,
		[reactModule.Change.AbsolutePosition] = function(p4) --[[ line: 252 ]]
			-- upvalues: channelTabsConfiguration (ref)
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsolutePosition(p4.AbsolutePosition)
			end
		end
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local var54 = "Frame"
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
			ImageTransparency = p2.transparencyValue:map(function(p5) --[[ line: 96 ]]
				-- upvalues: backgroundTransparency (ref)
				return if backgroundTransparency == nil then 1 else backgroundTransparency + p5 * (1 - backgroundTransparency)
			end),
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32),
			Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil,
			SelectionImageObject = var40,
			ref = if fFlagExpChatFocusChannelBarSupportModule then p2.topBorderRef else nil
		})
	}
	local createElement_2 = reactModule.createElement
	local var57 = "Frame"
	local t_6 = {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1),
		BackgroundColor3 = configModule.ChannelTabsSettings.BorderColor3
	}
	local borderTransparency = configModule.ChannelTabsSettings.BorderTransparency
	t_6.BackgroundTransparency = p2.transparencyValue:map(function(p6) --[[ line: 96 ]]
		-- upvalues: borderTransparency (ref)
		return if borderTransparency == nil then 1 else borderTransparency + p6 * (1 - borderTransparency)
	end)
	t_5.BottomBorder = createElement_2(var57, t_6)
	t_5.Background = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
		Position = UDim2.new(0, 0, 0, 8),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = p2.transparencyValue:map(function(p7) --[[ line: 96 ]]
			-- upvalues: backgroundTransparency (ref)
			return if backgroundTransparency == nil then 1 else backgroundTransparency + p7 * (1 - backgroundTransparency)
		end)
	})
	t_3.HorizontalBar = createElement_1(var54, t_4, t_5)
	local var59 = var43
	
	if var59 then
		var59 = reactModule.createElement
		local var60 = "Frame"
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
		local var63 = "TextButton"
		local t_9 = {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -configModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
			Size = UDim2.new(0, 27, 0, 27)
		}
		local var65 = if var26 then 0.3 else 1
		t_9.BackgroundTransparency = p2.transparencyValue:map(function(p8) --[[ line: 96 ]]
			-- upvalues: var65 (ref)
			return if var65 == nil then 1 else var65 + p8 * (1 - var65)
		end)
		t_9.BackgroundColor3 = color_1
		t_9.Text = ""
		t_9.BorderSizePixel = 0
		t_9.Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil
		t_9.SelectionImageObject = var41
		t_9.ref = if fFlagExpChatFocusChannelBarSupportModule then var38 else nil
		
		t_9[reactModule.Event.MouseEnter] = function() --[[ line: 329 ]]
			-- upvalues: var27 (ref)
			var27(true)
		end
		
		t_9[reactModule.Event.MouseLeave] = function() --[[ line: 332 ]]
			-- upvalues: var27 (ref)
			var27(false)
		end
		
		t_9[reactModule.Event.Activated] = function() --[[ line: 335 ]]
			-- upvalues: var29 (ref), var28 (ref)
			var29(not var28)
		end
		
		local t_10 = {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 27) })
		}
		local createElement_4 = reactModule.createElement
		local var67 = imageSetLabel
		local t_11 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.6, 0.6),
			Image = cycleDown,
			ImageColor3 = color
		}
		local var69 = 0
		t_11.ImageTransparency = p2.transparencyValue:map(function(p9) --[[ line: 96 ]]
			-- upvalues: var69 (ref)
			return if var69 == nil then 1 else var69 + p9 * (1 - var69)
		end)
		t_11.ScaleType = Enum.ScaleType.Stretch
		t_10.DropdownIconImage = createElement_4(var67, t_11)
		t_8.TextButton = createElement_3(var63, t_9, t_10)
		local var70 = var47
		
		if var70 then
			var70 = reactModule.createElement
			local var71 = "Frame"
			local t_12 = {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3
			}
			local var73 = 0
			t_12.BackgroundTransparency = p2.transparencyValue:map(function(p10) --[[ line: 96 ]]
				-- upvalues: var73 (ref)
				return if var73 == nil then 1 else var73 + p10 * (1 - var73)
			end)
			var70 = var70(var71, t_12, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		t_8.UnreadDot = var70
		var59 = var59(var60, t_7, t_8)
	end
	t_3.DropdownButton = var59
	local var74 = var43
	
	if var74 then
		var74 = reactModule.createElement
		local var75 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, var46),
			Visible = var28
		}
		local t_8 = {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, var25) })
		}
		local createElement_3 = reactModule.createElement
		local var78 = "UIStroke"
		local t_9 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChannelTabsSettings.BorderColor3
		}
		local borderTransparency_1 = configModule.ChannelTabsSettings.BorderTransparency
		t_9.Transparency = p2.transparencyValue:map(function(p11) --[[ line: 96 ]]
			-- upvalues: borderTransparency_1 (ref)
			return if borderTransparency_1 == nil then 1 else borderTransparency_1 + p11 * (1 - borderTransparency_1)
		end)
		t_8.Border = createElement_3(var78, t_9)
		local createElement_4 = reactModule.createElement
		local var80 = "ScrollingFrame"
		local t_10 = {
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 150, 0, var46)
		}
		local var82 = 0
		t_10.BackgroundTransparency = p2.transparencyValue:map(function(p12) --[[ line: 96 ]]
			-- upvalues: var82 (ref)
			return if var82 == nil then 1 else var82 + p12 * (1 - var82)
		end)
		local var83 = 0
		t_10.ScrollBarImageTransparency = p2.transparencyValue:map(function(p13) --[[ line: 96 ]]
			-- upvalues: var83 (ref)
			return if var83 == nil then 1 else var83 + p13 * (1 - var83)
		end)
		t_10.ScrollingDirection = Enum.ScrollingDirection.Y
		t_10.ElasticBehavior = Enum.ElasticBehavior.Always
		t_10.Selectable = if fFlagExpChatFocusChannelBarSupportModule then false else nil
		t_8.ScrollView = createElement_4(var80, t_10, t_1)
		var74 = var74(var75, t_7, t_8)
	end
	t_3.DropdownMenu = var74
	
	return createElement(var51, t_2, t_3)
end