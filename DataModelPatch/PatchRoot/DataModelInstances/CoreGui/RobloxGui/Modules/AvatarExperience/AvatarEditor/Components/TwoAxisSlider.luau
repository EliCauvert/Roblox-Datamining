local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OtterModule = require(CorePackages.Packages.Otter)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local GamepadUtils = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UseInitializedValueFunction = require(CorePackages.Packages.ReactUtils).useInitializedValue
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local Colors = UIBloxModule.App.Style.Colors
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local FFlagAXFixBodyScaleReduxUpdatesModule = require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates)
local AXFixMissingThumbstickInputObject = game:DefineFastFlag("AXFixMissingThumbstickInputObject", false)
local ComponentAssetsDropshadow28 = Images["component_assets/dropshadow_28"]
local ComponentAssetsCircle29 = Images["component_assets/circle_29"]
local White = Colors.White
local Pumice = Colors.Pumice
local Pumice1 = Colors.Pumice
local v1: number = if FFlagAXFixBodyScaleReduxUpdatesModule then 0.5 else 0.7
local v2: number = if FFlagAXFixBodyScaleReduxUpdatesModule then 0.2 else 0.5
local config = { frequency = 5 }
local t = {}

local function getInputObjects()
	-- upvalues: UserInputService (copy), t (ref)
	local LastInputType = UserInputService:GetLastInputType()
	
	if t[LastInputType] == nil then
		local Inputs = {}
		
		for _, Input in ipairs((UserInputService:GetGamepadState(LastInputType))) do
			Inputs[Input.KeyCode] = Input
		end
		t[LastInputType] = Inputs
	end
	return t[LastInputType]
end

local function useFocusNavigationBindings(UseRefResult, UseMemoResult, Callback, UseResult)
	-- upvalues: ReactFocusNavigationModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), Callback (copy), InputHandlersModule (upval), UseResult (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = if Callback then {
				handler = InputHandlersModule.onRelease(function(p1)
					-- upvalues: Callback (upval)
					p1.cancelled = true
					Callback()
				end)
			} else nil,
			[FocusNavigationEventNameEnum.ToggleGamepadInput] = { handler = InputHandlersModule.onRelease(UseResult) }
		}
	end, { Callback, UseResult }), (ReactFocusNavigationModule.useEventMap(UseMemoResult, UseRefResult)))
end

return function(p1)
	-- upvalues: ReactModule (copy), OtterModule (copy), UseInitializedValueFunction (copy), config (copy), UserInputService (copy), AXFixMissingThumbstickInputObject (copy), GamepadUtils (copy), UtilsModule (copy), FocusNavigationEventNameEnum (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), RunService (copy), getInputObjects (copy), t (ref), Focusable (copy), ImageSetLabel (copy), ComponentAssetsCircle29 (copy), Pumice1 (copy), White (copy), Pumice (copy), RoactModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), FFlagAXFixBodyScaleReduxUpdatesModule (copy), ComponentAssetsDropshadow28 (copy), v1 (copy), v2 (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(true)
	local UseRefResult6 = ReactModule.useRef(OtterModule.createSingleMotor(0))
	local UseRefResult7 = ReactModule.useRef(OtterModule.createSingleMotor(0))
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseInitializedValueResult = UseInitializedValueFunction(function()
		-- upvalues: ReactModule (upval), UseBindingResult (copy), UseBindingResult1 (copy)
		return ReactModule.joinBindings({ pressed = UseBindingResult, hovered = UseBindingResult1 })
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		if UseRefResult1.current then
			UseRefResult1.current:Disconnect()
			UseRefResult1.current = nil
		end
		if UseRefResult2.current then
			UseRefResult2.current:Disconnect()
			UseRefResult2.current = nil
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult7 (copy), OtterModule (upval), config (upval)
		UseRefResult7.current:setGoal(OtterModule.spring(1, config))
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult7 (copy), OtterModule (upval), config (upval)
		UseRefResult7.current:setGoal(OtterModule.spring(0, config))
	end, {})
	local UseResult3 = ReactModule.useCallback(function(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		local BackgroundAbsolutePosition = p1.getBackgroundAbsolutePosition()
		local BackgroundAbsoluteSize = p1.getBackgroundAbsoluteSize()
		
		if BackgroundAbsolutePosition and BackgroundAbsoluteSize then
			local Position = Input.Position
			p1.setScales(p1.mapPositionToScales((Vector2.new((Position.X - BackgroundAbsolutePosition.X) / BackgroundAbsoluteSize.X, (Position.Y - BackgroundAbsolutePosition.Y) / BackgroundAbsoluteSize.Y))))
		end
	end, {
		p1.getBackgroundAbsolutePosition,
		p1.getBackgroundAbsoluteSize,
		p1.setScales,
		p1.mapPositionToScales
	})
	local UseResult4 = ReactModule.useCallback(function(Input)
		-- upvalues: p1 (copy), UseResult (copy), UseRefResult6 (copy), OtterModule (upval), config (upval)
		if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch then return end
		if p1.onDragEnd then
			p1.onDragEnd()
		end
		UseResult()
		UseRefResult6.current:setGoal(OtterModule.spring(0, config))
	end, { p1.onDragEnd, UseResult })
	local UseResult5 = ReactModule.useCallback(function(_, Input)
		-- upvalues: p1 (copy), UseRefResult1 (copy), UserInputService (upval), UseResult3 (copy), UseRefResult2 (copy), UseResult4 (copy), UseRefResult6 (copy), OtterModule (upval), config (upval)
		local IsUserInputTypeMatch: boolean = Input.UserInputState == Enum.UserInputState.Begin and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch)
		
		if p1.isDisabled or UseRefResult1.current or not IsUserInputTypeMatch then return end
		if p1.onDragStart then
			p1.onDragStart()
		end
		UseRefResult1.current = UserInputService.InputChanged:connect(UseResult3)
		UseRefResult2.current = UserInputService.InputEnded:connect(UseResult4)
		UseRefResult6.current:setGoal(OtterModule.spring(1, config))
	end, { p1.isDisabled, p1.onDragStart, UseResult3, UseResult4 })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult7 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: AXFixMissingThumbstickInputObject (upval), GamepadUtils (upval), p1 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseRefResult5 (copy), UtilsModule (upval)
		local v3 = p2[Enum.KeyCode.Thumbstick1]
		local NormalizeStickByDeadzoneResult = if AXFixMissingThumbstickInputObject then if v3 then GamepadUtils.normalizeStickByDeadzone(v3.Position) else Vector2.new(0, 0) else GamepadUtils.normalizeStickByDeadzone(p2[Enum.KeyCode.Thumbstick1].Position)
		local IsNotNormalizeStickByDeadzoneResultMatch = NormalizeStickByDeadzoneResult ~= Vector2.new(0, 0)
		local v4 = nil
		local v5 = nil
		local v6 = nil
		local v7 = nil
		
		if AXFixMissingThumbstickInputObject then
			local v8 = p2[Enum.KeyCode.DPadLeft]
			local v9 = p2[Enum.KeyCode.DPadRight]
			local v10 = p2[Enum.KeyCode.DPadUp]
			local v11 = p2[Enum.KeyCode.DPadDown]
			v5 = if v8 and v8.Position.z == 1 then -1 else 0
			v4 = if v9 and v9.Position.z == 1 then 1 else 0
			v6 = if v10 and v10.Position.z == 1 then 1 else 0
			v7 = if v11 and v11.Position.z == 1 then -1 else 0
		else
			v5 = if p2[Enum.KeyCode.DPadLeft].Position.z == 1 then -1 else 0
			v4 = if p2[Enum.KeyCode.DPadRight].Position.z == 1 then 1 else 0
			v6 = if p2[Enum.KeyCode.DPadUp].Position.z == 1 then 1 else 0
			v7 = if p2[Enum.KeyCode.DPadDown].Position.z == 1 then -1 else 0
		end
		local _Vector2 = Vector2.new(v5 + v4, v6 + v7)
		local XScale = p1.xScale
		local YScale = p1.yScale
		local ClampedValue: number = XScale
		local ClampedValue1: number = YScale
		
		if IsNotNormalizeStickByDeadzoneResultMatch then
			UseRefResult3.current += p3
			ClampedValue, ClampedValue1 = p1.mapPositionToScales(p1.mapScalesToPosition(XScale, YScale) + Vector2.new(NormalizeStickByDeadzoneResult.x, -NormalizeStickByDeadzoneResult.y) * 1 * p3)
			UseRefResult4.current = 0
			UseRefResult5.current = false
		elseif _Vector2 == Vector2.new(0, 0) then
			UseRefResult3.current = 0
			UseRefResult4.current = 0
			UseRefResult5.current = true
		else
			UseRefResult3.current += p3
			local Floored = nil
			
			if UseRefResult5.current then
				Floored = 1
				UseRefResult4.current = 0
				UseRefResult5.current = false
			elseif UseRefResult3.current > 0.2 then
				local NewLargest = p3 - math.max(0.2 - (UseRefResult3.current - p3), 0) + UseRefResult4.current
				Floored = math.floor(8 * NewLargest)
				UseRefResult4.current = NewLargest - Floored / 8
			else
				Floored = 0
				UseRefResult4.current = 0
			end
			local _Vector2_1 = Vector2.new(if p1.invertDPadX then -1 else 1, if p1.invertDPadY then -1 else 1)
			local NewFloored = Floored - 1 + 0.51
			
			if _Vector2.x == 0 then
				ClampedValue = XScale
			else
				local XScaleRules = p1.xScaleRules
				ClampedValue = math.clamp(XScaleRules.min + UtilsModule.Round(XScale + _Vector2.x * _Vector2_1.x * XScaleRules.increment * NewFloored - XScaleRules.min, XScaleRules.increment), XScaleRules.min, XScaleRules.max)
			end
			if _Vector2.y == 0 then
				ClampedValue1 = YScale
			else
				local YScaleRules = p1.yScaleRules
				ClampedValue1 = math.clamp(YScaleRules.min + UtilsModule.Round(YScale + _Vector2.y * _Vector2_1.y * YScaleRules.increment * NewFloored - YScaleRules.min, YScaleRules.increment), YScaleRules.min, YScaleRules.max)
			end
		end
		if ClampedValue ~= XScale or ClampedValue1 ~= YScale then
			p1.setScales(ClampedValue, ClampedValue1)
		end
	end, {
		p1.xScale, p1.yScale, p1.mapScalesToPosition, p1.mapPositionToScales,
		p1.invertDPadX, p1.invertDPadY, p1.xScaleRules, p1.yScaleRules, p1.setScales
	})
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(UseRefResult, ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), FocusNavigationEventNameEnum (upval)
		return {
			[Enum.KeyCode.ButtonB] = if UseStateResult then FocusNavigationEventNameEnum.NavigateBack else nil,
			[Enum.KeyCode.Escape] = if UseStateResult then FocusNavigationEventNameEnum.NavigateBack else nil,
			[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.ToggleGamepadInput
		}
	end, { UseStateResult }), if UseStateResult then UseResult6 else nil, (ReactModule.useCallback(function(_)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), p1 (copy)
		if UseStateResult then
			UseStateResult2(false)
			
			return
		end
		if not p1.isDisabled then
			UseStateResult2(true)
		end
	end, { UseStateResult, p1.isDisabled })))))
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), UseStateResult (copy), UseResult7 (copy), getInputObjects (upval), t (upval)
		local HeartbeatConnection = RunService.Heartbeat:Connect(function(DeltaTime)
			-- upvalues: UseStateResult (upval), UseResult7 (upval), getInputObjects (upval)
			if UseStateResult then
				UseResult7(getInputObjects(), DeltaTime)
			end
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy), t (upval)
			HeartbeatConnection:Disconnect()
			t = {}
		end
	end, { UseStateResult, UseResult7 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult6 (copy), UseBindingResult2 (copy), UseRefResult7 (copy), UseBindingResult2_1 (copy), UseResult (copy)
		UseRefResult6.current:onStep(UseBindingResult2)
		UseRefResult7.current:onStep(UseBindingResult2_1)
		
		return function()
			-- upvalues: UseResult (upval), UseRefResult6 (upval), UseRefResult7 (upval)
			UseResult()
			UseRefResult6.current:destroy()
			UseRefResult7.current:destroy()
		end
	end, { UseResult })
	local IsDisabled = p1.isDisabled
	local MapScalesToPositionResult = p1.mapScalesToPosition(p1.xScale, p1.yScale)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Knob = ReactModule.createElement(Focusable[ImageSetLabel], {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(MapScalesToPositionResult.X, 0, MapScalesToPositionResult.Y, 0),
			Size = UDim2.fromOffset(30, 30),
			Image = ComponentAssetsCircle29,
			ImageColor3 = IsDisabled and Pumice1 or UseBindingResult:map(function(p2)
				-- upvalues: White (upval), Pumice (upval)
				return White:lerp(Pumice, p2)
			end),
			ImageTransparency = if IsDisabled then 0.5 else 0,
			Active = true,
			BackgroundTransparency = 1,
			ZIndex = 2,
			[RoactModule.Event.InputBegan] = UseResult5,
			[RoactModule.Event.MouseEnter] = UseResult1,
			[RoactModule.Event.MouseLeave] = UseResult2,
			[RoactModule.Ref] = UseTableWrappedCallbackRefResult,
			onFocusLost = UseResult6,
			NextSelectionLeft = UseStateResult and UseRefResult or nil,
			NextSelectionRight = UseStateResult and UseRefResult or nil,
			NextSelectionUp = UseStateResult and UseRefResult or nil,
			NextSelectionDown = UseStateResult and UseRefResult or nil,
			Selectable = true,
			SelectionImageObject = UseSelectionCursorFunction(UseStateResult and CursorKind.SelectedKnob or CursorKind.UnselectedKnob)
		}),
		KnobShadow = RoactModule.createElement(ImageSetLabel, {
			Active = true,
			BackgroundTransparency = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(MapScalesToPositionResult.X, 0, MapScalesToPositionResult.Y, 0),
			Size = if FFlagAXFixBodyScaleReduxUpdatesModule then UDim2.new(0, 52, 0, 52) else UDim2.new(0, 48, 0, 48),
			Image = ComponentAssetsDropshadow28,
			ImageTransparency = if IsDisabled then 1 else UseInitializedValueResult:map(function(p2)
				-- upvalues: UtilsModule (upval), v1 (upval), v2 (upval)
				return UtilsModule.lerp(UtilsModule.lerp(v1, v2, p2.hovered), 1, p2.pressed)
			end)
		})
	})
end