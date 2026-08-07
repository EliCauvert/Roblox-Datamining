-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:09 2026 Pacific Standard Time.

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
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }
local t_2 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
	SelectionBehaviorDown = Enum.SelectionBehavior.Escape
}

return reactModule.forwardRef(function(p0, p1) --[[ line: 95 | named "Slider" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), flagsModule (ref), useLastInputModeModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), useSliderDirectionalInputModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var31 = withDefaultsModule(p0, t)
	local var32 = useTokensModule()
	local var33, var34 = reactModule.useState(controlStateModule.Initialize)
	local var35, var36 = reactModule.useState(false)
	local var37, var38 = reactModule.useState(false)
	local var39 = useBindableModule(var31.value):map(function(p2) --[[ line: 101 ]]
		-- upvalues: var31 (ref)
		return math.clamp(p2, var31.range.Min, var31.range.Max)
	end)
	local var40 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useRef(nil)
	local var41 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(nil) else nil
	local var42 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var43 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var44 = useLastInputModeModule()
	local var45 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 118 ]]
		-- upvalues: var45 (ref)
		return var45.current
	end, {})
	local var46 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var45.current)
	local var47 = useSliderVariantsModule(var32, var31.size, var31.variant)
	local var48 = useSliderMotionStatesModule(var47.knob.style, var47.knob.dragStyle)
	local var49 = reactModule.useMemo(function() --[[ line: 130 ]]
		-- upvalues: var37 (ref), var48 (ref), var35 (ref)
		return if var37 then if var35 then var48.Dragging else var48.Idle else var48.Hidden
	end, { var32, var37, var35, var48 })
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: var31 (ref), visibilityModule (copy), var38 (ref), var35 (ref), var33 (ref), controlStateModule (copy)
		if var31.knobVisibility == visibilityModule.None then
			var38(false)
			
			return
		elseif var31.knobVisibility == visibilityModule.Always then
			var38(true)
			
			return
		end
		var38(var35 or (if var33 ~= controlStateModule.Hover then if var33 ~= controlStateModule.Selected then var33 == controlStateModule.Pressed else true else true))
	end, { var31.knobVisibility, var33, var35 })
	local var50 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3) --[[ line: 154 ]]
		-- upvalues: var45 (ref), calculateSliderValueFromPositionModule (copy), var31 (ref), calculateSliderStepValueModule (copy)
		if not var45.current then
			return 0
		end
		local var59 = calculateSliderValueFromPositionModule(p3, var45.current, var31.range)
		
		return if var31.step then calculateSliderStepValueModule(var59, var31.step, var31.range) else var59
	end, { var45, var31.range, var31.step })
	local var51 = reactModule.useCallback(function(p4) --[[ line: 167 ]]
		-- upvalues: var39 (ref), var31 (ref)
		if p4 ~= var39:getValue() and var31.onValueChanged then
			var31.onValueChanged(p4)
		end
	end, { var39, var31.onValueChanged })
	local var52 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function() --[[ line: 177 ]]
		-- upvalues: var50 (ref), var46 (ref), var51 (ref)
		var51(var50(var46:getValue()))
	end, { var50, var46, var51 })
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		useSliderDirectionalInputModule((if var33 ~= controlStateModule.Selected then var33 == controlStateModule.SelectedPressed else true) and not var31.isDisabled, var31.step, var31.range, {
			getValue = function() --[[ line: 185 ]]
				-- upvalues: var39 (ref)
				return var39:getValue()
			end,
			onStep = function(p5) --[[ line: 188 ]]
				-- upvalues: var51 (ref), var31 (ref), calculateSliderStepValueModule (copy)
				var51(if var31.step then calculateSliderStepValueModule(p5, var31.step, var31.range) else p5)
			end
		})
	end
	local var53 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _) --[[ line: 197 ]]
		-- upvalues: var41 (ref), var31 (ref), var44 (ref), inputModeModule (copy), var43 (ref), var42 (ref), var39 (ref), var51 (ref), calculateSliderStepValueModule (copy)
		local current = var41.current
		
		if not current then return end
		local var66 = var31.range.Max - var31.range.Min
		local scale = current.DragUDim2.X.Scale
		
		if var44 == inputModeModule.Directional and math.abs(scale - var43.current) > 0.01 then
			var42.current = (var39:getValue() - var31.range.Min) / var66 - scale
			var43.current = scale
			
			return
		end
		var43.current = scale
		local var67 = var31.range.Min + math.clamp(var42.current + scale, 0, 1) * var66
		var51(if var31.step then calculateSliderStepValueModule(var67, var31.step, var31.range) else var67)
	end, {
		var31.step,
		var31.range,
		var44,
		var39,
		var51
	}) else reactModule.useCallback(function(_, p6) --[[ line: 228 ]]
		-- upvalues: var45 (ref), var40 (ref), var31 (ref), var44 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var39 (ref), calculateNextStepValueModule (copy), var51 (ref), var50 (ref), calculateSliderPositionDeltaModule (copy)
		if var45.current and var40.current then
			if var31.step and var31.step > 0 then
				if var44 ~= inputModeModule.Directional then
					var51(var50(p6))
					var40.current = p6
					
					return
				end
				local var60 = p6 - var40.current
				local absValue = math.abs(var60.X)
				local var62 = calculatePixelsPerStepModule(var45.current.AbsoluteSize.X, var31.step, var31.range)
				
				if var62 * 2 < absValue then
					var40.current = p6
					
					return
				elseif absValue < var62 / 2 then return end
				local value = var39:getValue()
				local var64 = calculateNextStepValueModule(var60.X, value, var31.step, var31.range)
				
				if var64 == value then
					return
				else
					var51(var64)
					var40.current = p6
					
					return
				end
			else
				local var65 = calculateSliderPositionDeltaModule(p6, var40.current, var45.current.AbsoluteSize.Magnitude)
				var40.current = p6
				
				if var44 == inputModeModule.Directional and math.abs(var65) > 0.01 then return end
				var51(var50(p6))
			end
		end
	end, {
		var31.step, var31.range, var44, var39, var51, var50
	})
	local var54 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p8) --[[ line: 301 ]]
		-- upvalues: var36 (ref), var31 (ref), var43 (ref), var44 (ref), inputModeModule (copy), var42 (ref), var39 (ref), var45 (ref), calculateSliderValueFromPositionModule (copy), var51 (ref), calculateSliderStepValueModule (copy)
		var36(true)
		
		if var31.onDragStarted then
			var31.onDragStarted()
		end
		var43.current = 0
		local var68 = var31.range.Max - var31.range.Min
		
		if var44 == inputModeModule.Directional then
			var42.current = (var39:getValue() - var31.range.Min) / var68
			
			return
		end
		local var69 = if var45.current then calculateSliderValueFromPositionModule(p8, var45.current, var31.range) else var31.range.Min
		var42.current = (var69 - var31.range.Min) / var68
		var51(if var31.step then calculateSliderStepValueModule(var69, var31.step, var31.range) else var69)
	end, {
		var31.onDragStarted, var31.step, var31.range, var44, var39, var51
	}) else reactModule.useCallback(function(_, p7) --[[ line: 331 ]]
		-- upvalues: var40 (ref), var36 (ref), var31 (ref)
		var40.current = p7
		var36(true)
		
		if var31.onDragStarted then
			var31.onDragStarted()
		end
	end, { var31.onDragStarted })
	local var55 = reactModule.useCallback(function(_, _) --[[ line: 339 ]]
		-- upvalues: var36 (ref), flagsModule (copy), var40 (ref), var31 (ref)
		var36(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var40.current = nil
		end
		if var31.onDragEnded then
			var31.onDragEnded()
		end
	end, { var31.onDragEnded })
	local var56 = reactModule.useCallback(function(p9) --[[ line: 350 ]]
		-- upvalues: var34 (ref), flagsModule (copy), controlStateModule (copy), var52 (ref)
		var34(p9)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath and p9 == controlStateModule.Pressed then
			var52()
		end
	end, { var52 })
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function() --[[ line: 359 ]]
			-- upvalues: var41 (ref), var42 (ref)
			local current = var41.current
			
			if current then
				local var70 = current:AddConstraintFunction(1, function(p10, p11) --[[ line: 366 ]]
					-- upvalues: var42 (copy)
					local current = var42.current
					
					return UDim2.fromScale(math.clamp(p10.X.Scale, -current, 1 - current), 0), p11
				end)
				
				return function() --[[ line: 374 ]]
					-- upvalues: var70 (ref)
					var70:Disconnect()
				end
			end
		end, {})
	end
	local uDim2 = UDim2.fromScale(1, 0.5)
	local var58 = if var31.isContained then var39:map(function(p12) --[[ line: 382 ]]
		-- upvalues: var31 (ref)
		return Vector2.new((p12 - var31.range.Min) / (var31.range.Max - var31.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var31, {
		Size = UDim2.new(var31.width, UDim.new(0, var47.hitbox.height)),
		GroupTransparency = if var31.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then t_2 else nil,
		onStateChanged = var56,
		isDisabled = var31.isDisabled,
		ref = var45
	}), {
		DragDetector = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var41,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			[reactModule.Event.DragStart] = var54,
			[reactModule.Event.DragContinue] = var53,
			[reactModule.Event.DragEnd] = var55,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var31.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var54,
			[reactModule.Event.DragContinue] = var53,
			[reactModule.Event.DragEnd] = var55,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var31.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, { tag = var47.bar.tag, testId = `{var31.testId}--bar` }, {
			Fill = reactModule.createElement(viewModule, {
				tag = var47.fill.tag,
				Size = var39:map(function(p13) --[[ line: 431 ]]
					-- upvalues: var31 (ref)
					return UDim2.fromScale((p13 - var31.range.Min) / (var31.range.Max - var31.range.Min), 1)
				end),
				testId = `{var31.testId}--fill`
			}, {
				Knob = if var31.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var58,
					Position = uDim2,
					Visible = var37,
					testId = `{var31.testId}--custom-knob`
				}, var31.knob) elseif flagsModule.FoundationToggleVisualUpdate then reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var58,
						Position = uDim2,
						size = var31.size,
						style = var49.knobStyle,
						stroke = var47.knob.stroke,
						hasShadow = var47.knob.hasShadow,
						testId = `{var31.testId}--knob`
					})
				}) else reactModule.createElement(knobModule, {
					AnchorPoint = var58,
					Position = uDim2,
					size = var31.size,
					style = var49.knobStyle,
					stroke = var47.knob.stroke,
					hasShadow = var47.knob.hasShadow,
					testId = `{var31.testId}--knob`
				})
			})
		})
	})
end)