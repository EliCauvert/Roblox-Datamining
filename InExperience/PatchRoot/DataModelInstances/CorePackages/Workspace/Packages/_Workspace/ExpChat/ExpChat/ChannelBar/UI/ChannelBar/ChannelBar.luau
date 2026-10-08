local textChatService = game:GetService("TextChatService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local configModule = require(expChat.Config)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local signalsReactModule = require(parent.SignalsReact)
local createEffect = require(parent.Signals).createEffect
local expChatSharedModule = require(parent.ExpChatShared)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local analytics = expChatSharedModule.Analytics
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local useInterpolatedClientSettingsModule = require(expChat.ClientSettings.useInterpolatedClientSettings)
local var1 = require(expChat.Stores.GetFocusNavigationStore)(false)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local fFlagExpChatUseChannelTabsStore = require(parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local fFlagExpChatTabShortcutNav = require(parent.SharedFlags).FFlagExpChatTabShortcutNav
local expChatPerfTracker = require(parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local fFlagExpChatPerfTrackerTabName = require(parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local fFlagGlobalTextChatAddPlaySessionFieldModule = require(expChat.Flags.FFlagGlobalTextChatAddPlaySessionField)
local getChatLayoutStoreModule = require(expChat.Stores.GetChatLayoutStore)
local channelTabModule = require(script.Parent.Parent.ChannelTab)
local var2 = cryoModule.List.join(analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if fFlagGlobalTextChatAddPlaySessionFieldModule then { "addPlaySessionId" } else {})
local cycleDown = images["icons/navigation/cycleDown"]
local color = Color3.fromRGB(255, 255, 255)
local color_1 = Color3.fromRGB(100, 100, 100)
local expChatTabNavFocusPollDelayFrames = game:DefineFastInt("ExpChatTabNavFocusPollDelayFrames", 3)
local expChatTabNavFocusPollFrames = game:DefineFastInt("ExpChatTabNavFocusPollFrames", 4)

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
	-- upvalues: configModule (ref), reactModule (ref), signalsReactModule (ref), getChatLayoutStoreModule (ref), var1 (ref), reactFocusNavigationModule (ref), useSelectionCursor (ref), cursorKind (ref), fFlagExpChatTabShortcutNav (ref), userInputService (ref), createEffect (ref), fFlagExpChatUseChannelTabsStore (ref), expChatTabNavFocusPollDelayFrames (ref), runService (ref), expChatTabNavFocusPollFrames (ref), fFlagExpChatEnableFriendsTab (ref), channelTabModule (ref), expChatPerfTracker (ref), fFlagExpChatPerfTrackerTabName (ref), analytics (ref), var2 (ref), setTransparency (ref), textChatService (ref), useInterpolatedClientSettingsModule (ref), color_1 (ref), imageSetLabel (ref), cycleDown (ref), color (ref)
	local var4 = 0
	
	for i in pairs(p1.allChannelTabs) do
		var4 += 1
	end
	local var5 = configModule.ChatWindowSize.Y.Scale * p1.chatWindowSettings.HeightScale * configModule.ChatWindowMaxWidth
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10 = signalsReactModule.useSignalState(getChatLayoutStoreModule(false).getChatWindowWidth)
	local var11, var12 = reactModule.useState(1024)
	local _ = nil
	local _ = nil
	local var13, var14 = reactModule.useState(false)
	local var15 = var14
	local var16 = signalsReactModule.useSignalState(var1.getChatInputBarFocused)
	local var17 = reactModule.useRef(nil)
	local var18 = reactFocusNavigationModule.useFocusGuiObject()
	local var19 = useSelectionCursor(cursorKind.Invisible)
	local var20 = useSelectionCursor(cursorKind.RoundedSlot)
	local var21 = nil
	local var22 = nil
	
	if fFlagExpChatTabShortcutNav then
		local var23, var24 = reactModule.useState(nil)
		var21 = var23
		var22 = var24
	end
	local var25 = if fFlagExpChatTabShortcutNav then reactModule.useRef({}) else nil
	local var26 = nil
	local var27 = nil
	
	if fFlagExpChatTabShortcutNav then
		local var28, var29 = reactModule.useState(nil)
		var26 = var28
		var27 = var29
	end
	local var30 = var10 or var11
	local var31 = var30 < var4 * configModule.ChannelTabsSettings.MinTabWidth
	local var32 = if not var31 then var4 else math.floor((var30 - configModule.ChannelTabsSettings.DropdownIconContainerWidth) / configModule.ChannelTabsSettings.MinTabWidth)
	local var33 = (var30 - (if var31 then configModule.ChannelTabsSettings.DropdownIconContainerWidth else 0)) / var32
	local var34 = (var4 - var32) * 40
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTabShortcutNav (copy), var1 (copy), p1 (ref)
		if fFlagExpChatTabShortcutNav then
			var1.setTabBarVisible(p1.visible)
			
			return function()
				-- upvalues: var1 (copy)
				var1.setTabBarVisible(false)
			end
		end
	end, { p1.visible })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTabShortcutNav (copy), var1 (copy), var21 (write)
		if fFlagExpChatTabShortcutNav then
			var1.setTabBarRoot(var21)
			
			return function()
				-- upvalues: var1 (copy)
				var1.setTabBarRoot(nil)
			end
		end
	end, { var21 })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTabShortcutNav (copy), var1 (copy), userInputService (copy), createEffect (copy), p1 (ref), fFlagExpChatUseChannelTabsStore (copy), var9 (ref), var32 (ref), expChatTabNavFocusPollDelayFrames (copy), runService (copy), expChatTabNavFocusPollFrames (copy), var27 (write)
		if fFlagExpChatTabShortcutNav then
			local var35 = false
			
			local function _()
				-- upvalues: var1 (copy), userInputService (copy)
				return var1.getIsChatFocused() and not var1.getIsTabBarFocused() or userInputService:GetFocusedTextBox() ~= nil
			end
			
			local var36 = createEffect(function(p2)
				-- upvalues: var1 (copy), p1 (copy), fFlagExpChatUseChannelTabsStore (copy), var9 (copy), var32 (copy), var35 (write), expChatTabNavFocusPollDelayFrames (copy), runService (copy), expChatTabNavFocusPollFrames (copy), userInputService (copy), var27 (copy)
				local tabNavFocusRequestTime = var1.getTabNavFocusRequestTime(p2)
				local tabNavFocusTabName = var1.getTabNavFocusTabName(p2)
				
				if tabNavFocusRequestTime == nil then return end
				local var37 = if tabNavFocusTabName then p1.allChannelTabs[tabNavFocusTabName] else nil
				
				if var37 == nil then
					var1.clearTabNavFocusRequest()
					
					return
				end
				var9(var32 < (if fFlagExpChatUseChannelTabsStore then var37.tabIndex else var37.TabIndex))
				
				local function _()
					-- upvalues: var35 (copy), var1 (copy), tabNavFocusRequestTime (ref)
					return var35 or var1.getTabNavFocusRequestTime(false) ~= tabNavFocusRequestTime
				end
				
				task.spawn(function()
					-- upvalues: expChatTabNavFocusPollDelayFrames (copy), runService (copy), var35 (copy), var1 (copy), tabNavFocusRequestTime (ref), expChatTabNavFocusPollFrames (copy), userInputService (copy), var27 (copy), tabNavFocusTabName (ref)
					for _ = 1, expChatTabNavFocusPollDelayFrames do
						runService.Heartbeat:Wait()
						
						if not var35 and var1.getTabNavFocusRequestTime(false) == tabNavFocusRequestTime then
							continue
						end
						return
					end
					for i = 1, expChatTabNavFocusPollFrames do
						if i > 1 then
							runService.Heartbeat:Wait()
						end
						if not var35 and var1.getTabNavFocusRequestTime(false) == tabNavFocusRequestTime then
							if var1.getIsChatFocused() and not var1.getIsTabBarFocused() or userInputService:GetFocusedTextBox() ~= nil then
								continue
							end
							var27(tabNavFocusTabName)
							var1.clearTabNavFocusRequest()
							
							return
						end
						return
					end
					if not var35 and var1.getTabNavFocusRequestTime(false) == tabNavFocusRequestTime then
						var1.clearTabNavFocusRequest()
					end
				end)
			end)
			
			return function()
				-- upvalues: var35 (write), var36 (ref)
				var35 = true
				var36()
			end
		end
	end, { var32, p1.allChannelTabs })
	reactModule.useEffect(function()
		-- upvalues: fFlagExpChatTabShortcutNav (copy), var26 (write), var25 (ref), var18 (ref), var27 (write), p1 (ref)
		if not fFlagExpChatTabShortcutNav or var26 == nil then return end
		local var37 = var25.current[var26]
		
		if var37 then
			var18(var37)
			var27(nil)
			
			return
		elseif p1.allChannelTabs[var26] == nil then
			var27(nil)
		end
	end, { var26, var8, p1.allChannelTabs, var18 })
	local var37 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagExpChatUseChannelTabsStore (copy), var32 (ref)
		for i, v in pairs(p1.allChannelTabs) do
			if var32 < (if fFlagExpChatUseChannelTabsStore then v.tabIndex else v.TabIndex) and v.HasUnreadMessages then
				return true
			end
		end
		return false
	end, if fFlagExpChatEnableFriendsTab then { var32, p1.allChannelTabs } else nil)
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
		local var38
		local var39 = if fFlagExpChatUseChannelTabsStore then v.tabIndex else v.TabIndex
		local var40 = var39 <= var32
		local var41 = p1.allTextChannels[i_1]
		local var42 = if fFlagExpChatUseChannelTabsStore then v.type else v.Type
		local createElement = reactModule.createElement
		local t_2 = {
			channelTabsSettings = p1.channelTabsSettings,
			channelName = i_1,
			textChannel = var41,
			tabType = var42,
			hasUnreadMessages = v.HasUnreadMessages
		}
		
		if var39 >= var32 then
			var38 = var31 and var39 < var4
		end
		t_2.isDividerVisible = var38
		t_2.isTabCollapsed = not var40
		t_2.isTabSelected = p1.selectedTabName and p1.selectedTabName == i_1
		t_2.tabIndex = var39
		t_2.isTabVisibleToUser = var40 or var8
		t_2.isLayoutReady = var13
		t_2.tabRef = if fFlagExpChatTabShortcutNav then function(p2)
			-- upvalues: var25 (ref), i_1 (ref)
			var25.current[i_1] = p2
		end else nil
		
		function t_2.onTabSelected()
			-- upvalues: expChatPerfTracker (copy), i_1 (ref), fFlagExpChatPerfTrackerTabName (copy), var40 (ref), var16 (ref), var17 (ref), var18 (ref), analytics (copy), var42 (ref), var39 (ref), v (ref), p1 (ref), var2 (copy), var41 (ref), var9 (ref)
			expChatPerfTracker.cancelAll()
			expChatPerfTracker.start(expChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = i_1 }, if fFlagExpChatPerfTrackerTabName then { tabName = i_1 } else nil)
			
			if not var40 and var16 and var17.current then
				var18(var17.current)
			end
			analytics:TelemetryLogEvent(analytics.ExpChatTabClickedConfig, {
				name = i_1,
				type = var42 or "Unknown",
				index = var39,
				in_overflow = not var40,
				badge_count = if v.HasUnreadMessages then 1 else 0,
				previous_tab_name = p1.selectedTabName
			}, var2)
			p1.onTabSelected(var41, not var40, i_1, var42)
			var9(false)
		end
		
		function t_2.setTransparency(value)
			-- upvalues: setTransparency (copy), p1 (ref)
			return setTransparency(value, p1.transparencyValue)
		end
		
		createElement = createElement(channelTabModule, t_2)
		
		if var40 then
			t[var39] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var33, 1, 0),
				LayoutOrder = var39
			}, { ChannelTab = createElement })
		else
			local var43 = var39 - var32
			t_1[var43] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = var43
			}, { ChannelTab = createElement })
		end
	end
	local channelTabsConfiguration = textChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local channelTabsSettings = p1.channelTabsSettings
	local backgroundTransparency = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundTransparency
	local backgroundColor3 = useInterpolatedClientSettingsModule(channelTabsSettings).BackgroundColor3
	local createElement = reactModule.createElement
	local var44 = "Frame"
	local t_2 = {
		Size = UDim2.new(1, 0, 0, configModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p1.visible,
		BorderSizePixel = 0,
		ZIndex = 3,
		ref = if fFlagExpChatTabShortcutNav then var22 else nil,
		[reactModule.Event.MouseEnter] = p1.onHovered,
		[reactModule.Event.MouseLeave] = p1.onUnhovered,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var12 (ref), var15 (write), channelTabsConfiguration (ref)
			var12(p2.AbsoluteSize.X)
			var15(true)
			
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
	local var45 = "Frame"
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
			Selectable = true,
			ImageColor3 = backgroundColor3,
			ImageTransparency = p1.transparencyValue:map(function(p2)
				-- upvalues: backgroundTransparency (ref)
				return if backgroundTransparency == nil then 1 else backgroundTransparency + p2 * (1 - backgroundTransparency)
			end),
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 8),
			SliceCenter = Rect.new(8, 8, 24, 32),
			SelectionImageObject = var19,
			ref = p1.topBorderRef
		})
	}
	local createElement_2 = reactModule.createElement
	local var46 = "Frame"
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
	t_5.BottomBorder = createElement_2(var46, t_6)
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
	t_3.HorizontalBar = createElement_1(var45, t_4, t_5)
	local var47 = var31
	
	if var47 then
		var47 = reactModule.createElement
		local var48 = "Frame"
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
		local var50 = if var6 then 0.3 else 1
		t_9.BackgroundTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var50 (ref)
			return if var50 == nil then 1 else var50 + p2 * (1 - var50)
		end)
		t_9.BackgroundColor3 = color_1
		t_9.Text = ""
		t_9.BorderSizePixel = 0
		t_9.Selectable = true
		t_9.SelectionImageObject = var20
		t_9.ref = var17
		
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
		local var51 = imageSetLabel
		local t_11 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.6, 0.6),
			Image = cycleDown,
			ImageColor3 = color
		}
		local var52 = 0
		t_11.ImageTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var52 (ref)
			return if var52 == nil then 1 else var52 + p2 * (1 - var52)
		end)
		t_11.ScaleType = Enum.ScaleType.Stretch
		t_10.DropdownIconImage = createElement_4(var51, t_11)
		t_8.TextButton = createElement_3(var49, t_9, t_10)
		local var53 = var37
		
		if var53 then
			var53 = reactModule.createElement
			local var54 = "Frame"
			local t_12 = {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = configModule.ChannelTabsSettings.UnreadDotColor3
			}
			local var55 = 0
			t_12.BackgroundTransparency = p1.transparencyValue:map(function(p2)
				-- upvalues: var55 (ref)
				return if var55 == nil then 1 else var55 + p2 * (1 - var55)
			end)
			var53 = var53(var54, t_12, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		t_8.UnreadDot = var53
		var47 = var47(var48, t_7, t_8)
	end
	t_3.DropdownButton = var47
	local var56 = var31
	
	if var56 then
		var56 = reactModule.createElement
		local var57 = "Frame"
		local t_7 = {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, configModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, var34),
			Visible = var8
		}
		local t_8 = {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, var5) })
		}
		local createElement_3 = reactModule.createElement
		local var58 = "UIStroke"
		local t_9 = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = configModule.ChannelTabsSettings.BorderColor3
		}
		local borderTransparency_1 = configModule.ChannelTabsSettings.BorderTransparency
		t_9.Transparency = p1.transparencyValue:map(function(p2)
			-- upvalues: borderTransparency_1 (ref)
			return if borderTransparency_1 == nil then 1 else borderTransparency_1 + p2 * (1 - borderTransparency_1)
		end)
		t_8.Border = createElement_3(var58, t_9)
		local createElement_4 = reactModule.createElement
		local var59 = "ScrollingFrame"
		local t_10 = {
			ScrollBarThickness = 4,
			ClipsDescendants = true,
			Selectable = false,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(0, 150, 0, var34)
		}
		local var60 = 0
		t_10.BackgroundTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var60 (ref)
			return if var60 == nil then 1 else var60 + p2 * (1 - var60)
		end)
		local var61 = 0
		t_10.ScrollBarImageTransparency = p1.transparencyValue:map(function(p2)
			-- upvalues: var61 (ref)
			return if var61 == nil then 1 else var61 + p2 * (1 - var61)
		end)
		t_10.ScrollingDirection = Enum.ScrollingDirection.Y
		t_10.ElasticBehavior = Enum.ElasticBehavior.Always
		t_8.ScrollView = createElement_4(var59, t_10, t_1)
		var56 = var56(var57, t_7, t_8)
	end
	t_3.DropdownMenu = var56
	
	return createElement(var44, t_2, t_3)
end