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
local var10 = require(expChat.Stores.GetFocusNavigationStore)(false)
local fFlagExpChatPerfTracking = require(parent.SharedFlags).FFlagExpChatPerfTracking
local fFlagExpChatChannelTabRefactor = require(parent.SharedFlags).FFlagExpChatChannelTabRefactor
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local channelTabModule = require(script.Parent.Parent.ChannelTab)
local cycleDown = images["icons/navigation/cycleDown"]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(100, 100, 100)

local function _(value) --[[ line: 68 | named "countAllChannelTabs" ]]
	local var15 = 0
	
	for i in pairs(value) do
		var15 += 1
	end
	return var15
end

local function setTransparency(value, p0) --[[ line: 76 ]]
	return p0:map(function(p1) --[[ line: 77 ]]
		-- upvalues: value (ref)
		return if value == nil then 1 else value + p1 * (1 - value)
	end)
end

return function(p2) --[[ line: 82 | named "ChannelBar" ]]
	-- upvalues: configModule (ref), reactModule (ref), fFlagExpChatFocusChannelBarSupportModule (ref), signalsReactModule (ref), var10 (ref), reactFocusNavigationModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatChannelTabRefactor (ref), channelTabModule (ref), fFlagExpChatPerfTracking (ref), expChatPerfTracker (ref), getFFlagTextChatEnableUniverseChatTabs (ref), setTransparency (ref), textChatService (ref), useInterpolatedClientSettingsModule (ref), color_1 (ref), imageSetLabel (ref), cycleDown (ref), color (ref)
	local var16 = 0
	
	for i in pairs(p2.allChannelTabs) do
		var16 += 1
	end
	local var17 = configModule.ChatWindowSize.Y.Scale * p2.chatWindowSettings.HeightScale * configModule.ChatWindowMaxWidth
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(1024)
	local var24 = if fFlagExpChatFocusChannelBarSupportModule then signalsReactModule.useSignalState(var10.getChatInputBarFocused) else nil
	local var25 = if fFlagExpChatFocusChannelBarSupportModule then reactModule.useRef(nil) else nil
	local var26 = if fFlagExpChatFocusChannelBarSupportModule then reactFocusNavigationModule.useFocusGuiObject() else nil
	local var27 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.Invisible) else nil
	local var28 = if fFlagExpChatFocusChannelBarSupportModule then useSelectionCursor(cursorKind.RoundedSlot) else nil
	local var29 = var22 < var16 * configModule.ChannelTabsSettings.MinTabWidth
	local var30 = if not var29 then var16 else math.floor((var22 - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)
	local var31 = (var22 - (if var29 then configModule.ChannelTabsSettings.DropdownIconContainerWidth else 0)) / var30
	local var32 = (var16 - var30) * 40
	local var33 = reactModule.useMemo(function() --[[ line: 114 ]]
		-- upvalues: p2 (ref), var30 (ref)
		for i, v in pairs(p2.allChannelTabs) do
			if var30 < v.TabIndex and v.HasUnreadMessages then
				return true
			end
		end
		return false
	end)
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
		local var74
		local var70 = v.TabIndex <= var30
		local var71 = p2.allTextChannels[i_1]
		local var72 = if fFlagExpChatChannelTabRefactor then v.Type else nil
		local createElement = reactModule.createElement
		local t_2 = {
			channelTabsSettings = p2.channelTabsSettings,
			channelName = i_1,
			textChannel = var71,
			tabType = var72,
			hasUnreadMessages = v.HasUnreadMessages
		}
		
		if v.TabIndex >= var30 then
			var74 = var29 and v.TabIndex < var16
		end
		t_2.isDividerVisible = var74
		t_2.isTabCollapsed = not var70
		t_2.isTabSelected = p2.selectedTabName and p2.selectedTabName == i_1
		
		function t_2.onTabSelected() --[[ line: 153 ]]
			-- upvalues: fFlagExpChatPerfTracking (copy), expChatPerfTracker (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatChannelTabRefactor (copy), i_1 (ref), var71 (ref), var70 (ref), var24 (ref), var25 (ref), var26 (ref), p2 (ref), var72 (ref), var21 (ref)
			if fFlagExpChatPerfTracking then
				expChatPerfTracker.cancelAll()
				expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, {
					tabId = if getFFlagTextChatEnableUniverseChatTabs() or fFlagExpChatChannelTabRefactor then i_1 elseif var71 then var71.Name else nil
				})
			end
			if not var70 and var24 and var25.current then
				var26(var25.current)
			end
			p2.onTabSelected(var71, not var70, i_1, var72)
			var21(false)
		end
		
		function t_2.setTransparency(value) --[[ line: 170 ]]
			-- upvalues: setTransparency (copy), p2 (ref)
			return setTransparency(value, p2.transparencyValue)
		end
		
		createElement = createElement(channelTabModule, t_2)
		
		if var70 then
			t[v.TabIndex] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var31, 1, 0),
				LayoutOrder = v.TabIndex
			}, { ChannelTab = createElement })
		else
			local var75 = v.TabIndex - var30
			t_1[var75] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = var75
			}, { ChannelTab = createElement })
			
			if v.HasUnreadMessages then
				var33 = true
			end
		end
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local channelTabsSettings = p2.channelTabsSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundColor3
	local createElement = reactModule.createElement
	local var37 = "Frame"
	local t_2 = {
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p2.visible,
		BorderSizePixel = 0,
		[reactModule.Event.MouseEnter] = p2.onHovered,
		[reactModule.Event.MouseLeave] = p2.onUnhovered,
		[reactModule.Change.AbsoluteSize] = function(p3) --[[ line: 211 ]]
			-- upvalues: var23 (ref), channelTabsConfiguration (ref)
			var23(p3.AbsoluteSize.X)
			
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsoluteSize(p3.AbsoluteSize)
			end
		end,
		[reactModule.Change.AbsolutePosition] = function(p4) --[[ line: 217 ]]
			-- upvalues: channelTabsConfiguration (ref)
			if channelTabsConfiguration then
				channelTabsConfiguration:SetAbsolutePosition(p4.AbsolutePosition)
			end
		end
	}
	local t_3 = {}
	local createElement_1 = reactModule.createElement
	local var40 = "Frame"
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
			ImageTransparency = p2.transparencyValue:map(function(p5) --[[ line: 77 ]]
				-- upvalues: backgroundTransparency (ref)
				return if backgroundTransparency == nil then 1 else backgroundTransparency + p5 * (1 - backgroundTransparency)
			end),
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32),
			Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil,
			SelectionImageObject = var27,
			ref = if fFlagExpChatFocusChannelBarSupportModule then p2.topBorderRef else nil
		})
	}
	local createElement_2 = reactModule.createElement
	local var43 = "Frame"
	local t_6 = {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, -1),
		BackgroundColor3 = configModule.ChannelTabsSettings.BorderColor3
	}
	local borderTransparency = configModule.ChannelTabsSettings.BorderTransparency
	t_6.BackgroundTransparency = p2.transparencyValue:map(function(p6) --[[ line: 77 ]]
		-- upvalues: borderTransparency (ref)
		return if borderTransparency == nil then 1 else borderTransparency + p6 * (1 - borderTransparency)
	end)
	t_5.BottomBorder = createElement_2(var43, t_6)
	t_5.Background = reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
		Position = UDim2.new(0, 0, 0, 8),
		BackgroundColor3 = backgroundColor3,
		BackgroundTransparency = p2.transparencyValue:map(function(p7) --[[ line: 77 ]]
			-- upvalues: backgroundTransparency (ref)
			return if backgroundTransparency == nil then 1 else backgroundTransparency + p7 * (1 - backgroundTransparency)
		end)
	})
	t_3.HorizontalBar = createElement_1(var40, t_4, t_5)
	local var45 = var29
	
	if var45 then
		var45 = reactModule.createElement
		local var46 = "Frame"
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
		local var49 = "TextButton"
		local t_9 = {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -configModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
			Size = UDim2.new(0, 27, 0, 27)
		}
		local var51 = if var18 then 0.3 else 1
		t_9.BackgroundTransparency = p2.transparencyValue:map(function(p8) --[[ line: 77 ]]
			-- upvalues: var51 (ref)
			return if var51 == nil then 1 else var51 + p8 * (1 - var51)
		end)
		t_9.BackgroundColor3 = color_1
		t_9.Text = ""
		t_9.BorderSizePixel = 0
		t_9.Selectable = if fFlagExpChatFocusChannelBarSupportModule then true else nil
		t_9.SelectionImageObject = var28
		t_9.ref = if fFlagExpChatFocusChannelBarSupportModule then var25 else nil
		
		t_9[reactModule.Event.MouseEnter] = function() --[[ line: 293 ]]
			-- upvalues: var19 (ref)
			var19(true)
		end
		
		t_9[reactModule.Event.MouseLeave] = function() --[[ line: 296 ]]
			-- upvalues: var19 (ref)
			var19(false)
		end
		
		t_9[reactModule.Event.Activated] = function() --[[ line: 299 ]]
			-- upvalues: var21 (ref), var20 (ref)
			var21(not var20)
		end
		
		local t_10 = {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 27) })
		}
		local createElement_4 = reactModule.createElement
		local var53 = imageSetLabel
		local t_11 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.6, 0.6),
			Image = cycleDown,
			ImageColor3 = color
		}
		local var55 = 0
		t_11.ImageTransparency = p2.transparencyValue:map(function(p9) --[[ line: 77 ]]
			-- upvalues: var55 (ref)
			return if var55 == nil then 1 else var55 + p9 * (1 - var55)
		end)
		t_11.ScaleType = Enum.ScaleType.Stretch
		t_10.DropdownIconImage = createElement_4(var53, t_11)
		t_8.TextButton = createElement_3(var49, t_9, t_10)
		local var56 = var33
		
		if var56 then
			var56 = reactModule.createElement
			local var57 = "Frame"
			local t_12 = {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3
			}
			local var59 = 0
			t_12.BackgroundTransparency = p2.transparencyValue:map(function(p10) --[[ line: 77 ]]
				-- upvalues: var59 (ref)
				return if var59 == nil then 1 else var59 + p10 * (1 - var59)
			end)
			var56 = var56(var57, t_12, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		t_8.UnreadDot = var56
		var45 = var45(var46, t_7, t_8)
	end
	t_3.DropdownButton = var45
	local var60 = var29
	
	if var60 then
		var60 = reactModule.createElement
		local var61 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, var32),
			Visible = var20
		}
		local t_8 = {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, var17) })
		}
		local createElement_3 = reactModule.createElement
		local var64 = "UIStroke"
		local t_9 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChannelTabsSettings.BorderColor3
		}
		local borderTransparency_1 = configModule.ChannelTabsSettings.BorderTransparency
		t_9.Transparency = p2.transparencyValue:map(function(p11) --[[ line: 77 ]]
			-- upvalues: borderTransparency_1 (ref)
			return if borderTransparency_1 == nil then 1 else borderTransparency_1 + p11 * (1 - borderTransparency_1)
		end)
		t_8.Border = createElement_3(var64, t_9)
		local createElement_4 = reactModule.createElement
		local var66 = "ScrollingFrame"
		local t_10 = {
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 150, 0, var32)
		}
		local var68 = 0
		t_10.BackgroundTransparency = p2.transparencyValue:map(function(p12) --[[ line: 77 ]]
			-- upvalues: var68 (ref)
			return if var68 == nil then 1 else var68 + p12 * (1 - var68)
		end)
		local var69 = 0
		t_10.ScrollBarImageTransparency = p2.transparencyValue:map(function(p13) --[[ line: 77 ]]
			-- upvalues: var69 (ref)
			return if var69 == nil then 1 else var69 + p13 * (1 - var69)
		end)
		t_10.ScrollingDirection = Enum.ScrollingDirection.Y
		t_10.ElasticBehavior = Enum.ElasticBehavior.Always
		t_10.Selectable = if fFlagExpChatFocusChannelBarSupportModule then false else nil
		t_8.ScrollView = createElement_4(var66, t_10, t_1)
		var60 = var60(var61, t_7, t_8)
	end
	t_3.DropdownMenu = var60
	
	return createElement(var37, t_2, t_3)
end