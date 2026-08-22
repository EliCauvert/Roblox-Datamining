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
local useSliderDirectionalInputModule = require(script.Parent.useSliderDirectionalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local visibilityModule = require(foundation.Enums.Visibility)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local controlStateModule = require(foundation.Enums.ControlState)
local cursorTypeModule = require(foundation.Enums.CursorType)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local cursorComponentModule = require(foundation.Providers.Cursor.CursorComponent)
local flagsModule = require(foundation.Utility.Flags)
local knobModule = require(foundation.Components.Knob)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local getKnobSizeModule = require(foundation.Components.Knob.getKnobSize)
local usePresentationContext = presentationContextModule.usePresentationContext
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
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }
local t_2 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
	SelectionBehaviorDown = Enum.SelectionBehavior.Escape
}

return reactModule.forwardRef(function(p0, p1) --[[ line: 99 | named "Slider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), flagsModule (ref), useLastInputModeModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), useSliderDirectionalInputModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), usePresentationContext (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), cursorTypeModule (ref), getKnobSizeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var53
	local var34 = withDefaultsModule(p0, t)
	local var35 = useTokensModule()
	local var36, var37 = reactModule.useState(controlStateModule.Initialize)
	local var38, var39 = reactModule.useState(false)
	local var40, var41 = reactModule.useState(false)
	local var42 = useBindableModule(var34.value):map(function(p2) --[[ line: 105 ]]
		-- upvalues: var34 (ref)
		return math.clamp(p2, var34.range.Min, var34.range.Max)
	end)
	local var43 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useRef(nil)
	local var44 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(nil) else nil
	local var45 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var46 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var47 = useLastInputModeModule()
	local var48 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 122 ]]
		-- upvalues: var48 (ref)
		return var48.current
	end, {})
	local var49 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var48.current)
	local var50 = useSliderVariantsModule(var35, var34.size, var34.variant)
	local var51 = useSliderMotionStatesModule(var50.knob.style, var50.knob.dragStyle)
	local var52 = reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: var40 (ref), var51 (ref), var38 (ref)
		return if var40 then if var38 then var51.Dragging else var51.Idle else var51.Hidden
	end, { var35, var40, var38, var51 })
	
	if flagsModule.FoundationSliderKnobSelection then
		var53 = true
		
		if var36 ~= controlStateModule.Selected then
			local _ = var36 == controlStateModule.SelectedPressed
		end
	else
		var53 = nil
	end
	reactModule.useEffect(function() --[[ line: 146 ]]
		-- upvalues: var34 (ref), visibilityModule (copy), var41 (ref), flagsModule (copy), var53 (write), var38 (ref), var36 (ref), controlStateModule (copy)
		if var34.knobVisibility == visibilityModule.None then
			var41(if flagsModule.FoundationSliderKnobSelection then var53 else false)
			
			return
		elseif var34.knobVisibility == visibilityModule.Always then
			var41(true)
			
			return
		end
		var41(var38 or (if var36 ~= controlStateModule.Hover then if var36 ~= controlStateModule.Selected then var36 == controlStateModule.Pressed else true else true))
	end, {
		var34.knobVisibility,
		var36,
		var38,
		if flagsModule.FoundationSliderKnobSelection then var53 else nil
	})
	local var54 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3) --[[ line: 170 ]]
		-- upvalues: var48 (ref), calculateSliderValueFromPositionModule (copy), var34 (ref), calculateSliderStepValueModule (copy)
		if not var48.current then
			return 0
		end
		local var68 = calculateSliderValueFromPositionModule(p3, var48.current, var34.range)
		
		return if var34.step then calculateSliderStepValueModule(var68, var34.step, var34.range) else var68
	end, { var48, var34.range, var34.step })
	local var55 = reactModule.useCallback(function(p4) --[[ line: 183 ]]
		-- upvalues: var42 (ref), var34 (ref)
		if p4 ~= var42:getValue() and var34.onValueChanged then
			var34.onValueChanged(p4)
		end
	end, { var42, var34.onValueChanged })
	local var56 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: var54 (ref), var49 (ref), var55 (ref)
		var55(var54(var49:getValue()))
	end, { var54, var49, var55 })
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		if not flagsModule.FoundationSliderKnobSelection then
			var53 = if var36 ~= controlStateModule.Selected then var36 == controlStateModule.SelectedPressed else true
		end
		useSliderDirectionalInputModule(var53 and not var34.isDisabled, var34.step, var34.range, {
			getValue = function() --[[ line: 204 ]]
				-- upvalues: var42 (ref)
				return var42:getValue()
			end,
			onStep = function(p5) --[[ line: 207 ]]
				-- upvalues: var55 (ref), var34 (ref), calculateSliderStepValueModule (copy)
				var55(if var34.step then calculateSliderStepValueModule(p5, var34.step, var34.range) else p5)
			end
		})
	end
	local var57 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _) --[[ line: 216 ]]
		-- upvalues: var44 (ref), var34 (ref), var47 (ref), inputModeModule (copy), var46 (ref), var45 (ref), var42 (ref), var55 (ref), calculateSliderStepValueModule (copy)
		local current = var44.current
		
		if not current then return end
		local var75 = var34.range.Max - var34.range.Min
		local scale = current.DragUDim2.X.Scale
		
		if var47 == inputModeModule.Directional and math.abs(scale - var46.current) > 0.01 then
			var45.current = (var42:getValue() - var34.range.Min) / var75 - scale
			var46.current = scale
			
			return
		end
		var46.current = scale
		local var76 = var34.range.Min + math.clamp(var45.current + scale, 0, 1) * var75
		var55(if var34.step then calculateSliderStepValueModule(var76, var34.step, var34.range) else var76)
	end, {
		var34.step,
		var34.range,
		var47,
		var42,
		var55
	}) else reactModule.useCallback(function(_, p6) --[[ line: 247 ]]
		-- upvalues: var48 (ref), var43 (ref), var34 (ref), var47 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var42 (ref), calculateNextStepValueModule (copy), var55 (ref), var54 (ref), calculateSliderPositionDeltaModule (copy)
		if var48.current and var43.current then
			if var34.step and var34.step > 0 then
				if var47 ~= inputModeModule.Directional then
					var55(var54(p6))
					var43.current = p6
					
					return
				end
				local var69 = p6 - var43.current
				local absValue = math.abs(var69.X)
				local var71 = calculatePixelsPerStepModule(var48.current.AbsoluteSize.X, var34.step, var34.range)
				
				if var71 * 2 < absValue then
					var43.current = p6
					
					return
				elseif absValue < var71 / 2 then return end
				local value = var42:getValue()
				local var73 = calculateNextStepValueModule(var69.X, value, var34.step, var34.range)
				
				if var73 == value then
					return
				else
					var55(var73)
					var43.current = p6
					
					return
				end
			else
				local var74 = calculateSliderPositionDeltaModule(p6, var43.current, var48.current.AbsoluteSize.Magnitude)
				var43.current = p6
				
				if var47 == inputModeModule.Directional and math.abs(var74) > 0.01 then return end
				var55(var54(p6))
			end
		end
	end, {
		var34.step, var34.range, var47, var42, var55, var54
	})
	local var58 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p8) --[[ line: 320 ]]
		-- upvalues: var39 (ref), var34 (ref), var46 (ref), var47 (ref), inputModeModule (copy), var45 (ref), var42 (ref), var48 (ref), calculateSliderValueFromPositionModule (copy), var55 (ref), calculateSliderStepValueModule (copy)
		var39(true)
		
		if var34.onDragStarted then
			var34.onDragStarted()
		end
		var46.current = 0
		local var77 = var34.range.Max - var34.range.Min
		
		if var47 == inputModeModule.Directional then
			var45.current = (var42:getValue() - var34.range.Min) / var77
			
			return
		end
		local var78 = if var48.current then calculateSliderValueFromPositionModule(p8, var48.current, var34.range) else var34.range.Min
		var45.current = (var78 - var34.range.Min) / var77
		var55(if var34.step then calculateSliderStepValueModule(var78, var34.step, var34.range) else var78)
	end, {
		var34.onDragStarted, var34.step, var34.range, var47, var42, var55
	}) else reactModule.useCallback(function(_, p7) --[[ line: 350 ]]
		-- upvalues: var43 (ref), var39 (ref), var34 (ref)
		var43.current = p7
		var39(true)
		
		if var34.onDragStarted then
			var34.onDragStarted()
		end
	end, { var34.onDragStarted })
	local var59 = reactModule.useCallback(function(_, _) --[[ line: 358 ]]
		-- upvalues: var39 (ref), flagsModule (copy), var43 (ref), var34 (ref)
		var39(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var43.current = nil
		end
		if var34.onDragEnded then
			var34.onDragEnded()
		end
	end, { var34.onDragEnded })
	local var60 = reactModule.useCallback(function(p9) --[[ line: 369 ]]
		-- upvalues: var37 (ref), flagsModule (copy), controlStateModule (copy), var56 (ref)
		var37(p9)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath and p9 == controlStateModule.Pressed then
			var56()
		end
	end, { var56 })
	local var61 = if flagsModule.FoundationSliderKnobSelection then usePresentationContext() else nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function() --[[ line: 380 ]]
			-- upvalues: var44 (ref), var45 (ref)
			local current = var44.current
			
			if current then
				local var79 = current:AddConstraintFunction(1, function(p10, p11) --[[ line: 387 ]]
					-- upvalues: var45 (copy)
					local current = var45.current
					
					return UDim2.fromScale(math.clamp(p10.X.Scale, -current, 1 - current), 0), p11
				end)
				
				return function() --[[ line: 395 ]]
					-- upvalues: var79 (ref)
					var79:Disconnect()
				end
			end
		end, {})
	end
	local uDim2 = UDim2.fromScale(1, 0.5)
	local var63 = if var34.isContained then var42:map(function(p12) --[[ line: 403 ]]
		-- upvalues: var34 (ref)
		return Vector2.new((p12 - var34.range.Min) / (var34.range.Max - var34.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	local var64 = nil
	local var65 = nil
	
	if flagsModule.FoundationSliderKnobSelection then
		local var66, var67 = reactModule.useBinding(Vector2.zero)
		var64 = var66
		var65 = var67
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var34, {
		Size = UDim2.new(var34.width, UDim.new(0, var50.hitbox.height)),
		GroupTransparency = if var34.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then t_2 else nil,
		cursor = if flagsModule.FoundationSliderKnobSelection then cursorTypeModule.Invisible else nil,
		onStateChanged = var60,
		isDisabled = var34.isDisabled,
		ref = var48
	}), {
		DragDetector = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var44,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			[reactModule.Event.DragStart] = var58,
			[reactModule.Event.DragContinue] = var57,
			[reactModule.Event.DragEnd] = var59,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var34.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var58,
			[reactModule.Event.DragContinue] = var57,
			[reactModule.Event.DragEnd] = var59,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var34.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, { tag = var50.bar.tag, testId = `{var34.testId}--bar` }, {
			Fill = reactModule.createElement(viewModule, {
				tag = var50.fill.tag,
				Size = var42:map(function(p13) --[[ line: 466 ]]
					-- upvalues: var34 (ref)
					return UDim2.fromScale((p13 - var34.range.Min) / (var34.range.Max - var34.range.Min), 1)
				end),
				testId = `{var34.testId}--fill`
			}, {
				SelectionCursor = if flagsModule.FoundationSliderKnobSelection and var53 then reactModule.createElement(viewModule, {
					Size = if var34.knob then var64:map(function(p14) --[[ line: 474 ]]
						return UDim2.fromOffset(p14.X, p14.Y)
					end) else getKnobSizeModule(var35, var34.size),
					AnchorPoint = var63,
					Position = uDim2,
					testId = `{var34.testId}--selection-cursor`
				}, {
					Cursor = reactModule.createElement(cursorComponentModule, {
						isVisible = true,
						cornerRadius = UDim.new(0.5, 0),
						offset = var35.Padding.XSmall,
						borderWidth = var35.Stroke.Thicker,
						colorNamespace = var61.colorNamespace
					})
				}) else nil,
				Knob = if var34.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var63,
					Position = uDim2,
					Visible = var40,
					onAbsoluteSizeChanged = if flagsModule.FoundationSliderKnobSelection then if flagsModule.FoundationSliderKnobSelection then reactModule.useCallback(function(p15) --[[ line: 414 ]]
						-- upvalues: var65 (write)
						var65(p15.AbsoluteSize)
					end, {}) else nil else nil,
					testId = `{var34.testId}--custom-knob`
				}, var34.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var63,
						Position = uDim2,
						size = var34.size,
						style = var52.knobStyle,
						stroke = var50.knob.stroke,
						hasShadow = var50.knob.hasShadow,
						testId = `{var34.testId}--knob`
					})
				})
			})
		})
	})
end)