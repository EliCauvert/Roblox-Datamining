local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local OtterModule = require(Parent.Otter)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagExpChatPresetTrayDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local ConfigModule = require(ExpChat.Config)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local PresetChatContainerModule = require(script.Parent.PresetChatContainer)
local UseAutoTrayHeightModule = require(script.Parent.useAutoTrayHeight)
local SetIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local CompactWidthThreshold = ConfigModule.PresetTray.CompactWidthThreshold
local SlideSpring = ConfigModule.PresetTray.SlideSpring

local function _(): boolean --[[ Line: 31 | Named "isCompactMode" ]]
	-- upvalues: CompactWidthThreshold (copy)
	local CurrentCamera = workspace.CurrentCamera
	
	return if CurrentCamera then CurrentCamera.ViewportSize.X < CompactWidthThreshold else false
end

return ReactModule.memo(function(p1) --[[ Line: 39 | Named "PresetChatTray" ]]
	-- upvalues: GetPresetChatStoreModule (copy), SignalsReactModule (copy), CompactWidthThreshold (copy), FoundationModule (copy), UseAutoTrayHeightModule (copy), ReactModule (copy), GuiService (copy), SetIsPresetTrayOpenModule (copy), OtterModule (copy), SlideSpring (copy), UserInputService (copy), FFlagExpChatPresetTrayDismissAnalyticsModule (copy), ConfigModule (copy), PresetChatContainerModule (copy)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getIsTrayOpen)
	local CurrentCamera = workspace.CurrentCamera
	local IsXBelow: boolean = if CurrentCamera then CurrentCamera.ViewportSize.X < CompactWidthThreshold else false
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseAutoTrayHeightModuleResult, UseAutoTrayHeightModuleResult2 = UseAutoTrayHeightModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(1)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(GuiService.TopbarInset.Height)
	local NewUseAutoTrayHeightModuleResult = UseAutoTrayHeightModuleResult + math.max(0, UseStateResult1 - UseStateResult3 - UseStateResult4)
	ReactModule.useEffect(function() --[[ Line: 57 ]]
		-- upvalues: GuiService (upval), UseStateResult2_3 (copy)
		local Connection = GuiService:GetPropertyChangedSignal("TopbarInset"):Connect(function() --[[ Line: 58 ]]
			-- upvalues: UseStateResult2_3 (upval), GuiService (upval)
			UseStateResult2_3(GuiService.TopbarInset.Height)
		end)
		
		return function() --[[ Line: 61 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 68 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_4 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.Y)
		UseStateResult2_4(Frame.AbsoluteSize.X < Frame.AbsoluteSize.Y)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 73 ]]
		-- upvalues: UseStateResult2_2 (copy), UseAutoTrayHeightModuleResult2 (copy)
		UseStateResult2_2(Frame.AbsoluteSize.Y)
		UseAutoTrayHeightModuleResult2(Frame)
	end, { UseAutoTrayHeightModuleResult2 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 78 ]]
		-- upvalues: SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy)
		SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
	end, { PresetChatStoreModule })
	ReactModule.useEffect(function() --[[ Line: 82 ]]
		-- upvalues: UseSignalStateResult (copy), UseStateResult2 (copy), UseRefResult (copy), OtterModule (upval), UseBindingResult2 (copy), SlideSpring (upval)
		if UseSignalStateResult then
			UseStateResult2(true)
			
			if UseRefResult.current then
				UseRefResult.current:destroy()
			end
			local SingleMotor = OtterModule.createSingleMotor(1)
			UseRefResult.current = SingleMotor
			SingleMotor:onStep(function(p2) --[[ Line: 90 ]]
				-- upvalues: UseBindingResult2 (upval)
				UseBindingResult2(p2)
			end)
			SingleMotor:setGoal(OtterModule.spring(0, SlideSpring))
			
			return
		elseif UseRefResult.current then
			UseRefResult.current:setGoal(OtterModule.spring(1, SlideSpring))
			UseRefResult.current:onComplete(function() --[[ Line: 97 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
		end
	end, { UseSignalStateResult })
	ReactModule.useEffect(function() --[[ Line: 104 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 105 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:destroy()
				UseRefResult.current = nil
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 113 ]]
		-- upvalues: UseSignalStateResult (copy), UserInputService (upval), SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy), GuiService (upval), FFlagExpChatPresetTrayDismissAnalyticsModule (upval)
		if not UseSignalStateResult then return end
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input, _) --[[ Line: 118 ]]
			-- upvalues: SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (upval)
			if Input.KeyCode == Enum.KeyCode.Escape or Input.KeyCode == Enum.KeyCode.ButtonB then
				SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
			end
		end)
		local MenuOpenedConnection = GuiService.MenuOpened:Connect(function() --[[ Line: 124 ]]
			-- upvalues: FFlagExpChatPresetTrayDismissAnalyticsModule (upval), SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (upval)
			if FFlagExpChatPresetTrayDismissAnalyticsModule then
				SetIsPresetTrayOpenModule(PresetChatStoreModule, false)
				
				return
			else
				PresetChatStoreModule.setIsTrayOpen(false)
			end
		end)
		
		return function() --[[ Line: 132 ]]
			-- upvalues: InputBeganConnection (copy), MenuOpenedConnection (copy)
			InputBeganConnection:Disconnect()
			MenuOpenedConnection:Disconnect()
		end
	end, {
		UseSignalStateResult,
		PresetChatStoreModule,
		SetIsPresetTrayOpenModule
	})
	
	return if UseStateResult then ReactModule.createElement(ReactModule.Fragment, nil, {
		OuterScreenGui = ReactModule.createElement("ScreenGui", {
			DisplayOrder = 9,
			ScreenInsets = Enum.ScreenInsets.None,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			SizeTracker = ReactModule.createElement("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				[ReactModule.Change.AbsoluteSize] = UseResult
			}),
			FullFrame = if UseStateResult5 then nil else ReactModule.createElement(FoundationModule.View, {
				tag = "bg-surface-200",
				AnchorPoint = Vector2.new(0, 1),
				Position = UseBindingResult:map(function(p2): UDim2 --[[ Line: 156 ]]
					-- upvalues: NewUseAutoTrayHeightModuleResult (copy)
					return UDim2.new(0, 0, 1, (math.round(p2 * NewUseAutoTrayHeightModuleResult)))
				end),
				Size = UDim2.new(1, 0, 0, NewUseAutoTrayHeightModuleResult)
			})
		}),
		InnerScreenGui = ReactModule.createElement("ScreenGui", {
			DisplayOrder = 10,
			ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Backdrop = ReactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				Position = UDim2.fromScale(0, 0),
				Size = UDim2.fromScale(1, 1),
				Text = "",
				ZIndex = 1,
				[ReactModule.Event.Activated] = UseResult2,
				[ReactModule.Change.AbsoluteSize] = UseResult1
			}),
			Tray = ReactModule.createElement(FoundationModule.View, {
				tag = "stroke-standard stroke-default bg-surface-200",
				ClipsDescendants = true,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UseBindingResult:map(function(p2): UDim2 --[[ Line: 181 ]]
					-- upvalues: UseAutoTrayHeightModuleResult (copy)
					return UDim2.new(0, 0, 1, (math.round(p2 * UseAutoTrayHeightModuleResult)))
				end),
				Size = UDim2.new(1, 0, 0, UseAutoTrayHeightModuleResult)
			}, {
				Handle = ReactModule.createElement(FoundationModule.View, {
					ZIndex = 2,
					tag = "bg-divider radius-full",
					Size = UDim2.new(0, ConfigModule.PresetTray.HandleWidth, 0, UseTokensResult.Padding.XSmall),
					AnchorPoint = Vector2.new(0.5, 0),
					Position = UDim2.new(0.5, 0, 0, UseTokensResult.Padding.XSmall)
				}),
				Content = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy",
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromScale(0, 0)
				}, {
					Container = ReactModule.createElement(PresetChatContainerModule, {
						shouldShowKeyboardButton = true,
						textChannel = p1.textChannel,
						compact = IsXBelow,
						onSendChat = p1.onSendChat,
						onSendGlobalChat = p1.onSendGlobalChat
					})
				})
			})
		})
	}) else nil
end)