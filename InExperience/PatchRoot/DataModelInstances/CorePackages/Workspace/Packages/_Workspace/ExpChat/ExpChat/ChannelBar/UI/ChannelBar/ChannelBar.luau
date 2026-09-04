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
local fFlagExpChatEnableTabsImpressionAnalyticsModule = require(expChat.Flags.FFlagExpChatEnableTabsImpressionAnalytics)
local var1 = require(expChat.Stores.GetFocusNavigationStore)(false)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local fFlagExpChatLogTabClickedModule = require(expChat.Flags.FFlagExpChatLogTabClicked)
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local getChatLayoutStoreModule = require(expChat.Stores.GetChatLayoutStore)
local channelTabModule = require(script.Parent.Parent.ChannelTab)
local var2 = cryoModule.List.join(analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if fFlagGlobalTextChatAddPlaySessionFieldModule then { "addPlaySessionId" } else {})
local cycleDown = images["icons/navigation/cycleDown"]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(100, 100, 100)

local function _(value)
	local var3 = 0
	
	for i in pairs(value) do
		var3 += 1
	end
	return var3
end

local function setTransparency(value, p1)
	return p1:map(function(p2)
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p2 * (1 - value)
	end)
end

return function(p1)
	-- upvalues: configModule (ref), reactModule (ref), signalsReactModule (ref), getChatLayoutStoreModule (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), var1 (ref), reactFocusNavigationModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatEnableFriendsTab (ref), channelTabModule (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), fFlagExpChatLogTabClickedModule (ref), analytics (ref), var2 (ref), setTransparency (ref), textChatService (ref), useInterpolatedClientSettingsModule (ref), color_1 (ref), imageSetLabel (ref), cycleDown (ref), color (ref)
	local var4 = 0
	
	for i in pairs(p1.allChannelTabs) do
		var4 += 1
	end
	local var5 = configModule.ChatWindowSize.Y.Scale * p1.chatWindowSettings.HeightScale * configModule.ChatWindowMaxWidth
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10 = signalsReactModule.useSignalState(getChatLayoutStoreModule(false).getChatWindowWidth)
	local var11, var12 = reactModule.useState(1024)
	local var13 = nil
	local var14 = nil
	
	if fFlagExpChatEnableTabsImpressionAnalyticsModule then
		local var15, var16 = reactModule.useState(false)
		var13 = var15
		var14 = var16
	end
	local var17 = if fFlagExpChatFocusChannelBarSupportModule then signalsReactModule.useSignalState(var1.getChatInputBarFocused) else nil
	local var18 = if fFlagExpChatFocusChannelBarSupportModule then reactModule.useRef(nil) else nil
	local var19 = if fFlagExpChatFocusChannelBarSupportModule then reactFocusNavigationModule.useFocusGuiObject() else nil
	local var20 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.Invisible) else nil
	local var21 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var22 = var10 or var11
	local var23 = var22 < var4 * configModule.ChannelTabsSettings.MinTabWidth
	local var24 = if not var23 then var4 else math.floor((var22 - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)
	local var25 = (var22 - (if var23 then configModule.ChannelTabsSettings.DropdownIconContainerWidth else 0)) / var24
	local var26 = (var4 - var24) * 40
	local var27 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var24 (ref)
		for i, v in pairs(p1.allChannelTabs) do
			if var24 < v.TabIndex and v.HasUnreadMessages then
				return true
			end
		end
		return false
	end, if fFlagExpChatEnableFriendsTab then { var24, p1.allChannelTabs } else nil)
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
	
	for i_1, v in pairs(p1.allChannelTabs) do
		local var28
		local var29 = v.TabIndex <= var24
		local var30 = p1.allTextChannels[i_1]
		local type = v.Type
		local createElement = reactModule.createElement
		local t_2 = {
			channelTabsSettings = p1.channelTabsSettings,
			channelName = i_1,
			textChannel = var30,
			tabType = type,
			hasUnreadMessages = v.HasUnreadMessages
		}
		
		if v.TabIndex >= var24 then
			var28 = var23 and v.TabIndex < var4
		end
		t_2.isDividerVisible = var28
		t_2.isTabCollapsed = not var29
		t_2.isTabSelected = p1.selectedTabName and p1.selectedTabName == i_1
		t_2.tabIndex = if fFlagExpChatEnableTabsImpressionAnalyticsModule then v.TabIndex else nil
		t_2.isTabVisibleToUser = if fFlagExpChatEnableTabsImpressionAnalyticsModule then var29 or var8 else nil
		t_2.isLayoutReady = if fFlagExpChatEnableTabsImpressionAnalyticsModule then var13 else nil
		
		function t_2.onTabSelected()
			-- upvalues: expChatPerfTracker (copy), i_1 (ref), fFlagExpChatPerfTrackerTabName (copy), var29 (ref), var17 (ref), var18 (ref), var19 (ref), fFlagExpChatLogTabClickedModule (copy), analytics (copy), type (ref), v (ref), p1 (ref), var2 (copy), var30 (ref), var9 (ref)
			expChatPerfTracker.cancelAll()
			expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = i_1 }, if fFlagExpChatPerfTrackerTabName then { tabName = i_1 } else nil)
			
			if not var29 and var17 and var18.current then
				var19(var18.current)
			end
			if fFlagExpChatLogTabClickedModule then
				analytics:TelemetryLogEvent(analytics.ExpChatTabClickedConfig, {
					name = i_1,
					type = type or "Unknown",
					index = v.TabIndex,
					in_overflow = not var29,
					badge_count = if v.HasUnreadMessages then 1 else 0,
					previous_tab_name = p1.selectedTabName
				}, var2)
			end
			p1.onTabSelected(var30, not var29, i_1, type)
			var9(false)
		end
		
		function t_2.setTransparency(value)
			-- upvalues: setTransparency (copy), p1 (ref)
			return setTransparency(value, p1.transparencyValue)
		end
		
		createElement = createElement(channelTabModule, t_2)
		
		if var29 then
			t[v.TabIndex] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var25, 1, 0),
				LayoutOrder = v.TabIndex
			}, { ChannelTab = createElement })
		else
			local var31 = v.TabIndex - var24
			t_1[var31] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = var31
			}, { ChannelTab = createElement })
		end
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local channelTabsSettings = p1.channelTabsSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundColor3
	local createElement = reactModule.createElement
	local var32 = "Frame"
	local t_2 = {
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p1.visible,
		BorderSizePixel = 0,
		ZIndex = 3,
		[reactModule.Event.MouseEnter] = p1.onHovered,
		[reactModule.Event.MouseLeave] = p1.onUnhovered,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var12 (ref), fFlagExpChatEnableTabsImpressionAnalyticsModule (copy), var14 (write), channelTabsConfiguration (ref)
			var12(p2.AbsoluteSize.X)
			
			if fFlagExpChatEnableTabsImpressionAnalyticsModule then
				var14(true)
			end
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsoluteSize(p2.AbsoluteSize)
			end
		end,
		[reactModule.Change.AbsolutePosition] = function(p2)
			-- upvalues: channelTabsConfiguration (ref)
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsolutePosition(p2.AbsolutePosition)
			end
		end
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local var33 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_5 = {
		ContentContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Size = UDim2.fromScale(1, 1)
		}, t),
		TopCorner = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
			BorderSizePixel = 0,
			ImageColor3 = backgroundColor3,
			ImageTransparency = p1.transparencyValue:map(function(p2)
				-- upvalues: backgroundTransparency (ref)
				return if backgroundTransparency == nil then 1 else backgroundTransparency + p2 * (1 - backgroundTransparency)
			end),
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32),
			Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil,
			SelectionImageObject = var20,
			ref = if fFlagExpChatFocusChannelBarSupportModule then p1.topBorderRef else nil
		})
	}
	local createElement_2 = reactModule.createElement
	local var34 = "Frame"
	local t_6 = {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1),
		BackgroundColor3 = configModule.ChannelTabsSettings.BorderColor3
	}
	local borderTransparency = configModule.ChannelTabsSettings.BorderTransparency
	t_6.BackgroundTransparency = p1.transparencyValue:map(function(p2)
		-- upvalues: borderTransparency (ref)
		return if borderTransparency == nil then 1 else borderTransparency + p2 * (1 - borderTransparency)
	end)
	t_5.BottomBorder = createElement_2(var34, t_6)
	t_5.Background = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
		Position = UDim2.new(0, 0, 0, 8),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: backgroundTransparency (ref)
			return if backgroundTransparency == nil then 1 else backgroundTransparency + p2 * (1 - backgroundTransparency)
		end)
	})
	t_3.HorizontalBar = createElement_1(var33, t_4, t_5)
	local var35 = var23
	
	if var35 then
		var35 = reactModule.createElement
		local var36 = "Frame"
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
		local var37 = "TextButton"
		local t_9 = {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -configModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
			Size = UDim2.new(0, 27, 0, 27)
		}
		local var38 = if var6 then 0.3 else 1
		t_9.BackgroundTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var38 (ref)
			return if var38 == nil then 1 else var38 + p2 * (1 - var38)
		end)
		t_9.BackgroundColor3 = color_1
		t_9.Text = ""
		t_9.BorderSizePixel = 0
		t_9.Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil
		t_9.SelectionImageObject = var21
		t_9.ref = if fFlagExpChatFocusChannelBarSupportModule then var18 else nil
		
		t_9[reactModule.Event.MouseEnter] = function()
			-- upvalues: var7 (ref)
			var7(true)
		end
		
		t_9[reactModule.Event.MouseLeave] = function()
			-- upvalues: var7 (ref)
			var7(false)
		end
		
		t_9[reactModule.Event.Activated] = function()
			-- upvalues: var9 (ref), var8 (ref)
			var9(not var8)
		end
		
		local t_10 = {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 27) })
		}
		local createElement_4 = reactModule.createElement
		local var39 = imageSetLabel
		local t_11 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.6, 0.6),
			Image = cycleDown,
			ImageColor3 = color
		}
		local var40 = 0
		t_11.ImageTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var40 (ref)
			return if var40 == nil then 1 else var40 + p2 * (1 - var40)
		end)
		t_11.ScaleType = Enum.ScaleType.Stretch
		t_10.DropdownIconImage = createElement_4(var39, t_11)
		t_8.TextButton = createElement_3(var37, t_9, t_10)
		local var41 = var27
		
		if var41 then
			var41 = reactModule.createElement
			local var42 = "Frame"
			local t_12 = {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3
			}
			local var43 = 0
			t_12.BackgroundTransparency = p1.transparencyValue:map(function(p2)
				-- upvalues: var43 (ref)
				return if var43 == nil then 1 else var43 + p2 * (1 - var43)
			end)
			var41 = var41(var42, t_12, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		t_8.UnreadDot = var41
		var35 = var35(var36, t_7, t_8)
	end
	t_3.DropdownButton = var35
	local var44 = var23
	
	if var44 then
		var44 = reactModule.createElement
		local var45 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, var26),
			Visible = var8
		}
		local t_8 = {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, var5) })
		}
		local createElement_3 = reactModule.createElement
		local var46 = "UIStroke"
		local t_9 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChannelTabsSettings.BorderColor3
		}
		local borderTransparency_1 = configModule.ChannelTabsSettings.BorderTransparency
		t_9.Transparency = p1.transparencyValue:map(function(p2)
			-- upvalues: borderTransparency_1 (ref)
			return if borderTransparency_1 == nil then 1 else borderTransparency_1 + p2 * (1 - borderTransparency_1)
		end)
		t_8.Border = createElement_3(var46, t_9)
		local createElement_4 = reactModule.createElement
		local var47 = "ScrollingFrame"
		local t_10 = {
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 150, 0, var26)
		}
		local var48 = 0
		t_10.BackgroundTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var48 (ref)
			return if var48 == nil then 1 else var48 + p2 * (1 - var48)
		end)
		local var49 = 0
		t_10.ScrollBarImageTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var49 (ref)
			return if var49 == nil then 1 else var49 + p2 * (1 - var49)
		end)
		t_10.ScrollingDirection = Enum.ScrollingDirection.Y
		t_10.ElasticBehavior = Enum.ElasticBehavior.Always
		t_10.Selectable = if fFlagExpChatFocusChannelBarSupportModule then false else nil
		t_8.ScrollView = createElement_4(var47, t_10, t_1)
		var44 = var44(var45, t_7, t_8)
	end
	t_3.DropdownMenu = var44
	
	return createElement(var32, t_2, t_3)
end