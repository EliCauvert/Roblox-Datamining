local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local constantsModule = require(foundation.Constants)
local guiService = require(foundation.Utility.Wrappers.Services).GuiService
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
local getSelectionEntryDirectionModule = require(script.Parent.getSelectionEntryDirection)
local useSliderCaptureKeysModule = require(script.Parent.useSliderCaptureKeys)
local useSliderDirectionalInputModule = require(script.Parent.useSliderDirectionalInput)
local inputSizeModule = require(foundation.Enums.InputSize)
local visibilityModule = require(foundation.Enums.Visibility)
local orientationModule = require(foundation.Enums.Orientation)
local sliderVariantModule = require(foundation.Enums.SliderVariant)
local sliderTypeModule = require(foundation.Enums.SliderType)
local sliderThumbModule = require(script.Parent.SliderThumb)
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
local t_3 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}
local t_4 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Escape,
	SelectionBehaviorRight = Enum.SelectionBehavior.Escape,
	SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
	SelectionBehaviorDown = Enum.SelectionBehavior.Escape
}
local t_5 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), orientationModule (ref), sliderTypeModule (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), useLastInputModeModule (ref), reactUtilsModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), useSliderCaptureKeysModule (ref), guiService (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), inputModeModule (ref), calculateSliderFractionModule (ref), getGuiInputPositionModule (ref), useSliderDirectionalInputModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), getSelectionEntryDirectionModule (ref), usePresentationContext (ref), getKnobSizeModule (ref), blendTransparenciesModule (ref), viewModule (ref), sliderThumbModule (ref), t_5 (ref), cursorTypeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref), withCommonPropsModule (ref), constantsModule (ref), t_3 (ref), t_4 (ref), stateLayerAffordanceModule (ref), t_2 (ref)
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
	local var14 = nil
	local var15 = nil
	
	if flagsModule.FoundationSliderCapture then
		local var16, var17 = reactModule.useState(false)
		var14 = var16
		var15 = var17
	end
	local var18 = nil
	local var19 = nil
	
	if flagsModule.FoundationSliderCapture then
		local var20, var21 = reactModule.useState(false)
		var18 = var20
		var19 = var21
	end
	local var22 = if flagsModule.FoundationSliderCapture then reactModule.useRef(nil) else nil
	local var23 = if flagsModule.FoundationSliderCapture then reactModule.useRef(nil) else nil
	local var24 = if flagsModule.FoundationSliderCapture then reactModule.useRef(false) else nil
	local var25 = if flagsModule.FoundationSliderBeta then reactModule.useRef(false) else nil
	local var26 = nil
	local var27 = nil
	
	if flagsModule.FoundationSliderBeta then
		local var28, var29 = reactModule.useState(false)
		var26 = var28
		var27 = var29
	end
	local var30 = useBindableModule(var4):map(function(p3)
		-- upvalues: var2 (ref)
		return math.clamp(p3, var2.range.Min, var2.range.Max)
	end)
	local var31 = if flagsModule.FoundationSliderBeta then useBindableModule(if p1.type == sliderTypeModule.Range then p1.value else NumberRange.new(0)) else nil
	local var32 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useRef(nil)
	local var33 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(nil) else nil
	local var34 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	
	if flagsModule.FoundationSliderBeta then
		local var39, var40 = reactModule.useBinding(UDim2.new())
		var35 = var39
		var36 = var40
		local var41, var42 = reactModule.useBinding(UDim2.new())
		var37 = var41
		var38 = var42
	end
	local var43 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), var36 (write), var38 (write)
		if var1 then
			var36(UDim2.fromScale(0, p3 - 1))
			var38(UDim2.fromScale(0, p3))
			
			return
		end
		var36(UDim2.fromScale(-p3, 0))
		var38(UDim2.fromScale(1 - p3, 0))
	end, { var1 }) else nil
	local var44 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var45 = useLastInputModeModule()
	local var46 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var46 (ref)
		return var46.current
	end, {})
	local var47 = nil
	local var48 = nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		local var49, var50 = reactModule.useBinding(nil)
		var47 = var49
		var48 = var50
	end
	local var51
	local var52 = if flagsModule.FoundationSliderOffloadDraggingMath then reactUtilsModule.useComposedRef(var46, var48) else nil
	local var53 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var46.current)
	local var54 = useSliderVariantsModule(var7, var2.size, var2.variant, var1)
	local var55 = if flagsModule.FoundationSliderBeta then nil else useSliderMotionStatesModule(var54.knob.style, var54.knob.dragStyle)
	local var56 = if flagsModule.FoundationSliderBeta then nil else reactModule.useMemo(function()
		-- upvalues: var12 (ref), var55 (ref), var10 (ref)
		return if var12 then if var10 then var55.Dragging else var55.Idle else var55.Hidden
	end, { var7, var12, var10, var55 })
	local var57 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var12 (ref), var54 (ref), var10 (ref), var3 (ref)
		return if var12 then if var10 and not var3 then var54.knob.dragStyle else var54.knob.style else { Transparency = 1, Color3 = var54.knob.style.Color3 }
	end, { var54, var12, var10, var3 }) else nil
	
	if flagsModule.FoundationSliderKnobSelection then
		var51 = true
		
		if var8 ~= controlStateModule.Selected then
			local _ = true
			local selectedPressed = controlStateModule.SelectedPressed
			var51 = var8 == selectedPressed and ((if var8 == selectedPressed then flagsModule.FoundationSliderCapture else nil) and var14)
		end
	else
		var51 = nil
	end
	local var58 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function()
		-- upvalues: var14 (write), var3 (ref), var19 (write), var18 (write), var15 (write)
		if var14 then
			if var3 then
				var19(not var18)
				
				return
			end
		else
			var15(true)
		end
	end, { var14, var3, var18 }) else nil
	
	if flagsModule.FoundationSliderCapture then
		useSliderCaptureKeysModule(var51 and not var2.isDisabled, var58)
	end
	if flagsModule.FoundationSliderCapture then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var15 (write)
			if var2.isDisabled then
				var15(false)
			end
		end, { var2.isDisabled })
		reactModule.useEffect(function()
			-- upvalues: guiService (copy), var46 (ref), var22 (ref), var23 (ref)
			local function redirectDragSelection()
				-- upvalues: guiService (copy), var46 (copy), var22 (copy), var23 (copy)
				local selectedObject = guiService.SelectedObject
				
				if if selectedObject ~= var46.current then selectedObject ~= nil and (var46.current ~= nil and (selectedObject:IsDescendantOf(var46.current) and (selectedObject ~= var22.current and selectedObject ~= var23.current))) else true then
					guiService.SelectedObject = var22.current
				end
			end
			
			local selectedObject = guiService.SelectedObject
			
			if if selectedObject ~= var46.current then selectedObject ~= nil and (var46.current ~= nil and (selectedObject:IsDescendantOf(var46.current) and (selectedObject ~= var22.current and selectedObject ~= var23.current))) else true then
				guiService.SelectedObject = var22.current
			end
			local var59 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(redirectDragSelection)
			
			return function()
				-- upvalues: var59 (ref)
				var59:Disconnect()
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var14 (write), guiService (copy), var23 (ref), var15 (write)
			if var14 then
				guiService.SelectedObject = var23.current
				local var59 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
					-- upvalues: guiService (copy), var23 (copy), var15 (copy)
					if guiService.SelectedObject ~= var23.current then
						var15(false)
					end
				end)
				
				return function()
					-- upvalues: var59 (ref)
					var59:Disconnect()
				end
			end
		end, { var14 })
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var2 (ref), var13 (ref), visibilityModule (copy), var51 (write), var10 (ref), var8 (ref), controlStateModule (copy)
		if flagsModule.FoundationSliderBeta and var2.isDisabled then
			var13(false)
			
			return
		elseif var2.knobVisibility == visibilityModule.None then
			var13(if flagsModule.FoundationSliderKnobSelection then var51 else false)
			
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
		if flagsModule.FoundationSliderKnobSelection then var51 else nil
	})
	local var59 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3)
		-- upvalues: var46 (ref), calculateSliderValueFromPositionModule (copy), var2 (ref), calculateSliderStepValueModule (copy)
		if not var46.current then
			return 0
		end
		local var60 = calculateSliderValueFromPositionModule(p3, var46.current, var2.range)
		
		return if var2.step then calculateSliderStepValueModule(var60, var2.step, var2.range) else var60
	end, { var46, var2.range, var2.step })
	local var60 = reactModule.useCallback(function(p3)
		-- upvalues: var30 (ref), var5 (ref)
		if p3 ~= var30:getValue() and var5 then
			var5(p3)
		end
	end, { var30, var5 })
	local var61 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var6 (ref)
		local value = var31:getValue()
		
		if var6 and (typeof(value) ~= "NumberRange" or p3.Min ~= value.Min or p3.Max ~= value.Max) then
			var6(p3)
		end
	end, { var31, var6 }) else nil
	local var62 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var27 (write), flagsModule (copy), var19 (write), var11 (ref), var2 (ref)
		var27(p3)
		
		if flagsModule.FoundationSliderCapture then
			var19(p3)
		end
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
	end, { var2.onDragStarted }) else nil
	local var63 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var11 (ref), var2 (ref)
		var11(false)
		
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded }) else nil
	local var64 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var62 (ref)
		var62(false)
	end, { var62 }) else nil
	local var65 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var62 (ref)
		var62(true)
	end, { var62 }) else nil
	local var66 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function()
		-- upvalues: var59 (ref), var53 (ref), var60 (ref)
		var60(var59(var53:getValue()))
	end, { var59, var53, var60 })
	local var67 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return math.clamp((p3 - var2.range.Min) / (var2.range.Max - var2.range.Min), 0, 1)
	end, { var2.range.Min, var2.range.Max }) else nil
	local var68 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return var2.range.Min + p3 * (var2.range.Max - var2.range.Min)
	end, { var2.range.Min, var2.range.Max }) else nil
	local var69 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var68 (ref), var2 (ref), calculateSliderStepValueModule (copy)
		local var70 = var68(p3)
		
		return if var2.step then calculateSliderStepValueModule(var70, var2.step, var2.range) else var70
	end, { var68, var2.step, var2.range }) else nil
	local var70 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var67 (ref), var31 (ref), var2 (ref), var68 (ref)
		local var71 = var67(var31:getValue().Max)
		
		if var2.step and var2.step > 0 then
			var71 = var67(var2.range.Min + math.floor((var68(var71) - var2.range.Min) / var2.step + 0.5) * var2.step)
		end
		return 0, var71
	end, {
		var31,
		var67,
		var2.step,
		var68,
		var2.range.Min
	}) else nil
	local var71 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var67 (ref), var31 (ref), var2 (ref), var68 (ref)
		local var72 = var67(var31:getValue().Min)
		
		if var2.step and var2.step > 0 then
			var72 = var67(var2.range.Min + math.floor((var68(var72) - var2.range.Min) / var2.step + 0.5) * var2.step)
		end
		return var72, 1
	end, {
		var31,
		var67,
		var2.step,
		var68,
		var2.range.Min
	}) else nil
	local var72 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var61 (ref), var69 (ref)
		local value = var31:getValue()
		var61(NumberRange.new(math.min(var69(p3), value.Max), value.Max))
	end, { var31, var61, var69 }) else nil
	local var73 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var61 (ref), var69 (ref)
		local value = var31:getValue()
		var61(NumberRange.new(value.Min, math.max(var69(p3), value.Min)))
	end, { var31, var61, var69 }) else nil
	local var74 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3, p4)
		-- upvalues: var71 (ref), var73 (ref), var70 (ref), var72 (ref)
		if p4 then
			local var75, var76 = var71()
			var73(math.clamp(p3, var75, var76))
			
			return
		end
		local var77, var78 = var70()
		var72(math.clamp(p3, var77, var78))
	end, { var71, var70, var73, var72 }) else nil
	local var75 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var45 (ref), inputModeModule (copy), var46 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), var31 (ref), var67 (ref), var25 (ref), flagsModule (copy), var19 (write), var62 (ref), var74 (ref)
		if not var3 or var45 == inputModeModule.Directional or not var46.current then return end
		local var76 = calculateSliderFractionModule(getGuiInputPositionModule(p3, var46.current), var46.current, var1)
		local value = var31:getValue()
		local var77 = var67(value.Min)
		local var78 = var67(value.Max)
		local var79 = if math.abs(var78 - var76) >= math.abs(var76 - var77) then var77 == var78 and var78 < var76 else true
		var25.current = var79
		
		if flagsModule.FoundationSliderCapture then
			var19(var79)
		end
		var62(var79)
		var74(var76, var79)
	end, {
		var3, var45, var1, var31, var62, var74, var67
	}) else nil
	local var76 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var45 (ref), inputModeModule (copy), var46 (ref), getGuiInputPositionModule (copy), var74 (ref), calculateSliderFractionModule (copy), var1 (ref), var25 (ref)
		if var3 and var45 ~= inputModeModule.Directional and var46.current then
			var74(calculateSliderFractionModule(getGuiInputPositionModule(p3, var46.current), var46.current, var1), var25.current)
			
			return
		end
	end, { var3, var45, var1, var74 }) else nil
	local var77 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var3 (ref), var63 (ref)
		if var3 then
			var63()
			
			return
		end
	end, { var3, var63 }) else nil
	local var78 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function()
		-- upvalues: var15 (write), guiService (copy), var22 (ref)
		var15(false)
		guiService.SelectedObject = var22.current
	end, {}) else nil
	local var79 = if flagsModule.FoundationSliderAsSeenOnTV then reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var3 (ref), var31 (ref), var18 (write), var30 (ref), var61 (ref), var60 (ref), var2 (ref), calculateSliderStepValueModule (copy), var78 (ref)
		return {
			getValue = function()
				-- upvalues: flagsModule (copy), var3 (copy), var31 (copy), var18 (copy), var30 (copy)
				if not flagsModule.FoundationSliderCapture or not var3 then
					return var30:getValue()
				end
				local value = var31:getValue()
				
				return if var18 then value.Max else value.Min
			end,
			onStep = if flagsModule.FoundationSliderCapture then function(p3)
				-- upvalues: var3 (copy), var31 (copy), var18 (copy), var61 (copy), var60 (copy)
				if not var3 then
					var60(p3)
					
					return
				end
				local value = var31:getValue()
				
				if var18 then
					var61(NumberRange.new(value.Min, math.max(p3, value.Min)))
					
					return
				end
				var61(NumberRange.new(math.min(p3, value.Max), value.Max))
			end else function(p3)
				-- upvalues: var2 (copy), calculateSliderStepValueModule (copy), var60 (copy)
				var60(if var2.step then calculateSliderStepValueModule(p3, var2.step, var2.range) else p3)
			end,
			onExit = if flagsModule.FoundationSliderCapture then var78 else nil
		}
	end, {
		var30, var60, var2.step, var2.range,
		if flagsModule.FoundationSliderCapture then var3 else nil,
		if flagsModule.FoundationSliderCapture then var31 else nil,
		if flagsModule.FoundationSliderCapture then var18 else nil,
		if flagsModule.FoundationSliderCapture then var61 else nil,
		if flagsModule.FoundationSliderCapture then var78 else nil
	}) else nil
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		if not flagsModule.FoundationSliderKnobSelection then
			var51 = if var8 ~= controlStateModule.Selected then var8 == controlStateModule.SelectedPressed else true
		end
		local var80 = var51 and not var2.isDisabled
		var80 = if flagsModule.FoundationSliderCapture then var80 and var14 else var80 and not var3
		useSliderDirectionalInputModule(var80, var2.step, var2.range, var1, var79)
	end
	local var81 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _)
		-- upvalues: var33 (ref), var2 (ref), flagsModule (copy), var1 (ref), var45 (ref), inputModeModule (copy), var44 (ref), var34 (ref), var30 (ref), var43 (ref), var60 (ref), calculateSliderStepValueModule (copy)
		local current = var33.current
		
		if not current then return end
		local var82 = var2.range.Max - var2.range.Min
		local var83 = if flagsModule.FoundationSliderBeta and var1 then -current.DragUDim2.Y.Scale else current.DragUDim2.X.Scale
		
		if var45 ~= inputModeModule.Directional or math.abs(var83 - var44.current) <= 0.01 then
			var44.current = var83
			local var84 = var2.range.Min + math.clamp(var34.current + var83, 0, 1) * var82
			var60(if var2.step then calculateSliderStepValueModule(var84, var2.step, var2.range) else var84)
			
			return
		end
		var34.current = (var30:getValue() - var2.range.Min) / var82 - var83
		var44.current = var83
		
		if flagsModule.FoundationSliderBeta then
			var43(var34.current)
		end
	end, {
		var2.step, var2.range, var45, var30, var60,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var43 else nil
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var46 (ref), var32 (ref), var2 (ref), var45 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var30 (ref), calculateNextStepValueModule (copy), var60 (ref), var59 (ref), calculateSliderPositionDeltaModule (copy)
		if var46.current and var32.current then
			if var2.step and var2.step > 0 then
				if var45 ~= inputModeModule.Directional then
					var60(var59(p3))
					var32.current = p3
					
					return
				end
				local var82 = p3 - var32.current
				local absValue = math.abs(var82.X)
				local var83 = calculatePixelsPerStepModule(var46.current.AbsoluteSize.X, var2.step, var2.range)
				
				if var83 * 2 < absValue then
					var32.current = p3
					
					return
				elseif absValue < var83 / 2 then return end
				local value = var30:getValue()
				local var84 = calculateNextStepValueModule(var82.X, value, var2.step, var2.range)
				
				if var84 == value then
					return
				else
					var60(var84)
					var32.current = p3
					
					return
				end
			else
				local var85 = calculateSliderPositionDeltaModule(p3, var32.current, var46.current.AbsoluteSize.Magnitude)
				var32.current = p3
				
				if var45 == inputModeModule.Directional and math.abs(var85) > 0.01 then return end
				var60(var59(p3))
			end
		end
	end, {
		var2.step, var2.range, var45, var30, var60, var59
	})
	local var82 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var2 (ref), var44 (ref), var45 (ref), inputModeModule (copy), var34 (ref), var30 (ref), flagsModule (copy), var43 (ref), var46 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), calculateSliderValueFromPositionModule (copy), var60 (ref), calculateSliderStepValueModule (copy)
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
		var44.current = 0
		local var83 = var2.range.Max - var2.range.Min
		
		if var45 == inputModeModule.Directional then
			var34.current = (var30:getValue() - var2.range.Min) / var83
			
			if flagsModule.FoundationSliderBeta then
				var43(var34.current)
			end
			return
		else
			local var84 = if flagsModule.FoundationSliderBeta then if var46.current then var2.range.Min + calculateSliderFractionModule(getGuiInputPositionModule(p3, var46.current), var46.current, var1) * var83 else var2.range.Min elseif var46.current then calculateSliderValueFromPositionModule(p3, var46.current, var2.range) else var2.range.Min
			var34.current = (var84 - var2.range.Min) / var83
			var60(if var2.step then calculateSliderStepValueModule(var84, var2.step, var2.range) else var84)
			
			if flagsModule.FoundationSliderBeta then
				var43(var34.current)
			end
		end
	end, {
		var2.onDragStarted, var2.step, var2.range, var45, var30, var60,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var43 else nil
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var32 (ref), var11 (ref), var2 (ref)
		var32.current = p3
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
	end, { var2.onDragStarted })
	local var83 = reactModule.useCallback(function(_, _)
		-- upvalues: var11 (ref), flagsModule (copy), var32 (ref), var2 (ref)
		var11(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var32.current = nil
		end
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded })
	local var84 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), var3 (ref), flagsModule (copy), controlStateModule (copy), var66 (ref), var24 (ref), var19 (write), getSelectionEntryDirectionModule (copy), var1 (ref)
		var9(p3)
		
		if not var3 and not flagsModule.FoundationSliderOffloadDraggingMath and p3 == controlStateModule.Pressed then
			var66()
		end
		if flagsModule.FoundationSliderCapture then
			local var85 = if p3 ~= controlStateModule.Selected then p3 == controlStateModule.SelectedPressed else true
			
			if var3 and var85 and not var24.current then
				var19(getSelectionEntryDirectionModule(var1) < 0)
			end
			var24.current = var85
		end
	end, { var66, var3, var1 })
	local var85 = if flagsModule.FoundationSliderKnobSelection then usePresentationContext() else nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function()
			-- upvalues: var33 (ref), flagsModule (copy), var46 (ref), var34 (ref)
			local current = var33.current
			
			if not current then return end
			if flagsModule.FoundationSliderBeta then
				current.ReferenceUIInstance = var46.current
				
				return
			end
			local var86 = current:AddConstraintFunction(1, function(p3, p4)
				-- upvalues: var34 (copy)
				local current = var34.current
				
				return UDim2.fromScale(math.clamp(p3.X.Scale, -current, 1 - current), 0), p4
			end)
			
			return function()
				-- upvalues: var86 (ref)
				var86:Disconnect()
			end
		end, {})
	end
	local var86 = if var1 then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local var87 = if var2.isContained then var30:map(function(p3)
		-- upvalues: var2 (ref), var1 (ref)
		local var88 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
		
		return if var1 then Vector2.new(0.5, 1 - var88) else Vector2.new(var88, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local uDim = UDim.new(0, if flagsModule.FoundationSliderBeta then getKnobSizeModule(var7, var2.size).X.Offset else var54.hitbox.height)
	local var88 = if var1 then UDim2.new(uDim, var2.width) else UDim2.new(var2.width, uDim)
	local var89 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var54 (ref), blendTransparenciesModule (copy), var12 (ref)
		local stroke = var54.knob.stroke
		
		return if stroke == nil then nil else {
			Color = stroke.Color,
			Thickness = stroke.Thickness,
			Transparency = blendTransparenciesModule(if typeof(stroke.Transparency) == "number" then stroke.Transparency else nil, if var12 then 0 else 1)
		}
	end, { var54, var12 }) else nil
	local var90 = nil
	local var91 = nil
	
	if flagsModule.FoundationSliderKnobSelection then
		local var92, var93 = reactModule.useBinding(Vector2.zero)
		var90 = var92
		var91 = var93
	end
	local var94 = if flagsModule.FoundationSliderKnobSelection then reactModule.useCallback(function(p3)
		-- upvalues: var91 (write)
		var91(p3.AbsoluteSize)
	end, {}) else nil
	local var95 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var12 (ref), var10 (ref), var26 (write), var54 (ref), var57 (ref), var89 (ref)
		return {
			size = var2.size,
			style = if var12 and var10 and not var26 then var54.knob.dragStyle else var57,
			stroke = var89,
			hasShadow = var54.knob.hasShadow
		}
	end, {
		var2.size, var12, var10, var26, var54.knob.dragStyle, var57, var89,
		var54.knob.hasShadow
	}) else nil
	local var96 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var12 (ref), var10 (ref), var26 (write), var54 (ref), var57 (ref), var89 (ref)
		return {
			size = var2.size,
			style = if var12 and var10 and var26 then var54.knob.dragStyle else var57,
			stroke = var89,
			hasShadow = var54.knob.hasShadow
		}
	end, {
		var2.size, var12, var10, var26, var54.knob.dragStyle, var57, var89,
		var54.knob.hasShadow
	}) else nil
	local var97 = if flagsModule.FoundationSliderBeta then var31:map(function(p3)
		-- upvalues: var67 (ref)
		return var67(p3.Min)
	end) else nil
	local var98 = if flagsModule.FoundationSliderBeta then var31:map(function(p3)
		-- upvalues: var67 (ref)
		return var67(p3.Max)
	end) else nil
	local var99 = if flagsModule.FoundationSliderKnobSelection then var51 and (not flagsModule.FoundationSliderCapture or var14) else nil
	local var100 = if flagsModule.FoundationSliderCapture and var3 then if var18 then var98 else var97 else nil
	local var101 = if flagsModule.FoundationSliderCapture and var3 then if var2.isContained then var100:map(function(p3)
		-- upvalues: var1 (ref)
		return if var1 then Vector2.new(0.5, 1 - p3) else Vector2.new(p3, 0.5)
	end) else Vector2.new(0.5, 0.5) else nil
	local var102 = if flagsModule.FoundationSliderCapture and var3 then if var2.knob then var90:map(function(p3)
		return UDim2.fromOffset(p3.X, p3.Y)
	end) else getKnobSizeModule(var7, var2.size) else nil
	local var103 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function(_) end, {}) else nil
	local var104 = flagsModule.FoundationSliderCapture and (var45 == inputModeModule.Directional and var51)
	local var105 = if var104 then nil elseif var3 then reactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		[reactModule.Event.DragStart] = var75,
		[reactModule.Event.DragContinue] = var76,
		[reactModule.Event.DragEnd] = var77,
		SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
		Enabled = not var2.isDisabled
	}) elseif flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
		ref = var33,
		ReferenceUIInstance = var47,
		DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
		DragAxis = if var1 then Vector2.new(0, 1) else Vector2.new(1, 0),
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
		DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
		MinDragTranslation = if flagsModule.FoundationSliderBeta then var35 else nil,
		MaxDragTranslation = if flagsModule.FoundationSliderBeta then var37 else nil,
		[reactModule.Event.DragStart] = var82,
		[reactModule.Event.DragContinue] = var81,
		[reactModule.Event.DragEnd] = var83,
		SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
		Enabled = not var2.isDisabled
	}) else reactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		[reactModule.Event.DragStart] = var82,
		[reactModule.Event.DragContinue] = var81,
		[reactModule.Event.DragEnd] = var83,
		SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
		Enabled = not var2.isDisabled
	})
	local var106 = reactModule.createElement(viewModule, {
		tag = var54.bar.tag,
		Size = if flagsModule.FoundationSliderBeta then if var1 then UDim2.new(0, var54.bar.height, 1, 0) else UDim2.new(1, 0, 0, var54.bar.height) else nil,
		testId = `{var2.testId}--bar`
	}, if var3 then {
		Fill = reactModule.createElement(viewModule, {
			tag = var54.fill.tag,
			AnchorPoint = Vector2.new(0, 0),
			Position = if var1 then var98:map(function(p3)
				return UDim2.fromScale(0, 1 - p3)
			end) else var97:map(function(p3)
				return UDim2.fromScale(p3, 0)
			end),
			Size = var31:map(function(p3)
				-- upvalues: var67 (ref), var1 (ref)
				local var107 = var67(p3.Max) - var67(p3.Min)
				
				return if var1 then UDim2.fromScale(1, var107) else UDim2.fromScale(var107, 1)
			end),
			testId = `{var2.testId}--fill`
		}),
		MinKnob = reactModule.createElement(sliderThumbModule, {
			LayoutOrder = 1,
			trackRef = var46,
			fraction = var97,
			isVertical = var1,
			isDisabled = var2.isDisabled,
			isDragEnabled = not var104,
			knobAppearance = var95,
			knob = var2.knob,
			isContained = var2.isContained,
			onSeek = var72,
			getBounds = var70,
			onDragStarted = var64,
			onDragEnded = var63,
			Visible = var12,
			onAbsoluteSizeChanged = if flagsModule.FoundationSliderCapture then var94 else nil,
			testId = `{var2.testId}--min`
		}),
		MaxKnob = reactModule.createElement(sliderThumbModule, {
			LayoutOrder = 2,
			trackRef = var46,
			fraction = var98,
			isVertical = var1,
			isDisabled = var2.isDisabled,
			isDragEnabled = not var104,
			knobAppearance = var96,
			knob = var2.knob,
			isContained = var2.isContained,
			onSeek = var73,
			getBounds = var71,
			onDragStarted = var65,
			onDragEnded = var63,
			Visible = var12,
			onAbsoluteSizeChanged = if flagsModule.FoundationSliderCapture then var94 else nil,
			testId = `{var2.testId}--max`
		}),
		SelectionCursor = if flagsModule.FoundationSliderCapture and var99 then reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = var102,
			AnchorPoint = var101,
			Position = var100:map(function(p3)
				-- upvalues: var1 (ref)
				return if var1 then UDim2.fromScale(0.5, 1 - p3) else UDim2.fromScale(p3, 0.5)
			end),
			selection = { Selectable = true },
			selectionGroup = t_5,
			cursor = cursorTypeModule.Invisible,
			onStateChanged = var103,
			ref = var23,
			testId = `{var2.testId}--selection-cursor`
		}, {
			Cursor = reactModule.createElement(cursorComponentModule, {
				isVisible = true,
				cornerRadius = UDim.new(0.5, 0),
				offset = var7.Padding.XSmall,
				borderWidth = var7.Stroke.Thicker,
				colorNamespace = var85.colorNamespace
			})
		}) else nil
	} else {
		Fill = reactModule.createElement(viewModule, {
			tag = var54.fill.tag,
			AnchorPoint = if var1 then Vector2.new(0, 1) else nil,
			Position = if var1 then UDim2.fromScale(0, 1) else nil,
			Size = var30:map(function(p3)
				-- upvalues: var2 (ref), var1 (ref)
				local var107 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
				
				return if var1 then UDim2.fromScale(1, var107) else UDim2.fromScale(var107, 1)
			end),
			testId = `{var2.testId}--fill`
		}, {
			SelectionCursor = if var99 then reactModule.createElement(viewModule, {
				Size = if var2.knob then var90:map(function(p3)
					return UDim2.fromOffset(p3.X, p3.Y)
				end) else getKnobSizeModule(var7, var2.size),
				AnchorPoint = var87,
				Position = var86,
				selection = if flagsModule.FoundationSliderCapture then { Selectable = true } else nil,
				selectionGroup = if flagsModule.FoundationSliderCapture then t_5 else nil,
				cursor = if flagsModule.FoundationSliderCapture then cursorTypeModule.Invisible else nil,
				onStateChanged = var103,
				ref = var23,
				testId = `{var2.testId}--selection-cursor`
			}, {
				Cursor = reactModule.createElement(cursorComponentModule, {
					isVisible = true,
					cornerRadius = UDim.new(0.5, 0),
					offset = var7.Padding.XSmall,
					borderWidth = var7.Stroke.Thicker,
					colorNamespace = var85.colorNamespace
				})
			}) else nil,
			Knob = if var2.knob then reactModule.createElement(viewModule, {
				tag = "size-0-0 auto-xy",
				AnchorPoint = var87,
				Position = var86,
				Visible = var12,
				onAbsoluteSizeChanged = if flagsModule.FoundationSliderKnobSelection then var94 else nil,
				testId = `{var2.testId}--custom-knob`
			}, var2.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
				Knob = reactModule.createElement(knobModule, {
					AnchorPoint = var87,
					Position = var86,
					size = var2.size,
					style = if flagsModule.FoundationSliderBeta then var57 else var56.knobStyle,
					stroke = if flagsModule.FoundationSliderBeta then var89 else var54.knob.stroke,
					hasShadow = var54.knob.hasShadow,
					testId = `{var2.testId}--knob`
				})
			})
		})
	})
	
	return if flagsModule.FoundationSliderCapture then reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = var88,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if var14 then t_3 else t_4,
		ref = if var3 then var46 elseif flagsModule.FoundationSliderOffloadDraggingMath then var52 else var46
	}), {
		FocusTarget = reactModule.createElement(viewModule, {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			cursor = if flagsModule.FoundationSliderKnobSelection then if var14 then cursorTypeModule.Invisible else nil else nil,
			onStateChanged = var84,
			isDisabled = var2.isDisabled,
			ref = var22,
			testId = `{var2.testId}--focus-target`
		}, { DragDetector = var105 }),
		Bar = var106
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = var88,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then if var3 then nil elseif flagsModule.FoundationSliderBeta then var54.selectionGroup else t_2 else nil,
		cursor = if flagsModule.FoundationSliderKnobSelection then cursorTypeModule.Invisible else nil,
		onStateChanged = var84,
		isDisabled = var2.isDisabled,
		ref = if var3 then var46 elseif flagsModule.FoundationSliderOffloadDraggingMath then var52 else var46
	}), { DragDetector = var105, Bar = var106 })
end)