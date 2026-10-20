local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ConfigModule = require(ExpChat.Config)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local CreateEffectFunction = require(Parent.Signals).createEffect
local UIBloxModule = require(Parent.UIBlox)
local Analytics = require(Parent.ExpChatShared).Analytics
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseInterpolatedClientSettingsModule = require(ExpChat.ClientSettings.useInterpolatedClientSettings)
local v1 = require(ExpChat.Stores.GetFocusNavigationStore)(false)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local FFlagExpChatUseChannelTabsStore = require(Parent.SharedFlags).FFlagExpChatUseChannelTabsStore
local FFlagExpChatTabShortcutNav = require(Parent.SharedFlags).FFlagExpChatTabShortcutNav
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local FFlagExpChatPerfTrackerTabName = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatPerfTrackerTabName
local GetChatLayoutStoreModule = require(ExpChat.Stores.GetChatLayoutStore)
local ChannelTabModule = require(script.Parent.Parent.ChannelTab)
local JoinResult = require(Parent.Cryo).List.join(Analytics.DefaultStandardizedFields, { "addPlaceInstanceId" }, if require(ExpChat.Flags.FFlagGlobalTextChatAddPlaySessionField) then { "addPlaySessionId" } else {})
local IconsNavigationCycleDown = UIBloxModule.App.ImageSet.Images["icons/navigation/cycleDown"]
local _Color3 = Color3.fromRGB(255, 255, 255)
local _Color3_1 = Color3.fromRGB(100, 100, 100)
local ExpChatTabNavFocusPollDelayFrames = game:DefineFastInt("ExpChatTabNavFocusPollDelayFrames", 3)
local ExpChatTabNavFocusPollFrames = game:DefineFastInt("ExpChatTabNavFocusPollFrames", 4)

local function _(List): number
	local Count = 0
	
	for _ in pairs(List) do
		Count += 1
	end
	return Count
end

local function setTransparency(p1, TransparencyValue)
	return TransparencyValue:map(function(p2): number
		-- upvalues: p1 (copy)
		return if p1 == nil then 1 else p1 + p2 * (1 - p1)
	end)
end

return function(p1)
	-- upvalues: ConfigModule (copy), ReactModule (copy), SignalsReactModule (copy), GetChatLayoutStoreModule (copy), v1 (copy), ReactFocusNavigationModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), FFlagExpChatTabShortcutNav (copy), UserInputService (copy), CreateEffectFunction (copy), FFlagExpChatUseChannelTabsStore (copy), ExpChatTabNavFocusPollDelayFrames (copy), RunService (copy), ExpChatTabNavFocusPollFrames (copy), FFlagExpChatEnableFriendsTab (copy), ChannelTabModule (copy), ExpChatPerfTracker (copy), FFlagExpChatPerfTrackerTabName (copy), Analytics (copy), JoinResult (copy), setTransparency (copy), TextChatService (copy), UseInterpolatedClientSettingsModule (copy), _Color3_1 (copy), ImageSetLabel (copy), IconsNavigationCycleDown (copy), _Color3 (copy)
	local Count = 0
	
	for _ in pairs(p1.allChannelTabs) do
		Count += 1
	end
	local Count1: number = Count
	local ScaledScale = ConfigModule.ChatWindowSize.Y.Scale * p1.chatWindowSettings.HeightScale * ConfigModule.ChatWindowMaxWidth
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetChatLayoutStoreModule(false).getChatWindowWidth)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1024)
	local UseStateResult2_3 = nil
	local UseStateResult4
	UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(v1.getChatInputBarFocused)
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.Invisible)
	local UseSelectionCursorResult1 = UseSelectionCursorFunction(CursorKind.RoundedSlot)
	local v2 = nil
	local v3 = nil
	
	if FFlagExpChatTabShortcutNav then
		v2, v50 = ReactModule.useState(nil)
	end
	local UseRefResult1 = if FFlagExpChatTabShortcutNav then ReactModule.useRef({}) else nil
	local v4 = nil
	local Callback = nil
	
	if FFlagExpChatTabShortcutNav then
		v4, Callback = ReactModule.useState(nil)
	end
	local UseSignalStateResult2 = UseSignalStateResult or UseStateResult3
	local IsUseSignalStateResultBelow = UseSignalStateResult2 < Count1 * ConfigModule.ChannelTabsSettings.MinTabWidth
	local Floored = if IsUseSignalStateResultBelow then math.floor((UseSignalStateResult2 - ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth) / ConfigModule.ChannelTabsSettings.MinTabWidth) else Count1 or math.floor((UseSignalStateResult2 - ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth) / ConfigModule.ChannelTabsSettings.MinTabWidth)
	local XOffset = (UseSignalStateResult2 - (IsUseSignalStateResultBelow and ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth or 0)) / Floored
	local YOffset = (Count1 - Floored) * 40
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTabShortcutNav (upval), v1 (upval), p1 (copy)
		if not FFlagExpChatTabShortcutNav then return end
		v1.setTabBarVisible(p1.visible)
		
		return function()
			-- upvalues: v1 (upval)
			v1.setTabBarVisible(false)
		end
	end, { p1.visible })
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTabShortcutNav (upval), v1 (upval), v2 (ref)
		if not FFlagExpChatTabShortcutNav then return end
		v1.setTabBarRoot(v2)
		
		return function()
			-- upvalues: v1 (upval)
			v1.setTabBarRoot(nil)
		end
	end, { v2 })
	
	local function _(): boolean
		-- upvalues: v1 (upval), UserInputService (upval)
		return v1.getIsChatFocused() and not v1.getIsTabBarFocused() or UserInputService:GetFocusedTextBox() ~= nil
	end
	
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTabShortcutNav (upval), CreateEffectFunction (upval), v1 (upval), p1 (copy), FFlagExpChatUseChannelTabsStore (upval), UseStateResult2_1 (copy), Floored (copy), ExpChatTabNavFocusPollDelayFrames (upval), RunService (upval), ExpChatTabNavFocusPollFrames (upval), UserInputService (upval), Callback (ref)
		if not FFlagExpChatTabShortcutNav then return end
		local Flag = false
		local Effect = CreateEffectFunction(function(p2)
			-- upvalues: v1 (upval), p1 (upval), FFlagExpChatUseChannelTabsStore (upval), UseStateResult2_1 (upval), Floored (upval), Flag (ref), ExpChatTabNavFocusPollDelayFrames (upval), RunService (upval), ExpChatTabNavFocusPollFrames (upval), UserInputService (upval), Callback (upval)
			local TabNavFocusRequestTime = v1.getTabNavFocusRequestTime(p2)
			local TabNavFocusTabName = v1.getTabNavFocusTabName(p2)
			
			if TabNavFocusRequestTime == nil then return end
			local AllChannelTab = if TabNavFocusTabName then p1.allChannelTabs[TabNavFocusTabName] else nil
			
			if AllChannelTab == nil then
				v1.clearTabNavFocusRequest()
				
				return
			else
				UseStateResult2_1(Floored < (if FFlagExpChatUseChannelTabsStore then AllChannelTab.tabIndex else AllChannelTab.TabIndex))
				
				local function _()
					-- upvalues: Flag (upval), v1 (upval), TabNavFocusRequestTime (copy)
					return Flag or v1.getTabNavFocusRequestTime(false) ~= TabNavFocusRequestTime
				end
				
				task.spawn(function()
					-- upvalues: ExpChatTabNavFocusPollDelayFrames (upval), RunService (upval), Flag (upval), v1 (upval), TabNavFocusRequestTime (copy), ExpChatTabNavFocusPollFrames (upval), UserInputService (upval), Callback (upval), TabNavFocusTabName (copy)
					for _ = 1, ExpChatTabNavFocusPollDelayFrames do
						RunService.Heartbeat:Wait()
						
						if Flag or v1.getTabNavFocusRequestTime(false) ~= TabNavFocusRequestTime then return end
					end
					for i = 1, ExpChatTabNavFocusPollFrames do
						if i > 1 then
							RunService.Heartbeat:Wait()
						end
						if Flag or v1.getTabNavFocusRequestTime(false) ~= TabNavFocusRequestTime then return end
						if (not v1.getIsChatFocused() or v1.getIsTabBarFocused()) and UserInputService:GetFocusedTextBox() == nil then
							Callback(TabNavFocusTabName)
							v1.clearTabNavFocusRequest()
							
							return
						end
					end
					if not Flag and v1.getTabNavFocusRequestTime(false) == TabNavFocusRequestTime then
						v1.clearTabNavFocusRequest()
					end
				end)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref), Effect (copy)
			Flag = true
			Effect()
		end
	end, { Floored, p1.allChannelTabs })
	ReactModule.useEffect(function()
		-- upvalues: FFlagExpChatTabShortcutNav (upval), v4 (ref), v1 (upval), UserInputService (upval), Callback (ref), UseRefResult1 (copy), UseFocusGuiObjectResult (copy), p1 (copy)
		if not FFlagExpChatTabShortcutNav or v4 == nil then return end
		if v1.getIsChatFocused() and not v1.getIsTabBarFocused() or UserInputService:GetFocusedTextBox() ~= nil then
			Callback(nil)
			
			return
		end
		local CurrentEntry = UseRefResult1.current[v4]
		
		if CurrentEntry then
			UseFocusGuiObjectResult(CurrentEntry)
			Callback(nil)
			
			return
		end
		if p1.allChannelTabs[v4] == nil then
			Callback(nil)
		end
	end, {
		v4,
		UseStateResult1,
		p1.allChannelTabs,
		UseFocusGuiObjectResult
	})
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy), FFlagExpChatUseChannelTabsStore (upval), Floored (copy)
		for _, allChannelTab in pairs(p1.allChannelTabs) do
			if Floored < (if FFlagExpChatUseChannelTabsStore then allChannelTab.tabIndex else allChannelTab.TabIndex) and allChannelTab.HasUnreadMessages then
				return true
			end
		end
		return false
	end, if FFlagExpChatEnableFriendsTab then { Floored, p1.allChannelTabs } else nil)
	local config = {
		["$layout"] = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal
		})
	}
	local config1 = {
		["$layout"] = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical
		})
	}
	
	for ChannelName, allChannelTab in pairs(p1.allChannelTabs) do
		local TabIndex = if FFlagExpChatUseChannelTabsStore then allChannelTab.tabIndex else allChannelTab.TabIndex
		local IsTabIndexBelow = TabIndex <= Floored
		local AllTextChannel = p1.allTextChannels[ChannelName]
		local Type = if FFlagExpChatUseChannelTabsStore then allChannelTab.type else allChannelTab.Type
		local Element = ReactModule.createElement(ChannelTabModule, {
			channelTabsSettings = p1.channelTabsSettings,
			channelName = ChannelName,
			textChannel = AllTextChannel,
			tabType = Type,
			hasUnreadMessages = allChannelTab.HasUnreadMessages,
			isDividerVisible = if TabIndex < Floored then TabIndex < Count1 else IsUseSignalStateResultBelow and TabIndex < Count1,
			isTabCollapsed = not IsTabIndexBelow,
			isTabSelected = p1.selectedTabName and p1.selectedTabName == ChannelName,
			tabIndex = TabIndex,
			isTabVisibleToUser = IsTabIndexBelow or UseStateResult1,
			isLayoutReady = UseStateResult4,
			tabRef = if FFlagExpChatTabShortcutNav then function(p3)
				-- upvalues: UseRefResult1 (copy), ChannelName (copy)
				UseRefResult1.current[ChannelName] = p3
			end else nil,
			onTabSelected = function()
				-- upvalues: ExpChatPerfTracker (upval), ChannelName (copy), FFlagExpChatPerfTrackerTabName (upval), IsTabIndexBelow (copy), UseSignalStateResult1 (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), Analytics (upval), Type (copy), TabIndex (copy), allChannelTab (copy), p1 (copy), JoinResult (upval), AllTextChannel (copy), UseStateResult2_1 (copy)
				ExpChatPerfTracker.cancelAll()
				ExpChatPerfTracker.start(ExpChatPerfTracker.Events.ChatWindowTabSwitchTTI, { tabId = ChannelName }, if FFlagExpChatPerfTrackerTabName then { tabName = ChannelName } else nil)
				
				if not IsTabIndexBelow and UseSignalStateResult1 and UseRefResult.current then
					UseFocusGuiObjectResult(UseRefResult.current)
				end
				Analytics:TelemetryLogEvent(Analytics.ExpChatTabClickedConfig, {
					name = ChannelName,
					type = Type or "Unknown",
					index = TabIndex,
					in_overflow = not IsTabIndexBelow,
					badge_count = if allChannelTab.HasUnreadMessages then 1 else 0,
					previous_tab_name = p1.selectedTabName
				}, JoinResult)
				p1.onTabSelected(AllTextChannel, not IsTabIndexBelow, ChannelName, Type)
				UseStateResult2_1(false)
			end,
			setTransparency = function(p3)
				-- upvalues: setTransparency (upval), p1 (copy)
				return setTransparency(p3, p1.transparencyValue)
			end
		})
		
		if IsTabIndexBelow then
			config[TabIndex] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, XOffset, 1, 0),
				LayoutOrder = TabIndex
			}, { ChannelTab = Element })
		else
			local TabIndexDelta = TabIndex - Floored
			config1[TabIndexDelta] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = TabIndexDelta
			}, { ChannelTab = Element })
		end
	end
	local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local ChannelTabsSettings = p1.channelTabsSettings
	local BackgroundTransparency = UseInterpolatedClientSettingsModule(ChannelTabsSettings).BackgroundTransparency
	local BackgroundColor3 = UseInterpolatedClientSettingsModule(ChannelTabsSettings).BackgroundColor3
	local CreateElementFunction1 = ReactModule.createElement
	local v5 = "Frame"
	local config2 = {
		Size = UDim2.new(1, 0, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p1.visible,
		BorderSizePixel = 0,
		ZIndex = 3,
		ref = if FFlagExpChatTabShortcutNav then v3 else nil,
		[ReactModule.Event.MouseEnter] = p1.onHovered,
		[ReactModule.Event.MouseLeave] = p1.onUnhovered,
		[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
			-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (ref), ChannelTabsConfiguration (copy)
			UseStateResult2_2(Frame.AbsoluteSize.X)
			UseStateResult2_3(true)
			
			if ChannelTabsConfiguration then
				ChannelTabsConfiguration:SetAbsoluteSize(Frame.AbsoluteSize)
			end
		end,
		[ReactModule.Change.AbsolutePosition] = function(Frame)
			-- upvalues: ChannelTabsConfiguration (copy)
			if ChannelTabsConfiguration then
				ChannelTabsConfiguration:SetAbsolutePosition(Frame.AbsolutePosition)
			end
		end
	}
	local BorderTransparency = ConfigModule.ChannelTabsSettings.BorderTransparency
	local config3 = {
		HorizontalBar = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, {
			ContentContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Size = UDim2.fromScale(1, 1)
			}, config),
			TopCorner = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
				BorderSizePixel = 0,
				Selectable = true,
				ImageColor3 = BackgroundColor3,
				ImageTransparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: BackgroundTransparency (copy)
					return if BackgroundTransparency == nil then 1 else BackgroundTransparency + p3 * (1 - BackgroundTransparency)
				end),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 0, 8),
				SliceCenter = Rect.new(8, 8, 24, 32),
				SelectionImageObject = UseSelectionCursorResult,
				ref = p1.topBorderRef
			}),
			BottomBorder = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, -1),
				BackgroundColor3 = ConfigModule.ChannelTabsSettings.BorderColor3,
				BackgroundTransparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: BorderTransparency (copy)
					return if BorderTransparency == nil then 1 else BorderTransparency + p3 * (1 - BorderTransparency)
				end)
			}),
			Background = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
				Position = UDim2.new(0, 0, 0, 8),
				BackgroundColor3 = BackgroundColor3,
				BackgroundTransparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: BackgroundTransparency (copy)
					return if BackgroundTransparency == nil then 1 else BackgroundTransparency + p3 * (1 - BackgroundTransparency)
				end)
			})
		})
	}
	local DropdownButton = IsUseSignalStateResultBelow
	
	if DropdownButton then
		local CreateElementFunction = ReactModule.createElement
		local v6 = "Frame"
		local config4 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 8),
			Size = UDim2.new(0, ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth, 1, -9),
			BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		}
		local v7: number = if UseStateResult then 0.3 else 1
		local v8 = 0
		local config41 = {
			TextButton = ReactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -ConfigModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
				Size = UDim2.new(0, 27, 0, 27),
				BackgroundTransparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: v7 (copy)
					return if v7 == nil then 1 else v7 + p3 * (1 - v7)
				end),
				BackgroundColor3 = _Color3_1,
				Text = "",
				BorderSizePixel = 0,
				Selectable = true,
				SelectionImageObject = UseSelectionCursorResult1,
				ref = UseRefResult,
				[ReactModule.Event.MouseEnter] = function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(true)
				end,
				[ReactModule.Event.MouseLeave] = function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end,
				[ReactModule.Event.Activated] = function()
					-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy)
					UseStateResult2_1(not UseStateResult1)
				end
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 27) }),
				DropdownIconImage = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromScale(0.6, 0.6),
					Image = IconsNavigationCycleDown,
					ImageColor3 = _Color3,
					ImageTransparency = p1.transparencyValue:map(function(p3): number
						-- upvalues: v8 (copy)
						return if v8 == nil then 1 else v8 + p3 * (1 - v8)
					end),
					ScaleType = Enum.ScaleType.Stretch
				})
			})
		}
		local Frame = UseMemoResult
		
		if Frame then
			local v9 = 0
			Frame = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = ConfigModule.ChannelTabsSettings.UnreadDotColor3,
				BackgroundTransparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: v9 (copy)
					return if v9 == nil then 1 else v9 + p3 * (1 - v9)
				end)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		config41.UnreadDot = Frame
		DropdownButton = CreateElementFunction(v6, config4, config41)
	end
	config3.DropdownButton = DropdownButton
	local Frame1 = IsUseSignalStateResultBelow
	
	if Frame1 then
		local BorderTransparency1 = ConfigModule.ChannelTabsSettings.BorderTransparency
		local v10 = 0
		local MapResult = p1.transparencyValue:map(function(p3): number
			-- upvalues: v10 (copy)
			return if v10 == nil then 1 else v10 + p3 * (1 - v10)
		end)
		local v11 = 0
		Frame1 = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -1, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight + 1),
			Size = UDim2.new(0, 150, 0, YOffset),
			Visible = UseStateResult1
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, ScaledScale) }),
			Border = ReactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = ConfigModule.ChannelTabsSettings.BorderColor3,
				Transparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: BorderTransparency1 (copy)
					return if BorderTransparency1 == nil then 1 else BorderTransparency1 + p3 * (1 - BorderTransparency1)
				end)
			}),
			ScrollView = ReactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 4,
				ClipsDescendants = true,
				Selectable = false,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(0, 150, 0, YOffset),
				BackgroundTransparency = MapResult,
				ScrollBarImageTransparency = p1.transparencyValue:map(function(p3): number
					-- upvalues: v11 (copy)
					return if v11 == nil then 1 else v11 + p3 * (1 - v11)
				end),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ElasticBehavior = Enum.ElasticBehavior.Always
			}, config1)
		})
	end
	config3.DropdownMenu = Frame1
	
	return CreateElementFunction1(v5, config2, config3)
end