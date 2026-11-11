local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local InputModeModule = require(Foundation.Utility.Input.InputMode)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseBindableModule = require(Foundation.Utility.useBindable)
local UseLastInputModeModule = require(Foundation.Utility.Input.useLastInputMode)
local UsePointerPositionModule = require(Foundation.Utility.usePointerPosition)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local CalculateNextStepValueModule = require(script.Parent.calculateNextStepValue)
local CalculatePixelsPerStepModule = require(script.Parent.calculatePixelsPerStep)
local CalculateSliderPositionDeltaModule = require(script.Parent.calculateSliderPositionDelta)
local CalculateSliderStepValueModule = require(script.Parent.calculateSliderStepValue)
local CalculateSliderValueFromPositionModule = require(script.Parent.calculateSliderValueFromPosition)
local VisibilityModule = require(Foundation.Enums.Visibility)
local ControlStateModule = require(Foundation.Enums.ControlState)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local FlagsModule = require(Foundation.Utility.Flags)
local KnobModule = require(Foundation.Components.Knob)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local UseSliderMotionStatesModule = require(Foundation.Components.Slider.useSliderMotionStates)
local UseSliderVariantsModule = require(Foundation.Components.Slider.useSliderVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	isDisabled = false,
	isContained = false,
	testId = "--foundation-slider",
	range = NumberRange.new(0, 1),
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(1, 0),
	variant = require(Foundation.Enums.SliderVariant).Standard,
	knobVisibility = VisibilityModule.Auto
}
local config1 = { colorMode = require(Foundation.Enums.ColorMode).Inverse }

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ControlStateModule (copy), UseBindableModule (copy), UseLastInputModeModule (copy), UsePointerPositionModule (copy), UseSliderVariantsModule (copy), UseSliderMotionStatesModule (copy), VisibilityModule (copy), CalculateSliderValueFromPositionModule (copy), CalculateSliderStepValueModule (copy), InputModeModule (copy), CalculatePixelsPerStepModule (copy), CalculateNextStepValueModule (copy), CalculateSliderPositionDeltaModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), StateLayerAffordanceModule (copy), FlagsModule (copy), PresentationContextModule (copy), config1 (copy), KnobModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlStateModule.Initialize)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local MapResult = UseBindableModule(WithDefaultsModuleResult.value):map(function(Value: number): number
		-- upvalues: WithDefaultsModuleResult (copy)
		return (math.clamp(Value, WithDefaultsModuleResult.range.Min, WithDefaultsModuleResult.range.Max))
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLastInputModeModuleResult = UseLastInputModeModule()
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseRefResult1 (copy)
		return UseRefResult1.current
	end, {})
	local UsePointerPositionModuleResult = UsePointerPositionModule(UseRefResult1.current)
	local UseSliderVariantsModuleResult = UseSliderVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	local UseSliderMotionStatesModuleResult = UseSliderMotionStatesModule(UseSliderVariantsModuleResult.knob.style, UseSliderVariantsModuleResult.knob.dragStyle)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult3 (copy), UseSliderMotionStatesModuleResult (copy), UseStateResult1 (copy)
		return if UseStateResult3 then if UseStateResult1 then UseSliderMotionStatesModuleResult.Dragging else UseSliderMotionStatesModuleResult.Idle else UseSliderMotionStatesModuleResult.Hidden
	end, {
		UseTokensModuleResult,
		UseStateResult3,
		UseStateResult1,
		UseSliderMotionStatesModuleResult
	})
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), VisibilityModule (upval), UseStateResult2_2 (copy), UseStateResult1 (copy), UseStateResult (copy), ControlStateModule (upval)
		if WithDefaultsModuleResult.knobVisibility == VisibilityModule.None then
			UseStateResult2_2(false)
			
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
		UseStateResult1
	})
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult1 (copy), CalculateSliderValueFromPositionModule (upval), WithDefaultsModuleResult (copy), CalculateSliderStepValueModule (upval)
		if UseRefResult1.current then
			local SliderValueFromPositionModule = CalculateSliderValueFromPositionModule(p3, UseRefResult1.current, WithDefaultsModuleResult.range)
			
			return if WithDefaultsModuleResult.step then CalculateSliderStepValueModule(SliderValueFromPositionModule, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range) else SliderValueFromPositionModule
		else
			return 0
		end
	end, {
		UseRefResult1,
		WithDefaultsModuleResult.range,
		WithDefaultsModuleResult.step
	})
	local UseResult1 = ReactModule.useCallback(function(p3)
		-- upvalues: MapResult (copy), WithDefaultsModuleResult (copy)
		if p3 ~= MapResult:getValue() and WithDefaultsModuleResult.onValueChanged then
			WithDefaultsModuleResult.onValueChanged(p3)
		end
	end, { MapResult, WithDefaultsModuleResult.onValueChanged })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UsePointerPositionModuleResult (copy), UseResult1 (copy)
		UseResult1((UseResult(UsePointerPositionModuleResult:getValue())))
	end, { UseResult, UsePointerPositionModuleResult, UseResult1 })
	local _UDim2 = UDim2.fromScale(1, 0.5)
	local MapResult1 = if WithDefaultsModuleResult.isContained then MapResult:map(function(p3): Vector2
		-- upvalues: WithDefaultsModuleResult (copy)
		return Vector2.new((p3 - WithDefaultsModuleResult.range.Min) / (WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = UDim2.new(WithDefaultsModuleResult.width, UDim.new(0, UseSliderVariantsModuleResult.hitbox.height)),
		GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		onStateChanged = ReactModule.useCallback(function(Pressed)
			-- upvalues: UseStateResult2 (copy), ControlStateModule (upval), UseResult2 (copy)
			UseStateResult2(Pressed)
			
			if Pressed == ControlStateModule.Pressed then
				UseResult2()
			end
		end, { UseResult2 }),
		isDisabled = WithDefaultsModuleResult.isDisabled,
		ref = UseRefResult1
	}), {
		DragDetector = ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[ReactModule.Event.DragStart] = ReactModule.useCallback(function(_, Current)
				-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
				UseRefResult.current = Current
				UseStateResult2_1(true)
				
				if WithDefaultsModuleResult.onDragStarted then
					WithDefaultsModuleResult.onDragStarted()
				end
			end, { WithDefaultsModuleResult.onDragStarted }),
			[ReactModule.Event.DragContinue] = ReactModule.useCallback(function(_, Current)
				-- upvalues: UseRefResult1 (copy), UseRefResult (copy), WithDefaultsModuleResult (copy), UseLastInputModeModuleResult (copy), InputModeModule (upval), CalculatePixelsPerStepModule (upval), MapResult (copy), CalculateNextStepValueModule (upval), UseResult1 (copy), UseResult (copy), CalculateSliderPositionDeltaModule (upval)
				if UseRefResult1.current and UseRefResult.current then
					if not WithDefaultsModuleResult.step or WithDefaultsModuleResult.step <= 0 then
						local SliderPositionDeltaModule: number = CalculateSliderPositionDeltaModule(Current, UseRefResult.current, UseRefResult1.current.AbsoluteSize.Magnitude)
						UseRefResult.current = Current
						
						if UseLastInputModeModuleResult == InputModeModule.Directional and math.abs(SliderPositionDeltaModule) > 0.01 then return end
						UseResult1((UseResult(Current)))
					elseif UseLastInputModeModuleResult ~= InputModeModule.Directional then
						UseResult1((UseResult(Current)))
						UseRefResult.current = Current
						
						return
					else
						local CurrentDelta = Current - UseRefResult.current
						local Magnitude = math.abs(CurrentDelta.X)
						local PixelsPerStepModule: number = CalculatePixelsPerStepModule(UseRefResult1.current.AbsoluteSize.X, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range)
						
						if PixelsPerStepModule * 2 < Magnitude then
							UseRefResult.current = Current
							
							return
						end
						if Magnitude < PixelsPerStepModule / 2 then return end
						local Value = MapResult:getValue()
						local NextStepValueModule = CalculateNextStepValueModule(CurrentDelta.X, Value, WithDefaultsModuleResult.step, WithDefaultsModuleResult.range)
						
						if NextStepValueModule ~= Value then
							UseResult1(NextStepValueModule)
							UseRefResult.current = Current
							
							return
						end
					end
				end
			end, {
				WithDefaultsModuleResult.step, WithDefaultsModuleResult.range,
				UseLastInputModeModuleResult, MapResult, UseResult1, UseResult
			}),
			[ReactModule.Event.DragEnd] = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2_1 (copy), UseRefResult (copy), WithDefaultsModuleResult (copy)
				UseStateResult2_1(false)
				UseRefResult.current = nil
				
				if WithDefaultsModuleResult.onDragEnded then
					WithDefaultsModuleResult.onDragEnded()
				end
			end, { WithDefaultsModuleResult.onDragEnded }),
			Enabled = not WithDefaultsModuleResult.isDisabled
		}),
		Bar = ReactModule.createElement(ViewModule, {
			tag = UseSliderVariantsModuleResult.bar.tag,
			testId = `{WithDefaultsModuleResult.testId}--bar`
		}, {
			Fill = ReactModule.createElement(ViewModule, {
				tag = UseSliderVariantsModuleResult.fill.tag,
				Size = MapResult:map(function(p3): UDim2
					-- upvalues: WithDefaultsModuleResult (copy)
					return UDim2.fromScale((p3 - WithDefaultsModuleResult.range.Min) / (WithDefaultsModuleResult.range.Max - WithDefaultsModuleResult.range.Min), 1)
				end),
				testId = `{WithDefaultsModuleResult.testId}--fill`
			}, {
				Knob = if WithDefaultsModuleResult.knob then ReactModule.createElement(ViewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = MapResult1,
					Position = _UDim2,
					Visible = UseStateResult3,
					testId = `{WithDefaultsModuleResult.testId}--custom-knob`
				}, WithDefaultsModuleResult.knob) elseif FlagsModule.FoundationToggleVisualUpdate then ReactModule.createElement(PresentationContextModule.Provider, { value = config1 }, {
					Knob = ReactModule.createElement(KnobModule, {
						AnchorPoint = MapResult1,
						Position = _UDim2,
						size = WithDefaultsModuleResult.size,
						style = UseMemoResult.knobStyle,
						stroke = UseSliderVariantsModuleResult.knob.stroke,
						hasShadow = UseSliderVariantsModuleResult.knob.hasShadow,
						testId = `{WithDefaultsModuleResult.testId}--knob`
					})
				}) else ReactModule.createElement(KnobModule, {
					AnchorPoint = MapResult1,
					Position = _UDim2,
					size = WithDefaultsModuleResult.size,
					style = UseMemoResult.knobStyle,
					stroke = UseSliderVariantsModuleResult.knob.stroke,
					hasShadow = UseSliderVariantsModuleResult.knob.hasShadow,
					testId = `{WithDefaultsModuleResult.testId}--knob`
				})
			})
		})
	})
end)