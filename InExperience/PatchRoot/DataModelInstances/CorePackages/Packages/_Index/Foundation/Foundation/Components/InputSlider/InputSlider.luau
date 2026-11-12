local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local Components = Foundation.Components
local InputLabelModule = require(Components.InputLabel)
local TextModule = require(Components.Text)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local GetStateLayerStyleModule = require(Components.Interactable.getStateLayerStyle)
local UseSliderDirectionalInputModule = require(Components.InternalSlider.useSliderDirectionalInput)
local DevAssertModule = require(Foundation.Utility.devAssert)
local GetBindableValueModule = require(Foundation.Utility.getBindableValue)
local GetDisabledStyleModule = require(Foundation.Utility.getDisabledStyle)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseLastInputModeModule = require(Foundation.Utility.Input.useLastInputMode)
local UsePluginModule = require(Foundation.Providers.Plugin.usePlugin)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ControlStateModule = require(Foundation.Enums.ControlState)
local InputLabelSizeModule = require(Foundation.Enums.InputLabelSize)
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local OnChangeCallbackReasonModule = require(Foundation.Enums.OnChangeCallbackReason)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Providers.Style.Tokens)
local CalculateInputSliderValueModule = require(script.Parent.calculateInputSliderValue)
local FormatInputSliderValueModule = require(script.Parent.formatInputSliderValue)
local SnapInputSliderValueModule = require(script.Parent.snapInputSliderValue)
local UseInputSliderFillModule = require(script.Parent.useInputSliderFill)
local config = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}
local config1 = {
	sensitivity = 1,
	isDisabled = false,
	testId = "--foundation-input-slider"
}

local function ScrubDragDetector(p1)
	-- upvalues: ReactModule (copy)
	return if p1.isPresent then ReactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = p1.isEnabled,
		[ReactModule.Tag] = `data-testid={p1.testId}`,
		[ReactModule.Event.DragStart] = p1.onDragStart,
		[ReactModule.Event.DragContinue] = p1.onDragContinue,
		[ReactModule.Event.DragEnd] = p1.onDragEnd
	}) else nil
end

local function _(SelectedPressed): boolean
	-- upvalues: ControlStateModule (copy)
	return SelectedPressed == ControlStateModule.Selected or SelectedPressed == ControlStateModule.SelectedPressed
end

local _ = function(Hover): boolean
	-- upvalues: ControlStateModule (copy)
	return Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed
end

local _ = function(Hover, Hover1): boolean
	-- upvalues: ControlStateModule (copy)
	return Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed or (Hover1 == ControlStateModule.Hover or Hover1 == ControlStateModule.Pressed)
end

local _ = function(p1, Hover, p2)
	-- upvalues: GetStateLayerStyleModule (copy), ControlStateModule (copy)
	if p2 then
		return GetStateLayerStyleModule(p1, nil, ControlStateModule.Pressed)
	else
		local IsHoverMatch: boolean = Hover == ControlStateModule.Hover or Hover == ControlStateModule.Pressed
		
		return if IsHoverMatch then GetStateLayerStyleModule(p1, nil, Hover) else nil
	end
end

local _ = function(p1, p2, p3)
	-- upvalues: GetDisabledStyleModule (copy)
	return GetDisabledStyleModule(if p2 then p1.Color.Content.Emphasis else p1.Color.Content.Default, p3), GetDisabledStyleModule(if p2 then p1.Color.Content.Default else p1.Color.Content.Muted, p3)
end

local _ = function(p1: number): number
	-- upvalues: DevAssertModule (copy)
	local v1 = p1 > 0
	DevAssertModule(v1, `InputSlider: sensitivity must be positive, got {p1}.`)
	
	return if v1 then p1 else 1
end

local _ = function(p1: number)
	-- upvalues: DevAssertModule (copy)
	if p1 == nil then
		return nil
	else
		local v1 = p1 > 0
		DevAssertModule(v1, `InputSlider: step must be positive, got {p1}.`)
		
		return if v1 then p1 else nil
	end
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTokensModule (copy), UsePluginModule (copy), UseLastInputModeModule (copy), DevAssertModule (copy), ReactModule (copy), ControlStateModule (copy), GetBindableValueModule (copy), CalculateInputSliderValueModule (copy), OnChangeCallbackReasonModule (copy), FormatInputSliderValueModule (copy), SnapInputSliderValueModule (copy), UseSliderDirectionalInputModule (copy), InputModeModule (copy), UseInputSliderFillModule (copy), MapBindableModule (copy), GetDisabledStyleModule (copy), GetStateLayerStyleModule (copy), UseStyleTagsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), config (copy), StateLayerAffordanceModule (copy), InputLabelModule (copy), InputLabelSizeModule (copy), ScrubDragDetector (copy), DashModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTokensModuleResult = UseTokensModule()
	local UsePluginModuleResult = UsePluginModule()
	local UseLastInputModeModuleResult = UseLastInputModeModule()
	local Range = WithDefaultsModuleResult.range
	local Step: number = WithDefaultsModuleResult.step
	local v1 = nil
	
	if Step == nil then
		v1 = nil
	else
		local IsStepAbove = Step > 0
		DevAssertModule(IsStepAbove, `InputSlider: step must be positive, got {Step}.`)
		v1 = if IsStepAbove then Step else nil
	end
	local Sensitivity: number = WithDefaultsModuleResult.sensitivity
	local IsSensitivityAbove = Sensitivity > 0
	DevAssertModule(IsSensitivityAbove, `InputSlider: sensitivity must be positive, got {Sensitivity}.`)
	local Sensitivity1: number = if IsSensitivityAbove then Sensitivity else 1
	local IsDisabled = WithDefaultsModuleResult.isDisabled
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(ControlStateModule.Initialize)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(ControlStateModule.Initialize)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding("")
	local IsUseStateResultMatch: boolean = UseStateResult5 == ControlStateModule.Selected or UseStateResult5 == ControlStateModule.SelectedPressed
	local UseStateResult7 = UseStateResult or (UseStateResult1 or UseStateResult4)
	local UseResult = ReactModule.useCallback(function(): number
		-- upvalues: GetBindableValueModule (upval), WithDefaultsModuleResult (copy), Range (copy)
		return (math.clamp(GetBindableValueModule(WithDefaultsModuleResult.value), Range.Min, Range.Max))
	end, { WithDefaultsModuleResult.value, Range })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseResult (copy), WithDefaultsModuleResult (copy)
		if p2 ~= UseResult() then
			WithDefaultsModuleResult.onValueChanged(p2, p3)
		end
	end, { WithDefaultsModuleResult.onValueChanged, UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), IsDisabled (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil and not IsDisabled then
			Current:CaptureFocus()
			task.defer(function()
				-- upvalues: Current (copy)
				if Current.Parent ~= nil and Current:IsFocused() then
					Current.SelectionStart = 1
					Current.CursorPosition = utf8.len(Current.Text) + 1
				end
			end)
			
			return
		end
	end, { IsDisabled })
	local UseResult3 = ReactModule.useCallback(function(_, Vector)
		-- upvalues: IsDisabled (copy), UseStateResult2_2 (copy), UseRefResult1 (copy), UseResult (copy)
		if not IsDisabled then
			UseStateResult2_2(true)
			UseRefResult1.current = {
				hasStarted = false,
				pressX = Vector.X,
				originX = Vector.X,
				startValue = UseResult()
			}
			
			return
		end
	end, { IsDisabled, UseResult })
	local UseResult4 = ReactModule.useCallback(function(_, Vector)
		-- upvalues: UseRefResult1 (copy), UseRefResult4 (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy), UseResult1 (copy), CalculateInputSliderValueModule (upval), Sensitivity1 (copy), v1 (copy), Range (copy), OnChangeCallbackReasonModule (upval)
		local Current = UseRefResult1.current
		
		if Current == nil then return end
		if not Current.hasStarted then
			if math.abs(Vector.X - Current.pressX) < 3 then return end
			Current.hasStarted = true
			Current.originX = Vector.X
			UseRefResult4.current = false
			UseStateResult2_1(true)
			
			if WithDefaultsModuleResult.onDragStarted then
				WithDefaultsModuleResult.onDragStarted()
			end
		end
		UseResult1(CalculateInputSliderValueModule(Current.startValue, Vector.X - Current.originX, Sensitivity1 * 0.25, v1, Range), OnChangeCallbackReasonModule.Drag)
	end, {
		WithDefaultsModuleResult.onDragStarted,
		UseResult1,
		Sensitivity1,
		v1,
		Range
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy), UseRefResult1 (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy), UseResult2 (copy)
		UseStateResult2_2(false)
		local Current = UseRefResult1.current
		UseRefResult1.current = nil
		
		if Current == nil then return end
		if Current.hasStarted then
			UseStateResult2_1(false)
			
			if WithDefaultsModuleResult.onDragEnded then
				WithDefaultsModuleResult.onDragEnded()
				
				return
			end
		else
			UseResult2()
		end
	end, { WithDefaultsModuleResult.onDragEnded, UseResult2 })
	local UseRefResult5 = ReactModule.useRef(WithDefaultsModuleResult.onDragEnded)
	UseRefResult5.current = WithDefaultsModuleResult.onDragEnded
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseStateResult2_1 (copy), UseRefResult5 (copy)
		local Current = UseRefResult1.current
		UseRefResult1.current = nil
		
		if Current == nil or not Current.hasStarted then return end
		UseStateResult2_1(false)
		
		if UseRefResult5.current then
			UseRefResult5.current()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult5 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval), UseRefResult5 (upval)
			local Current = UseRefResult1.current
			UseRefResult1.current = nil
			
			if Current ~= nil and Current.hasStarted and UseRefResult5.current then
				UseRefResult5.current()
			end
		end
	end, {})
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: FormatInputSliderValueModule (upval), UseResult (copy), UseRefResult2 (copy), UseBindingResult2 (copy), UseStateResult2 (copy)
		local FormatInputSliderValueModuleResult = FormatInputSliderValueModule(UseResult())
		UseRefResult2.current = false
		UseBindingResult2(FormatInputSliderValueModuleResult)
		p2.Text = FormatInputSliderValueModuleResult
		UseStateResult2(true)
	end, { UseResult })
	local UseResult8 = ReactModule.useCallback(function(p2, p3, Input)
		-- upvalues: UseStateResult2 (copy), UseRefResult2 (copy), FormatInputSliderValueModule (upval), UseResult (copy), SnapInputSliderValueModule (upval), v1 (copy), Range (copy), UseRefResult4 (copy), UseResult1 (copy), OnChangeCallbackReasonModule (upval)
		UseStateResult2(false)
		local IsKeyCodeMatch: boolean = Input ~= nil and Input.KeyCode == Enum.KeyCode.Escape
		
		if UseRefResult2.current or IsKeyCodeMatch then
			UseRefResult2.current = false
			
			return
		end
		local Number: number? = tonumber(p2.Text)
		
		if Number == nil or Number ~= Number or p2.Text == FormatInputSliderValueModule(UseResult()) then return end
		local SnapInputSliderValueModuleResult = SnapInputSliderValueModule(Number, v1, Range)
		
		if SnapInputSliderValueModuleResult ~= UseResult() then
			UseRefResult4.current = true
		end
		UseResult1(SnapInputSliderValueModuleResult, if p3 then OnChangeCallbackReasonModule.Keyboard else OnChangeCallbackReasonModule.FocusLost)
	end, { UseResult, UseResult1, Range, v1 })
	local UseResult9 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(p2.Text)
	end, {})
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy)
		local Current = UseRefResult.current
		
		if Current and Current:IsFocused() then
			UseRefResult2.current = true
			Current:ReleaseFocus()
		end
	end, {})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseResult (copy), UseStateResult2_3 (copy)
		UseRefResult3.current = UseResult()
		UseStateResult2_3(true)
	end, { UseResult })
	local UseResult12 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(false)
	end, {})
	local UseResult13 = ReactModule.useCallback(function()
		-- upvalues: UseResult1 (copy), UseRefResult3 (copy), OnChangeCallbackReasonModule (upval), UseStateResult2_3 (copy)
		UseResult1(UseRefResult3.current, OnChangeCallbackReasonModule.Keyboard)
		UseStateResult2_3(false)
	end, { UseResult1 })
	UseSliderDirectionalInputModule(UseStateResult4 and not IsDisabled, v1 or 1, Range, false, (ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), v1 (copy), Range (copy), UseResult1 (copy), OnChangeCallbackReasonModule (upval), UseResult13 (copy)
		return {
			getValue = UseResult,
			onStep = function(p2: number)
				-- upvalues: v1 (upval), UseResult (upval), Range (upval), UseResult1 (upval), OnChangeCallbackReasonModule (upval)
				if v1 == nil then
					local UseResultResult: number = UseResult()
					p2 = math.clamp(UseResultResult + math.sign(p2 - UseResultResult) * 1, Range.Min, Range.Max)
				end
				UseResult1(p2, OnChangeCallbackReasonModule.Keyboard)
			end,
			onExit = UseResult13
		}
	end, {
		UseResult,
		UseResult1,
		UseResult13,
		v1,
		Range
	})))
	ReactModule.useEffect(function()
		-- upvalues: UseLastInputModeModuleResult (copy), InputModeModule (upval), UseStateResult4 (copy), IsUseStateResultMatch (copy), UseStateResult (copy), UseStateResult2_3 (copy)
		local IsNotUseLastInputModeModuleResultMatch: boolean = UseLastInputModeModuleResult ~= nil and UseLastInputModeModuleResult ~= InputModeModule.Directional
		
		if UseStateResult4 and (not IsUseStateResultMatch or UseStateResult or IsNotUseLastInputModeModuleResultMatch) then
			UseStateResult2_3(false)
		end
	end, {
		UseStateResult4,
		IsUseStateResultMatch,
		UseStateResult,
		UseLastInputModeModuleResult
	})
	local UseResult14 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseStateResult4 (copy), UseResult12 (copy), UseResult2 (copy), UseResult11 (copy)
		local IsKeyCodeMatch: boolean = Input.KeyCode == Enum.KeyCode.Return or Input.KeyCode == Enum.KeyCode.KeypadEnter
		
		if not IsKeyCodeMatch and Input.KeyCode ~= Enum.KeyCode.ButtonA then return end
		if UseStateResult4 then
			UseResult12()
			
			return
		end
		if IsKeyCodeMatch then
			UseResult2()
			
			return
		else
			UseResult11()
		end
	end, { UseStateResult4, UseResult12, UseResult2, UseResult11 })
	ReactModule.useEffect(function()
		-- upvalues: IsDisabled (copy), UseStateResult2_3 (copy), UseResult10 (copy), UseResult6 (copy)
		if IsDisabled then
			UseStateResult2_3(false)
			UseResult10()
			UseResult6()
		end
	end, { IsDisabled, UseResult6 })
	local UseStateResult1_1 = not IsDisabled and (not UseStateResult and (UseStateResult1 or (UseStateResult5 == ControlStateModule.Hover or UseStateResult5 == ControlStateModule.Pressed or (UseStateResult6 == ControlStateModule.Hover or UseStateResult6 == ControlStateModule.Pressed))))
	ReactModule.useEffect(function()
		-- upvalues: UsePluginModuleResult (copy), UseStateResult1_1 (copy)
		if UsePluginModuleResult == nil or not UseStateResult1_1 then return end
		local Mouse = UsePluginModuleResult:GetMouse()
		local Icon = Mouse.Icon
		Mouse.Icon = "rbxasset://SystemCursors/SizeEW"
		
		return function()
			-- upvalues: Mouse (copy), Icon (copy)
			Mouse.Icon = Icon
		end
	end, { UsePluginModuleResult, UseStateResult1_1 })
	local UseInputSliderFillModuleResult = UseInputSliderFillModule(WithDefaultsModuleResult.value, Range, IsDisabled, UseRefResult4)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), UseBindingResult (copy), MapBindableModule (upval), WithDefaultsModuleResult (copy), FormatInputSliderValueModule (upval), Range (copy)
		return if UseStateResult then UseBindingResult else MapBindableModule(WithDefaultsModuleResult.value, function(Value: number)
			-- upvalues: FormatInputSliderValueModule (upval), Range (upval)
			return FormatInputSliderValueModule((math.clamp(Value, Range.Min, Range.Max)))
		end)
	end, {
		UseStateResult,
		UseBindingResult,
		WithDefaultsModuleResult.value,
		Range
	})
	local DisabledStyleModule = GetDisabledStyleModule(if UseStateResult7 then UseTokensModuleResult.Color.Content.Emphasis else UseTokensModuleResult.Color.Content.Default, IsDisabled)
	local DisabledStyleModule1 = GetDisabledStyleModule(if UseStateResult7 then UseTokensModuleResult.Color.Content.Default else UseTokensModuleResult.Color.Content.Muted, IsDisabled)
	local StateLayerStyleModule = nil
	
	if IsDisabled or UseStateResult or UseStateResult4 then
		StateLayerStyleModule = nil
	elseif UseStateResult1 then
		StateLayerStyleModule = GetStateLayerStyleModule(UseTokensModuleResult, nil, ControlStateModule.Pressed)
	else
		local IsUseStateResultMatch1: boolean = UseStateResult5 == ControlStateModule.Hover or UseStateResult5 == ControlStateModule.Pressed
		StateLayerStyleModule = if IsUseStateResultMatch1 then GetStateLayerStyleModule(UseTokensModuleResult, nil, UseStateResult5) else nil
	end
	local config2 = {
		isPresent = UseStateResult1 or (UseStateResult3 or UseLastInputModeModuleResult ~= InputModeModule.Directional),
		isEnabled = not UseStateResult and (not IsDisabled or UseStateResult3),
		onDragStart = UseResult3,
		onDragContinue = UseResult4,
		onDragEnd = UseResult5
	}
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "col gap-small auto-y",
		Size = UDim2.new(WithDefaultsModuleResult.width or UDim.new(1, 0), UDim.new()),
		selectionGroup = if UseStateResult4 then config else nil,
		ref = Ref
	}), {
		Label = if WithDefaultsModuleResult.label and WithDefaultsModuleResult.label ~= "" then ReactModule.createElement(ViewModule, {
			tag = "auto-xy",
			LayoutOrder = 1,
			onStateChanged = UseStateResult2_5,
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			selection = { Selectable = false },
			isDisabled = IsDisabled,
			testId = `{WithDefaultsModuleResult.testId}--label`
		}, {
			Text = ReactModule.createElement(InputLabelModule, {
				Text = WithDefaultsModuleResult.label,
				size = InputLabelSizeModule.XSmall,
				isDisabled = IsDisabled,
				testId = `{WithDefaultsModuleResult.testId}--label-text`
			}),
			DragDetector = ReactModule.createElement(ScrubDragDetector, DashModule.join(config2, {
				testId = `{WithDefaultsModuleResult.testId}--label--drag-detector`
			}))
		}) else nil,
		Field = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = {
				["size-full-600 radius-small"] = true,
				["stroke-standard stroke-position-inner stroke-system-emphasis"] = UseStateResult7
			},
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			backgroundStyle = { Transparency = 0.001, Color3 = Color3.new(1, 1, 1) },
			cursor = {
				radius = UDim.new(0, UseTokensModuleResult.Radius.Small),
				offset = UseTokensModuleResult.Stroke.Thick,
				borderWidth = UseTokensModuleResult.Stroke.Thick
			},
			onStateChanged = UseStateResult2_4,
			onActivated = UseResult14,
			isDisabled = IsDisabled,
			testId = `{WithDefaultsModuleResult.testId}--field`
		}, {
			Fill = ReactModule.createElement("UIGradient", {
				Color = UseInputSliderFillModuleResult.color,
				Transparency = UseInputSliderFillModuleResult.transparency,
				Offset = UseInputSliderFillModuleResult.offset,
				[ReactModule.Tag] = `data-testid={WithDefaultsModuleResult.testId}--fill`
			}),
			DragDetector = ReactModule.createElement(ScrubDragDetector, DashModule.join(config2, {
				testId = `{WithDefaultsModuleResult.testId}--field--drag-detector`
			})),
			StateLayer = if StateLayerStyleModule then ReactModule.createElement(ViewModule, {
				tag = "size-full radius-small",
				ZIndex = 2,
				backgroundStyle = StateLayerStyleModule,
				testId = `{WithDefaultsModuleResult.testId}--state-layer`
			}) else nil,
			Content = ReactModule.createElement(ViewModule, {
				tag = "row align-y-center gap-xxsmall size-full padding-x-small",
				ZIndex = 3
			}, {
				Value = ReactModule.createElement("TextBox", {
					Text = UseMemoResult,
					ClearTextOnFocus = false,
					TextEditable = not IsDisabled,
					Interactable = UseStateResult,
					Selectable = false,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.fromScale(0, 1),
					TextColor3 = DisabledStyleModule.Color3,
					TextTransparency = DisabledStyleModule.Transparency,
					LayoutOrder = 1,
					ref = UseRefResult,
					[ReactModule.Tag] = `{UseStyleTagsModule("text-body-small text-align-x-left text-align-y-center gui-object-defaults")} data-testid={WithDefaultsModuleResult.testId}--textbox`,
					[ReactModule.Event.Focused] = UseResult7,
					[ReactModule.Event.FocusLost] = UseResult8,
					[ReactModule.Change.Text] = UseResult9
				}),
				Suffix = if WithDefaultsModuleResult.suffix then ReactModule.createElement(TextModule, {
					tag = "auto-xy text-body-small",
					LayoutOrder = 2,
					Text = WithDefaultsModuleResult.suffix,
					textStyle = DisabledStyleModule1,
					testId = `{WithDefaultsModuleResult.testId}--suffix`
				}) else nil
			})
		})
	})
end))