local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ConfigModule = require(ExpChat.Config)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local SignalsReactModule = require(Parent.SignalsReact)
local UIBloxModule = require(Parent.UIBlox)
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseInterpolatedClientSettingsModule = require(ExpChat.ClientSettings.useInterpolatedClientSettings)
local FFlagExpChatFocusChannelBarSupportModule = require(ExpChat.Flags.FFlagExpChatFocusChannelBarSupport)
local FFlagExpChatChannelBarDropdownZIndexFixModule = require(ExpChat.Flags.FFlagExpChatChannelBarDropdownZIndexFix)
local v1 = require(ExpChat.Stores.GetFocusNavigationStore)(false)
local FFlagExpChatPerfTracking = require(Parent.SharedFlags).FFlagExpChatPerfTracking
local FFlagExpChatChannelTabRefactor = require(Parent.SharedFlags).FFlagExpChatChannelTabRefactor
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local ExpChatPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.ExpChatPerfTracker
local ChannelTabModule = require(script.Parent.Parent.ChannelTab)
local IconsNavigationCycleDown = UIBloxModule.App.ImageSet.Images["icons/navigation/cycleDown"]
local _Color3 = Color3.fromRGB(255, 255, 255)
local _Color3_1 = Color3.fromRGB(100, 100, 100)

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
	-- upvalues: ConfigModule (copy), ReactModule (copy), FFlagExpChatFocusChannelBarSupportModule (copy), SignalsReactModule (copy), v1 (copy), ReactFocusNavigationModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), FFlagExpChatEnableFriendsTab (copy), FFlagExpChatChannelTabRefactor (copy), ChannelTabModule (copy), FFlagExpChatPerfTracking (copy), ExpChatPerfTracker (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), setTransparency (copy), TextChatService (copy), UseInterpolatedClientSettingsModule (copy), FFlagExpChatChannelBarDropdownZIndexFixModule (copy), _Color3_1 (copy), ImageSetLabel (copy), IconsNavigationCycleDown (copy), _Color3 (copy)
	local Count = 0
	
	for _ in pairs(p1.allChannelTabs) do
		Count += 1
	end
	local Count1: number = Count
	local ScaledScale = ConfigModule.ChatWindowSize.Y.Scale * p1.chatWindowSettings.HeightScale * ConfigModule.ChatWindowMaxWidth
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(1024)
	local UseSignalStateResult = if FFlagExpChatFocusChannelBarSupportModule then SignalsReactModule.useSignalState(v1.getChatInputBarFocused) else nil
	local UseRefResult = if FFlagExpChatFocusChannelBarSupportModule then ReactModule.useRef(nil) else nil
	local UseFocusGuiObjectResult = if FFlagExpChatFocusChannelBarSupportModule then ReactFocusNavigationModule.useFocusGuiObject() else nil
	local UseSelectionCursorResult = if FFlagExpChatFocusChannelBarSupportModule then UseSelectionCursorFunction(CursorKind.Invisible) else nil
	local UseSelectionCursorResult1 = if FFlagExpChatFocusChannelBarSupportModule then UseSelectionCursorFunction(CursorKind.RoundedSlot) else nil
	local IsUseStateResultBelow = UseStateResult3 < Count1 * ConfigModule.ChannelTabsSettings.MinTabWidth
	local Floored = if IsUseStateResultBelow then math.floor((UseStateResult3 - ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth) / ConfigModule.ChannelTabsSettings.MinTabWidth) else Count1 or math.floor((UseStateResult3 - ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth) / ConfigModule.ChannelTabsSettings.MinTabWidth)
	local XOffset = (UseStateResult3 - (IsUseStateResultBelow and ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth or 0)) / Floored
	local YOffset = (Count1 - Floored) * 40
	local UseMemoResult = ReactModule.useMemo(function(): boolean
		-- upvalues: p1 (copy), Floored (copy)
		for _, allChannelTab in pairs(p1.allChannelTabs) do
			if Floored < allChannelTab.TabIndex and allChannelTab.HasUnreadMessages then
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
		local IsTabIndexBelow = allChannelTab.TabIndex <= Floored
		local AllTextChannel = p1.allTextChannels[ChannelName]
		local Type = if FFlagExpChatChannelTabRefactor then allChannelTab.Type else nil
		local Element1 = ReactModule.createElement(ChannelTabModule, {
			channelTabsSettings = p1.channelTabsSettings,
			channelName = ChannelName,
			textChannel = AllTextChannel,
			tabType = Type,
			hasUnreadMessages = allChannelTab.HasUnreadMessages,
			isDividerVisible = if allChannelTab.TabIndex < Floored then allChannelTab.TabIndex < Count1 else IsUseStateResultBelow and allChannelTab.TabIndex < Count1,
			isTabCollapsed = not IsTabIndexBelow,
			isTabSelected = p1.selectedTabName and p1.selectedTabName == ChannelName,
			onTabSelected = function()
				-- upvalues: FFlagExpChatPerfTracking (upval), ExpChatPerfTracker (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatChannelTabRefactor (upval), ChannelName (copy), AllTextChannel (copy), IsTabIndexBelow (copy), UseSignalStateResult (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy), p1 (copy), Type (copy), UseStateResult2_1 (copy)
				if FFlagExpChatPerfTracking then
					ExpChatPerfTracker.cancelAll()
					ExpChatPerfTracker.start(ExpChatPerfTracker.Events.ChatWindowTabSwitchTTI, {
						tabId = if GetFFlagTextChatEnableUniverseChatTabsFunction() or FFlagExpChatChannelTabRefactor then ChannelName elseif AllTextChannel then AllTextChannel.Name else nil
					})
				end
				if not IsTabIndexBelow and UseSignalStateResult and UseRefResult.current then
					UseFocusGuiObjectResult(UseRefResult.current)
				end
				p1.onTabSelected(AllTextChannel, not IsTabIndexBelow, ChannelName, Type)
				UseStateResult2_1(false)
			end,
			setTransparency = function(p2)
				-- upvalues: setTransparency (upval), p1 (copy)
				return setTransparency(p2, p1.transparencyValue)
			end
		})
		
		if IsTabIndexBelow then
			config[allChannelTab.TabIndex] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, XOffset, 1, 0),
				LayoutOrder = allChannelTab.TabIndex
			}, { ChannelTab = Element1 })
		else
			local TabIndexDelta = allChannelTab.TabIndex - Floored
			config1[TabIndexDelta] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 40),
				LayoutOrder = TabIndexDelta
			}, { ChannelTab = Element1 })
		end
	end
	local ChannelTabsConfiguration = TextChatService:FindFirstChildOfClass("ChannelTabsConfiguration")
	local ChannelTabsSettings = p1.channelTabsSettings
	local BackgroundTransparency = UseInterpolatedClientSettingsModule(ChannelTabsSettings).BackgroundTransparency
	local BackgroundColor3 = UseInterpolatedClientSettingsModule(ChannelTabsSettings).BackgroundColor3
	local CreateElementFunction1 = ReactModule.createElement
	local v2 = "Frame"
	local config2 = {
		Size = UDim2.new(1, 0, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight),
		BackgroundTransparency = 1,
		Visible = p1.visible,
		BorderSizePixel = 0,
		ZIndex = if FFlagExpChatChannelBarDropdownZIndexFixModule then 3 else nil,
		[ReactModule.Event.MouseEnter] = p1.onHovered,
		[ReactModule.Event.MouseLeave] = p1.onUnhovered,
		[ReactModule.Change.AbsoluteSize] = function(Frame: Frame)
			-- upvalues: UseStateResult2_2 (copy), ChannelTabsConfiguration (copy)
			UseStateResult2_2(Frame.AbsoluteSize.X)
			
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
	local BorderTransparency1 = ConfigModule.ChannelTabsSettings.BorderTransparency
	local config3 = {
		HorizontalBar = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1)
		}, {
			ContentContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1)
			}, config),
			TopCorner = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/TopRoundedRect8px.png",
				BorderSizePixel = 0,
				ImageColor3 = BackgroundColor3,
				ImageTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BackgroundTransparency (copy)
					return if BackgroundTransparency == nil then 1 else BackgroundTransparency + p2 * (1 - BackgroundTransparency)
				end),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 0, 8),
				SliceCenter = Rect.new(8, 8, 24, 32),
				Selectable = if FFlagExpChatFocusChannelBarSupportModule then true else nil,
				SelectionImageObject = UseSelectionCursorResult,
				ref = if FFlagExpChatFocusChannelBarSupportModule then p1.topBorderRef else nil
			}),
			BottomBorder = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, -1),
				BackgroundColor3 = ConfigModule.ChannelTabsSettings.BorderColor3,
				BackgroundTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BorderTransparency1 (copy)
					return if BorderTransparency1 == nil then 1 else BorderTransparency1 + p2 * (1 - BorderTransparency1)
				end)
			}),
			Background = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, ConfigModule.ChannelTabsSettings.HorizontalBarHeight - 8 - 1),
				Position = UDim2.new(0, 0, 0, 8),
				BackgroundColor3 = BackgroundColor3,
				BackgroundTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BackgroundTransparency (copy)
					return if BackgroundTransparency == nil then 1 else BackgroundTransparency + p2 * (1 - BackgroundTransparency)
				end)
			})
		})
	}
	local Element = IsUseStateResultBelow
	
	if Element then
		local CreateElementFunction = ReactModule.createElement
		local v3 = "Frame"
		local config4 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 8),
			Size = UDim2.new(0, ConfigModule.ChannelTabsSettings.DropdownIconContainerWidth, 1, -9),
			BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		}
		local v4: number = if UseStateResult then 0.3 else 1
		local v5 = 0
		local config41 = {
			TextButton = ReactModule.createElement("TextButton", {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -ConfigModule.ChannelTabsSettings.DropdownIconPadding / 2, 0.5, -4),
				Size = UDim2.new(0, 27, 0, 27),
				BackgroundTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: v4 (copy)
					return if v4 == nil then 1 else v4 + p2 * (1 - v4)
				end),
				BackgroundColor3 = _Color3_1,
				Text = "",
				BorderSizePixel = 0,
				Selectable = if FFlagExpChatFocusChannelBarSupportModule then true else nil,
				SelectionImageObject = UseSelectionCursorResult1,
				ref = if FFlagExpChatFocusChannelBarSupportModule then UseRefResult else nil,
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
					ImageTransparency = p1.transparencyValue:map(function(p2): number
						-- upvalues: v5 (copy)
						return if v5 == nil then 1 else v5 + p2 * (1 - v5)
					end),
					ScaleType = Enum.ScaleType.Stretch
				})
			})
		}
		local Frame = UseMemoResult
		
		if Frame then
			local v6 = 0
			Frame = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, 8, 0, 8),
				Position = UDim2.new(0, 18, 0.5, -4),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = ConfigModule.ChannelTabsSettings.UnreadDotColor3,
				BackgroundTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: v6 (copy)
					return if v6 == nil then 1 else v6 + p2 * (1 - v6)
				end)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		end
		config41.UnreadDot = Frame
		Element = CreateElementFunction(v3, config4, config41)
	end
	config3.DropdownButton = Element
	local Frame1 = IsUseStateResultBelow
	
	if Frame1 then
		local BorderTransparency = ConfigModule.ChannelTabsSettings.BorderTransparency
		local v7 = 0
		local MapResult = p1.transparencyValue:map(function(p2): number
			-- upvalues: v7 (copy)
			return if v7 == nil then 1 else v7 + p2 * (1 - v7)
		end)
		local v8 = 0
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
				Transparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: BorderTransparency (copy)
					return if BorderTransparency == nil then 1 else BorderTransparency + p2 * (1 - BorderTransparency)
				end)
			}),
			ScrollView = ReactModule.createElement("ScrollingFrame", {
				ScrollBarThickness = 4,
				ClipsDescendants = true,
				BorderSizePixel = 0,
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(0, 150, 0, YOffset),
				BackgroundTransparency = MapResult,
				ScrollBarImageTransparency = p1.transparencyValue:map(function(p2): number
					-- upvalues: v8 (copy)
					return if v8 == nil then 1 else v8 + p2 * (1 - v8)
				end),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				Selectable = not FFlagExpChatFocusChannelBarSupportModule and nil
			}, config1)
		})
	end
	config3.DropdownMenu = Frame1
	
	return CreateElementFunction1(v2, config2, config3)
end