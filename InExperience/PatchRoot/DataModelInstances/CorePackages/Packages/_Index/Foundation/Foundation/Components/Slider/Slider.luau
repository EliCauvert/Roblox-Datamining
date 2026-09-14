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
local calculateSliderFractionModule = require(script.Parent.calculateSliderFraction)
local calculateSliderPositionDeltaModule = require(script.Parent.calculateSliderPositionDelta)
local calculateSliderStepValueModule = require(script.Parent.calculateSliderStepValue)
local calculateSliderValueFromPositionModule = require(script.Parent.calculateSliderValueFromPosition)
local getGuiInputPositionModule = require(script.Parent.getGuiInputPosition)
local useSliderDirectionalInputModule = require(script.Parent.useSliderDirectionalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local visibilityModule = require(foundation.Enums.Visibility)
local orientationModule = require(foundation.Enums.Orientation)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local sliderTypeModule = require(foundation.Enums.SliderType)
local sliderKnobModule = require(script.Parent.SliderKnob)
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
	orientation = if flagsModule.FoundationSliderBeta then orientationModule.Horizontal else nil,
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
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), orientationModule (ref), sliderTypeModule (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), useLastInputModeModule (ref), reactUtilsModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), inputModeModule (ref), calculateSliderFractionModule (ref), getGuiInputPositionModule (ref), useSliderDirectionalInputModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), usePresentationContext (ref), getKnobSizeModule (ref), blendTransparenciesModule (ref), viewModule (ref), sliderKnobModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), cursorTypeModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	
	if flagsModule.FoundationSliderBeta then
		var1 = var2.orientation == orientationModule.Vertical
		var1 = nil
	else
		var1 = nil
	end
	local var3
	if flagsModule.FoundationSliderBeta then
		var3 = p1.type == sliderTypeModule.Range
		var3 = nil
	else
		var3 = nil
	end
	local var4 = if p1.type == sliderTypeModule.Range then 0 else p1.value
	local var5 = if p1.type == sliderTypeModule.Range then nil else p1.onValueChanged
	local var6 = if flagsModule.FoundationSliderBeta then if p1.type == sliderTypeModule.Range then p1.onValueChanged else nil else nil
	local var7 = useTokensModule()
	local var8, var9 = reactModule.useState(controlStateModule.Initialize)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(false)
	local var14 = if flagsModule.FoundationSliderBeta then reactModule.useRef(false) else nil
	local var15 = nil
	local var16 = nil
	
	if flagsModule.FoundationSliderBeta then
		local var17, var18 = reactModule.useState(false)
		var15 = var17
		var16 = var18
	end
	local var19 = useBindableModule(var4):map(function(p3)
		-- upvalues: var2 (ref)
		return math.clamp(p3, var2.range.Min, var2.range.Max)
	end)
	local var20 = if flagsModule.FoundationSliderBeta then useBindableModule(if p1.type == sliderTypeModule.Range then p1.value else NumberRange.new(0)) else nil
	local var21 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useRef(nil)
	local var22 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(nil) else nil
	local var23 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var24 = nil
	local var25 = nil
	local var26 = nil
	local var27 = nil
	
	if flagsModule.FoundationSliderBeta then
		local var28, var29 = reactModule.useBinding(UDim2.new())
		var24 = var28
		var25 = var29
		local var30, var31 = reactModule.useBinding(UDim2.new())
		var26 = var30
		var27 = var31
	end
	local var32 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), var25 (write), var27 (write)
		if var1 then
			var25(UDim2.fromScale(0, p3 - 1))
			var27(UDim2.fromScale(0, p3))
			
			return
		end
		var25(UDim2.fromScale(-p3, 0))
		var27(UDim2.fromScale(1 - p3, 0))
	end, { var1 }) else nil
	local var33 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var34 = useLastInputModeModule()
	local var35 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var35 (ref)
		return var35.current
	end, {})
	local var36 = nil
	local var37 = nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		local var38, var39 = reactModule.useBinding(nil)
		var36 = var38
		var37 = var39
	end
	local var40
	local var41 = if flagsModule.FoundationSliderOffloadDraggingMath then reactUtilsModule.useComposedRef(var35, var37) else nil
	local var42 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var35.current)
	local var43 = useSliderVariantsModule(var7, var2.size, var2.variant, var1)
	local var44 = if flagsModule.FoundationSliderBeta then nil else useSliderMotionStatesModule(var43.knob.style, var43.knob.dragStyle)
	local var45 = if flagsModule.FoundationSliderBeta then nil else reactModule.useMemo(function()
		-- upvalues: var12 (ref), var44 (ref), var10 (ref)
		return if var12 then if var10 then var44.Dragging else var44.Idle else var44.Hidden
	end, { var7, var12, var10, var44 })
	local var46 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var12 (ref), var43 (ref), var10 (ref), var3 (ref)
		return if var12 then if var10 and not var3 then var43.knob.dragStyle else var43.knob.style else { Transparency = 1, Color3 = var43.knob.style.Color3 }
	end, { var43, var12, var10, var3 }) else nil
	
	if flagsModule.FoundationSliderKnobSelection then
		var40 = true
		
		if var8 ~= controlStateModule.Selected then
			local _ = var8 == controlStateModule.SelectedPressed
		end
	else
		var40 = nil
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var2 (ref), var13 (ref), visibilityModule (copy), var40 (write), var10 (ref), var8 (ref), controlStateModule (copy)
		if flagsModule.FoundationSliderBeta and var2.isDisabled then
			var13(false)
			
			return
		elseif var2.knobVisibility == visibilityModule.None then
			var13(if flagsModule.FoundationSliderKnobSelection then var40 else false)
			
			return
		elseif var2.knobVisibility == visibilityModule.Always then
			var13(true)
			
			return
		end
		var13(var10 or (if var8 ~= controlStateModule.Hover then if var8 ~= controlStateModule.Selected then var8 == controlStateModule.Pressed else true else true))
	end, {
		var2.knobVisibility,
		var8,
		var10,
		if flagsModule.FoundationSliderBeta then var2.isDisabled else nil,
		if flagsModule.FoundationSliderKnobSelection then var40 else nil
	})
	local var47 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3)
		-- upvalues: var35 (ref), calculateSliderValueFromPositionModule (copy), var2 (ref), calculateSliderStepValueModule (copy)
		if not var35.current then
			return 0
		end
		local var48 = calculateSliderValueFromPositionModule(p3, var35.current, var2.range)
		
		return if var2.step then calculateSliderStepValueModule(var48, var2.step, var2.range) else var48
	end, { var35, var2.range, var2.step })
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: var19 (ref), var5 (ref)
		if p3 ~= var19:getValue() and var5 then
			var5(p3)
		end
	end, { var19, var5 })
	local var49 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref), var6 (ref)
		local value = var20:getValue()
		
		if var6 and (typeof(value) ~= "NumberRange" or p3.Min ~= value.Min or p3.Max ~= value.Max) then
			var6(p3)
		end
	end, { var20, var6 }) else nil
	local var50 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var16 (write), var11 (ref), var2 (ref)
		var16(p3)
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
	end, { var2.onDragStarted }) else nil
	local var51 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var11 (ref), var2 (ref)
		var11(false)
		
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded }) else nil
	local var52 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var50 (ref)
		var50(false)
	end, { var50 }) else nil
	local var53 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var50 (ref)
		var50(true)
	end, { var50 }) else nil
	local var54 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function()
		-- upvalues: var47 (ref), var42 (ref), var48 (ref)
		var48(var47(var42:getValue()))
	end, { var47, var42, var48 })
	local var55 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return math.clamp((p3 - var2.range.Min) / (var2.range.Max - var2.range.Min), 0, 1)
	end, { var2.range.Min, var2.range.Max }) else nil
	local var56 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return var2.range.Min + p3 * (var2.range.Max - var2.range.Min)
	end, { var2.range.Min, var2.range.Max }) else nil
	local var57 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var56 (ref), var2 (ref), calculateSliderStepValueModule (copy)
		local var58 = var56(p3)
		
		return if var2.step then calculateSliderStepValueModule(var58, var2.step, var2.range) else var58
	end, { var56, var2.step, var2.range }) else nil
	local var58 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var55 (ref), var20 (ref), var2 (ref), var56 (ref)
		local var59 = var55(var20:getValue().Max)
		
		if var2.step and var2.step > 0 then
			var59 = var55(var2.range.Min + math.floor((var56(var59) - var2.range.Min) / var2.step + 0.5) * var2.step)
		end
		return 0, var59
	end, {
		var20,
		var55,
		var2.step,
		var56,
		var2.range.Min
	}) else nil
	local var59 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var55 (ref), var20 (ref), var2 (ref), var56 (ref)
		local var60 = var55(var20:getValue().Min)
		
		if var2.step and var2.step > 0 then
			var60 = var55(var2.range.Min + math.floor((var56(var60) - var2.range.Min) / var2.step + 0.5) * var2.step)
		end
		return var60, 1
	end, {
		var20,
		var55,
		var2.step,
		var56,
		var2.range.Min
	}) else nil
	local var60 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref), var49 (ref), var57 (ref)
		local value = var20:getValue()
		var49(NumberRange.new(math.min(var57(p3), value.Max), value.Max))
	end, { var20, var49, var57 }) else nil
	local var61 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var20 (ref), var49 (ref), var57 (ref)
		local value = var20:getValue()
		var49(NumberRange.new(value.Min, math.max(var57(p3), value.Min)))
	end, { var20, var49, var57 }) else nil
	local var62 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3, p4)
		-- upvalues: var59 (ref), var61 (ref), var58 (ref), var60 (ref)
		if p4 then
			local var63, var64 = var59()
			var61(math.clamp(p3, var63, var64))
			
			return
		end
		local var65, var66 = var58()
		var60(math.clamp(p3, var65, var66))
	end, { var59, var58, var61, var60 }) else nil
	local var63 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var34 (ref), inputModeModule (copy), var35 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), var20 (ref), var55 (ref), var14 (ref), var50 (ref), var62 (ref)
		if not var3 or var34 == inputModeModule.Directional or not var35.current then return end
		local var64 = calculateSliderFractionModule(getGuiInputPositionModule(p3, var35.current), var35.current, var1)
		local value = var20:getValue()
		local var65 = var55(value.Min)
		local var66 = var55(value.Max)
		local var67 = if math.abs(var66 - var64) >= math.abs(var64 - var65) then var65 == var66 and var66 < var64 else true
		var14.current = var67
		var50(var67)
		var62(var64, var67)
	end, {
		var3, var34, var1, var20, var50, var62, var55
	}) else nil
	local var64 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var34 (ref), inputModeModule (copy), var35 (ref), getGuiInputPositionModule (copy), var62 (ref), calculateSliderFractionModule (copy), var1 (ref), var14 (ref)
		if var3 and var34 ~= inputModeModule.Directional and var35.current then
			var62(calculateSliderFractionModule(getGuiInputPositionModule(p3, var35.current), var35.current, var1), var14.current)
			
			return
		end
	end, { var3, var34, var1, var62 }) else nil
	local var65 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var3 (ref), var51 (ref)
		if var3 then
			var51()
			
			return
		end
	end, { var3, var51 }) else nil
	local var66 = if flagsModule.FoundationSliderAsSeenOnTV then reactModule.useMemo(function()
		-- upvalues: var19 (ref), var48 (ref), var2 (ref), calculateSliderStepValueModule (copy)
		return {
			getValue = function()
				-- upvalues: var19 (copy)
				return var19:getValue()
			end,
			onStep = function(p3)
				-- upvalues: var48 (copy), var2 (copy), calculateSliderStepValueModule (copy)
				var48(if var2.step then calculateSliderStepValueModule(p3, var2.step, var2.range) else p3)
			end
		}
	end, { var19, var48, var2.step, var2.range }) else nil
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		if not flagsModule.FoundationSliderKnobSelection then
			var40 = if var8 ~= controlStateModule.Selected then var8 == controlStateModule.SelectedPressed else true
		end
		useSliderDirectionalInputModule(var40 and (not var2.isDisabled and not var3), var2.step, var2.range, var1, var66)
	end
	local var67 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _)
		-- upvalues: var22 (ref), var2 (ref), flagsModule (copy), var1 (ref), var34 (ref), inputModeModule (copy), var33 (ref), var23 (ref), var19 (ref), var32 (ref), var48 (ref), calculateSliderStepValueModule (copy)
		local current = var22.current
		
		if not current then return end
		local var68 = var2.range.Max - var2.range.Min
		local var69 = if flagsModule.FoundationSliderBeta and var1 then -current.DragUDim2.Y.Scale else current.DragUDim2.X.Scale
		
		if var34 ~= inputModeModule.Directional or math.abs(var69 - var33.current) <= 0.01 then
			var33.current = var69
			local var70 = var2.range.Min + math.clamp(var23.current + var69, 0, 1) * var68
			var48(if var2.step then calculateSliderStepValueModule(var70, var2.step, var2.range) else var70)
			
			return
		end
		var23.current = (var19:getValue() - var2.range.Min) / var68 - var69
		var33.current = var69
		
		if flagsModule.FoundationSliderBeta then
			var32(var23.current)
		end
	end, {
		var2.step, var2.range, var34, var19, var48,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var32 else nil
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var35 (ref), var21 (ref), var2 (ref), var34 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var19 (ref), calculateNextStepValueModule (copy), var48 (ref), var47 (ref), calculateSliderPositionDeltaModule (copy)
		if var35.current and var21.current then
			if var2.step and var2.step > 0 then
				if var34 ~= inputModeModule.Directional then
					var48(var47(p3))
					var21.current = p3
					
					return
				end
				local var68 = p3 - var21.current
				local absValue = math.abs(var68.X)
				local var69 = calculatePixelsPerStepModule(var35.current.AbsoluteSize.X, var2.step, var2.range)
				
				if var69 * 2 < absValue then
					var21.current = p3
					
					return
				elseif absValue < var69 / 2 then return end
				local value = var19:getValue()
				local var70 = calculateNextStepValueModule(var68.X, value, var2.step, var2.range)
				
				if var70 == value then
					return
				else
					var48(var70)
					var21.current = p3
					
					return
				end
			else
				local var71 = calculateSliderPositionDeltaModule(p3, var21.current, var35.current.AbsoluteSize.Magnitude)
				var21.current = p3
				
				if var34 == inputModeModule.Directional and math.abs(var71) > 0.01 then return end
				var48(var47(p3))
			end
		end
	end, {
		var2.step, var2.range, var34, var19, var48, var47
	})
	local var68 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var2 (ref), var33 (ref), var34 (ref), inputModeModule (copy), var23 (ref), var19 (ref), flagsModule (copy), var32 (ref), var35 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), calculateSliderValueFromPositionModule (copy), var48 (ref), calculateSliderStepValueModule (copy)
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
		var33.current = 0
		local var69 = var2.range.Max - var2.range.Min
		
		if var34 == inputModeModule.Directional then
			var23.current = (var19:getValue() - var2.range.Min) / var69
			
			if flagsModule.FoundationSliderBeta then
				var32(var23.current)
			end
			return
		else
			local var70 = if flagsModule.FoundationSliderBeta then if var35.current then var2.range.Min + calculateSliderFractionModule(getGuiInputPositionModule(p3, var35.current), var35.current, var1) * var69 else var2.range.Min elseif var35.current then calculateSliderValueFromPositionModule(p3, var35.current, var2.range) else var2.range.Min
			var23.current = (var70 - var2.range.Min) / var69
			var48(if var2.step then calculateSliderStepValueModule(var70, var2.step, var2.range) else var70)
			
			if flagsModule.FoundationSliderBeta then
				var32(var23.current)
			end
		end
	end, {
		var2.onDragStarted, var2.step, var2.range, var34, var19, var48,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var32 else nil
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var21 (ref), var11 (ref), var2 (ref)
		var21.current = p3
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
	end, { var2.onDragStarted })
	local var69 = reactModule.useCallback(function(_, _)
		-- upvalues: var11 (ref), flagsModule (copy), var21 (ref), var2 (ref)
		var11(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var21.current = nil
		end
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded })
	local var70 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), var3 (ref), flagsModule (copy), controlStateModule (copy), var54 (ref)
		var9(p3)
		
		if not var3 and not flagsModule.FoundationSliderOffloadDraggingMath and p3 == controlStateModule.Pressed then
			var54()
		end
	end, { var54, var3 })
	local var71 = if flagsModule.FoundationSliderKnobSelection then usePresentationContext() else nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function()
			-- upvalues: var22 (ref), flagsModule (copy), var35 (ref), var23 (ref)
			local current = var22.current
			
			if not current then return end
			if flagsModule.FoundationSliderBeta then
				current.ReferenceUIInstance = var35.current
				
				return
			end
			local var72 = current:AddConstraintFunction(1, function(p3, p4)
				-- upvalues: var23 (copy)
				local current = var23.current
				
				return UDim2.fromScale(math.clamp(p3.X.Scale, -current, 1 - current), 0), p4
			end)
			
			return function()
				-- upvalues: var72 (ref)
				var72:Disconnect()
			end
		end, {})
	end
	local var72 = if var1 then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local var73 = if var2.isContained then var19:map(function(p3)
		-- upvalues: var2 (ref), var1 (ref)
		local var74 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
		
		return if var1 then Vector2.new(0.5, 1 - var74) else Vector2.new(var74, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local uDim = UDim.new(0, if flagsModule.FoundationSliderBeta then getKnobSizeModule(var7, var2.size).X.Offset else var43.hitbox.height)
	local var74 = if var1 then UDim2.new(uDim, var2.width) else UDim2.new(var2.width, uDim)
	local var75 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var43 (ref), blendTransparenciesModule (copy), var12 (ref)
		local stroke = var43.knob.stroke
		
		return if stroke == nil then nil else {
			Color = stroke.Color,
			Thickness = stroke.Thickness,
			Transparency = blendTransparenciesModule(if typeof(stroke.Transparency) == "number" then stroke.Transparency else nil, if var12 then 0 else 1)
		}
	end, { var43, var12 }) else nil
	local var76 = nil
	local var77 = nil
	
	if flagsModule.FoundationSliderKnobSelection then
		local var78, var79 = reactModule.useBinding(Vector2.zero)
		var76 = var78
		var77 = var79
	end
	local var80 = if flagsModule.FoundationSliderKnobSelection then reactModule.useCallback(function(p3)
		-- upvalues: var77 (write)
		var77(p3.AbsoluteSize)
	end, {}) else nil
	local var81 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var12 (ref), var10 (ref), var15 (write), var43 (ref), var46 (ref), var75 (ref)
		return {
			size = var2.size,
			style = if var12 and var10 and not var15 then var43.knob.dragStyle else var46,
			stroke = var75,
			hasShadow = var43.knob.hasShadow
		}
	end, {
		var2.size, var12, var10, var15, var43.knob.dragStyle, var46, var75,
		var43.knob.hasShadow
	}) else nil
	local var82 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var12 (ref), var10 (ref), var15 (write), var43 (ref), var46 (ref), var75 (ref)
		return {
			size = var2.size,
			style = if var12 and var10 and var15 then var43.knob.dragStyle else var46,
			stroke = var75,
			hasShadow = var43.knob.hasShadow
		}
	end, {
		var2.size, var12, var10, var15, var43.knob.dragStyle, var46, var75,
		var43.knob.hasShadow
	}) else nil
	local var83 = if flagsModule.FoundationSliderBeta then var20:map(function(p3)
		-- upvalues: var55 (ref)
		return var55(p3.Min)
	end) else nil
	local var84 = if flagsModule.FoundationSliderBeta then var20:map(function(p3)
		-- upvalues: var55 (ref)
		return var55(p3.Max)
	end) else nil
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = var74,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then if var3 then nil elseif flagsModule.FoundationSliderBeta then var43.selectionGroup else t_2 else nil,
		cursor = if flagsModule.FoundationSliderKnobSelection then cursorTypeModule.Invisible else nil,
		onStateChanged = var70,
		isDisabled = var2.isDisabled,
		ref = if var3 then var35 elseif flagsModule.FoundationSliderOffloadDraggingMath then var41 else var35
	}), {
		DragDetector = if var3 then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var63,
			[reactModule.Event.DragContinue] = var64,
			[reactModule.Event.DragEnd] = var65,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}) elseif flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var22,
			ReferenceUIInstance = var36,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = if var1 then Vector2.new(0, 1) else Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			MinDragTranslation = if flagsModule.FoundationSliderBeta then var24 else nil,
			MaxDragTranslation = if flagsModule.FoundationSliderBeta then var26 else nil,
			[reactModule.Event.DragStart] = var68,
			[reactModule.Event.DragContinue] = var67,
			[reactModule.Event.DragEnd] = var69,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var68,
			[reactModule.Event.DragContinue] = var67,
			[reactModule.Event.DragEnd] = var69,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, {
			tag = var43.bar.tag,
			Size = if flagsModule.FoundationSliderBeta then if var1 then UDim2.new(0, var43.bar.height, 1, 0) else UDim2.new(1, 0, 0, var43.bar.height) else nil,
			testId = `{var2.testId}--bar`
		}, if var3 then {
			Fill = reactModule.createElement(viewModule, {
				tag = var43.fill.tag,
				AnchorPoint = Vector2.new(0, 0),
				Position = if var1 then var84:map(function(p3)
					return UDim2.fromScale(0, 1 - p3)
				end) else var83:map(function(p3)
					return UDim2.fromScale(p3, 0)
				end),
				Size = var20:map(function(p3)
					-- upvalues: var55 (ref), var1 (ref)
					local var85 = var55(p3.Max) - var55(p3.Min)
					
					return if var1 then UDim2.fromScale(1, var85) else UDim2.fromScale(var85, 1)
				end),
				testId = `{var2.testId}--fill`
			}),
			MinKnob = reactModule.createElement(sliderKnobModule, {
				LayoutOrder = 1,
				trackRef = var35,
				fraction = var83,
				isVertical = var1,
				isDisabled = var2.isDisabled,
				knobAppearance = var81,
				knob = var2.knob,
				isContained = var2.isContained,
				onSeek = var60,
				getBounds = var58,
				onDragStarted = var52,
				onDragEnded = var51,
				Visible = var12,
				testId = `{var2.testId}--min`
			}),
			MaxKnob = reactModule.createElement(sliderKnobModule, {
				LayoutOrder = 2,
				trackRef = var35,
				fraction = var84,
				isVertical = var1,
				isDisabled = var2.isDisabled,
				knobAppearance = var82,
				knob = var2.knob,
				isContained = var2.isContained,
				onSeek = var61,
				getBounds = var59,
				onDragStarted = var53,
				onDragEnded = var51,
				Visible = var12,
				testId = `{var2.testId}--max`
			})
		} else {
			Fill = reactModule.createElement(viewModule, {
				tag = var43.fill.tag,
				AnchorPoint = if var1 then Vector2.new(0, 1) else nil,
				Position = if var1 then UDim2.fromScale(0, 1) else nil,
				Size = var19:map(function(p3)
					-- upvalues: var2 (ref), var1 (ref)
					local var85 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
					
					return if var1 then UDim2.fromScale(1, var85) else UDim2.fromScale(var85, 1)
				end),
				testId = `{var2.testId}--fill`
			}, {
				SelectionCursor = if flagsModule.FoundationSliderKnobSelection and var40 then reactModule.createElement(viewModule, {
					Size = if var2.knob then var76:map(function(p3)
						return UDim2.fromOffset(p3.X, p3.Y)
					end) else getKnobSizeModule(var7, var2.size),
					AnchorPoint = var73,
					Position = var72,
					testId = `{var2.testId}--selection-cursor`
				}, {
					Cursor = reactModule.createElement(cursorComponentModule, {
						isVisible = true,
						cornerRadius = UDim.new(0.5, 0),
						offset = var7.Padding.XSmall,
						borderWidth = var7.Stroke.Thicker,
						colorNamespace = var71.colorNamespace
					})
				}) else nil,
				Knob = if var2.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var73,
					Position = var72,
					Visible = var12,
					onAbsoluteSizeChanged = if flagsModule.FoundationSliderKnobSelection then var80 else nil,
					testId = `{var2.testId}--custom-knob`
				}, var2.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var73,
						Position = var72,
						size = var2.size,
						style = if flagsModule.FoundationSliderBeta then var46 else var45.knobStyle,
						stroke = if flagsModule.FoundationSliderBeta then var75 else var43.knob.stroke,
						hasShadow = var43.knob.hasShadow,
						testId = `{var2.testId}--knob`
					})
				})
			})
		})
	})
end)