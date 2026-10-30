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
local CalculateSliderValueFractionModule = require(script.Parent.calculateSliderValueFraction)
local GetGuiInputPositionModule = require(script.Parent.getGuiInputPosition)
local GetSelectionEntryDirectionModule = require(script.Parent.getSelectionEntryDirection)
local UseSliderCaptureKeysModule = require(script.Parent.useSliderCaptureKeys)
local UseSliderDirectionalInputModule = require(script.Parent.useSliderDirectionalInput)
local VisibilityModule = require(Foundation.Enums.Visibility)
local OrientationModule = require(Foundation.Enums.Orientation)
local SliderTypeModule = require(Foundation.Enums.SliderType)
local InternalSliderModule = require(Foundation.Components.InternalSlider)
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

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: FlagsModule (copy), WithDefaultsModule (copy), config (copy), OrientationModule (copy), SliderTypeModule (copy), UseTokensModule (copy), UseSliderVariantsModule (copy), UseBindableModule (copy), ReactModule (copy), ViewModule (copy), PresentationContextModule (copy), config1 (copy), KnobModule (copy), BlendTransparenciesModule (copy), CalculateSliderValueFractionModule (copy), InternalSliderModule (copy), WithCommonPropsModule (copy), ControlStateModule (copy), UseLastInputModeModule (copy), ReactUtilsModule (copy), UseSliderCaptureKeysModule (copy), GuiService (copy), VisibilityModule (copy), CalculateSliderStepValueModule (copy), InputModeModule (copy), CalculateSliderFractionModule (copy), GetGuiInputPositionModule (copy), UseSliderDirectionalInputModule (copy), GetSelectionEntryDirectionModule (copy), UsePresentationContextFunction (copy), GetKnobSizeModule (copy), SliderThumbModule (copy), SelectionGroup (copy), CursorTypeModule (copy), CursorComponentModule (copy), ConstantsModule (copy), config2 (copy), config3 (copy), StateLayerAffordanceModule (copy)
	if FlagsModule.FoundationSliderRebuild then
		local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
		local IsOrientationMatch = WithDefaultsModuleResult.orientation == OrientationModule.Vertical
		local IsTypeMatch = p1.type == SliderTypeModule.Range
		local UseSliderVariantsModuleResult = UseSliderVariantsModule(UseTokensModule(), WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, IsOrientationMatch)
		local UseBindableModuleResult = UseBindableModule(if p1.type == SliderTypeModule.Range then 0 else p1.value)
		local UseBindableModuleResult1 = UseBindableModule(if p1.type == SliderTypeModule.Range then p1.value else NumberRange.new(0))
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: IsTypeMatch (copy), UseBindableModuleResult1 (copy), WithDefaultsModuleResult (copy), UseBindableModuleResult (copy)
			return if IsTypeMatch then {
				{
					value = UseBindableModuleResult1:map(function(p2)
						return p2.Min
					end),
					testId = `{WithDefaultsModuleResult.testId}--min`
				},
				{
					value = UseBindableModuleResult1:map(function(p2)
						return p2.Max
					end),
					testId = `{WithDefaultsModuleResult.testId}--max`
				}
			} else {
				{
					value = UseBindableModuleResult:map(function(Value: number): number
						-- upvalues: WithDefaultsModuleResult (upval)
						return (math.clamp(Value, WithDefaultsModuleResult.range.Min, WithDefaultsModuleResult.range.Max))
					end),
					testId = `{WithDefaultsModuleResult.testId}--thumb`
				}
			}
		end, {
			IsTypeMatch, UseBindableModuleResult1, UseBindableModuleResult,
			WithDefaultsModuleResult.range.Min, WithDefaultsModuleResult.range.Max,
			WithDefaultsModuleResult.testId
		})
		
		return ReactModule.createElement(InternalSliderModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			thumbs = UseMemoResult,
			onValueChanged = ReactModule.useCallback(function(p2, MinValue)
				-- upvalues: p1 (copy), SliderTypeModule (upval), UseBindableModuleResult1 (copy)
				if p1.type == SliderTypeModule.Range then
					if p1.onValueChanged then
						local Value = UseBindableModuleResult1:getValue()
						p1.onValueChanged(if p2 == 1 then NumberRange.new(MinValue, Value.Max) else NumberRange.new(Value.Min, MinValue))
						
						return
					end
				elseif p1.onValueChanged then
					p1.onValueChanged(MinValue)
				end
			end, { p1.type, p1.onValueChanged, UseBindableModuleResult1 }),
			renderThumb = ReactModule.useCallback(function(p2, p3)
				-- upvalues: WithDefaultsModuleResult (copy), IsTypeMatch (copy), ReactModule (upval), ViewModule (upval), PresentationContextModule (upval), config1 (upval), KnobModule (upval), UseSliderVariantsModuleResult (copy), BlendTransparenciesModule (upval), UseMemoResult (copy)
				return if WithDefaultsModuleResult.knob then if IsTypeMatch then WithDefaultsModuleResult.knob else ReactModule.createElement(ViewModule, {
					tag = "size-0-0 auto-xy",
					Visible = p3.isVisible,
					testId = `{WithDefaultsModuleResult.testId}--custom-knob`
				}, WithDefaultsModuleResult.knob) else ReactModule.createElement(PresentationContextModule.Provider, { value = config1 }, {
					Knob = ReactModule.createElement(KnobModule, {
						size = WithDefaultsModuleResult.size,
						style = if p3.isVisible then if p3.isDragging then UseSliderVariantsModuleResult.knob.dragStyle else UseSliderVariantsModuleResult.knob.style else {
							Transparency = 1,
							Color3 = UseSliderVariantsModuleResult.knob.style.Color3
						},
						stroke = if UseSliderVariantsModuleResult.knob.stroke then {
							Color = UseSliderVariantsModuleResult.knob.stroke.Color,
							Thickness = UseSliderVariantsModuleResult.knob.stroke.Thickness,
							Transparency = BlendTransparenciesModule(if typeof(UseSliderVariantsModuleResult.knob.stroke.Transparency) == "number" then UseSliderVariantsModuleResult.knob.stroke.Transparency else nil, if p3.isVisible then 0 else 1)
						} else nil,
						hasShadow = UseSliderVariantsModuleResult.knob.hasShadow,
						testId = if IsTypeMatch then `{UseMemoResult[p2].testId}--knob` else `{WithDefaultsModuleResult.testId}--knob`
					})
				})
			end, {
				WithDefaultsModuleResult.knob, WithDefaultsModuleResult.size,
				WithDefaultsModuleResult.testId, IsTypeMatch, UseSliderVariantsModuleResult,
				UseMemoResult
			}),
			range = WithDefaultsModuleResult.range,
			step = WithDefaultsModuleResult.step,
			size = WithDefaultsModuleResult.size,
			width = WithDefaultsModuleResult.width,
			orientation = WithDefaultsModuleResult.orientation,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isContained = WithDefaultsModuleResult.isContained,
			knobVisibility = WithDefaultsModuleResult.knobVisibility,
			onDragStarted = WithDefaultsModuleResult.onDragStarted,
			onDragEnded = WithDefaultsModuleResult.onDragEnded,
			ref = Ref
		}), ReactModule.createElement(ViewModule, {
			tag = UseSliderVariantsModuleResult.bar.tag,
			Size = if IsOrientationMatch then UDim2.new(0, UseSliderVariantsModuleResult.bar.height, 1, 0) else UDim2.new(1, 0, 0, UseSliderVariantsModuleResult.bar.height),
			testId = `{WithDefaultsModuleResult.testId}--bar`
		}, {
			Fill = if IsTypeMatch then ReactModule.createElement(ViewModule, {
				tag = UseSliderVariantsModuleResult.fill.tag,
				Position = UseBindableModuleResult1:map(function(p2): UDim2
					-- upvalues: IsOrientationMatch (copy), CalculateSliderValueFractionModule (upval), WithDefaultsModuleResult (copy)
					return if IsOrientationMatch then UDim2.fromScale(0, 1 - CalculateSliderValueFractionModule(p2.Max, WithDefaultsModuleResult.range)) else UDim2.fromScale(CalculateSliderValueFractionModule(p2.Min, WithDefaultsModuleResult.range), 0)
				end),
				Size = UseBindableModuleResult1:map(function(p2): UDim2
					-- upvalues: CalculateSliderValueFractionModule (upval), WithDefaultsModuleResult (copy), IsOrientationMatch (copy)
					local SliderValueFractionModuleDelta = CalculateSliderValueFractionModule(p2.Max, WithDefaultsModuleResult.range) - CalculateSliderValueFractionModule(p2.Min, WithDefaultsModuleResult.range)
					
					return if IsOrientationMatch then UDim2.fromScale(1, SliderValueFractionModuleDelta) else UDim2.fromScale(SliderValueFractionModuleDelta, 1)
				end),
				testId = `{WithDefaultsModuleResult.testId}--fill`
			}) else ReactModule.createElement(ViewModule, {
				tag = UseSliderVariantsModuleResult.fill.tag,
				AnchorPoint = if IsOrientationMatch then Vector2.new(0, 1) else nil,
				Position = if IsOrientationMatch then UDim2.fromScale(0, 1) else nil,
				Size = UseBindableModuleResult:map(function(p2): UDim2
					-- upvalues: CalculateSliderValueFractionModule (upval), WithDefaultsModuleResult (copy), IsOrientationMatch (copy)
					local SliderValueFractionModule = CalculateSliderValueFractionModule(p2, WithDefaultsModuleResult.range)
					
					return if IsOrientationMatch then UDim2.fromScale(1, SliderValueFractionModule) else UDim2.fromScale(SliderValueFractionModule, 1)
				end),
				testId = `{WithDefaultsModuleResult.testId}--fill`
			})
		}))
	end
	local WithDefaultsModuleResult1 = WithDefaultsModule(p1, config)
	local IsOrientationMatch1 = WithDefaultsModuleResult1.orientation == OrientationModule.Vertical
	local IsTypeMatch1 = p1.type == SliderTypeModule.Range
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
		-- upvalues: WithDefaultsModuleResult1 (copy)
		return (math.clamp(Value, WithDefaultsModuleResult1.range.Min, WithDefaultsModuleResult1.range.Max))
	end)
	local UseBindableModuleResult2 = UseBindableModule(if p1.type == SliderTypeModule.Range then p1.value else NumberRange.new(0))
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UDim2.new())
	local UseResult = ReactModule.useCallback(function(YScale: number)
		-- upvalues: IsOrientationMatch1 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy)
		if IsOrientationMatch1 then
			UseBindingResult2(UDim2.fromScale(0, YScale - 1))
			UseBindingResult2_1(UDim2.fromScale(0, YScale))
			
			return
		else
			UseBindingResult2(UDim2.fromScale(-YScale, 0))
			UseBindingResult2_1(UDim2.fromScale(1 - YScale, 0))
		end
	end, { IsOrientationMatch1 })
	local UseRefResult6 = ReactModule.useRef(0)
	local UseLastInputModeModuleResult = UseLastInputModeModule()
	local UseRefResult7 = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(Ref, function()
		-- upvalues: UseRefResult7 (copy)
		return UseRefResult7.current
	end, {})
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(UseRefResult7, UseBindingResult2_2)
	local UseSliderVariantsModuleResult1 = UseSliderVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult1.size, WithDefaultsModuleResult1.variant, IsOrientationMatch1)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult3 (copy), UseSliderVariantsModuleResult1 (copy), UseStateResult1 (copy), IsTypeMatch1 (copy)
		return if UseStateResult3 then if UseStateResult1 and not IsTypeMatch1 then UseSliderVariantsModuleResult1.knob.dragStyle else UseSliderVariantsModuleResult1.knob.style else {
			Transparency = 1,
			Color3 = UseSliderVariantsModuleResult1.knob.style.Color3
		}
	end, {
		UseSliderVariantsModuleResult1,
		UseStateResult3,
		UseStateResult1,
		IsTypeMatch1
	})
	local IsUseStateResultMatch = UseStateResult == ControlStateModule.Selected or (UseStateResult == ControlStateModule.SelectedPressed or FlagsModule.FoundationSliderCapture and v1)
	local UseResult1 = if FlagsModule.FoundationSliderCapture then ReactModule.useCallback(function()
		-- upvalues: v1 (ref), IsTypeMatch1 (copy), Callback1 (ref), v2 (ref), Callback (ref)
		if not v1 then
			Callback(true)
		elseif IsTypeMatch1 then
			Callback1(not v2)
			
			return
		end
	end, { v1, IsTypeMatch1, v2 }) else nil
	
	if FlagsModule.FoundationSliderCapture then
		UseSliderCaptureKeysModule(IsUseStateResultMatch and not WithDefaultsModuleResult1.isDisabled, UseResult1)
	end
	if FlagsModule.FoundationSliderCapture then
		ReactModule.useEffect(function()
			-- upvalues: WithDefaultsModuleResult1 (copy), Callback (ref)
			if WithDefaultsModuleResult1.isDisabled then
				Callback(false)
			end
		end, { WithDefaultsModuleResult1.isDisabled })
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
		-- upvalues: WithDefaultsModuleResult1 (copy), UseStateResult2_2 (copy), VisibilityModule (upval), IsUseStateResultMatch (copy), UseStateResult1 (copy), UseStateResult (copy), ControlStateModule (upval)
		if WithDefaultsModuleResult1.isDisabled then
			UseStateResult2_2(false)
			
			return
		end
		if WithDefaultsModuleResult1.knobVisibility == VisibilityModule.None then
			UseStateResult2_2(IsUseStateResultMatch)
			
			return
		end
		if WithDefaultsModuleResult1.knobVisibility == VisibilityModule.Always then
			UseStateResult2_2(true)
			
			return
		else
			UseStateResult2_2(UseStateResult1 or (UseStateResult == ControlStateModule.Hover or (UseStateResult == ControlStateModule.Selected or UseStateResult == ControlStateModule.Pressed)))
		end
	end, {
		WithDefaultsModuleResult1.knobVisibility,
		UseStateResult,
		UseStateResult1,
		WithDefaultsModuleResult1.isDisabled,
		IsUseStateResultMatch
	})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: MapResult (copy), OnValueChanged (copy)
		if p2 ~= MapResult:getValue() and OnValueChanged then
			OnValueChanged(p2)
		end
	end, { MapResult, OnValueChanged })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindableModuleResult2 (copy), OnValueChanged1 (copy)
		local Value = UseBindableModuleResult2:getValue()
		
		if OnValueChanged1 and (typeof(Value) ~= "NumberRange" or p2.Min ~= Value.Min or p2.Max ~= Value.Max) then
			OnValueChanged1(p2)
		end
	end, { UseBindableModuleResult2, OnValueChanged1 })
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy), FlagsModule (upval), Callback1 (ref), UseStateResult2_1 (copy), WithDefaultsModuleResult1 (copy)
		UseStateResult2_3(p2)
		
		if FlagsModule.FoundationSliderCapture then
			Callback1(p2)
		end
		UseStateResult2_1(true)
		
		if WithDefaultsModuleResult1.onDragStarted then
			WithDefaultsModuleResult1.onDragStarted()
		end
	end, { WithDefaultsModuleResult1.onDragStarted })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult1 (copy)
		UseStateResult2_1(false)
		
		if WithDefaultsModuleResult1.onDragEnded then
			WithDefaultsModuleResult1.onDragEnded()
		end
	end, { WithDefaultsModuleResult1.onDragEnded })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseResult4 (copy)
		UseResult4(false)
	end, { UseResult4 })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseResult4 (copy)
		UseResult4(true)
	end, { UseResult4 })
	local UseResult8 = ReactModule.useCallback(function(p2): number
		-- upvalues: WithDefaultsModuleResult1 (copy)
		return (math.clamp((p2 - WithDefaultsModuleResult1.range.Min) / (WithDefaultsModuleResult1.range.Max - WithDefaultsModuleResult1.range.Min), 0, 1))
	end, {
		WithDefaultsModuleResult1.range.Min,
		WithDefaultsModuleResult1.range.Max
	})
	local UseResult9 = ReactModule.useCallback(function(p2)
		-- upvalues: WithDefaultsModuleResult1 (copy)
		return WithDefaultsModuleResult1.range.Min + p2 * (WithDefaultsModuleResult1.range.Max - WithDefaultsModuleResult1.range.Min)
	end, {
		WithDefaultsModuleResult1.range.Min,
		WithDefaultsModuleResult1.range.Max
	})
	local UseResult10 = ReactModule.useCallback(function(p2)
		-- upvalues: UseResult9 (copy), WithDefaultsModuleResult1 (copy), CalculateSliderStepValueModule (upval)
		local UseResultResult = UseResult9(p2)
		
		return if WithDefaultsModuleResult1.step then CalculateSliderStepValueModule(UseResultResult, WithDefaultsModuleResult1.step, WithDefaultsModuleResult1.range) else UseResultResult
	end, {
		UseResult9,
		WithDefaultsModuleResult1.step,
		WithDefaultsModuleResult1.range
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseResult8 (copy), UseBindableModuleResult2 (copy), WithDefaultsModuleResult1 (copy), UseResult9 (copy)
		local UseResultResult = UseResult8(UseBindableModuleResult2:getValue().Max)
		
		if WithDefaultsModuleResult1.step and WithDefaultsModuleResult1.step > 0 then
			UseResultResult = UseResult8(WithDefaultsModuleResult1.range.Min + math.floor((UseResult9(UseResultResult) - WithDefaultsModuleResult1.range.Min) / WithDefaultsModuleResult1.step + 0.5) * WithDefaultsModuleResult1.step)
		end
		return 0, UseResultResult
	end, {
		UseBindableModuleResult2,
		UseResult8,
		WithDefaultsModuleResult1.step,
		UseResult9,
		WithDefaultsModuleResult1.range.Min
	})
	local UseResult12 = ReactModule.useCallback(function()
		-- upvalues: UseResult8 (copy), UseBindableModuleResult2 (copy), WithDefaultsModuleResult1 (copy), UseResult9 (copy)
		local UseResultResult = UseResult8(UseBindableModuleResult2:getValue().Min)
		
		if WithDefaultsModuleResult1.step and WithDefaultsModuleResult1.step > 0 then
			UseResultResult = UseResult8(WithDefaultsModuleResult1.range.Min + math.floor((UseResult9(UseResultResult) - WithDefaultsModuleResult1.range.Min) / WithDefaultsModuleResult1.step + 0.5) * WithDefaultsModuleResult1.step)
		end
		return UseResultResult, 1
	end, {
		UseBindableModuleResult2,
		UseResult8,
		WithDefaultsModuleResult1.step,
		UseResult9,
		WithDefaultsModuleResult1.range.Min
	})
	local UseResult13 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindableModuleResult2 (copy), UseResult3 (copy), UseResult10 (copy)
		local Value = UseBindableModuleResult2:getValue()
		UseResult3(NumberRange.new(math.min(UseResult10(p2), Value.Max), Value.Max))
	end, { UseBindableModuleResult2, UseResult3, UseResult10 })
	local UseResult14 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindableModuleResult2 (copy), UseResult3 (copy), UseResult10 (copy)
		local Value = UseBindableModuleResult2:getValue()
		UseResult3(NumberRange.new(Value.Min, (math.max(UseResult10(p2), Value.Min))))
	end, { UseBindableModuleResult2, UseResult3, UseResult10 })
	local UseResult15 = ReactModule.useCallback(function(Value: number, p2)
		-- upvalues: UseResult12 (copy), UseResult14 (copy), UseResult11 (copy), UseResult13 (copy)
		if p2 then
			local UseResultResult, UseResultResult2 = UseResult12()
			UseResult14((math.clamp(Value, UseResultResult, UseResultResult2)))
			
			return
		else
			local UseResultResult1, UseResultResult2_1 = UseResult11()
			UseResult13((math.clamp(Value, UseResultResult1, UseResultResult2_1)))
		end
	end, { UseResult12, UseResult11, UseResult14, UseResult13 })
	local UseResult16 = ReactModule.useCallback(function(_, p2)
		-- upvalues: IsTypeMatch1 (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult7 (copy), CalculateSliderFractionModule (upval), GetGuiInputPositionModule (upval), IsOrientationMatch1 (copy), UseBindableModuleResult2 (copy), UseResult8 (copy), UseRefResult3 (copy), FlagsModule (upval), Callback1 (ref), UseResult4 (copy), UseResult15 (copy)
		if not IsTypeMatch1 or UseLastInputModeModuleResult == InputModeModule.Directional or not UseRefResult7.current then return end
		local SliderFractionModule = CalculateSliderFractionModule(GetGuiInputPositionModule(p2, UseRefResult7.current), UseRefResult7.current, IsOrientationMatch1)
		local Value = UseBindableModuleResult2:getValue()
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
		IsTypeMatch1, UseLastInputModeModuleResult, IsOrientationMatch1,
		UseBindableModuleResult2, UseResult4, UseResult15, UseResult8
	})
	local UseResult17 = ReactModule.useCallback(function(_, p2)
		-- upvalues: IsTypeMatch1 (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult7 (copy), GetGuiInputPositionModule (upval), UseResult15 (copy), CalculateSliderFractionModule (upval), IsOrientationMatch1 (copy), UseRefResult3 (copy)
		if IsTypeMatch1 and UseLastInputModeModuleResult ~= InputModeModule.Directional and UseRefResult7.current then
			UseResult15(CalculateSliderFractionModule(GetGuiInputPositionModule(p2, UseRefResult7.current), UseRefResult7.current, IsOrientationMatch1), UseRefResult3.current)
			
			return
		end
	end, {
		IsTypeMatch1,
		UseLastInputModeModuleResult,
		IsOrientationMatch1,
		UseResult15
	})
	local UseResult18 = ReactModule.useCallback(function()
		-- upvalues: IsTypeMatch1 (copy), UseResult5 (copy)
		if IsTypeMatch1 then
			UseResult5()
			
			return
		end
	end, { IsTypeMatch1, UseResult5 })
	local UseResult19 = if FlagsModule.FoundationSliderCapture then ReactModule.useCallback(function()
		-- upvalues: Callback (ref), GuiService (upval), UseRefResult (copy)
		Callback(false)
		GuiService.SelectedObject = UseRefResult.current
	end, {}) else nil
	local NoIsDisabled: boolean = IsUseStateResultMatch and not WithDefaultsModuleResult1.isDisabled
	UseSliderDirectionalInputModule(if FlagsModule.FoundationSliderCapture then NoIsDisabled and v1 else NoIsDisabled and not IsTypeMatch1, WithDefaultsModuleResult1.step, WithDefaultsModuleResult1.range, IsOrientationMatch1, (ReactModule.useMemo(function()
		-- upvalues: FlagsModule (upval), IsTypeMatch1 (copy), UseBindableModuleResult2 (copy), v2 (ref), MapResult (copy), UseResult3 (copy), UseResult2 (copy), WithDefaultsModuleResult1 (copy), CalculateSliderStepValueModule (upval), UseResult19 (copy)
		return {
			getValue = function()
				-- upvalues: FlagsModule (upval), IsTypeMatch1 (upval), UseBindableModuleResult2 (upval), v2 (upval), MapResult (upval)
				if FlagsModule.FoundationSliderCapture and IsTypeMatch1 then
					local Value = UseBindableModuleResult2:getValue()
					
					return if v2 then Value.Max else Value.Min
				else
					return MapResult:getValue()
				end
			end,
			onStep = if FlagsModule.FoundationSliderCapture then function(p2: number)
				-- upvalues: IsTypeMatch1 (upval), UseBindableModuleResult2 (upval), v2 (upval), UseResult3 (upval), UseResult2 (upval)
				if not IsTypeMatch1 then
					UseResult2(p2)
					
					return
				end
				local Value = UseBindableModuleResult2:getValue()
				
				if v2 then
					UseResult3(NumberRange.new(Value.Min, (math.max(p2, Value.Min))))
					
					return
				else
					UseResult3(NumberRange.new(math.min(p2, Value.Max), Value.Max))
				end
			end else function(p2)
				-- upvalues: WithDefaultsModuleResult1 (upval), CalculateSliderStepValueModule (upval), UseResult2 (upval)
				UseResult2(if WithDefaultsModuleResult1.step then CalculateSliderStepValueModule(p2, WithDefaultsModuleResult1.step, WithDefaultsModuleResult1.range) else p2)
			end,
			onExit = if FlagsModule.FoundationSliderCapture then UseResult19 else nil
		}
	end, {
		MapResult, UseResult2, WithDefaultsModuleResult1.step,
		WithDefaultsModuleResult1.range,
		if FlagsModule.FoundationSliderCapture then IsTypeMatch1 else nil,
		if FlagsModule.FoundationSliderCapture then UseBindableModuleResult2 else nil,
		if FlagsModule.FoundationSliderCapture then v2 else nil,
		if FlagsModule.FoundationSliderCapture then UseResult3 else nil,
		if FlagsModule.FoundationSliderCapture then UseResult19 else nil
	})))
	local UseResult20 = ReactModule.useCallback(function(_, _)
		-- upvalues: UseRefResult4 (copy), WithDefaultsModuleResult1 (copy), IsOrientationMatch1 (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult6 (copy), UseRefResult5 (copy), MapResult (copy), UseResult (copy), UseResult2 (copy), CalculateSliderStepValueModule (upval)
		local Current = UseRefResult4.current
		
		if not Current then return end
		local MaxDelta = WithDefaultsModuleResult1.range.Max - WithDefaultsModuleResult1.range.Min
		local Negated = if IsOrientationMatch1 then -Current.DragUDim2.Y.Scale else Current.DragUDim2.X.Scale
		
		if UseLastInputModeModuleResult == InputModeModule.Directional and math.abs(Negated - UseRefResult6.current) > 0.01 then
			UseRefResult5.current = (MapResult:getValue() - WithDefaultsModuleResult1.range.Min) / MaxDelta - Negated
			UseRefResult6.current = Negated
			UseResult(UseRefResult5.current)
			
			return
		else
			UseRefResult6.current = Negated
			local NewMin = WithDefaultsModuleResult1.range.Min + math.clamp(UseRefResult5.current + Negated, 0, 1) * MaxDelta
			UseResult2(if WithDefaultsModuleResult1.step then CalculateSliderStepValueModule(NewMin, WithDefaultsModuleResult1.step, WithDefaultsModuleResult1.range) else NewMin)
		end
	end, {
		WithDefaultsModuleResult1.step, WithDefaultsModuleResult1.range,
		UseLastInputModeModuleResult, MapResult, UseResult2, IsOrientationMatch1,
		UseResult
	})
	local UseResult21 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult1 (copy), UseRefResult6 (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), UseRefResult5 (copy), MapResult (copy), UseResult (copy), UseRefResult7 (copy), CalculateSliderFractionModule (upval), GetGuiInputPositionModule (upval), IsOrientationMatch1 (copy), UseResult2 (copy), CalculateSliderStepValueModule (upval)
		UseStateResult2_1(true)
		
		if WithDefaultsModuleResult1.onDragStarted then
			WithDefaultsModuleResult1.onDragStarted()
		end
		UseRefResult6.current = 0
		local MaxDelta = WithDefaultsModuleResult1.range.Max - WithDefaultsModuleResult1.range.Min
		
		if UseLastInputModeModuleResult == InputModeModule.Directional then
			UseRefResult5.current = (MapResult:getValue() - WithDefaultsModuleResult1.range.Min) / MaxDelta
			UseResult(UseRefResult5.current)
			
			return
		else
			local NewMin = if UseRefResult7.current then WithDefaultsModuleResult1.range.Min + CalculateSliderFractionModule(GetGuiInputPositionModule(p2, UseRefResult7.current), UseRefResult7.current, IsOrientationMatch1) * MaxDelta else WithDefaultsModuleResult1.range.Min
			UseRefResult5.current = (NewMin - WithDefaultsModuleResult1.range.Min) / MaxDelta
			UseResult2(if WithDefaultsModuleResult1.step then CalculateSliderStepValueModule(NewMin, WithDefaultsModuleResult1.step, WithDefaultsModuleResult1.range) else NewMin)
			UseResult(UseRefResult5.current)
		end
	end, {
		WithDefaultsModuleResult1.onDragStarted, WithDefaultsModuleResult1.step,
		WithDefaultsModuleResult1.range, UseLastInputModeModuleResult, MapResult,
		UseResult2, IsOrientationMatch1, UseResult
	})
	local UseResult22 = ReactModule.useCallback(function(_, _)
		-- upvalues: UseStateResult2_1 (copy), WithDefaultsModuleResult1 (copy)
		UseStateResult2_1(false)
		
		if WithDefaultsModuleResult1.onDragEnded then
			WithDefaultsModuleResult1.onDragEnded()
		end
	end, { WithDefaultsModuleResult1.onDragEnded })
	local UseResult23 = ReactModule.useCallback(function(SelectedPressed)
		-- upvalues: UseStateResult2 (copy), FlagsModule (upval), ControlStateModule (upval), IsTypeMatch1 (copy), UseRefResult2 (copy), Callback1 (ref), GetSelectionEntryDirectionModule (upval), IsOrientationMatch1 (copy)
		UseStateResult2(SelectedPressed)
		
		if FlagsModule.FoundationSliderCapture then
			local IsSelectedPressedMatch: boolean = SelectedPressed == ControlStateModule.Selected or SelectedPressed == ControlStateModule.SelectedPressed
			
			if IsTypeMatch1 and IsSelectedPressedMatch and not UseRefResult2.current then
				Callback1(GetSelectionEntryDirectionModule(IsOrientationMatch1) < 0)
			end
			UseRefResult2.current = IsSelectedPressedMatch
		end
	end, { IsTypeMatch1, IsOrientationMatch1 })
	local UsePresentationContextResult = UsePresentationContextFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult7 (copy)
		local Current = UseRefResult4.current
		
		if Current then
			Current.ReferenceUIInstance = UseRefResult7.current
			
			return
		end
	end, {})
	local _UDim2: UDim2 = if IsOrientationMatch1 then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local MapResult1 = if WithDefaultsModuleResult1.isContained then MapResult:map(function(p2): Vector2
		-- upvalues: WithDefaultsModuleResult1 (copy), IsOrientationMatch1 (copy)
		local MinRatio = (p2 - WithDefaultsModuleResult1.range.Min) / (WithDefaultsModuleResult1.range.Max - WithDefaultsModuleResult1.range.Min)
		
		return if IsOrientationMatch1 then Vector2.new(0.5, 1 - MinRatio) else Vector2.new(MinRatio, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local _UDim = UDim.new(0, GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult1.size).X.Offset)
	local _UDim2_1: UDim2 = if IsOrientationMatch1 then UDim2.new(_UDim, WithDefaultsModuleResult1.width) else UDim2.new(WithDefaultsModuleResult1.width, _UDim)
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseSliderVariantsModuleResult1 (copy), BlendTransparenciesModule (upval), UseStateResult3 (copy)
		local Stroke = UseSliderVariantsModuleResult1.knob.stroke
		
		return if Stroke == nil then nil else {
			Color = Stroke.Color,
			Thickness = Stroke.Thickness,
			Transparency = BlendTransparenciesModule(if typeof(Stroke.Transparency) == "number" then Stroke.Transparency else nil, if UseStateResult3 then 0 else 1)
		}
	end, { UseSliderVariantsModuleResult1, UseStateResult3 })
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(Vector2.zero)
	local UseResult24 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2_3 (copy)
		UseBindingResult2_3(Frame.AbsoluteSize)
	end, {})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult1 (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseSliderVariantsModuleResult1 (copy), UseMemoResult1 (copy), UseMemoResult2 (copy)
		return {
			size = WithDefaultsModuleResult1.size,
			style = if UseStateResult3 and UseStateResult1 and not UseStateResult4 then UseSliderVariantsModuleResult1.knob.dragStyle else UseMemoResult1,
			stroke = UseMemoResult2,
			hasShadow = UseSliderVariantsModuleResult1.knob.hasShadow
		}
	end, {
		WithDefaultsModuleResult1.size, UseStateResult3, UseStateResult1,
		UseStateResult4, UseSliderVariantsModuleResult1.knob.dragStyle, UseMemoResult1,
		UseMemoResult2, UseSliderVariantsModuleResult1.knob.hasShadow
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult1 (copy), UseStateResult3 (copy), UseStateResult1 (copy), UseStateResult4 (copy), UseSliderVariantsModuleResult1 (copy), UseMemoResult1 (copy), UseMemoResult2 (copy)
		return {
			size = WithDefaultsModuleResult1.size,
			style = if UseStateResult3 and UseStateResult1 and UseStateResult4 then UseSliderVariantsModuleResult1.knob.dragStyle else UseMemoResult1,
			stroke = UseMemoResult2,
			hasShadow = UseSliderVariantsModuleResult1.knob.hasShadow
		}
	end, {
		WithDefaultsModuleResult1.size, UseStateResult3, UseStateResult1,
		UseStateResult4, UseSliderVariantsModuleResult1.knob.dragStyle, UseMemoResult1,
		UseMemoResult2, UseSliderVariantsModuleResult1.knob.hasShadow
	})
	local MapResult2 = UseBindableModuleResult2:map(function(p2)
		-- upvalues: UseResult8 (copy)
		return UseResult8(p2.Min)
	end)
	local MapResult3 = UseBindableModuleResult2:map(function(p2)
		-- upvalues: UseResult8 (copy)
		return UseResult8(p2.Max)
	end)
	local NoFoundationSliderCapture = IsUseStateResultMatch and (not FlagsModule.FoundationSliderCapture or v1)
	local MapResult4 = if FlagsModule.FoundationSliderCapture and IsTypeMatch1 then if v2 then MapResult3 else MapResult2 else nil
	local MapResult5 = if FlagsModule.FoundationSliderCapture and IsTypeMatch1 then if WithDefaultsModuleResult1.isContained then MapResult4:map(function(X: number): Vector2
		-- upvalues: IsOrientationMatch1 (copy)
		return if IsOrientationMatch1 then Vector2.new(0.5, 1 - X) else Vector2.new(X, 0.5)
	end) else Vector2.new(0.5, 0.5) else nil
	local MapResult6 = if FlagsModule.FoundationSliderCapture and IsTypeMatch1 then if WithDefaultsModuleResult1.knob then UseBindingResult4:map(function(Vector): UDim2
		return UDim2.fromOffset(Vector.X, Vector.Y)
	end) else GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult1.size) else nil
	local UseResult25 = if FlagsModule.FoundationSliderCapture then ReactModule.useCallback(function(_) end, {}) else nil
	local IsUseStateResultMatch1 = FlagsModule.FoundationSliderCapture and (UseLastInputModeModuleResult == InputModeModule.Directional and IsUseStateResultMatch)
	local UIDragDetector = if IsUseStateResultMatch1 then nil elseif IsTypeMatch1 then ReactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		[ReactModule.Event.DragStart] = UseResult16,
		[ReactModule.Event.DragContinue] = UseResult17,
		[ReactModule.Event.DragEnd] = UseResult18,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not WithDefaultsModuleResult1.isDisabled
	}) else ReactModule.createElement("UIDragDetector", {
		ref = UseRefResult4,
		ReferenceUIInstance = UseBindingResult3,
		DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
		DragAxis = if IsOrientationMatch1 then Vector2.new(0, 1) else Vector2.new(1, 0),
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
		DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
		MinDragTranslation = UseBindingResult,
		MaxDragTranslation = UseBindingResult1,
		[ReactModule.Event.DragStart] = UseResult21,
		[ReactModule.Event.DragContinue] = UseResult20,
		[ReactModule.Event.DragEnd] = UseResult22,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not WithDefaultsModuleResult1.isDisabled
	})
	local Element = ReactModule.createElement(ViewModule, {
		tag = UseSliderVariantsModuleResult1.bar.tag,
		Size = if IsOrientationMatch1 then UDim2.new(0, UseSliderVariantsModuleResult1.bar.height, 1, 0) else UDim2.new(1, 0, 0, UseSliderVariantsModuleResult1.bar.height),
		testId = `{WithDefaultsModuleResult1.testId}--bar`
	}, if IsTypeMatch1 then {
		Fill = ReactModule.createElement(ViewModule, {
			tag = UseSliderVariantsModuleResult1.fill.tag,
			AnchorPoint = Vector2.new(0, 0),
			Position = if IsOrientationMatch1 then MapResult3:map(function(p2: number): UDim2
				return UDim2.fromScale(0, 1 - p2)
			end) else MapResult2:map(function(XScale): UDim2
				return UDim2.fromScale(XScale, 0)
			end),
			Size = UseBindableModuleResult2:map(function(p2): UDim2
				-- upvalues: UseResult8 (copy), IsOrientationMatch1 (copy)
				local UseResultResultDelta = UseResult8(p2.Max) - UseResult8(p2.Min)
				
				return if IsOrientationMatch1 then UDim2.fromScale(1, UseResultResultDelta) else UDim2.fromScale(UseResultResultDelta, 1)
			end),
			testId = `{WithDefaultsModuleResult1.testId}--fill`
		}),
		MinKnob = ReactModule.createElement(SliderThumbModule, {
			LayoutOrder = 1,
			trackRef = UseRefResult7,
			fraction = MapResult2,
			isVertical = IsOrientationMatch1,
			isDisabled = WithDefaultsModuleResult1.isDisabled,
			isDragEnabled = not IsUseStateResultMatch1,
			knobAppearance = UseMemoResult3,
			knob = WithDefaultsModuleResult1.knob,
			isContained = WithDefaultsModuleResult1.isContained,
			onSeek = UseResult13,
			getBounds = UseResult11,
			onDragStarted = UseResult6,
			onDragEnded = UseResult5,
			Visible = UseStateResult3,
			onAbsoluteSizeChanged = if FlagsModule.FoundationSliderCapture then UseResult24 else nil,
			testId = `{WithDefaultsModuleResult1.testId}--min`
		}),
		MaxKnob = ReactModule.createElement(SliderThumbModule, {
			LayoutOrder = 2,
			trackRef = UseRefResult7,
			fraction = MapResult3,
			isVertical = IsOrientationMatch1,
			isDisabled = WithDefaultsModuleResult1.isDisabled,
			isDragEnabled = not IsUseStateResultMatch1,
			knobAppearance = UseMemoResult4,
			knob = WithDefaultsModuleResult1.knob,
			isContained = WithDefaultsModuleResult1.isContained,
			onSeek = UseResult14,
			getBounds = UseResult12,
			onDragStarted = UseResult7,
			onDragEnded = UseResult5,
			Visible = UseStateResult3,
			onAbsoluteSizeChanged = if FlagsModule.FoundationSliderCapture then UseResult24 else nil,
			testId = `{WithDefaultsModuleResult1.testId}--max`
		}),
		SelectionCursor = if FlagsModule.FoundationSliderCapture and NoFoundationSliderCapture then ReactModule.createElement(ViewModule, {
			ZIndex = 3,
			Size = MapResult6,
			AnchorPoint = MapResult5,
			Position = MapResult4:map(function(XScale: number): UDim2
				-- upvalues: IsOrientationMatch1 (copy)
				return if IsOrientationMatch1 then UDim2.fromScale(0.5, 1 - XScale) else UDim2.fromScale(XScale, 0.5)
			end),
			selection = { Selectable = true },
			selectionGroup = SelectionGroup,
			cursor = CursorTypeModule.Invisible,
			onStateChanged = UseResult25,
			ref = UseRefResult1,
			testId = `{WithDefaultsModuleResult1.testId}--selection-cursor`
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
			tag = UseSliderVariantsModuleResult1.fill.tag,
			AnchorPoint = if IsOrientationMatch1 then Vector2.new(0, 1) else nil,
			Position = if IsOrientationMatch1 then UDim2.fromScale(0, 1) else nil,
			Size = MapResult:map(function(p2): UDim2
				-- upvalues: WithDefaultsModuleResult1 (copy), IsOrientationMatch1 (copy)
				local MinRatio = (p2 - WithDefaultsModuleResult1.range.Min) / (WithDefaultsModuleResult1.range.Max - WithDefaultsModuleResult1.range.Min)
				
				return if IsOrientationMatch1 then UDim2.fromScale(1, MinRatio) else UDim2.fromScale(MinRatio, 1)
			end),
			testId = `{WithDefaultsModuleResult1.testId}--fill`
		}, {
			SelectionCursor = if NoFoundationSliderCapture then ReactModule.createElement(ViewModule, {
				Size = if WithDefaultsModuleResult1.knob then UseBindingResult4:map(function(Vector): UDim2
					return UDim2.fromOffset(Vector.X, Vector.Y)
				end) else GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult1.size),
				AnchorPoint = MapResult1,
				Position = _UDim2,
				selection = if FlagsModule.FoundationSliderCapture then { Selectable = true } else nil,
				selectionGroup = if FlagsModule.FoundationSliderCapture then SelectionGroup else nil,
				cursor = if FlagsModule.FoundationSliderCapture then CursorTypeModule.Invisible else nil,
				onStateChanged = UseResult25,
				ref = UseRefResult1,
				testId = `{WithDefaultsModuleResult1.testId}--selection-cursor`
			}, {
				Cursor = ReactModule.createElement(CursorComponentModule, {
					isVisible = true,
					cornerRadius = UDim.new(0.5, 0),
					offset = UseTokensModuleResult.Padding.XSmall,
					borderWidth = UseTokensModuleResult.Stroke.Thicker,
					colorNamespace = UsePresentationContextResult.colorNamespace
				})
			}) else nil,
			Knob = if WithDefaultsModuleResult1.knob then ReactModule.createElement(ViewModule, {
				tag = "size-0-0 auto-xy",
				AnchorPoint = MapResult1,
				Position = _UDim2,
				Visible = UseStateResult3,
				onAbsoluteSizeChanged = UseResult24,
				testId = `{WithDefaultsModuleResult1.testId}--custom-knob`
			}, WithDefaultsModuleResult1.knob) else ReactModule.createElement(PresentationContextModule.Provider, { value = config1 }, {
				Knob = ReactModule.createElement(KnobModule, {
					AnchorPoint = MapResult1,
					Position = _UDim2,
					size = WithDefaultsModuleResult1.size,
					style = UseMemoResult1,
					stroke = UseMemoResult2,
					hasShadow = UseSliderVariantsModuleResult1.knob.hasShadow,
					testId = `{WithDefaultsModuleResult1.testId}--knob`
				})
			})
		})
	})
	local config4 = { DragDetector = UIDragDetector, Bar = Element }
	
	return if FlagsModule.FoundationSliderCapture then ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult1, {
		Size = _UDim2_1,
		GroupTransparency = if WithDefaultsModuleResult1.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if v1 then config2 else config3,
		ref = if IsTypeMatch1 then UseRefResult7 else UseComposedRefResult
	}), {
		FocusTarget = ReactModule.createElement(ViewModule, {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			cursor = if v1 then CursorTypeModule.Invisible else nil,
			onStateChanged = UseResult23,
			isDisabled = WithDefaultsModuleResult1.isDisabled,
			ref = UseRefResult,
			testId = `{WithDefaultsModuleResult1.testId}--focus-target`
		}, { DragDetector = UIDragDetector }),
		Bar = Element
	}) else ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult1, {
		Size = _UDim2_1,
		GroupTransparency = if WithDefaultsModuleResult1.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		selectionGroup = if IsTypeMatch1 then nil else UseSliderVariantsModuleResult1.selectionGroup,
		cursor = CursorTypeModule.Invisible,
		onStateChanged = UseResult23,
		isDisabled = WithDefaultsModuleResult1.isDisabled,
		ref = if IsTypeMatch1 then UseRefResult7 else UseComposedRefResult
	}), config4)
end)