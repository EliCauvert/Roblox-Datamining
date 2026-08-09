local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local inputModeModule = require(foundation.Utility.Input.InputMode)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useBindableModule = require(foundation.Utility.useBindable)
local useLastInputModeModule = require(foundation.Utility.Input.useLastInputMode)
local usePointerPositionModule = require(foundation.Utility.usePointerPosition)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local calculateNextStepValueModule = require(script.Parent.calculateNextStepValue)
local calculatePixelsPerStepModule = require(script.Parent.calculatePixelsPerStep)
local calculateSliderPositionDeltaModule = require(script.Parent.calculateSliderPositionDelta)
local calculateSliderStepValueModule = require(script.Parent.calculateSliderStepValue)
local calculateSliderValueFromPositionModule = require(script.Parent.calculateSliderValueFromPosition)
local inputSizeModule = require(foundation.Enums.InputSize)
local visibilityModule = require(foundation.Enums.Visibility)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local colorModeModule = require(foundation.Enums.ColorMode)
local controlStateModule = require(foundation.Enums.ControlState)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local flagsModule = require(foundation.Utility.Flags)
local knobModule = require(foundation.Components.Knob)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local useSliderMotionStatesModule = require(foundation.Components.Slider.useSliderMotionStates)
local useSliderVariantsModule = require(foundation.Components.Slider.useSliderVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local t = {
	isDisabled = false,
	isContained = false,
	testId = "--foundation-slider",
	range = NumberRange.new(0, 1),
	size = inputSizeModule.Medium,
	width = UDim.new(1, 0),
	variant = sliderVariantModule.Standard,
	knobVisibility = visibilityModule.Auto
}
local t_1 = { colorMode = colorModeModule.Inverse }

return reactModule.forwardRef(function(p0, p1) --[[ line: 86 | named "Slider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), useLastInputModeModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), flagsModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var29 = withDefaultsModule(p0, t)
	local var30 = useTokensModule()
	local var31, var32 = reactModule.useState(controlStateModule.Initialize)
	local var33, var34 = reactModule.useState(false)
	local var35, var36 = reactModule.useState(false)
	local var37 = useBindableModule(var29.value):map(function(p2) --[[ line: 92 ]]
		-- upvalues: var29 (ref)
		return math.clamp(p2, var29.range.Min, var29.range.Max)
	end)
	local var38 = reactModule.useRef(nil)
	local var39 = useLastInputModeModule()
	local var40 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 99 ]]
		-- upvalues: var40 (ref)
		return var40.current
	end, {})
	local var41 = usePointerPositionModule(var40.current)
	local var42 = useSliderVariantsModule(var30, var29.size, var29.variant)
	local var43 = useSliderMotionStatesModule(var42.knob.style, var42.knob.dragStyle)
	local var44 = reactModule.useMemo(function() --[[ line: 109 ]]
		-- upvalues: var35 (ref), var43 (ref), var33 (ref)
		return if var35 then if var33 then var43.Dragging else var43.Idle else var43.Hidden
	end, { var30, var35, var33, var43 })
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: var29 (ref), visibilityModule (copy), var36 (ref), var33 (ref), var31 (ref), controlStateModule (copy)
		if var29.knobVisibility == visibilityModule.None then
			var36(false)
			
			return
		elseif var29.knobVisibility == visibilityModule.Always then
			var36(true)
			
			return
		end
		var36(var33 or (if var31 ~= controlStateModule.Hover then if var31 ~= controlStateModule.Selected then var31 == controlStateModule.Pressed else true else true))
	end, { var29.knobVisibility, var31, var33 })
	local var45 = reactModule.useCallback(function(p3) --[[ line: 131 ]]
		-- upvalues: var40 (ref), calculateSliderValueFromPositionModule (copy), var29 (ref), calculateSliderStepValueModule (copy)
		if not var40.current then
			return 0
		end
		local var54 = calculateSliderValueFromPositionModule(p3, var40.current, var29.range)
		
		return if var29.step then calculateSliderStepValueModule(var54, var29.step, var29.range) else var54
	end, { var40, var29.range, var29.step })
	local var46 = reactModule.useCallback(function(p4) --[[ line: 144 ]]
		-- upvalues: var37 (ref), var29 (ref)
		if p4 ~= var37:getValue() and var29.onValueChanged then
			var29.onValueChanged(p4)
		end
	end, { var37, var29.onValueChanged })
	local var47 = reactModule.useCallback(function() --[[ line: 152 ]]
		-- upvalues: var45 (ref), var41 (ref), var46 (ref)
		var46(var45(var41:getValue()))
	end, { var45, var41, var46 })
	local var48 = reactModule.useCallback(function(_, p5) --[[ line: 157 ]]
		-- upvalues: var38 (ref), var34 (ref), var29 (ref)
		var38.current = p5
		var34(true)
		
		if var29.onDragStarted then
			var29.onDragStarted()
		end
	end, { var29.onDragStarted })
	local var49 = reactModule.useCallback(function(_, p6) --[[ line: 166 ]]
		-- upvalues: var40 (ref), var38 (ref), var29 (ref), var39 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var37 (ref), calculateNextStepValueModule (copy), var46 (ref), var45 (ref), calculateSliderPositionDeltaModule (copy)
		if var40.current and var38.current then
			if var29.step and var29.step > 0 then
				if var39 ~= inputModeModule.Directional then
					var46(var45(p6))
					var38.current = p6
					
					return
				end
				local var55 = p6 - var38.current
				local absValue = math.abs(var55.X)
				local var57 = calculatePixelsPerStepModule(var40.current.AbsoluteSize.X, var29.step, var29.range)
				
				if var57 * 2 < absValue then
					var38.current = p6
					
					return
				elseif absValue < var57 / 2 then return end
				local value = var37:getValue()
				local var59 = calculateNextStepValueModule(var55.X, value, var29.step, var29.range)
				
				if var59 == value then
					return
				else
					var46(var59)
					var38.current = p6
					
					return
				end
			else
				local var60 = calculateSliderPositionDeltaModule(p6, var38.current, var40.current.AbsoluteSize.Magnitude)
				var38.current = p6
				
				if var39 == inputModeModule.Directional and math.abs(var60) > 0.01 then return end
				var46(var45(p6))
			end
		end
	end, {
		var29.step, var29.range, var39, var37, var46, var45
	})
	local var50 = reactModule.useCallback(function() --[[ line: 231 ]]
		-- upvalues: var34 (ref), var38 (ref), var29 (ref)
		var34(false)
		var38.current = nil
		
		if var29.onDragEnded then
			var29.onDragEnded()
		end
	end, { var29.onDragEnded })
	local var51 = reactModule.useCallback(function(p7) --[[ line: 240 ]]
		-- upvalues: var32 (ref), controlStateModule (copy), var47 (ref)
		var32(p7)
		
		if p7 == controlStateModule.Pressed then
			var47()
		end
	end, { var47 })
	local uDim2 = UDim2.fromScale(1, 0.5)
	local var53 = if var29.isContained then var37:map(function(p8) --[[ line: 252 ]]
		-- upvalues: var29 (ref)
		return Vector2.new((p8 - var29.range.Min) / (var29.range.Max - var29.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var29, {
		Size = UDim2.new(var29.width, UDim.new(0, var42.hitbox.height)),
		GroupTransparency = if var29.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		onStateChanged = var51,
		isDisabled = var29.isDisabled,
		ref = var40
	}), {
		DragDetector = reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var48,
			[reactModule.Event.DragContinue] = var49,
			[reactModule.Event.DragEnd] = var50,
			Enabled = not var29.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, { tag = var42.bar.tag, testId = `{var29.testId}--bar` }, {
			Fill = reactModule.createElement(viewModule, {
				tag = var42.fill.tag,
				Size = var37:map(function(p9) --[[ line: 286 ]]
					-- upvalues: var29 (ref)
					return UDim2.fromScale((p9 - var29.range.Min) / (var29.range.Max - var29.range.Min), 1)
				end),
				testId = `{var29.testId}--fill`
			}, {
				Knob = if var29.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var53,
					Position = uDim2,
					Visible = var35,
					testId = `{var29.testId}--custom-knob`
				}, var29.knob) elseif flagsModule.FoundationToggleVisualUpdate then reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var53,
						Position = uDim2,
						size = var29.size,
						style = var44.knobStyle,
						stroke = var42.knob.stroke,
						hasShadow = var42.knob.hasShadow,
						testId = `{var29.testId}--knob`
					})
				}) else reactModule.createElement(knobModule, {
					AnchorPoint = var53,
					Position = uDim2,
					size = var29.size,
					style = var44.knobStyle,
					stroke = var42.knob.stroke,
					hasShadow = var42.knob.hasShadow,
					testId = `{var29.testId}--knob`
				})
			})
		})
	})
end)