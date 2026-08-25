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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), flagsModule (ref), useLastInputModeModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), useSliderDirectionalInputModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(controlStateModule.Initialize)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = useBindableModule(var1.value):map(function(p1)
		-- upvalues: var1 (ref)
		return math.clamp(p1, var1.range.Min, var1.range.Max)
	end)
	local var10 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useRef(nil)
	local var11 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(nil) else nil
	local var12 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var13 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var14 = useLastInputModeModule()
	local var15 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var15 (ref)
		return var15.current
	end, {})
	local var16 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var15.current)
	local var17 = useSliderVariantsModule(var2, var1.size, var1.variant)
	local var18 = useSliderMotionStatesModule(var17.knob.style, var17.knob.dragStyle)
	local var19 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var18 (ref), var5 (ref)
		return if var7 then if var5 then var18.Dragging else var18.Idle else var18.Hidden
	end, { var2, var7, var5, var18 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), visibilityModule (copy), var8 (ref), var5 (ref), var3 (ref), controlStateModule (copy)
		if var1.knobVisibility == visibilityModule.None then
			var8(false)
			
			return
		elseif var1.knobVisibility == visibilityModule.Always then
			var8(true)
			
			return
		end
		var8(var5 or (if var3 ~= controlStateModule.Hover then if var3 ~= controlStateModule.Selected then var3 == controlStateModule.Pressed else true else true))
	end, { var1.knobVisibility, var3, var5 })
	local var1 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p1)
		-- upvalues: var15 (ref), calculateSliderValueFromPositionModule (copy), var1 (ref), calculateSliderStepValueModule (copy)
		if not var15.current then
			return 0
		end
		local var1 = calculateSliderValueFromPositionModule(p1, var15.current, var1.range)
		
		return if var1.step then calculateSliderStepValueModule(var1, var1.step, var1.range) else var1
	end, { var15, var1.range, var1.step })
	local var2 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var1 (ref)
		if p1 ~= var9:getValue() and var1.onValueChanged then
			var1.onValueChanged(p1)
		end
	end, { var9, var1.onValueChanged })
	local var3 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function()
		-- upvalues: var1 (ref), var16 (ref), var2 (ref)
		var2(var1(var16:getValue()))
	end, { var1, var16, var2 })
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		useSliderDirectionalInputModule((if var3 ~= controlStateModule.Selected then var3 == controlStateModule.SelectedPressed else true) and not var1.isDisabled, var1.step, var1.range, {
			getValue = function()
				-- upvalues: var9 (ref)
				return var9:getValue()
			end,
			onStep = function(p1)
				-- upvalues: var2 (ref), var1 (ref), calculateSliderStepValueModule (copy)
				var2(if var1.step then calculateSliderStepValueModule(p1, var1.step, var1.range) else p1)
			end
		})
	end
	local var4 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _)
		-- upvalues: var11 (ref), var1 (ref), var14 (ref), inputModeModule (copy), var13 (ref), var12 (ref), var9 (ref), var2 (ref), calculateSliderStepValueModule (copy)
		local current = var11.current
		
		if not current then return end
		local var1 = var1.range.Max - var1.range.Min
		local scale = current.DragUDim2.X.Scale
		
		if var14 == inputModeModule.Directional and math.abs(scale - var13.current) > 0.01 then
			var12.current = (var9:getValue() - var1.range.Min) / var1 - scale
			var13.current = scale
			
			return
		end
		var13.current = scale
		local var2 = var1.range.Min + math.clamp(var12.current + scale, 0, 1) * var1
		var2(if var1.step then calculateSliderStepValueModule(var2, var1.step, var1.range) else var2)
	end, {
		var1.step,
		var1.range,
		var14,
		var9,
		var2
	}) else reactModule.useCallback(function(_, p1)
		-- upvalues: var15 (ref), var10 (ref), var1 (ref), var14 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var9 (ref), calculateNextStepValueModule (copy), var2 (ref), var1 (ref), calculateSliderPositionDeltaModule (copy)
		if var15.current and var10.current then
			if var1.step and var1.step > 0 then
				if var14 ~= inputModeModule.Directional then
					var2(var1(p1))
					var10.current = p1
					
					return
				end
				local var1 = p1 - var10.current
				local absValue = math.abs(var1.X)
				local var2 = calculatePixelsPerStepModule(var15.current.AbsoluteSize.X, var1.step, var1.range)
				
				if var2 * 2 < absValue then
					var10.current = p1
					
					return
				elseif absValue < var2 / 2 then return end
				local value = var9:getValue()
				local var3 = calculateNextStepValueModule(var1.X, value, var1.step, var1.range)
				
				if var3 == value then
					return
				else
					var2(var3)
					var10.current = p1
					
					return
				end
			else
				local var4 = calculateSliderPositionDeltaModule(p1, var10.current, var15.current.AbsoluteSize.Magnitude)
				var10.current = p1
				
				if var14 == inputModeModule.Directional and math.abs(var4) > 0.01 then return end
				var2(var1(p1))
			end
		end
	end, {
		var1.step, var1.range, var14, var9, var2, var1
	})
	local var3 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p1)
		-- upvalues: var6 (ref), var1 (ref), var13 (ref), var14 (ref), inputModeModule (copy), var12 (ref), var9 (ref), var15 (ref), calculateSliderValueFromPositionModule (copy), var2 (ref), calculateSliderStepValueModule (copy)
		var6(true)
		
		if var1.onDragStarted then
			var1.onDragStarted()
		end
		var13.current = 0
		local var1 = var1.range.Max - var1.range.Min
		
		if var14 == inputModeModule.Directional then
			var12.current = (var9:getValue() - var1.range.Min) / var1
			
			return
		end
		local var2 = if var15.current then calculateSliderValueFromPositionModule(p1, var15.current, var1.range) else var1.range.Min
		var12.current = (var2 - var1.range.Min) / var1
		var2(if var1.step then calculateSliderStepValueModule(var2, var1.step, var1.range) else var2)
	end, {
		var1.onDragStarted, var1.step, var1.range, var14, var9, var2
	}) else reactModule.useCallback(function(_, p1)
		-- upvalues: var10 (ref), var6 (ref), var1 (ref)
		var10.current = p1
		var6(true)
		
		if var1.onDragStarted then
			var1.onDragStarted()
		end
	end, { var1.onDragStarted })
	local var3 = reactModule.useCallback(function(_, _)
		-- upvalues: var6 (ref), flagsModule (copy), var10 (ref), var1 (ref)
		var6(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var10.current = nil
		end
		if var1.onDragEnded then
			var1.onDragEnded()
		end
	end, { var1.onDragEnded })
	local var4 = reactModule.useCallback(function(p1)
		-- upvalues: var4 (ref), flagsModule (copy), controlStateModule (copy), var3 (ref)
		var4(p1)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath and p1 == controlStateModule.Pressed then
			var3()
		end
	end, { var3 })
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var12 (ref)
			local current = var11.current
			
			if current then
				local var1 = current:AddConstraintFunction(1, function(p1, p2)
					-- upvalues: var12 (copy)
					local current = var12.current
					
					return UDim2.fromScale(math.clamp(p1.X.Scale, -current, 1 - current), 0), p2
				end)
				
				return function()
					-- upvalues: var1 (ref)
					var1:Disconnect()
				end
			end
		end, {})
	end
	local uDim2 = UDim2.fromScale(1, 0.5)
	local var5 = if var1.isContained then var9:map(function(p1)
		-- upvalues: var1 (ref)
		return Vector2.new((p1 - var1.range.Min) / (var1.range.Max - var1.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		Size = UDim2.new(var1.width, UDim.new(0, var17.hitbox.height)),
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then t_2 else nil,
		onStateChanged = var4,
		isDisabled = var1.isDisabled,
		ref = var15
	}), {
		DragDetector = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var11,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			[reactModule.Event.DragStart] = var3,
			[reactModule.Event.DragContinue] = var4,
			[reactModule.Event.DragEnd] = var3,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var1.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var3,
			[reactModule.Event.DragContinue] = var4,
			[reactModule.Event.DragEnd] = var3,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var1.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, { tag = var17.bar.tag, testId = `{var1.testId}--bar` }, {
			Fill = reactModule.createElement(viewModule, {
				tag = var17.fill.tag,
				Size = var9:map(function(p1)
					-- upvalues: var1 (ref)
					return UDim2.fromScale((p1 - var1.range.Min) / (var1.range.Max - var1.range.Min), 1)
				end),
				testId = `{var1.testId}--fill`
			}, {
				Knob = if var1.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var5,
					Position = uDim2,
					Visible = var7,
					testId = `{var1.testId}--custom-knob`
				}, var1.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var5,
						Position = uDim2,
						size = var1.size,
						style = var19.knobStyle,
						stroke = var17.knob.stroke,
						hasShadow = var17.knob.hasShadow,
						testId = `{var1.testId}--knob`
					})
				})
			})
		})
	})
end)