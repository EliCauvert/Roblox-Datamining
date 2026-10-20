local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local ConstantsModule = require(Foundation.Constants)
local GuiService = require(Foundation.Utility.Wrappers.Services).GuiService
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseBindableModule = require(Foundation.Utility.useBindable)
local UseLastInputModeModule = require(Foundation.Utility.Input.useLastInputMode)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local CalculateSliderFractionModule = require(script.Parent.calculateSliderFraction)
local CalculateSliderStepValueModule = require(script.Parent.calculateSliderStepValue)
local GetGuiInputPositionModule = require(script.Parent.getGuiInputPosition)
local GetSelectionEntryDirectionModule = require(script.Parent.getSelectionEntryDirection)
local UseSliderCaptureKeysModule = require(script.Parent.useSliderCaptureKeys)
local UseSliderDirectionalInputModule = require(script.Parent.useSliderDirectionalInput)
local VisibilityModule = require(Foundation.Enums.Visibility)
local OrientationModule = require(Foundation.Enums.Orientation)
local SliderTypeModule = require(Foundation.Enums.SliderType)
local SliderThumbModule = require(script.Parent.SliderThumb)
local ControlStateModule = require(Foundation.Enums.ControlState)
local CursorTypeModule = require(Foundation.Enums.CursorType)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local CursorComponentModule = require(Foundation.Providers.Cursor.CursorComponent)
local FlagsModule = require(Foundation.Utility.Flags)
local KnobModule = require(Foundation.Components.Knob)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local GetKnobSizeModule = require(Foundation.Components.Knob.getKnobSize)
local UsePresentationContextFunction = PresentationContextModule.usePresentationContext
local UseSliderVariantsModule = require(Foundation.Components.Slider.useSliderVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	isDisabled = false,
	isContained = false,
	testId = "--foundation-slider",
	range = NumberRange.new(0, 1),
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(1, 0),
	orientation = OrientationModule.Horizontal,
	variant = require(Foundation.Enums.SliderVariant).Standard,
	knobVisibility = VisibilityModule.Auto
}
local config1 = {
	colorNamespace = require(Foundation.Enums.ColorNamespace).Inverse
}
local config2 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}
local config3 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Escape,
	SelectionBehaviorRight = Enum.SelectionBehavior.Escape,
	SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
	SelectionBehaviorDown = Enum.SelectionBehavior.Escape
}
local SelectionGroup = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), OrientationModule (copy), SliderTypeModule (copy), UseTokensModule (copy), ReactModule (copy), ControlStateModule (copy), FlagsModule (copy), UseBindableModule (copy), UseLastInputModeModule (copy), ReactUtilsModule (copy), UseSliderVariantsModule (copy), UseSliderCaptureKeysModule (copy), GuiService (copy), VisibilityModule (copy), CalculateSliderStepValueModule (copy), InputModeModule (copy), CalculateSliderFractionModule (copy), GetGuiInputPositionModule (copy), UseSliderDirectionalInputModule (copy), GetSelectionEntryDirectionModule (copy), UsePresentationContextFunction (copy), GetKnobSizeModule (copy), BlendTransparenciesModule (copy), ViewModule (copy), SliderThumbModule (copy), SelectionGroup (copy), CursorTypeModule (copy), CursorComponentModule (copy), PresentationContextModule (copy), config1 (copy), KnobModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), config2 (copy), config3 (copy), StateLayerAffordanceModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local IsOrientationMatch = WithDefaultsModuleResult.orientation == OrientationModule.Vertical
	local IsTypeMatch = p1.type == SliderTypeModule.Range
	local Value = if p1.type == SliderTypeModule.Range then 0 else p1.value
	local OnValueChanged = if p1.type == SliderTypeModule.Range then nil else p1.onValueChanged
	local OnValueChanged1 = if p1.type == SliderTypeModule.Range then p1.onValueChanged else nil
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local v1 = nil
	local Callback = nil
	
	if FlagsModule.FoundationSliderCapture then
		v1, Callback = ReactModule.useState(false)
	end
	local v2 = nil
	local Callback1 = nil
	
	if FlagsModule.FoundationSliderCapture then
		v2, Callback1 = ReactModule.useState(false)
	end
	local UseRefResult = if FlagsModule.FoundationSliderCapture then ReactModule.useRef(nil) else nil
	local UseRefResult1 = if FlagsModule.FoundationSliderCapture then ReactModule.useRef(nil) else nil
	local UseRefResult2 = if FlagsModule.FoundationSliderCapture then ReactModule.useRef(false) else nil
	local UseRefResult3 = ReactModule.useRef(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local MapResult = UseBindableModule(Value):map(function(Value: number): number
		-- upvalues: WithDefaultsModuleResult (copy)
		return (math.clamp(Value, WithDefaultsModuleResult.range.Min, WithDefaultsModuleResult.range.Max))
	end)
	local UseBindableModuleResult = UseBindableModule(if p1.type == SliderTypeModule.Range then p1.value else NumberRange.new(0))
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UDim2.new())
	local UseResult = ReactModule.useCallback(function(YScale: number)
		-- upvalues: IsOrientationMatch (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if IsOrientationMatch then
			UseBindingResult2(UDim2.fromScale(0, YScale - 1))
			UseBindingResult2_1(UDim2.fromScale(0, YScale))
			
			return
		else
			UseBindingResult2(UDim2.fromScale(-YScale, 0))
			UseBindingResult2_1(UDim2.fromScale(1 - YScale, 0))
		end
	end, { IsOrientationMatch })
	local UseRefResult6 = ReactModule.useRef(0)
	local UseLastInputModeModuleResult = UseLastInputModeModule()
	local UseRefResult7 = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseRefResult7 (copy)
		return UseRefResult7.current
	end, {})
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(UseRefResult7, UseBindingResult2_2)
	local UseSliderVariantsModuleResult = UseSliderVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, IsOrientationMatch)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult3 (copy), UseSliderVariantsModuleResult (copy), UseStateResult1 (copy), IsTypeMatch (copy)
		return if UseStateResult3 then if UseStateResult1 and not IsTypeMatch then UseSliderVariantsModuleResult.knob.dragStyle else UseSliderVariantsModuleResult.knob.style else {
			Transparency = 1,
			Color3 = UseSliderVariantsModuleResult.knob.style.Color3
		}
	end, {
		UseSliderVariantsModuleResult,
		UseStateResult3,
		UseStateResult1,
		IsTypeMatch
	})
	local IsUseStateResultMatch = UseStateResult == ControlStateModule.Selected or (UseStateResult == ControlStateModule.SelectedPressed or FlagsModule.FoundationSliderCapture and v1)
	local UseResult1 = if FlagsModule.FoundationSliderCapture then ReactModule.useCallback(function()
		-- upvalues: v1 (ref), IsTypeMatch (copy), Callback1 (ref), v2 (ref), Callback (ref)
		if not v1 then
			Callback(true)
		elseif IsTypeMatch then
			Callback1(not v2)
			
			return
		end
	end, { v1, IsTypeMatch, v2 }) else nil
	
	if FlagsModule.FoundationSliderCapture then
		UseSliderCaptureKeysModule(IsUseStateResultMatch and not WithDefaultsModuleResult.isDisabled, UseResult1)
	end
	if FlagsModule.FoundationSliderCapture then
		ReactModule.useEffect(function()
			-- upvalues: WithDefaultsModuleResult (copy), Callback (ref)
			if WithDefaultsModuleResult.isDisabled then
				Callback(false)
			end
		end, { WithDefaultsModuleResult.isDisabled })
		ReactModule.useEffect(function()
			-- upvalues: GuiService (upval), UseRefResult7 (copy), UseRefResult (copy), UseRefResult1 (copy)
			local function redirectDragSelection()
				-- upvalues: GuiService (upval), UseRefResult7 (upval), UseRefResult (upval), UseRefResult1 (upval)
				local SelectedObject = GuiService.SelectedObject
				
				if SelectedObject == UseRefResult7.current or SelectedObject ~= nil and (UseRefResult7.current ~= nil and (SelectedObject:IsDescendantOf(UseRefResult7.current) and (SelectedObject ~= UseRefResult.current and SelectedObject ~= UseRefResult1.current))) then
					GuiService.SelectedObject = UseRefResult.current
				end
			end
			
			local SelectedObject = GuiService.SelectedObject
			
			if SelectedObject == UseRefResult7.current or SelectedObject ~= nil and (UseRefResult7.current ~= nil and (SelectedObject:IsDescendantOf(UseRefResult7.current) and (SelectedObject ~= UseRefResult.current and SelectedObject ~= UseRefResult1.current))) then
				GuiService.SelectedObject = UseRefResult.current
			end
			local Connection = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(redirectDragSelection)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: v1 (ref), GuiService (upval), UseRefResult1 (copy), Callback (ref)
			if not v1 then return end
			GuiService.SelectedObject = UseRefResult1.current
			local Connection = GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
				-- upvalues: GuiService (upval), UseRefResult1 (upval), Callback (upval)
				if GuiService.SelectedObject ~= UseRefResult1.current then
					Callback(false)
				end
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { v1 })
	end
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2_2 (copy), VisibilityModule (upval), IsUseStateResultMatch (copy), UseStateResult1 (copy), UseStateResult (copy), ControlStateModule (upval)
		if WithDefaultsModuleResult.isDisabled then
			UseStateResult2_2(false)
			
			return
		end
		if WithDefaultsModuleResult.knobVisibility == VisibilityModule.None then
			UseStateResult2_2(IsUseStateResultMatch)
			
			return
		end
		if WithDefaultsModuleResult.knobVisibility == VisibilityModule.Always then
			UseStateResult2_2(true)
			
			return
		else
			UseStateResult2_2(UseStateResult1 or (UseStateResult == ControlStateModule.Hover or (UseStateResult == ControlStateModule.Selected or UseStateResult == ControlStateModule.Pressed)))
		end
	end, {
		WithDefaultsModuleResult.knobVisibility,
		UseStateResult,
		UseStateResult1,
		WithDefaultsModuleResult.isDisabled,
		IsUseStateResultMatch
	})
	local UseResult2 = ReactModule.useCallback(function(p3)
		-- upvalues: MapResult (copy), OnValueChanged (copy)
		if p3 ~= MapResult:getValue() and OnValueChanged then
			OnValueChanged(p3)
		end
	end, { MapResult, OnValueChanged })
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseBindableModuleResult (copy), OnValueChanged1 (copy)
		local Value = UseBindableModuleResult:getValue()
		
		if OnValueChanged1 and (typeof(Value) ~= "NumberRange" or p3.Min ~= Value.Min or p3.Max ~= Value.Max) then
			OnValueChanged1(p3)
		end
	end, { UseBindableModuleResult, OnValueChanged1 })
	local UseResult4 = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2_3 (copy), FlagsModule (upval), Callback1 (ref), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2_3(p3)
		
		if FlagsModule.FoundationSliderCapture then
			Callback1(p3)
		end
		UseStateResult2_1(true)
		
		if WithDefaultsModuleResult.onDragStarted then
			WithDefaultsModuleResult.onDragStarted()
		end
	end, { WithDefaultsModuleResult.onDragStarted })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2_1(false)
		
		if WithDefaultsModuleResult.onDragEnded then
			WithDefaultsModuleResult.onDragEnded()
		end
	end, { WithDefaultsModuleResult.onDragEnded })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseResult4 (copy)
		UseResult4(false)
	end, { UseResult4 })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseResult4 (copy)
		UseResult4(true)
	end, { UseResult4 })
	local UseResult8 = ReactModule.useCallback(function(p3): number
		-- upvalues: WithDefaultsModuleResult (copy)
		return (math.clamp((p3 - WithDefaultsModuleResult.range.Min) / (WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min), 0, 1))
	end, {
		WithDefaultsModuleResult.range.Min,
		WithDefaultsModuleResult.range.Max
	})
	local UseResult9 = ReactModule.useCallback(function(p3)
		-- upvalues: WithDefaultsModuleResult (copy)
		return WithDefaultsModuleResult.range.Min + p3 * (WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min)
	end, {
		WithDefaultsModuleResult.range.Min,
		WithDefaultsModuleResult.range.Max
	})
	local UseResult10 = ReactModule.useCallback(function(p3)
		-- upvalues: UseResult9 (copy), WithDefaultsModuleResult (copy), CalculateSliderStepValueModule (upval)
		local UseResultResult = UseResult9(p3)
		
		return if WithDefaultsModuleResult.step then CalculateSliderStepValueModule(UseResultResult, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range) else UseResultResult
	end, {
		UseResult9,
		WithDefaultsModuleResult.step,
		WithDefaultsModuleResult.range
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseResult8 (copy), UseBindableModuleResult (copy), WithDefaultsModuleResult (copy), UseResult9 (copy)
		local UseResultResult = UseResult8(UseBindableModuleResult:getValue().Max)
		
		if WithDefaultsModuleResult.step and WithDefaultsModuleResult.step > 0 then
			UseResultResult = UseResult8(WithDefaultsModuleResult.range.Min + math.floor((UseResult9(UseResultResult) - WithDefaultsModuleResult.range.Min) / WithDefaultsModuleResult.step + 0.5) * WithDefaultsModuleResult.step)
		end
		return 0, UseResultResult
	end, {
		UseBindableModuleResult,
		UseResult8,
		WithDefaultsModuleResult.step,
		UseResult9,
		WithDefaultsModuleResult.range.Min
	})
	local UseResult12 = ReactModule.useCallback(function()
		-- upvalues: UseResult8 (copy), UseBindableModuleResult (copy), WithDefaultsModuleResult (copy), UseResult9 (copy)
		local UseResultResult = UseResult8(UseBindableModuleResult:getValue().Min)
		
		if WithDefaultsModuleResult.step and WithDefaultsModuleResult.step > 0 then
			UseResultResult = UseResult8(WithDefaultsModuleResult.range.Min + math.floor((UseResult9(UseResultResult) - WithDefaultsModuleResult.range.Min) / WithDefaultsModuleResult.step + 0.5) * WithDefaultsModuleResult.step)
		end
		return UseResultResult, 1
	end, {
		UseBindableModuleResult,
		UseResult8,
		WithDefaultsModuleResult.step,
		UseResult9,
		WithDefaultsModuleResult.range.Min
	})
	local UseResult13 = ReactModule.useCallback(function(p3)
		-- upvalues: UseBindableModuleResult (copy), UseResult3 (copy), UseResult10 (copy)
		local Value = UseBindableModuleResult:getValue()
		UseResult3(NumberRange.new(math.min(UseResult10(p3), Value.Max), Value.Max))
	end, { UseBindableModuleResult, UseResult3, UseResult10 })
	local UseResult14 = ReactModule.useCallback(function(p3)
		-- upvalues: UseBindableModuleResult (copy), UseResult3 (copy), UseResult10 (copy)
		local Value = UseBindableModuleResult:getValue()
		UseResult3(NumberRange.new(Value.Min, (math.max(UseResult10(p3), Value.Min))))
	end, { UseBindableModuleResult, UseResult3, UseResult10 })
	local UseResult15 = ReactModule.useCallback(function(Value: number, p3)
		-- upvalues: UseResult12 (copy), UseResult14 (copy), UseResult11 (copy), UseResult13 (copy)
		if p3 then
			local UseResultResult, UseResultResult2 = UseResult12()
			UseResult14((math.clamp(Value, UseResultResult, UseResultResult2)))
			
			return
		else
			local UseResultResult1, UseResultResult2_1 = UseResult11()
			UseResult13((math.clamp(Value, UseResultResult1, UseResultResult2_1)))
		end
	end, { UseResult12, UseResult11, UseResult14, UseResult13 })
	local UseResult16 = ReactModule.useCallback(function(_, p3)
		-- upvalues: IsTypeMatch (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult7 (copy), CalculateSliderFractionModule (upval), GetGuiInputPositionModule (upval), IsOrientationMatch (copy), UseBindableModuleResult (copy), UseResult8 (copy), UseRefResult3 (copy), FlagsModule (upval), Callback1 (ref), UseResult4 (copy), UseResult15 (copy)
		if not IsTypeMatch or UseLastInputModeModuleResult == InputModeModule.Directional or not UseRefResult7.current then return end
		local SliderFractionModule = CalculateSliderFractionModule(GetGuiInputPositionModule(p3, UseRefResult7.current), UseRefResult7.current, IsOrientationMatch)
		local Value = UseBindableModuleResult:getValue()
		local UseResultResult = UseResult8(Value.Min)
		local UseResultResult1 = UseResult8(Value.Max)
		local IsMagnitudeBelow: boolean = math.abs(UseResultResult1 - SliderFractionModule) < math.abs(SliderFractionModule - UseResultResult) or UseResultResult == UseResultResult1 and UseResultResult1 < SliderFractionModule
		UseRefResult3.current = IsMagnitudeBelow
		
		if FlagsModule.FoundationSliderCapture then
			Callback1(IsMagnitudeBelow)
		end
		UseResult4(IsMagnitudeBelow)
		UseResult15(SliderFractionModule, IsMagnitudeBelow)
	end, {
		IsTypeMatch, UseLastInputModeModuleResult, IsOrientationMatch,
		UseBindableModuleResult, UseResult4, UseResult15, UseResult8
	})
	local UseResult17 = ReactModule.useCallback(function(_, p3)
		-- upvalues: IsTypeMatch (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult7 (copy), GetGuiInputPositionModule (upval), UseResult15 (copy), CalculateSliderFractionModule (upval), IsOrientationMatch (copy), UseRefResult3 (copy)
		if IsTypeMatch and UseLastInputModeModuleResult ~= InputModeModule.Directional and UseRefResult7.current then
			UseResult15(CalculateSliderFractionModule(GetGuiInputPositionModule(p3, UseRefResult7.current), UseRefResult7.current, IsOrientationMatch), UseRefResult3.current)
			
			return
		end
	end, {
		IsTypeMatch,
		UseLastInputModeModuleResult,
		IsOrientationMatch,
		UseResult15
	})
	local UseResult18 = ReactModule.useCallback(function()
		-- upvalues: IsTypeMatch (copy), UseResult5 (copy)
		if IsTypeMatch then
			UseResult5()
			
			return
		end
	end, { IsTypeMatch, UseResult5 })
	local UseResult19 = if FlagsModule.FoundationSliderCapture then ReactModule.useCallback(function()
		-- upvalues: Callback (ref), GuiService (upval), UseRefResult (copy)
		Callback(false)
		GuiService.SelectedObject = UseRefResult.current
	end, {}) else nil
	local NoIsDisabled: boolean = IsUseStateResultMatch and not WithDefaultsModuleResult.isDisabled
	UseSliderDirectionalInputModule(if FlagsModule.FoundationSliderCapture then NoIsDisabled and v1 else NoIsDisabled and not IsTypeMatch, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range, IsOrientationMatch, (ReactModule.useMemo(function()
		-- upvalues: FlagsModule (upval), IsTypeMatch (copy), UseBindableModuleResult (copy), v2 (ref), MapResult (copy), UseResult3 (copy), UseResult2 (copy), WithDefaultsModuleResult (copy), CalculateSliderStepValueModule (upval), UseResult19 (copy)
		return {
			getValue = function()
				-- upvalues: FlagsModule (upval), IsTypeMatch (upval), UseBindableModuleResult (upval), v2 (upval), MapResult (upval)
				if FlagsModule.FoundationSliderCapture and IsTypeMatch then
					local Value = UseBindableModuleResult:getValue()
					
					return if v2 then Value.Max else Value.Min
				else
					return MapResult:getValue()
				end
			end,
			onStep = if FlagsModule.FoundationSliderCapture then function(p3: number)
				-- upvalues: IsTypeMatch (upval), UseBindableModuleResult (upval), v2 (upval), UseResult3 (upval), UseResult2 (upval)
				if not IsTypeMatch then
					UseResult2(p3)
					
					return
				end
				local Value = UseBindableModuleResult:getValue()
				
				if v2 then
					UseResult3(NumberRange.new(Value.Min, (math.max(p3, Value.Min))))
					
					return
				else
					UseResult3(NumberRange.new(math.min(p3, Value.Max), Value.Max))
				end
			end else function(p3)
				-- upvalues: WithDefaultsModuleResult (upval), CalculateSliderStepValueModule (upval), UseResult2 (upval)
				UseResult2(if WithDefaultsModuleResult.step then CalculateSliderStepValueModule(p3, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range) else p3)
			end,
			onExit = if FlagsModule.FoundationSliderCapture then UseResult19 else nil
		}
	end, {
		MapResult, UseResult2, WithDefaultsModuleResult.step,
		WithDefaultsModuleResult.range,
		if FlagsModule.FoundationSliderCapture then IsTypeMatch else nil,
		if FlagsModule.FoundationSliderCapture then UseBindableModuleResult else nil,
		if FlagsModule.FoundationSliderCapture then v2 else nil,
		if FlagsModule.FoundationSliderCapture then UseResult3 else nil,
		if FlagsModule.FoundationSliderCapture then UseResult19 else nil
	})))
	local UseResult20 = ReactModule.useCallback(function(_, _)
		-- upvalues: UseRefResult4 (copy), WithDefaultsModuleResult (copy), IsOrientationMatch (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult6 (copy), UseRefResult5 (copy), MapResult (copy), UseResult (copy), UseResult2 (copy), CalculateSliderStepValueModule (upval)
		local Current = UseRefResult4.current
		
		if not Current then return end
		local MaxDelta = WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min
		local Negated = if IsOrientationMatch then -Current.DragUDim2.Y.Scale else Current.DragUDim2.X.Scale
		
		if UseLastInputModeModuleResult == InputModeModule.Directional and math.abs(Negated - UseRefResult6.current) > 0.01 then
			UseRefResult5.current = (MapResult:getValue() - WithDefaultsModuleResult.range.Min) / MaxDelta - Negated
			UseRefResult6.current = Negated
			UseResult(UseRefResult5.current)
			
			return
		else
			UseRefResult6.current = Negated
			local NewMin = WithDefaultsModuleResult.range.Min + math.clamp(UseRefResult5.current + Negated, 0, 1) * MaxDelta
			UseResult2(if WithDefaultsModuleResult.step then CalculateSliderStepValueModule(NewMin, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range) else NewMin)
		end
	end, {
		WithDefaultsModuleResult.step, WithDefaultsModuleResult.range,
		UseLastInputModeModuleResult, MapResult, UseResult2, IsOrientationMatch,
		UseResult
	})
	local UseResult21 = ReactModule.useCallback(function(_, p3)
		-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult (copy), UseRefResult6 (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult5 (copy), MapResult (copy), UseResult (copy), UseRefResult7 (copy), CalculateSliderFractionModule (upval), GetGuiInputPositionModule (upval), IsOrientationMatch (copy), UseResult2 (copy), CalculateSliderStepValueModule (upval)
		UseStateResult2_1(true)
		
		if WithDefaultsModuleResult.onDragStarted then
			WithDefaultsModuleResult.onDragStarted()
		end
		UseRefResult6.current = 0
		local MaxDelta = WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min
		
		if UseLastInputModeModuleResult == InputModeModule.Directional then
			UseRefResult5.current = (MapResult:getValue() - WithDefaultsModuleResult.range.Min) / MaxDelta
			UseResult(UseRefResult5.current)
			
			return
		else
			local NewMin = if UseRefResult7.current then WithDefaultsModuleResult.range.Min + CalculateSliderFractionModule(GetGuiInputPositionModule(p3, UseRefResult7.current), UseRefResult7.current, IsOrientationMatch) * MaxDelta else WithDefaultsModuleResult.range.Min
			UseRefResult5.current = (NewMin - WithDefaultsModuleResult.range.Min) / MaxDelta
			UseResult2(if WithDefaultsModuleResult.step then CalculateSliderStepValueModule(NewMin, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range) else NewMin)
			UseResult(UseRefResult5.current)
		end
	end, {
		WithDefaultsModuleResult.onDragStarted, WithDefaultsModuleResult.step,
		WithDefaultsModuleResult.range, UseLastInputModeModuleResult, MapResult,
		UseResult2, IsOrientationMatch, UseResult
	})
	local UseResult22 = ReactModule.useCallback(function(_, _)
		-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2_1(false)
		
		if WithDefaultsModuleResult.onDragEnded then
			WithDefaultsModuleResult.onDragEnded()
		end
	end, { WithDefaultsModuleResult.onDragEnded })
	local UseResult23 = ReactModule.useCallback(function(SelectedPressed)
		-- upvalues: UseStateResult2 (copy), FlagsModule (upval), ControlStateModule (upval), IsTypeMatch (copy), UseRefResult2 (copy), Callback1 (ref), GetSelectionEntryDirectionModule (upval), IsOrientationMatch (copy)
		UseStateResult2(SelectedPressed)
		
		if FlagsModule.FoundationSliderCapture then
			local IsSelectedPressedMatch: boolean = SelectedPressed == ControlStateModule.Selected or SelectedPressed == ControlStateModule.SelectedPressed
			
			if IsTypeMatch and IsSelectedPressedMatch and not UseRefResult2.current then
				Callback1(GetSelectionEntryDirectionModule(IsOrientationMatch) < 0)
			end
			UseRefResult2.current = IsSelectedPressedMatch
		end
	end, { IsTypeMatch, IsOrientationMatch })
	local UsePresentationContextResult = UsePresentationContextFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult7 (copy)
		local Current = UseRefResult4.current
		
		if Current then
			Current.ReferenceUIInstance = UseRefResult7.current
			
			return
		end
	end, {})
	local _UDim2: UDim2 = if IsOrientationMatch then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local MapResult1 = if WithDefaultsModuleResult.isContained then MapResult:map(function(p3): Vector2
		-- upvalues: WithDefaultsModuleResult (copy), IsOrientationMatch (copy)
		local MinRatio = (p3 - WithDefaultsModuleResult.range.Min) / (WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min)
		
		return if IsOrientationMatch then Vector2.new(0.5, 1 - MinRatio) else Vector2.new(MinRatio, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local _UDim = UDim.new(0, GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size).X.Offset)
	local _UDim2_1: UDim2 = if IsOrientationMatch then UDim2.new(_UDim, WithDefaultsModuleResult.width) else UDim2.new(WithDefaultsModuleResult.width, _UDim)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSliderVariantsModuleResult (copy), BlendTransparenciesModule (upval), UseStateResult3 (copy)
		local Stroke = UseSliderVariantsModuleResult.knob.stroke
		
		return if Stroke == nil then nil else {
			Color = Stroke.Color,
			Thickness = Stroke.Thickness,
			Transparency = BlendTransparenciesModule(if typeof(Stroke.Transparency) == "number" then Stroke.Transparency else nil, if UseStateResult3 then 0 else 1)
		}
	end, { UseSliderVariantsModuleResult, UseStateResult3 })
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(Vector2.zero)
	local UseResult24 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2_3 (copy)
		UseBindingResult2_3(Frame.AbsoluteSize)
	end, {})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseSliderVariantsModuleResult (copy), UseMemoResult (copy), UseMemoResult1 (copy)
		return {
			size = WithDefaultsModuleResult.size,
			style = if UseStateResult3 and UseStateResult1 and not UseStateResult4 then UseSliderVariantsModuleResult.knob.dragStyle else UseMemoResult,
			stroke = UseMemoResult1,
			hasShadow = UseSliderVariantsModuleResult.knob.hasShadow
		}
	end, {
		WithDefaultsModuleResult.size, UseStateResult3, UseStateResult1,
		UseStateResult4, UseSliderVariantsModuleResult.knob.dragStyle, UseMemoResult,
		UseMemoResult1, UseSliderVariantsModuleResult.knob.hasShadow
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseSliderVariantsModuleResult (copy), UseMemoResult (copy), UseMemoResult1 (copy)
		return {
			size = WithDefaultsModuleResult.size,
			style = if UseStateResult3 and UseStateResult1 and UseStateResult4 then UseSliderVariantsModuleResult.knob.dragStyle else UseMemoResult,
			stroke = UseMemoResult1,
			hasShadow = UseSliderVariantsModuleResult.knob.hasShadow
		}
	end, {
		WithDefaultsModuleResult.size, UseStateResult3, UseStateResult1,
		UseStateResult4, UseSliderVariantsModuleResult.knob.dragStyle, UseMemoResult,
		UseMemoResult1, UseSliderVariantsModuleResult.knob.hasShadow
	})
	local MapResult2 = UseBindableModuleResult:map(function(p3)
		-- upvalues: UseResult8 (copy)
		return UseResult8(p3.Min)
	end)
	local MapResult3 = UseBindableModuleResult:map(function(p3)
		-- upvalues: UseResult8 (copy)
		return UseResult8(p3.Max)
	end)
	local NoFoundationSliderCapture = IsUseStateResultMatch and (not FlagsModule.FoundationSliderCapture or v1)
	local MapResult4 = if FlagsModule.FoundationSliderCapture and IsTypeMatch then if v2 then MapResult3 else MapResult2 else nil
	local MapResult5 = if FlagsModule.FoundationSliderCapture and IsTypeMatch then if WithDefaultsModuleResult.isContained then MapResult4:map(function(X: number): Vector2
		-- upvalues: IsOrientationMatch (copy)
		return if IsOrientationMatch then Vector2.new(0.5, 1 - X) else Vector2.new(X, 0.5)
	end) else Vector2.new(0.5, 0.5) else nil
	local MapResult6 = if FlagsModule.FoundationSliderCapture and IsTypeMatch then if WithDefaultsModuleResult.knob then UseBindingResult4:map(function(Vector): UDim2
		return UDim2.fromOffset(Vector.X, Vector.Y)
	end) else GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size) else nil
	local UseResult25 = if FlagsModule.FoundationSliderCapture then ReactModule.useCallback(function(_) end, {}) else nil
	local IsUseStateResultMatch1 = FlagsModule.FoundationSliderCapture and (UseLastInputModeModuleResult == InputModeModule.Directional and IsUseStateResultMatch)
	local UIDragDetector = if IsUseStateResultMatch1 then nil elseif IsTypeMatch then ReactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		[ReactModule.Event.DragStart] = UseResult16,
		[ReactModule.Event.DragContinue] = UseResult17,
		[ReactModule.Event.DragEnd] = UseResult18,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not WithDefaultsModuleResult.isDisabled
	}) else ReactModule.createElement("UIDragDetector", {
		ref = UseRefResult4,
		ReferenceUIInstance = UseBindingResult3,
		DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
		DragAxis = if IsOrientationMatch then Vector2.new(0, 1) else Vector2.new(1, 0),
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
		DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
		MinDragTranslation = UseBindingResult,
		MaxDragTranslation = UseBindingResult1,
		[ReactModule.Event.DragStart] = UseResult21,
		[ReactModule.Event.DragContinue] = UseResult20,
		[ReactModule.Event.DragEnd] = UseResult22,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not WithDefaultsModuleResult.isDisabled
	})
	local Element = ReactModule.createElement(ViewModule, {
		tag = UseSliderVariantsModuleResult.bar.tag,
		Size = if IsOrientationMatch then UDim2.new(0, UseSliderVariantsModuleResult.bar.height, 1, 0) else UDim2.new(1, 0, 0, UseSliderVariantsModuleResult.bar.height),
		testId = `{WithDefaultsModuleResult.testId}--bar`
	}, if IsTypeMatch then {
		Fill = ReactModule.createElement(ViewModule, {
			tag = UseSliderVariantsModuleResult.fill.tag,
			AnchorPoint = Vector2.new(0, 0),
			Position = if IsOrientationMatch then MapResult3:map(function(p3: number): UDim2
				return UDim2.fromScale(0, 1 - p3)
			end) else MapResult2:map(function(XScale): UDim2
				return UDim2.fromScale(XScale, 0)
			end),
			Size = UseBindableModuleResult:map(function(p3): UDim2
				-- upvalues: UseResult8 (copy), IsOrientationMatch (copy)
				local UseResultResultDelta = UseResult8(p3.Max) - UseResult8(p3.Min)
				
				return if IsOrientationMatch then UDim2.fromScale(1, UseResultResultDelta) else UDim2.fromScale(UseResultResultDelta, 1)
			end),
			testId = `{WithDefaultsModuleResult.testId}--fill`
		}),
		MinKnob = ReactModule.createElement(SliderThumbModule, {
			LayoutOrder = 1,
			trackRef = UseRefResult7,
			fraction = MapResult2,
			isVertical = IsOrientationMatch,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isDragEnabled = not IsUseStateResultMatch1,
			knobAppearance = UseMemoResult2,
			knob = WithDefaultsModuleResult.knob,
			isContained = WithDefaultsModuleResult.isContained,
			onSeek = UseResult13,
			getBounds = UseResult11,
			onDragStarted = UseResult6,
			onDragEnded = UseResult5,
			Visible = UseStateResult3,
			onAbsoluteSizeChanged = if FlagsModule.FoundationSliderCapture then UseResult24 else nil,
			testId = `{WithDefaultsModuleResult.testId}--min`
		}),
		MaxKnob = ReactModule.createElement(SliderThumbModule, {
			LayoutOrder = 2,
			trackRef = UseRefResult7,
			fraction = MapResult3,
			isVertical = IsOrientationMatch,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isDragEnabled = not IsUseStateResultMatch1,
			knobAppearance = UseMemoResult3,
			knob = WithDefaultsModuleResult.knob,
			isContained = WithDefaultsModuleResult.isContained,
			onSeek = UseResult14,
			getBounds = UseResult12,
			onDragStarted = UseResult7,
			onDragEnded = UseResult5,
			Visible = UseStateResult3,
			onAbsoluteSizeChanged = if FlagsModule.FoundationSliderCapture then UseResult24 else nil,
			testId = `{WithDefaultsModuleResult.testId}--max`
		}),
		SelectionCursor = if FlagsModule.FoundationSliderCapture and NoFoundationSliderCapture then ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			Size = MapResult6,
			AnchorPoint = MapResult5,
			Position = MapResult4:map(function(XScale: number): UDim2
				-- upvalues: IsOrientationMatch (copy)
				return if IsOrientationMatch then UDim2.fromScale(0.5, 1 - XScale) else UDim2.fromScale(XScale, 0.5)
			end),
			selection = { Selectable = true },
			selectionGroup = SelectionGroup,
			cursor = CursorTypeModule.Invisible,
			onStateChanged = UseResult25,
			ref = UseRefResult1,
			testId = `{WithDefaultsModuleResult.testId}--selection-cursor`
		}, {
			Cursor = ReactModule.createElement(CursorComponentModule, {
				isVisible = true,
				cornerRadius = UDim.new(0.5, 0),
				offset = UseTokensModuleResult.Padding.XSmall,
				borderWidth = UseTokensModuleResult.Stroke.Thicker,
				colorNamespace = UsePresentationContextResult.colorNamespace
			})
		}) else nil
	} else {
		Fill = ReactModule.createElement(ViewModule, {
			tag = UseSliderVariantsModuleResult.fill.tag,
			AnchorPoint = if IsOrientationMatch then Vector2.new(0, 1) else nil,
			Position = if IsOrientationMatch then UDim2.fromScale(0, 1) else nil,
			Size = MapResult:map(function(p3): UDim2
				-- upvalues: WithDefaultsModuleResult (copy), IsOrientationMatch (copy)
				local MinRatio = (p3 - WithDefaultsModuleResult.range.Min) / (WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min)
				
				return if IsOrientationMatch then UDim2.fromScale(1, MinRatio) else UDim2.fromScale(MinRatio, 1)
			end),
			testId = `{WithDefaultsModuleResult.testId}--fill`
		}, {
			SelectionCursor = if NoFoundationSliderCapture then ReactModule.createElement(ViewModule, {
				Size = if WithDefaultsModuleResult.knob then UseBindingResult4:map(function(Vector): UDim2
					return UDim2.fromOffset(Vector.X, Vector.Y)
				end) else GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size),
				AnchorPoint = MapResult1,
				Position = _UDim2,
				selection = if FlagsModule.FoundationSliderCapture then { Selectable = true } else nil,
				selectionGroup = if FlagsModule.FoundationSliderCapture then SelectionGroup else nil,
				cursor = if FlagsModule.FoundationSliderCapture then CursorTypeModule.Invisible else nil,
				onStateChanged = UseResult25,
				ref = UseRefResult1,
				testId = `{WithDefaultsModuleResult.testId}--selection-cursor`
			}, {
				Cursor = ReactModule.createElement(CursorComponentModule, {
					isVisible = true,
					cornerRadius = UDim.new(0.5, 0),
					offset = UseTokensModuleResult.Padding.XSmall,
					borderWidth = UseTokensModuleResult.Stroke.Thicker,
					colorNamespace = UsePresentationContextResult.colorNamespace
				})
			}) else nil,
			Knob = if WithDefaultsModuleResult.knob then ReactModule.createElement(ViewModule, {
				tag = "size-0-0 auto-xy",
				AnchorPoint = MapResult1,
				Position = _UDim2,
				Visible = UseStateResult3,
				onAbsoluteSizeChanged = UseResult24,
				testId = `{WithDefaultsModuleResult.testId}--custom-knob`
			}, WithDefaultsModuleResult.knob) else ReactModule.createElement(PresentationContextModule.Provider, { value = config1 }, {
				Knob = ReactModule.createElement(KnobModule, {
					AnchorPoint = MapResult1,
					Position = _UDim2,
					size = WithDefaultsModuleResult.size,
					style = UseMemoResult,
					stroke = UseMemoResult1,
					hasShadow = UseSliderVariantsModuleResult.knob.hasShadow,
					testId = `{WithDefaultsModuleResult.testId}--knob`
				})
			})
		})
	})
	local config4 = { DragDetector = UIDragDetector, Bar = Element }
	
	return if FlagsModule.FoundationSliderCapture then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = _UDim2_1,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if v1 then config2 else config3,
		ref = if IsTypeMatch then UseRefResult7 else UseComposedRefResult
	}), {
		FocusTarget = ReactModule.createElement(ViewModule, {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			cursor = if v1 then CursorTypeModule.Invisible else nil,
			onStateChanged = UseResult23,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			ref = UseRefResult,
			testId = `{WithDefaultsModuleResult.testId}--focus-target`
		}, { DragDetector = UIDragDetector }),
		Bar = Element
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = _UDim2_1,
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		selectionGroup = if IsTypeMatch then nil else UseSliderVariantsModuleResult.selectionGroup,
		cursor = CursorTypeModule.Invisible,
		onStateChanged = UseResult23,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		ref = if IsTypeMatch then UseRefResult7 else UseComposedRefResult
	}), config4)
end)