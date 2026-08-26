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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), flagsModule (ref), useLastInputModeModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), useSliderDirectionalInputModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), usePresentationContext (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), cursorTypeModule (ref), getKnobSizeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local var3 = useTokensModule()
	local var4, var5 = reactModule.useState(controlStateModule.Initialize)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10 = useBindableModule(var2.value):map(function(p3)
		-- upvalues: var2 (ref)
		return math.clamp(p3, var2.range.Min, var2.range.Max)
	end)
	local var11 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useRef(nil)
	local var12 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(nil) else nil
	local var13 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var14 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var15 = useLastInputModeModule()
	local var16 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var16 (ref)
		return var16.current
	end, {})
	local var17 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var16.current)
	local var18 = useSliderVariantsModule(var3, var2.size, var2.variant)
	local var19 = useSliderMotionStatesModule(var18.knob.style, var18.knob.dragStyle)
	local var20 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var19 (ref), var6 (ref)
		return if var8 then if var6 then var19.Dragging else var19.Idle else var19.Hidden
	end, { var3, var8, var6, var19 })
	
	if flagsModule.FoundationSliderKnobSelection then
		var1 = true
		
		if var4 ~= controlStateModule.Selected then
			local _ = var4 == controlStateModule.SelectedPressed
		end
	else
		var1 = nil
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), visibilityModule (copy), var9 (ref), flagsModule (copy), var1 (write), var6 (ref), var4 (ref), controlStateModule (copy)
		if var2.knobVisibility == visibilityModule.None then
			var9(if flagsModule.FoundationSliderKnobSelection then var1 else false)
			
			return
		elseif var2.knobVisibility == visibilityModule.Always then
			var9(true)
			
			return
		end
		var9(var6 or (if var4 ~= controlStateModule.Hover then if var4 ~= controlStateModule.Selected then var4 == controlStateModule.Pressed else true else true))
	end, {
		var2.knobVisibility,
		var4,
		var6,
		if flagsModule.FoundationSliderKnobSelection then var1 else nil
	})
	local var21 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3)
		-- upvalues: var16 (ref), calculateSliderValueFromPositionModule (copy), var2 (ref), calculateSliderStepValueModule (copy)
		if not var16.current then
			return 0
		end
		local var22 = calculateSliderValueFromPositionModule(p3, var16.current, var2.range)
		
		return if var2.step then calculateSliderStepValueModule(var22, var2.step, var2.range) else var22
	end, { var16, var2.range, var2.step })
	local var22 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var2 (ref)
		if p3 ~= var10:getValue() and var2.onValueChanged then
			var2.onValueChanged(p3)
		end
	end, { var10, var2.onValueChanged })
	local var23 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function()
		-- upvalues: var21 (ref), var17 (ref), var22 (ref)
		var22(var21(var17:getValue()))
	end, { var21, var17, var22 })
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		if not flagsModule.FoundationSliderKnobSelection then
			var1 = if var4 ~= controlStateModule.Selected then var4 == controlStateModule.SelectedPressed else true
		end
		useSliderDirectionalInputModule(var1 and not var2.isDisabled, var2.step, var2.range, {
			getValue = function()
				-- upvalues: var10 (ref)
				return var10:getValue()
			end,
			onStep = function(p3)
				-- upvalues: var22 (ref), var2 (ref), calculateSliderStepValueModule (copy)
				var22(if var2.step then calculateSliderStepValueModule(p3, var2.step, var2.range) else p3)
			end
		})
	end
	local var24 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _)
		-- upvalues: var12 (ref), var2 (ref), var15 (ref), inputModeModule (copy), var14 (ref), var13 (ref), var10 (ref), var22 (ref), calculateSliderStepValueModule (copy)
		local current = var12.current
		
		if not current then return end
		local var25 = var2.range.Max - var2.range.Min
		local scale = current.DragUDim2.X.Scale
		
		if var15 == inputModeModule.Directional and math.abs(scale - var14.current) > 0.01 then
			var13.current = (var10:getValue() - var2.range.Min) / var25 - scale
			var14.current = scale
			
			return
		end
		var14.current = scale
		local var26 = var2.range.Min + math.clamp(var13.current + scale, 0, 1) * var25
		var22(if var2.step then calculateSliderStepValueModule(var26, var2.step, var2.range) else var26)
	end, {
		var2.step,
		var2.range,
		var15,
		var10,
		var22
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var16 (ref), var11 (ref), var2 (ref), var15 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var10 (ref), calculateNextStepValueModule (copy), var22 (ref), var21 (ref), calculateSliderPositionDeltaModule (copy)
		if var16.current and var11.current then
			if var2.step and var2.step > 0 then
				if var15 ~= inputModeModule.Directional then
					var22(var21(p3))
					var11.current = p3
					
					return
				end
				local var25 = p3 - var11.current
				local absValue = math.abs(var25.X)
				local var26 = calculatePixelsPerStepModule(var16.current.AbsoluteSize.X, var2.step, var2.range)
				
				if var26 * 2 < absValue then
					var11.current = p3
					
					return
				elseif absValue < var26 / 2 then return end
				local value = var10:getValue()
				local var27 = calculateNextStepValueModule(var25.X, value, var2.step, var2.range)
				
				if var27 == value then
					return
				else
					var22(var27)
					var11.current = p3
					
					return
				end
			else
				local var28 = calculateSliderPositionDeltaModule(p3, var11.current, var16.current.AbsoluteSize.Magnitude)
				var11.current = p3
				
				if var15 == inputModeModule.Directional and math.abs(var28) > 0.01 then return end
				var22(var21(p3))
			end
		end
	end, {
		var2.step, var2.range, var15, var10, var22, var21
	})
	local var25 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p3)
		-- upvalues: var7 (ref), var2 (ref), var14 (ref), var15 (ref), inputModeModule (copy), var13 (ref), var10 (ref), var16 (ref), calculateSliderValueFromPositionModule (copy), var22 (ref), calculateSliderStepValueModule (copy)
		var7(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
		var14.current = 0
		local var26 = var2.range.Max - var2.range.Min
		
		if var15 == inputModeModule.Directional then
			var13.current = (var10:getValue() - var2.range.Min) / var26
			
			return
		end
		local var27 = if var16.current then calculateSliderValueFromPositionModule(p3, var16.current, var2.range) else var2.range.Min
		var13.current = (var27 - var2.range.Min) / var26
		var22(if var2.step then calculateSliderStepValueModule(var27, var2.step, var2.range) else var27)
	end, {
		var2.onDragStarted, var2.step, var2.range, var15, var10, var22
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var7 (ref), var2 (ref)
		var11.current = p3
		var7(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
	end, { var2.onDragStarted })
	local var26 = reactModule.useCallback(function(_, _)
		-- upvalues: var7 (ref), flagsModule (copy), var11 (ref), var2 (ref)
		var7(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var11.current = nil
		end
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded })
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), flagsModule (copy), controlStateModule (copy), var23 (ref)
		var5(p3)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath and p3 == controlStateModule.Pressed then
			var23()
		end
	end, { var23 })
	local var28 = if flagsModule.FoundationSliderKnobSelection then usePresentationContext() else nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function()
			-- upvalues: var12 (ref), var13 (ref)
			local current = var12.current
			
			if current then
				local var29 = current:AddConstraintFunction(1, function(p3, p4)
					-- upvalues: var13 (copy)
					local current = var13.current
					
					return UDim2.fromScale(math.clamp(p3.X.Scale, -current, 1 - current), 0), p4
				end)
				
				return function()
					-- upvalues: var29 (ref)
					var29:Disconnect()
				end
			end
		end, {})
	end
	local uDim2 = UDim2.fromScale(1, 0.5)
	local var29 = if var2.isContained then var10:map(function(p3)
		-- upvalues: var2 (ref)
		return Vector2.new((p3 - var2.range.Min) / (var2.range.Max - var2.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	local var30 = nil
	local var31 = nil
	
	if flagsModule.FoundationSliderKnobSelection then
		local var32, var33 = reactModule.useBinding(Vector2.zero)
		var30 = var32
		var31 = var33
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = UDim2.new(var2.width, UDim.new(0, var18.hitbox.height)),
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then t_2 else nil,
		cursor = if flagsModule.FoundationSliderKnobSelection then cursorTypeModule.Invisible else nil,
		onStateChanged = var27,
		isDisabled = var2.isDisabled,
		ref = var16
	}), {
		DragDetector = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var12,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			[reactModule.Event.DragStart] = var25,
			[reactModule.Event.DragContinue] = var24,
			[reactModule.Event.DragEnd] = var26,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var25,
			[reactModule.Event.DragContinue] = var24,
			[reactModule.Event.DragEnd] = var26,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, { tag = var18.bar.tag, testId = `{var2.testId}--bar` }, {
			Fill = reactModule.createElement(viewModule, {
				tag = var18.fill.tag,
				Size = var10:map(function(p3)
					-- upvalues: var2 (ref)
					return UDim2.fromScale((p3 - var2.range.Min) / (var2.range.Max - var2.range.Min), 1)
				end),
				testId = `{var2.testId}--fill`
			}, {
				SelectionCursor = if flagsModule.FoundationSliderKnobSelection and var1 then reactModule.createElement(viewModule, {
					Size = if var2.knob then var30:map(function(p3)
						return UDim2.fromOffset(p3.X, p3.Y)
					end) else getKnobSizeModule(var3, var2.size),
					AnchorPoint = var29,
					Position = uDim2,
					testId = `{var2.testId}--selection-cursor`
				}, {
					Cursor = reactModule.createElement(cursorComponentModule, {
						isVisible = true,
						cornerRadius = UDim.new(0.5, 0),
						offset = var3.Padding.XSmall,
						borderWidth = var3.Stroke.Thicker,
						colorNamespace = var28.colorNamespace
					})
				}) else nil,
				Knob = if var2.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var29,
					Position = uDim2,
					Visible = var8,
					onAbsoluteSizeChanged = if flagsModule.FoundationSliderKnobSelection then if flagsModule.FoundationSliderKnobSelection then reactModule.useCallback(function(p3)
						-- upvalues: var31 (write)
						var31(p3.AbsoluteSize)
					end, {}) else nil else nil,
					testId = `{var2.testId}--custom-knob`
				}, var2.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var29,
						Position = uDim2,
						size = var2.size,
						style = var20.knobStyle,
						stroke = var18.knob.stroke,
						hasShadow = var18.knob.hasShadow,
						testId = `{var2.testId}--knob`
					})
				})
			})
		})
	})
end)