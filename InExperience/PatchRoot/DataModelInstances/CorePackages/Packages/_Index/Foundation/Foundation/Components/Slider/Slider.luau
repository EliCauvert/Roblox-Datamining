local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
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
local blendTransparenciesModule = require(foundation.Utility.blendTransparencies)
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
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), flagsModule (ref), useLastInputModeModule (ref), reactUtilsModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), useSliderDirectionalInputModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), usePresentationContext (ref), getKnobSizeModule (ref), blendTransparenciesModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), cursorTypeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(controlStateModule.Initialize)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = useBindableModule(var1.value):map(function(p3)
		-- upvalues: var1 (ref)
		return math.clamp(p3, var1.range.Min, var1.range.Max)
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
	local var16 = nil
	local var17 = nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		local var18, var19 = reactModule.useBinding(nil)
		var16 = var18
		var17 = var19
	end
	local var20
	local var21 = if flagsModule.FoundationSliderOffloadDraggingMath then reactUtilsModule.useComposedRef(var15, var17) else nil
	local var22 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var15.current)
	local var23 = useSliderVariantsModule(var2, var1.size, var1.variant)
	local var24 = useSliderMotionStatesModule(var23.knob.style, var23.knob.dragStyle)
	local var25 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var24 (ref), var5 (ref)
		return if var7 then if var5 then var24.Dragging else var24.Idle else var24.Hidden
	end, { var2, var7, var5, var24 })
	local var26 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var7 (ref), var23 (ref), var5 (ref)
		return if var7 then if var5 then var23.knob.dragStyle else var23.knob.style else { Transparency = 1, Color3 = var23.knob.style.Color3 }
	end, { var23, var7, var5 }) else nil
	
	if flagsModule.FoundationSliderKnobSelection then
		var20 = true
		
		if var3 ~= controlStateModule.Selected then
			local _ = var3 == controlStateModule.SelectedPressed
		end
	else
		var20 = nil
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var1 (ref), var8 (ref), visibilityModule (copy), var20 (write), var5 (ref), var3 (ref), controlStateModule (copy)
		if flagsModule.FoundationSliderBeta and var1.isDisabled then
			var8(false)
			
			return
		elseif var1.knobVisibility == visibilityModule.None then
			var8(if flagsModule.FoundationSliderKnobSelection then var20 else false)
			
			return
		elseif var1.knobVisibility == visibilityModule.Always then
			var8(true)
			
			return
		end
		var8(var5 or (if var3 ~= controlStateModule.Hover then if var3 ~= controlStateModule.Selected then var3 == controlStateModule.Pressed else true else true))
	end, {
		var1.knobVisibility,
		var3,
		var5,
		if flagsModule.FoundationSliderBeta then var1.isDisabled else nil,
		if flagsModule.FoundationSliderKnobSelection then var20 else nil
	})
	local var27 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3)
		-- upvalues: var15 (ref), calculateSliderValueFromPositionModule (copy), var1 (ref), calculateSliderStepValueModule (copy)
		if not var15.current then
			return 0
		end
		local var28 = calculateSliderValueFromPositionModule(p3, var15.current, var1.range)
		
		return if var1.step then calculateSliderStepValueModule(var28, var1.step, var1.range) else var28
	end, { var15, var1.range, var1.step })
	local var28 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), var1 (ref)
		if p3 ~= var9:getValue() and var1.onValueChanged then
			var1.onValueChanged(p3)
		end
	end, { var9, var1.onValueChanged })
	local var29 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function()
		-- upvalues: var27 (ref), var22 (ref), var28 (ref)
		var28(var27(var22:getValue()))
	end, { var27, var22, var28 })
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		if not flagsModule.FoundationSliderKnobSelection then
			var20 = if var3 ~= controlStateModule.Selected then var3 == controlStateModule.SelectedPressed else true
		end
		useSliderDirectionalInputModule(var20 and not var1.isDisabled, var1.step, var1.range, {
			getValue = function()
				-- upvalues: var9 (ref)
				return var9:getValue()
			end,
			onStep = function(p3)
				-- upvalues: var28 (ref), var1 (ref), calculateSliderStepValueModule (copy)
				var28(if var1.step then calculateSliderStepValueModule(p3, var1.step, var1.range) else p3)
			end
		})
	end
	local var30 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _)
		-- upvalues: var11 (ref), var1 (ref), var14 (ref), inputModeModule (copy), var13 (ref), var12 (ref), var9 (ref), var28 (ref), calculateSliderStepValueModule (copy)
		local current = var11.current
		
		if not current then return end
		local var31 = var1.range.Max - var1.range.Min
		local scale = current.DragUDim2.X.Scale
		
		if var14 == inputModeModule.Directional and math.abs(scale - var13.current) > 0.01 then
			var12.current = (var9:getValue() - var1.range.Min) / var31 - scale
			var13.current = scale
			
			return
		end
		var13.current = scale
		local var32 = var1.range.Min + math.clamp(var12.current + scale, 0, 1) * var31
		var28(if var1.step then calculateSliderStepValueModule(var32, var1.step, var1.range) else var32)
	end, {
		var1.step,
		var1.range,
		var14,
		var9,
		var28
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var15 (ref), var10 (ref), var1 (ref), var14 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var9 (ref), calculateNextStepValueModule (copy), var28 (ref), var27 (ref), calculateSliderPositionDeltaModule (copy)
		if var15.current and var10.current then
			if var1.step and var1.step > 0 then
				if var14 ~= inputModeModule.Directional then
					var28(var27(p3))
					var10.current = p3
					
					return
				end
				local var31 = p3 - var10.current
				local absValue = math.abs(var31.X)
				local var32 = calculatePixelsPerStepModule(var15.current.AbsoluteSize.X, var1.step, var1.range)
				
				if var32 * 2 < absValue then
					var10.current = p3
					
					return
				elseif absValue < var32 / 2 then return end
				local value = var9:getValue()
				local var33 = calculateNextStepValueModule(var31.X, value, var1.step, var1.range)
				
				if var33 == value then
					return
				else
					var28(var33)
					var10.current = p3
					
					return
				end
			else
				local var34 = calculateSliderPositionDeltaModule(p3, var10.current, var15.current.AbsoluteSize.Magnitude)
				var10.current = p3
				
				if var14 == inputModeModule.Directional and math.abs(var34) > 0.01 then return end
				var28(var27(p3))
			end
		end
	end, {
		var1.step, var1.range, var14, var9, var28, var27
	})
	local var31 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p3)
		-- upvalues: var6 (ref), var1 (ref), var13 (ref), var14 (ref), inputModeModule (copy), var12 (ref), var9 (ref), var15 (ref), calculateSliderValueFromPositionModule (copy), var28 (ref), calculateSliderStepValueModule (copy)
		var6(true)
		
		if var1.onDragStarted then
			var1.onDragStarted()
		end
		var13.current = 0
		local var32 = var1.range.Max - var1.range.Min
		
		if var14 == inputModeModule.Directional then
			var12.current = (var9:getValue() - var1.range.Min) / var32
			
			return
		end
		local var33 = if var15.current then calculateSliderValueFromPositionModule(p3, var15.current, var1.range) else var1.range.Min
		var12.current = (var33 - var1.range.Min) / var32
		var28(if var1.step then calculateSliderStepValueModule(var33, var1.step, var1.range) else var33)
	end, {
		var1.onDragStarted, var1.step, var1.range, var14, var9, var28
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var10 (ref), var6 (ref), var1 (ref)
		var10.current = p3
		var6(true)
		
		if var1.onDragStarted then
			var1.onDragStarted()
		end
	end, { var1.onDragStarted })
	local var32 = reactModule.useCallback(function(_, _)
		-- upvalues: var6 (ref), flagsModule (copy), var10 (ref), var1 (ref)
		var6(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var10.current = nil
		end
		if var1.onDragEnded then
			var1.onDragEnded()
		end
	end, { var1.onDragEnded })
	local var33 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), flagsModule (copy), controlStateModule (copy), var29 (ref)
		var4(p3)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath and p3 == controlStateModule.Pressed then
			var29()
		end
	end, { var29 })
	local var34 = if flagsModule.FoundationSliderKnobSelection then usePresentationContext() else nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var12 (ref)
			local current = var11.current
			
			if current then
				local var35 = current:AddConstraintFunction(1, function(p3, p4)
					-- upvalues: var12 (copy)
					local current = var12.current
					
					return UDim2.fromScale(math.clamp(p3.X.Scale, -current, 1 - current), 0), p4
				end)
				
				return function()
					-- upvalues: var35 (ref)
					var35:Disconnect()
				end
			end
		end, {})
	end
	local uDim2 = UDim2.fromScale(1, 0.5)
	local var35 = if var1.isContained then var9:map(function(p3)
		-- upvalues: var1 (ref)
		return Vector2.new((p3 - var1.range.Min) / (var1.range.Max - var1.range.Min), 0.5)
	end) else Vector2.new(0.5, 0.5)
	local var36 = if flagsModule.FoundationSliderBeta then getKnobSizeModule(var2, var1.size).X.Offset else nil
	local var37 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var23 (ref), blendTransparenciesModule (copy), var7 (ref)
		local stroke = var23.knob.stroke
		
		return if stroke == nil then nil else {
			Color = stroke.Color,
			Thickness = stroke.Thickness,
			Transparency = blendTransparenciesModule(if typeof(stroke.Transparency) == "number" then stroke.Transparency else nil, if var7 then 0 else 1)
		}
	end, { var23, var7 }) else nil
	local var38 = nil
	local var39 = nil
	
	if flagsModule.FoundationSliderKnobSelection then
		local var40, var41 = reactModule.useBinding(Vector2.zero)
		var38 = var40
		var39 = var41
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		Size = UDim2.new(var1.width, UDim.new(0, if flagsModule.FoundationSliderBeta then var36 else var23.hitbox.height)),
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then t_2 else nil,
		cursor = if flagsModule.FoundationSliderKnobSelection then cursorTypeModule.Invisible else nil,
		onStateChanged = var33,
		isDisabled = var1.isDisabled,
		ref = if flagsModule.FoundationSliderOffloadDraggingMath then var21 else var15
	}), {
		DragDetector = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var11,
			ReferenceUIInstance = var16,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			[reactModule.Event.DragStart] = var31,
			[reactModule.Event.DragContinue] = var30,
			[reactModule.Event.DragEnd] = var32,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var1.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var31,
			[reactModule.Event.DragContinue] = var30,
			[reactModule.Event.DragEnd] = var32,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var1.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, {
			tag = var23.bar.tag,
			Size = if flagsModule.FoundationSliderBeta then UDim2.new(1, 0, 0, var23.bar.height) else nil,
			testId = `{var1.testId}--bar`
		}, {
			Fill = reactModule.createElement(viewModule, {
				tag = var23.fill.tag,
				Size = var9:map(function(p3)
					-- upvalues: var1 (ref)
					return UDim2.fromScale((p3 - var1.range.Min) / (var1.range.Max - var1.range.Min), 1)
				end),
				testId = `{var1.testId}--fill`
			}, {
				SelectionCursor = if flagsModule.FoundationSliderKnobSelection and var20 then reactModule.createElement(viewModule, {
					Size = if var1.knob then var38:map(function(p3)
						return UDim2.fromOffset(p3.X, p3.Y)
					end) else getKnobSizeModule(var2, var1.size),
					AnchorPoint = var35,
					Position = uDim2,
					testId = `{var1.testId}--selection-cursor`
				}, {
					Cursor = reactModule.createElement(cursorComponentModule, {
						isVisible = true,
						cornerRadius = UDim.new(0.5, 0),
						offset = var2.Padding.XSmall,
						borderWidth = var2.Stroke.Thicker,
						colorNamespace = var34.colorNamespace
					})
				}) else nil,
				Knob = if var1.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var35,
					Position = uDim2,
					Visible = var7,
					onAbsoluteSizeChanged = if flagsModule.FoundationSliderKnobSelection then if flagsModule.FoundationSliderKnobSelection then reactModule.useCallback(function(p3)
						-- upvalues: var39 (write)
						var39(p3.AbsoluteSize)
					end, {}) else nil else nil,
					testId = `{var1.testId}--custom-knob`
				}, var1.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var35,
						Position = uDim2,
						size = var1.size,
						style = if flagsModule.FoundationSliderBeta then var26 else var25.knobStyle,
						stroke = if flagsModule.FoundationSliderBeta then var37 else var23.knob.stroke,
						hasShadow = var23.knob.hasShadow,
						testId = `{var1.testId}--knob`
					})
				})
			})
		})
	})
end)