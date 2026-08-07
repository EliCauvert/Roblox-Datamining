local textChatService = game:GetService("TextChatService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local configModule = require(expChat.Config)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsReactModule = require(parent.SignalsReact)
local expChatSharedModule = require(parent.ExpChatShared)
local UIBloxModule = require(parent.UIBlox)
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local fFlagExpChatFocusChannelBarSupportModule = require(expChat.Flags.FFlagExpChatFocusChannelBarSupport)
local fFlagExpChatChannelBarDropdownZIndexFixModule = require(expChat.Flags.FFlagExpChatChannelBarDropdownZIndexFix)
local var11 = require(expChat.Stores.GetFocusNavigationStore)(false)
local fFlagExpChatPerfTracking = require(parent.SharedFlags).FFlagExpChatPerfTracking
local fFlagExpChatChannelTabRefactor = require(parent.SharedFlags).FFlagExpChatChannelTabRefactor
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local channelTabModule = require(script.Parent.Parent.ChannelTab)
local cycleDown = images["icons/navigation/cycleDown"]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(100, 100, 100)

local function _(value) --[[ line: 75 | named "countAllChannelTabs" ]]
	local var16 = 0
	
	for i in pairs(value) do
		var16 += 1
	end
	return var16
end

local function setTransparency(value, p0) --[[ line: 83 ]]
	return p0:map(function(p1) --[[ line: 84 ]]
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p1 * (1 - value)
	end)
end

return function(p2) --[[ line: 89 | named "ChannelBar" ]]
	-- upvalues: configModule (ref), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), signalsReactModule (ref), var11 (ref), reactFocusNavigationModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatEnableFriendsTab (ref), fFlagExpChatChannelTabRefactor (ref), channelTabModule (ref), fFlagExpChatPerfTracking (ref), expChatPerfTracker (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatPerfTrackerTabName (ref), setTransparency (ref), textChatService (ref), useInterpolatedClientSettingsModule (ref), fFlagExpChatChannelBarDropdownZIndexFixModule (ref), color_1 (ref), imageSetLabel (ref), cycleDown (ref), color (ref)
	local var17 = 0
	
	for i in pairs(p2.allChannelTabs) do
		var17 += 1
	end
	local var18 = configModule.ChatWindowSize.Y.Scale * p2.chatWindowSettings.HeightScale * configModule.ChatWindowMaxWidth
	local var19, var20 = reactModule.useState(false)
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(1024)
	local var25 = if fFlagExpChatFocusChannelBarSupportModule then signalsReactModule.useSignalState(var11.getChatInputBarFocused) else nil
	local var26 = if fFlagExpChatFocusChannelBarSupportModule then reactModule.useRef(nil) else nil
	local var27 = if fFlagExpChatFocusChannelBarSupportModule then reactFocusNavigationModule.useFocusGuiObject() else nil
	local var28 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.Invisible) else nil
	local var29 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var30 = var23 < var17 * configModule.ChannelTabsSettings.MinTabWidth
	local var31 = if not var30 then var17 else math.floor((var23 - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)
	local var32 = (var23 - (if var30 then configModule.ChannelTabsSettings.DropdownIconContainerWidth else 0)) / var31
	local var33 = (var17 - var31) * 40
	local var34 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: p2 (ref), var31 (ref)
		for i, v in pairs(p2.allChannelTabs) do
			if var31 < v.TabIndex and v.HasUnreadMessages then
				return true
			end
		end
		return false
	end, if fFlagExpChatEnableFriendsTab then { var31, p2.allChannelTabs } else nil)
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
		local var75
		local var71 = v.TabIndex <= var31
		local var72 = p2.allTextChannels[i_1]
		local var73 = if fFlagExpChatChannelTabRefactor then v.Type else nil
		local createElement = reactModule.createElement
		local t_2 = {
			channelTabsSettings = p2.channelTabsSettings,
			channelName = i_1,
			textChannel = var72,
			tabType = var73,
			hasUnreadMessages = v.HasUnreadMessages
		}
		
		if v.TabIndex >= var31 then
			var75 = var30 and v.TabIndex < var17
		end
		t_2.isDividerVisible = var75
		t_2.isTabCollapsed = not var71
		t_2.isTabSelected = p2.selectedTabName and p2.selectedTabName == i_1
		
		function t_2.onTabSelected() --[[ line: 160 ]]
			-- upvalues: fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatChannelTabRefactor (copy), i_1 (ref), var72 (ref), fFlagExpChatPerfTrackerTabName (copy), var71 (ref), var25 (ref), var26 (ref), var27 (ref), p2 (ref), var73 (ref), var22 (ref)
			if fFlagExpChatPerfTracking then
				expChatPerfTracker.cancelAll()
				expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, {
					tabId = if getFFlagTextChatEnableUniverseChatTabs() or fFlagExpChatChannelTabRefactor then i_1 elseif var72 then var72.Name else nil
				}, if fFlagExpChatPerfTrackerTabName then { tabName = i_1 } else nil)
			end
			if not var71 and var25 and var26.current then
				var27(var26.current)
			end
			p2.onTabSelected(var72, not var71, i_1, var73)
			var22(false)
		end
		
		function t_2.setTransparency(value) --[[ line: 177 ]]
			-- upvalues: setTransparency (copy), p2 (ref)
			return setTransparency(value, p2.transparencyValue)
		end
		
		createElement = createElement(channelTabModule, t_2)
		
		if var71 then
			t[v.TabIndex] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var32, 1, 0),
				LayoutOrder = v.TabIndex
			}, { ChannelTab = createElement })
		else
			local var76 = v.TabIndex - var31
			t_1[var76] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = var76
			}, { ChannelTab = createElement })
		end
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local channelTabsSettings = p2.channelTabsSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundColor3
	local createElement = reactModule.createElement
	local var38 = "Frame"
	local t_2 = {
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p2.visible,
		BorderSizePixel = 0,
		ZIndex = if fFlagExpChatChannelBarDropdownZIndexFixModule then 3 else nil,
		[reactModule.Event.MouseEnter] = p2.onHovered,
		[reactModule.Event.MouseLeave] = p2.onUnhovered,
		[reactModule.Change.AbsoluteSize] = function(p3) --[[ line: 215 ]]
			-- upvalues: var24 (ref), channelTabsConfiguration (ref)
			var24(p3.AbsoluteSize.X)
			
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsoluteSize(p3.AbsoluteSize)
			end
		end,
		[reactModule.Change.AbsolutePosition] = function(p4) --[[ line: 221 ]]
			-- upvalues: channelTabsConfiguration (ref)
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsolutePosition(p4.AbsolutePosition)
			end
		end
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local var41 = "Frame"
	local t_4 = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}
	local t_5 = {
		ContentContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, t),
		TopCorner = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
			BorderSizePixel = 0,
			ImageColor3 = backgroundColor3,
			ImageTransparency = p2.transparencyValue:map(function(p5) --[[ line: 84 ]]
				-- upvalues: backgroundTransparency (ref)
				return if backgroundTransparency == nil then 1 else backgroundTransparency + p5 * (1 - backgroundTransparency)
			end),
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32),
			Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil,
			SelectionImageObject = var28,
			ref = if fFlagExpChatFocusChannelBarSupportModule then p2.topBorderRef else nil
		})
	}
	local createElement_2 = reactModule.createElement
	local var44 = "Frame"
	local t_6 = {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1),
		BackgroundColor3 = configModule.ChannelTabsSettings.BorderColor3
	}
	local borderTransparency = configModule.ChannelTabsSettings.BorderTransparency
	t_6.BackgroundTransparency = p2.transparencyValue:map(function(p6) --[[ line: 84 ]]
		-- upvalues: borderTransparency (ref)
		return if borderTransparency == nil then 1 else borderTransparency + p6 * (1 - borderTransparency)
	end)
	t_5.BottomBorder = createElement_2(var44, t_6)
	t_5.Background = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
		Position = UDim2.new(0, 0, 0, 8),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = p2.transparencyValue:map(function(p7) --[[ line: 84 ]]
			-- upvalues: backgroundTransparency (ref)
			return if backgroundTransparency == nil then 1 else backgroundTransparency + p7 * (1 - backgroundTransparency)
		end)
	})
	t_3.HorizontalBar = createElement_1(var41, t_4, t_5)
	local var46 = var30
	
	if var46 then
		var46 = reactModule.createElement
		local var47 = "Frame"
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
		local var50 = "TextButton"
		local t_9 = {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -configModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
			Size = UDim2.new(0, 27, 0, 27)
		}
		local var52 = if var19 then 0.3 else 1
		t_9.BackgroundTransparency = p2.transparencyValue:map(function(p8) --[[ line: 84 ]]
			-- upvalues: var52 (ref)
			return if var52 == nil then 1 else var52 + p8 * (1 - var52)
		end)
		t_9.BackgroundColor3 = color_1
		t_9.Text = ""
		t_9.BorderSizePixel = 0
		t_9.Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil
		t_9.SelectionImageObject = var29
		t_9.ref = if fFlagExpChatFocusChannelBarSupportModule then var26 else nil
		
		t_9[reactModule.Event.MouseEnter] = function() --[[ line: 297 ]]
			-- upvalues: var20 (ref)
			var20(true)
		end
		
		t_9[reactModule.Event.MouseLeave] = function() --[[ line: 300 ]]
			-- upvalues: var20 (ref)
			var20(false)
		end
		
		t_9[reactModule.Event.Activated] = function() --[[ line: 303 ]]
			-- upvalues: var22 (ref), var21 (ref)
			var22(not var21)
		end
		
		local t_10 = {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 27) })
		}
		local createElement_4 = reactModule.createElement
		local var54 = imageSetLabel
		local t_11 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.6, 0.6),
			Image = cycleDown,
			ImageColor3 = color
		}
		local var56 = 0
		t_11.ImageTransparency = p2.transparencyValue:map(function(p9) --[[ line: 84 ]]
			-- upvalues: var56 (ref)
			return if var56 == nil then 1 else var56 + p9 * (1 - var56)
		end)
		t_11.ScaleType = Enum.ScaleType.Stretch
		t_10.DropdownIconImage = createElement_4(var54, t_11)
		t_8.TextButton = createElement_3(var50, t_9, t_10)
		local var57 = var34
		
		if var57 then
			var57 = reactModule.createElement
			local var58 = "Frame"
			local t_12 = {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3
			}
			local var60 = 0
			t_12.BackgroundTransparency = p2.transparencyValue:map(function(p10) --[[ line: 84 ]]
				-- upvalues: var60 (ref)
				return if var60 == nil then 1 else var60 + p10 * (1 - var60)
			end)
			var57 = var57(var58, t_12, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		t_8.UnreadDot = var57
		var46 = var46(var47, t_7, t_8)
	end
	t_3.DropdownButton = var46
	local var61 = var30
	
	if var61 then
		var61 = reactModule.createElement
		local var62 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, var33),
			Visible = var21
		}
		local t_8 = {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, var18) })
		}
		local createElement_3 = reactModule.createElement
		local var65 = "UIStroke"
		local t_9 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChannelTabsSettings.BorderColor3
		}
		local borderTransparency_1 = configModule.ChannelTabsSettings.BorderTransparency
		t_9.Transparency = p2.transparencyValue:map(function(p11) --[[ line: 84 ]]
			-- upvalues: borderTransparency_1 (ref)
			return if borderTransparency_1 == nil then 1 else borderTransparency_1 + p11 * (1 - borderTransparency_1)
		end)
		t_8.Border = createElement_3(var65, t_9)
		local createElement_4 = reactModule.createElement
		local var67 = "ScrollingFrame"
		local t_10 = {
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 150, 0, var33)
		}
		local var69 = 0
		t_10.BackgroundTransparency = p2.transparencyValue:map(function(p12) --[[ line: 84 ]]
			-- upvalues: var69 (ref)
			return if var69 == nil then 1 else var69 + p12 * (1 - var69)
		end)
		local var70 = 0
		t_10.ScrollBarImageTransparency = p2.transparencyValue:map(function(p13) --[[ line: 84 ]]
			-- upvalues: var70 (ref)
			return if var70 == nil then 1 else var70 + p13 * (1 - var70)
		end)
		t_10.ScrollingDirection = Enum.ScrollingDirection.Y
		t_10.ElasticBehavior = Enum.ElasticBehavior.Always
		t_10.Selectable = if fFlagExpChatFocusChannelBarSupportModule then false else nil
		t_8.ScrollView = createElement_4(var67, t_10, t_1)
		var61 = var61(var62, t_7, t_8)
	end
	t_3.DropdownMenu = var61
	
	return createElement(var38, t_2, t_3)
end