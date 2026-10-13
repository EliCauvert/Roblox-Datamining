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
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local calculateSliderFractionModule = require(script.Parent.calculateSliderFraction)
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
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), orientationModule (ref), sliderTypeModule (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), useLastInputModeModule (ref), reactUtilsModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), useSliderCaptureKeysModule (ref), guiService (ref), visibilityModule (ref), calculateSliderStepValueModule (ref), inputModeModule (ref), calculateSliderFractionModule (ref), getGuiInputPositionModule (ref), useSliderDirectionalInputModule (ref), calculateSliderValueFromPositionModule (ref), getSelectionEntryDirectionModule (ref), usePresentationContext (ref), getKnobSizeModule (ref), blendTransparenciesModule (ref), viewModule (ref), sliderThumbModule (ref), t_5 (ref), cursorTypeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref), withCommonPropsModule (ref), constantsModule (ref), t_3 (ref), t_4 (ref), stateLayerAffordanceModule (ref), t_2 (ref)
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
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useRef(0)
	local var34 = nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	
	if flagsModule.FoundationSliderBeta then
		local var38, var39 = reactModule.useBinding(UDim2.new())
		var34 = var38
		var35 = var39
		local var40, var41 = reactModule.useBinding(UDim2.new())
		var36 = var40
		var37 = var41
	end
	local var42 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), var35 (write), var37 (write)
		if var1 then
			var35(UDim2.fromScale(0, p3 - 1))
			var37(UDim2.fromScale(0, p3))
			
			return
		end
		var35(UDim2.fromScale(-p3, 0))
		var37(UDim2.fromScale(1 - p3, 0))
	end, { var1 }) else nil
	local var43 = reactModule.useRef(0)
	local var44 = useLastInputModeModule()
	local var45 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var45 (ref)
		return var45.current
	end, {})
	local var46, var47 = reactModule.useBinding(nil)
	local var48 = reactUtilsModule.useComposedRef(var45, var47)
	local var49 = useSliderVariantsModule(var7, var2.size, var2.variant, var1)
	local var50 = if flagsModule.FoundationSliderBeta then nil else useSliderMotionStatesModule(var49.knob.style, var49.knob.dragStyle)
	local var51 = if flagsModule.FoundationSliderBeta then nil else reactModule.useMemo(function()
		-- upvalues: var12 (ref), var50 (ref), var10 (ref)
		return if var12 then if var10 then var50.Dragging else var50.Idle else var50.Hidden
	end, { var7, var12, var10, var50 })
	local var52 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var12 (ref), var49 (ref), var10 (ref), var3 (ref)
		return if var12 then if var10 and not var3 then var49.knob.dragStyle else var49.knob.style else { Transparency = 1, Color3 = var49.knob.style.Color3 }
	end, { var49, var12, var10, var3 }) else nil
	local var53 = true
	
	if var8 ~= controlStateModule.Selected then
		local _ = true
		local selectedPressed = controlStateModule.SelectedPressed
		var53 = var8 == selectedPressed and ((if var8 == selectedPressed then flagsModule.FoundationSliderCapture else nil) and var14)
	end
	local var54 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function()
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
		useSliderCaptureKeysModule(var53 and not var2.isDisabled, var54)
	end
	if flagsModule.FoundationSliderCapture then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), var15 (write)
			if var2.isDisabled then
				var15(false)
			end
		end, { var2.isDisabled })
		reactModule.useEffect(function()
			-- upvalues: guiService (copy), var45 (ref), var22 (ref), var23 (ref)
			local function redirectDragSelection()
				-- upvalues: guiService (copy), var45 (copy), var22 (copy), var23 (copy)
				local selectedObject = guiService.SelectedObject
				
				if if selectedObject ~= var45.current then selectedObject ~= nil and (var45.current ~= nil and (selectedObject:IsDescendantOf(var45.current) and (selectedObject ~= var22.current and selectedObject ~= var23.current))) else true then
					guiService.SelectedObject = var22.current
				end
			end
			
			local selectedObject = guiService.SelectedObject
			
			if if selectedObject ~= var45.current then selectedObject ~= nil and (var45.current ~= nil and (selectedObject:IsDescendantOf(var45.current) and (selectedObject ~= var22.current and selectedObject ~= var23.current))) else true then
				guiService.SelectedObject = var22.current
			end
			local var55 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(redirectDragSelection)
			
			return function()
				-- upvalues: var55 (ref)
				var55:Disconnect()
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var14 (write), guiService (copy), var23 (ref), var15 (write)
			if var14 then
				guiService.SelectedObject = var23.current
				local var55 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
					-- upvalues: guiService (copy), var23 (copy), var15 (copy)
					if guiService.SelectedObject ~= var23.current then
						var15(false)
					end
				end)
				
				return function()
					-- upvalues: var55 (ref)
					var55:Disconnect()
				end
			end
		end, { var14 })
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var2 (ref), var13 (ref), visibilityModule (copy), var53 (ref), var10 (ref), var8 (ref), controlStateModule (copy)
		if flagsModule.FoundationSliderBeta and var2.isDisabled then
			var13(false)
			
			return
		elseif var2.knobVisibility == visibilityModule.None then
			var13(var53)
			
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
		var53
	})
	local var55 = reactModule.useCallback(function(p3)
		-- upvalues: var30 (ref), var5 (ref)
		if p3 ~= var30:getValue() and var5 then
			var5(p3)
		end
	end, { var30, var5 })
	local var56 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var6 (ref)
		local value = var31:getValue()
		
		if var6 and (typeof(value) ~= "NumberRange" or p3.Min ~= value.Min or p3.Max ~= value.Max) then
			var6(p3)
		end
	end, { var31, var6 }) else nil
	local var57 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
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
	local var58 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var11 (ref), var2 (ref)
		var11(false)
		
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded }) else nil
	local var59 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var57 (ref)
		var57(false)
	end, { var57 }) else nil
	local var60 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var57 (ref)
		var57(true)
	end, { var57 }) else nil
	local var61 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return math.clamp((p3 - var2.range.Min) / (var2.range.Max - var2.range.Min), 0, 1)
	end, { var2.range.Min, var2.range.Max }) else nil
	local var62 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref)
		return var2.range.Min + p3 * (var2.range.Max - var2.range.Min)
	end, { var2.range.Min, var2.range.Max }) else nil
	local var63 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var62 (ref), var2 (ref), calculateSliderStepValueModule (copy)
		local var64 = var62(p3)
		
		return if var2.step then calculateSliderStepValueModule(var64, var2.step, var2.range) else var64
	end, { var62, var2.step, var2.range }) else nil
	local var64 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var61 (ref), var31 (ref), var2 (ref), var62 (ref)
		local var65 = var61(var31:getValue().Max)
		
		if var2.step and var2.step > 0 then
			var65 = var61(var2.range.Min + math.floor((var62(var65) - var2.range.Min) / var2.step + 0.5) * var2.step)
		end
		return 0, var65
	end, {
		var31,
		var61,
		var2.step,
		var62,
		var2.range.Min
	}) else nil
	local var65 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var61 (ref), var31 (ref), var2 (ref), var62 (ref)
		local var66 = var61(var31:getValue().Min)
		
		if var2.step and var2.step > 0 then
			var66 = var61(var2.range.Min + math.floor((var62(var66) - var2.range.Min) / var2.step + 0.5) * var2.step)
		end
		return var66, 1
	end, {
		var31,
		var61,
		var2.step,
		var62,
		var2.range.Min
	}) else nil
	local var66 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var56 (ref), var63 (ref)
		local value = var31:getValue()
		var56(NumberRange.new(math.min(var63(p3), value.Max), value.Max))
	end, { var31, var56, var63 }) else nil
	local var67 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var31 (ref), var56 (ref), var63 (ref)
		local value = var31:getValue()
		var56(NumberRange.new(value.Min, math.max(var63(p3), value.Min)))
	end, { var31, var56, var63 }) else nil
	local var68 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3, p4)
		-- upvalues: var65 (ref), var67 (ref), var64 (ref), var66 (ref)
		if p4 then
			local var69, var70 = var65()
			var67(math.clamp(p3, var69, var70))
			
			return
		end
		local var71, var72 = var64()
		var66(math.clamp(p3, var71, var72))
	end, { var65, var64, var67, var66 }) else nil
	local var69 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var44 (ref), inputModeModule (copy), var45 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), var31 (ref), var61 (ref), var25 (ref), flagsModule (copy), var19 (write), var57 (ref), var68 (ref)
		if not var3 or var44 == inputModeModule.Directional or not var45.current then return end
		local var70 = calculateSliderFractionModule(getGuiInputPositionModule(p3, var45.current), var45.current, var1)
		local value = var31:getValue()
		local var71 = var61(value.Min)
		local var72 = var61(value.Max)
		local var73 = if math.abs(var72 - var70) >= math.abs(var70 - var71) then var71 == var72 and var72 < var70 else true
		var25.current = var73
		
		if flagsModule.FoundationSliderCapture then
			var19(var73)
		end
		var57(var73)
		var68(var70, var73)
	end, {
		var3, var44, var1, var31, var57, var68, var61
	}) else nil
	local var70 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var44 (ref), inputModeModule (copy), var45 (ref), getGuiInputPositionModule (copy), var68 (ref), calculateSliderFractionModule (copy), var1 (ref), var25 (ref)
		if var3 and var44 ~= inputModeModule.Directional and var45.current then
			var68(calculateSliderFractionModule(getGuiInputPositionModule(p3, var45.current), var45.current, var1), var25.current)
			
			return
		end
	end, { var3, var44, var1, var68 }) else nil
	local var71 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function()
		-- upvalues: var3 (ref), var58 (ref)
		if var3 then
			var58()
			
			return
		end
	end, { var3, var58 }) else nil
	local var72 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function()
		-- upvalues: var15 (write), guiService (copy), var22 (ref)
		var15(false)
		guiService.SelectedObject = var22.current
	end, {}) else nil
	local var73 = reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var3 (ref), var31 (ref), var18 (write), var30 (ref), var56 (ref), var55 (ref), var2 (ref), calculateSliderStepValueModule (copy), var72 (ref)
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
				-- upvalues: var3 (copy), var31 (copy), var18 (copy), var56 (copy), var55 (copy)
				if not var3 then
					var55(p3)
					
					return
				end
				local value = var31:getValue()
				
				if var18 then
					var56(NumberRange.new(value.Min, math.max(p3, value.Min)))
					
					return
				end
				var56(NumberRange.new(math.min(p3, value.Max), value.Max))
			end else function(p3)
				-- upvalues: var2 (copy), calculateSliderStepValueModule (copy), var55 (copy)
				var55(if var2.step then calculateSliderStepValueModule(p3, var2.step, var2.range) else p3)
			end,
			onExit = if flagsModule.FoundationSliderCapture then var72 else nil
		}
	end, {
		var30, var55, var2.step, var2.range,
		if flagsModule.FoundationSliderCapture then var3 else nil,
		if flagsModule.FoundationSliderCapture then var31 else nil,
		if flagsModule.FoundationSliderCapture then var18 else nil,
		if flagsModule.FoundationSliderCapture then var56 else nil,
		if flagsModule.FoundationSliderCapture then var72 else nil
	})
	local var74 = var53 and not var2.isDisabled
	var74 = if flagsModule.FoundationSliderCapture then var74 and var14 else var74 and not var3
	useSliderDirectionalInputModule(var74, var2.step, var2.range, var1, var73)
	local var75 = reactModule.useCallback(function(_, _)
		-- upvalues: var32 (ref), var2 (ref), flagsModule (copy), var1 (ref), var44 (ref), inputModeModule (copy), var43 (ref), var33 (ref), var30 (ref), var42 (ref), var55 (ref), calculateSliderStepValueModule (copy)
		local current = var32.current
		
		if not current then return end
		local var76 = var2.range.Max - var2.range.Min
		local var77 = if flagsModule.FoundationSliderBeta and var1 then -current.DragUDim2.Y.Scale else current.DragUDim2.X.Scale
		
		if var44 ~= inputModeModule.Directional or math.abs(var77 - var43.current) <= 0.01 then
			var43.current = var77
			local var78 = var2.range.Min + math.clamp(var33.current + var77, 0, 1) * var76
			var55(if var2.step then calculateSliderStepValueModule(var78, var2.step, var2.range) else var78)
			
			return
		end
		var33.current = (var30:getValue() - var2.range.Min) / var76 - var77
		var43.current = var77
		
		if flagsModule.FoundationSliderBeta then
			var42(var33.current)
		end
	end, {
		var2.step, var2.range, var44, var30, var55,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var42 else nil
	})
	local var76 = reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var2 (ref), var43 (ref), var44 (ref), inputModeModule (copy), var33 (ref), var30 (ref), flagsModule (copy), var42 (ref), var45 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), calculateSliderValueFromPositionModule (copy), var55 (ref), calculateSliderStepValueModule (copy)
		var11(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
		var43.current = 0
		local var77 = var2.range.Max - var2.range.Min
		
		if var44 == inputModeModule.Directional then
			var33.current = (var30:getValue() - var2.range.Min) / var77
			
			if flagsModule.FoundationSliderBeta then
				var42(var33.current)
			end
			return
		else
			local var78 = if flagsModule.FoundationSliderBeta then if var45.current then var2.range.Min + calculateSliderFractionModule(getGuiInputPositionModule(p3, var45.current), var45.current, var1) * var77 else var2.range.Min elseif var45.current then calculateSliderValueFromPositionModule(p3, var45.current, var2.range) else var2.range.Min
			var33.current = (var78 - var2.range.Min) / var77
			var55(if var2.step then calculateSliderStepValueModule(var78, var2.step, var2.range) else var78)
			
			if flagsModule.FoundationSliderBeta then
				var42(var33.current)
			end
		end
	end, {
		var2.onDragStarted, var2.step, var2.range, var44, var30, var55,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var42 else nil
	})
	local var77 = reactModule.useCallback(function(_, _)
		-- upvalues: var11 (ref), var2 (ref)
		var11(false)
		
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded })
	local var78 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), flagsModule (copy), controlStateModule (copy), var3 (ref), var24 (ref), var19 (write), getSelectionEntryDirectionModule (copy), var1 (ref)
		var9(p3)
		
		if flagsModule.FoundationSliderCapture then
			local var79 = if p3 ~= controlStateModule.Selected then p3 == controlStateModule.SelectedPressed else true
			
			if var3 and var79 and not var24.current then
				var19(getSelectionEntryDirectionModule(var1) < 0)
			end
			var24.current = var79
		end
	end, { var3, var1 })
	local var79 = usePresentationContext()
	reactModule.useEffect(function()
		-- upvalues: var32 (ref), flagsModule (copy), var45 (ref), var33 (ref)
		local current = var32.current
		
		if not current then return end
		if flagsModule.FoundationSliderBeta then
			current.ReferenceUIInstance = var45.current
			
			return
		end
		local var80 = current:AddConstraintFunction(1, function(p3, p4)
			-- upvalues: var33 (copy)
			local current = var33.current
			
			return UDim2.fromScale(math.clamp(p3.X.Scale, -current, 1 - current), 0), p4
		end)
		
		return function()
			-- upvalues: var80 (ref)
			var80:Disconnect()
		end
	end, {})
	local var80 = if var1 then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local var81 = if var2.isContained then var30:map(function(p3)
		-- upvalues: var2 (ref), var1 (ref)
		local var82 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
		
		return if var1 then Vector2.new(0.5, 1 - var82) else Vector2.new(var82, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local uDim = UDim.new(0, if flagsModule.FoundationSliderBeta then getKnobSizeModule(var7, var2.size).X.Offset else var49.hitbox.height)
	local var82 = if var1 then UDim2.new(uDim, var2.width) else UDim2.new(var2.width, uDim)
	local var83 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var49 (ref), blendTransparenciesModule (copy), var12 (ref)
		local stroke = var49.knob.stroke
		
		return if stroke == nil then nil else {
			Color = stroke.Color,
			Thickness = stroke.Thickness,
			Transparency = blendTransparenciesModule(if typeof(stroke.Transparency) == "number" then stroke.Transparency else nil, if var12 then 0 else 1)
		}
	end, { var49, var12 }) else nil
	local var84, var85 = reactModule.useBinding(Vector2.zero)
	local var86 = reactModule.useCallback(function(p3)
		-- upvalues: var85 (ref)
		var85(p3.AbsoluteSize)
	end, {})
	local var87 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var12 (ref), var10 (ref), var26 (write), var49 (ref), var52 (ref), var83 (ref)
		return {
			size = var2.size,
			style = if var12 and var10 and not var26 then var49.knob.dragStyle else var52,
			stroke = var83,
			hasShadow = var49.knob.hasShadow
		}
	end, {
		var2.size, var12, var10, var26, var49.knob.dragStyle, var52, var83,
		var49.knob.hasShadow
	}) else nil
	local var88 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var12 (ref), var10 (ref), var26 (write), var49 (ref), var52 (ref), var83 (ref)
		return {
			size = var2.size,
			style = if var12 and var10 and var26 then var49.knob.dragStyle else var52,
			stroke = var83,
			hasShadow = var49.knob.hasShadow
		}
	end, {
		var2.size, var12, var10, var26, var49.knob.dragStyle, var52, var83,
		var49.knob.hasShadow
	}) else nil
	local var89 = if flagsModule.FoundationSliderBeta then var31:map(function(p3)
		-- upvalues: var61 (ref)
		return var61(p3.Min)
	end) else nil
	local var90 = if flagsModule.FoundationSliderBeta then var31:map(function(p3)
		-- upvalues: var61 (ref)
		return var61(p3.Max)
	end) else nil
	local var91 = var53 and (not flagsModule.FoundationSliderCapture or var14)
	local var92 = if flagsModule.FoundationSliderCapture and var3 then if var18 then var90 else var89 else nil
	local var93 = if flagsModule.FoundationSliderCapture and var3 then if var2.isContained then var92:map(function(p3)
		-- upvalues: var1 (ref)
		return if var1 then Vector2.new(0.5, 1 - p3) else Vector2.new(p3, 0.5)
	end) else Vector2.new(0.5, 0.5) else nil
	local var94 = if flagsModule.FoundationSliderCapture and var3 then if var2.knob then var84:map(function(p3)
		return UDim2.fromOffset(p3.X, p3.Y)
	end) else getKnobSizeModule(var7, var2.size) else nil
	local var95 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function(_) end, {}) else nil
	local var96 = flagsModule.FoundationSliderCapture and (var44 == inputModeModule.Directional and var53)
	local var97 = if var96 then nil elseif var3 then reactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		[reactModule.Event.DragStart] = var69,
		[reactModule.Event.DragContinue] = var70,
		[reactModule.Event.DragEnd] = var71,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not var2.isDisabled
	}) else reactModule.createElement("UIDragDetector", {
		ref = var32,
		ReferenceUIInstance = var46,
		DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
		DragAxis = if var1 then Vector2.new(0, 1) else Vector2.new(1, 0),
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
		DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
		MinDragTranslation = if flagsModule.FoundationSliderBeta then var34 else nil,
		MaxDragTranslation = if flagsModule.FoundationSliderBeta then var36 else nil,
		[reactModule.Event.DragStart] = var76,
		[reactModule.Event.DragContinue] = var75,
		[reactModule.Event.DragEnd] = var77,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not var2.isDisabled
	})
	local var98 = reactModule.createElement(viewModule, {
		tag = var49.bar.tag,
		Size = if flagsModule.FoundationSliderBeta then if var1 then UDim2.new(0, var49.bar.height, 1, 0) else UDim2.new(1, 0, 0, var49.bar.height) else nil,
		testId = `{var2.testId}--bar`
	}, if var3 then {
		Fill = reactModule.createElement(viewModule, {
			tag = var49.fill.tag,
			AnchorPoint = Vector2.new(0, 0),
			Position = if var1 then var90:map(function(p3)
				return UDim2.fromScale(0, 1 - p3)
			end) else var89:map(function(p3)
				return UDim2.fromScale(p3, 0)
			end),
			Size = var31:map(function(p3)
				-- upvalues: var61 (ref), var1 (ref)
				local var99 = var61(p3.Max) - var61(p3.Min)
				
				return if var1 then UDim2.fromScale(1, var99) else UDim2.fromScale(var99, 1)
			end),
			testId = `{var2.testId}--fill`
		}),
		MinKnob = reactModule.createElement(sliderThumbModule, {
			LayoutOrder = 1,
			trackRef = var45,
			fraction = var89,
			isVertical = var1,
			isDisabled = var2.isDisabled,
			isDragEnabled = not var96,
			knobAppearance = var87,
			knob = var2.knob,
			isContained = var2.isContained,
			onSeek = var66,
			getBounds = var64,
			onDragStarted = var59,
			onDragEnded = var58,
			Visible = var12,
			onAbsoluteSizeChanged = if flagsModule.FoundationSliderCapture then var86 else nil,
			testId = `{var2.testId}--min`
		}),
		MaxKnob = reactModule.createElement(sliderThumbModule, {
			LayoutOrder = 2,
			trackRef = var45,
			fraction = var90,
			isVertical = var1,
			isDisabled = var2.isDisabled,
			isDragEnabled = not var96,
			knobAppearance = var88,
			knob = var2.knob,
			isContained = var2.isContained,
			onSeek = var67,
			getBounds = var65,
			onDragStarted = var60,
			onDragEnded = var58,
			Visible = var12,
			onAbsoluteSizeChanged = if flagsModule.FoundationSliderCapture then var86 else nil,
			testId = `{var2.testId}--max`
		}),
		SelectionCursor = if flagsModule.FoundationSliderCapture and var91 then reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = var94,
			AnchorPoint = var93,
			Position = var92:map(function(p3)
				-- upvalues: var1 (ref)
				return if var1 then UDim2.fromScale(0.5, 1 - p3) else UDim2.fromScale(p3, 0.5)
			end),
			selection = { Selectable = true },
			selectionGroup = t_5,
			cursor = cursorTypeModule.Invisible,
			onStateChanged = var95,
			ref = var23,
			testId = `{var2.testId}--selection-cursor`
		}, {
			Cursor = reactModule.createElement(cursorComponentModule, {
				isVisible = true,
				cornerRadius = UDim.new(0.5, 0),
				offset = var7.Padding.XSmall,
				borderWidth = var7.Stroke.Thicker,
				colorNamespace = var79.colorNamespace
			})
		}) else nil
	} else {
		Fill = reactModule.createElement(viewModule, {
			tag = var49.fill.tag,
			AnchorPoint = if var1 then Vector2.new(0, 1) else nil,
			Position = if var1 then UDim2.fromScale(0, 1) else nil,
			Size = var30:map(function(p3)
				-- upvalues: var2 (ref), var1 (ref)
				local var99 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
				
				return if var1 then UDim2.fromScale(1, var99) else UDim2.fromScale(var99, 1)
			end),
			testId = `{var2.testId}--fill`
		}, {
			SelectionCursor = if var91 then reactModule.createElement(viewModule, {
				Size = if var2.knob then var84:map(function(p3)
					return UDim2.fromOffset(p3.X, p3.Y)
				end) else getKnobSizeModule(var7, var2.size),
				AnchorPoint = var81,
				Position = var80,
				selection = if flagsModule.FoundationSliderCapture then { Selectable = true } else nil,
				selectionGroup = if flagsModule.FoundationSliderCapture then t_5 else nil,
				cursor = if flagsModule.FoundationSliderCapture then cursorTypeModule.Invisible else nil,
				onStateChanged = var95,
				ref = var23,
				testId = `{var2.testId}--selection-cursor`
			}, {
				Cursor = reactModule.createElement(cursorComponentModule, {
					isVisible = true,
					cornerRadius = UDim.new(0.5, 0),
					offset = var7.Padding.XSmall,
					borderWidth = var7.Stroke.Thicker,
					colorNamespace = var79.colorNamespace
				})
			}) else nil,
			Knob = if var2.knob then reactModule.createElement(viewModule, {
				tag = "size-0-0 auto-xy",
				AnchorPoint = var81,
				Position = var80,
				Visible = var12,
				onAbsoluteSizeChanged = var86,
				testId = `{var2.testId}--custom-knob`
			}, var2.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
				Knob = reactModule.createElement(knobModule, {
					AnchorPoint = var81,
					Position = var80,
					size = var2.size,
					style = if flagsModule.FoundationSliderBeta then var52 else var51.knobStyle,
					stroke = if flagsModule.FoundationSliderBeta then var83 else var49.knob.stroke,
					hasShadow = var49.knob.hasShadow,
					testId = `{var2.testId}--knob`
				})
			})
		})
	})
	
	return if flagsModule.FoundationSliderCapture then reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = var82,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if var14 then t_3 else t_4,
		ref = if var3 then var45 else var48
	}), {
		FocusTarget = reactModule.createElement(viewModule, {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			cursor = if var14 then cursorTypeModule.Invisible else nil,
			onStateChanged = var78,
			isDisabled = var2.isDisabled,
			ref = var22,
			testId = `{var2.testId}--focus-target`
		}, { DragDetector = var97 }),
		Bar = var98
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = var82,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if var3 then nil elseif flagsModule.FoundationSliderBeta then var49.selectionGroup else t_2,
		cursor = cursorTypeModule.Invisible,
		onStateChanged = var78,
		isDisabled = var2.isDisabled,
		ref = if var3 then var45 else var48
	}), { DragDetector = var97, Bar = var98 })
end)