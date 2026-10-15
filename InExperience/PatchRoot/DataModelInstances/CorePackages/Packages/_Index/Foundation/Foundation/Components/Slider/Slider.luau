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
local useSliderVariantsModule = require(foundation.Components.Slider.useSliderVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local t = {
	isDisabled = false,
	isContained = false,
	testId = "--foundation-slider",
	range = NumberRange.new(0, 1),
	size = inputSizeModule.Medium,
	width = UDim.new(1, 0),
	orientation = orientationModule.Horizontal,
	variant = sliderVariantModule.Standard,
	knobVisibility = visibilityModule.Auto
}
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }
local t_2 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}
local t_3 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Escape,
	SelectionBehaviorRight = Enum.SelectionBehavior.Escape,
	SelectionBehaviorUp = Enum.SelectionBehavior.Escape,
	SelectionBehaviorDown = Enum.SelectionBehavior.Escape
}
local t_4 = {
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), orientationModule (ref), sliderTypeModule (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), flagsModule (ref), useBindableModule (ref), useLastInputModeModule (ref), reactUtilsModule (ref), useSliderVariantsModule (ref), useSliderCaptureKeysModule (ref), guiService (ref), visibilityModule (ref), calculateSliderStepValueModule (ref), inputModeModule (ref), calculateSliderFractionModule (ref), getGuiInputPositionModule (ref), useSliderDirectionalInputModule (ref), getSelectionEntryDirectionModule (ref), usePresentationContext (ref), getKnobSizeModule (ref), blendTransparenciesModule (ref), viewModule (ref), sliderThumbModule (ref), t_4 (ref), cursorTypeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref), withCommonPropsModule (ref), constantsModule (ref), t_2 (ref), t_3 (ref), stateLayerAffordanceModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = var1.orientation == orientationModule.Vertical
	local var3 = p1.type == sliderTypeModule.Range
	local var4 = if p1.type == sliderTypeModule.Range then 0 else p1.value
	local var5 = if p1.type == sliderTypeModule.Range then nil else p1.onValueChanged
	local var6 = if p1.type == sliderTypeModule.Range then p1.onValueChanged else nil
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
	local var25 = reactModule.useRef(false)
	local var26, var27 = reactModule.useState(false)
	local var28 = useBindableModule(var4):map(function(p3)
		-- upvalues: var1 (ref)
		return math.clamp(p3, var1.range.Min, var1.range.Max)
	end)
	local var29 = useBindableModule(if p1.type == sliderTypeModule.Range then p1.value else NumberRange.new(0))
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useRef(0)
	local var32, var33 = reactModule.useBinding(UDim2.new())
	local var34, var35 = reactModule.useBinding(UDim2.new())
	local var36 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref), var33 (ref), var35 (ref)
		if var2 then
			var33(UDim2.fromScale(0, p3 - 1))
			var35(UDim2.fromScale(0, p3))
			
			return
		end
		var33(UDim2.fromScale(-p3, 0))
		var35(UDim2.fromScale(1 - p3, 0))
	end, { var2 })
	local var37 = reactModule.useRef(0)
	local var38 = useLastInputModeModule()
	local var39 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var39 (ref)
		return var39.current
	end, {})
	local var40, var41 = reactModule.useBinding(nil)
	local var42 = reactUtilsModule.useComposedRef(var39, var41)
	local var43 = useSliderVariantsModule(var7, var1.size, var1.variant, var2)
	local var44 = reactModule.useMemo(function()
		-- upvalues: var12 (ref), var43 (ref), var10 (ref), var3 (ref)
		return if var12 then if var10 and not var3 then var43.knob.dragStyle else var43.knob.style else { Transparency = 1, Color3 = var43.knob.style.Color3 }
	end, { var43, var12, var10, var3 })
	local var45 = true
	
	if var8 ~= controlStateModule.Selected then
		local _ = true
		local selectedPressed = controlStateModule.SelectedPressed
		var45 = var8 == selectedPressed and ((if var8 == selectedPressed then flagsModule.FoundationSliderCapture else nil) and var14)
	end
	local var46 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function()
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
		useSliderCaptureKeysModule(var45 and not var1.isDisabled, var46)
	end
	if flagsModule.FoundationSliderCapture then
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var15 (write)
			if var1.isDisabled then
				var15(false)
			end
		end, { var1.isDisabled })
		reactModule.useEffect(function()
			-- upvalues: guiService (copy), var39 (ref), var22 (ref), var23 (ref)
			local function redirectDragSelection()
				-- upvalues: guiService (copy), var39 (copy), var22 (copy), var23 (copy)
				local selectedObject = guiService.SelectedObject
				
				if if selectedObject ~= var39.current then selectedObject ~= nil and (var39.current ~= nil and (selectedObject:IsDescendantOf(var39.current) and (selectedObject ~= var22.current and selectedObject ~= var23.current))) else true then
					guiService.SelectedObject = var22.current
				end
			end
			
			local selectedObject = guiService.SelectedObject
			
			if if selectedObject ~= var39.current then selectedObject ~= nil and (var39.current ~= nil and (selectedObject:IsDescendantOf(var39.current) and (selectedObject ~= var22.current and selectedObject ~= var23.current))) else true then
				guiService.SelectedObject = var22.current
			end
			local var47 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(redirectDragSelection)
			
			return function()
				-- upvalues: var47 (ref)
				var47:Disconnect()
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var14 (write), guiService (copy), var23 (ref), var15 (write)
			if var14 then
				guiService.SelectedObject = var23.current
				local var47 = guiService:GetPropertyChangedSignal("SelectedObject"):Connect(function()
					-- upvalues: guiService (copy), var23 (copy), var15 (copy)
					if guiService.SelectedObject ~= var23.current then
						var15(false)
					end
				end)
				
				return function()
					-- upvalues: var47 (ref)
					var47:Disconnect()
				end
			end
		end, { var14 })
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var13 (ref), visibilityModule (copy), var45 (ref), var10 (ref), var8 (ref), controlStateModule (copy)
		if var1.isDisabled then
			var13(false)
			
			return
		elseif var1.knobVisibility == visibilityModule.None then
			var13(var45)
			
			return
		elseif var1.knobVisibility == visibilityModule.Always then
			var13(true)
			
			return
		end
		var13(var10 or (if var8 ~= controlStateModule.Hover then if var8 ~= controlStateModule.Selected then var8 == controlStateModule.Pressed else true else true))
	end, {
		var1.knobVisibility,
		var8,
		var10,
		var1.isDisabled,
		var45
	})
	local var47 = reactModule.useCallback(function(p3)
		-- upvalues: var28 (ref), var5 (ref)
		if p3 ~= var28:getValue() and var5 then
			var5(p3)
		end
	end, { var28, var5 })
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: var29 (ref), var6 (ref)
		local value = var29:getValue()
		
		if var6 and (typeof(value) ~= "NumberRange" or p3.Min ~= value.Min or p3.Max ~= value.Max) then
			var6(p3)
		end
	end, { var29, var6 })
	local var49 = reactModule.useCallback(function(p3)
		-- upvalues: var27 (ref), flagsModule (copy), var19 (write), var11 (ref), var1 (ref)
		var27(p3)
		
		if flagsModule.FoundationSliderCapture then
			var19(p3)
		end
		var11(true)
		
		if var1.onDragStarted then
			var1.onDragStarted()
		end
	end, { var1.onDragStarted })
	local var50 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var1 (ref)
		var11(false)
		
		if var1.onDragEnded then
			var1.onDragEnded()
		end
	end, { var1.onDragEnded })
	local var51 = reactModule.useCallback(function()
		-- upvalues: var49 (ref)
		var49(false)
	end, { var49 })
	local var52 = reactModule.useCallback(function()
		-- upvalues: var49 (ref)
		var49(true)
	end, { var49 })
	local var53 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref)
		return math.clamp((p3 - var1.range.Min) / (var1.range.Max - var1.range.Min), 0, 1)
	end, { var1.range.Min, var1.range.Max })
	local var54 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref)
		return var1.range.Min + p3 * (var1.range.Max - var1.range.Min)
	end, { var1.range.Min, var1.range.Max })
	local var55 = reactModule.useCallback(function(p3)
		-- upvalues: var54 (ref), var1 (ref), calculateSliderStepValueModule (copy)
		local var56 = var54(p3)
		
		return if var1.step then calculateSliderStepValueModule(var56, var1.step, var1.range) else var56
	end, { var54, var1.step, var1.range })
	local var56 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), var29 (ref), var1 (ref), var54 (ref)
		local var57 = var53(var29:getValue().Max)
		
		if var1.step and var1.step > 0 then
			var57 = var53(var1.range.Min + math.floor((var54(var57) - var1.range.Min) / var1.step + 0.5) * var1.step)
		end
		return 0, var57
	end, {
		var29,
		var53,
		var1.step,
		var54,
		var1.range.Min
	})
	local var57 = reactModule.useCallback(function()
		-- upvalues: var53 (ref), var29 (ref), var1 (ref), var54 (ref)
		local var58 = var53(var29:getValue().Min)
		
		if var1.step and var1.step > 0 then
			var58 = var53(var1.range.Min + math.floor((var54(var58) - var1.range.Min) / var1.step + 0.5) * var1.step)
		end
		return var58, 1
	end, {
		var29,
		var53,
		var1.step,
		var54,
		var1.range.Min
	})
	local var58 = reactModule.useCallback(function(p3)
		-- upvalues: var29 (ref), var48 (ref), var55 (ref)
		local value = var29:getValue()
		var48(NumberRange.new(math.min(var55(p3), value.Max), value.Max))
	end, { var29, var48, var55 })
	local var59 = reactModule.useCallback(function(p3)
		-- upvalues: var29 (ref), var48 (ref), var55 (ref)
		local value = var29:getValue()
		var48(NumberRange.new(value.Min, math.max(var55(p3), value.Min)))
	end, { var29, var48, var55 })
	local var60 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var57 (ref), var59 (ref), var56 (ref), var58 (ref)
		if p4 then
			local var61, var62 = var57()
			var59(math.clamp(p3, var61, var62))
			
			return
		end
		local var63, var64 = var56()
		var58(math.clamp(p3, var63, var64))
	end, { var57, var56, var59, var58 })
	local var61 = reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var38 (ref), inputModeModule (copy), var39 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var2 (ref), var29 (ref), var53 (ref), var25 (ref), flagsModule (copy), var19 (write), var49 (ref), var60 (ref)
		if not var3 or var38 == inputModeModule.Directional or not var39.current then return end
		local var62 = calculateSliderFractionModule(getGuiInputPositionModule(p3, var39.current), var39.current, var2)
		local value = var29:getValue()
		local var63 = var53(value.Min)
		local var64 = var53(value.Max)
		local var65 = if math.abs(var64 - var62) >= math.abs(var62 - var63) then var63 == var64 and var64 < var62 else true
		var25.current = var65
		
		if flagsModule.FoundationSliderCapture then
			var19(var65)
		end
		var49(var65)
		var60(var62, var65)
	end, {
		var3, var38, var2, var29, var49, var60, var53
	})
	local var62 = reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var38 (ref), inputModeModule (copy), var39 (ref), getGuiInputPositionModule (copy), var60 (ref), calculateSliderFractionModule (copy), var2 (ref), var25 (ref)
		if var3 and var38 ~= inputModeModule.Directional and var39.current then
			var60(calculateSliderFractionModule(getGuiInputPositionModule(p3, var39.current), var39.current, var2), var25.current)
			
			return
		end
	end, { var3, var38, var2, var60 })
	local var63 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var50 (ref)
		if var3 then
			var50()
			
			return
		end
	end, { var3, var50 })
	local var64 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function()
		-- upvalues: var15 (write), guiService (copy), var22 (ref)
		var15(false)
		guiService.SelectedObject = var22.current
	end, {}) else nil
	local var65 = reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var3 (ref), var29 (ref), var18 (write), var28 (ref), var48 (ref), var47 (ref), var1 (ref), calculateSliderStepValueModule (copy), var64 (ref)
		return {
			getValue = function()
				-- upvalues: flagsModule (copy), var3 (copy), var29 (copy), var18 (copy), var28 (copy)
				if not flagsModule.FoundationSliderCapture or not var3 then
					return var28:getValue()
				end
				local value = var29:getValue()
				
				return if var18 then value.Max else value.Min
			end,
			onStep = if flagsModule.FoundationSliderCapture then function(p3)
				-- upvalues: var3 (copy), var29 (copy), var18 (copy), var48 (copy), var47 (copy)
				if not var3 then
					var47(p3)
					
					return
				end
				local value = var29:getValue()
				
				if var18 then
					var48(NumberRange.new(value.Min, math.max(p3, value.Min)))
					
					return
				end
				var48(NumberRange.new(math.min(p3, value.Max), value.Max))
			end else function(p3)
				-- upvalues: var1 (copy), calculateSliderStepValueModule (copy), var47 (copy)
				var47(if var1.step then calculateSliderStepValueModule(p3, var1.step, var1.range) else p3)
			end,
			onExit = if flagsModule.FoundationSliderCapture then var64 else nil
		}
	end, {
		var28, var47, var1.step, var1.range,
		if flagsModule.FoundationSliderCapture then var3 else nil,
		if flagsModule.FoundationSliderCapture then var29 else nil,
		if flagsModule.FoundationSliderCapture then var18 else nil,
		if flagsModule.FoundationSliderCapture then var48 else nil,
		if flagsModule.FoundationSliderCapture then var64 else nil
	})
	local var66 = var45 and not var1.isDisabled
	var66 = if flagsModule.FoundationSliderCapture then var66 and var14 else var66 and not var3
	useSliderDirectionalInputModule(var66, var1.step, var1.range, var2, var65)
	local var67 = reactModule.useCallback(function(_, _)
		-- upvalues: var30 (ref), var1 (ref), var2 (ref), var38 (ref), inputModeModule (copy), var37 (ref), var31 (ref), var28 (ref), var36 (ref), var47 (ref), calculateSliderStepValueModule (copy)
		local current = var30.current
		
		if not current then return end
		local var68 = var1.range.Max - var1.range.Min
		local var69 = if var2 then -current.DragUDim2.Y.Scale else current.DragUDim2.X.Scale
		
		if var38 == inputModeModule.Directional and math.abs(var69 - var37.current) > 0.01 then
			var31.current = (var28:getValue() - var1.range.Min) / var68 - var69
			var37.current = var69
			var36(var31.current)
			
			return
		end
		var37.current = var69
		local var70 = var1.range.Min + math.clamp(var31.current + var69, 0, 1) * var68
		var47(if var1.step then calculateSliderStepValueModule(var70, var1.step, var1.range) else var70)
	end, {
		var1.step, var1.range, var38, var28, var47, var2, var36
	})
	local var68 = reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var1 (ref), var37 (ref), var38 (ref), inputModeModule (copy), var31 (ref), var28 (ref), var36 (ref), var39 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var2 (ref), var47 (ref), calculateSliderStepValueModule (copy)
		var11(true)
		
		if var1.onDragStarted then
			var1.onDragStarted()
		end
		var37.current = 0
		local var69 = var1.range.Max - var1.range.Min
		
		if var38 == inputModeModule.Directional then
			var31.current = (var28:getValue() - var1.range.Min) / var69
			var36(var31.current)
			
			return
		end
		local var70 = if var39.current then var1.range.Min + calculateSliderFractionModule(getGuiInputPositionModule(p3, var39.current), var39.current, var2) * var69 else var1.range.Min
		var31.current = (var70 - var1.range.Min) / var69
		var47(if var1.step then calculateSliderStepValueModule(var70, var1.step, var1.range) else var70)
		var36(var31.current)
	end, {
		var1.onDragStarted, var1.step, var1.range, var38, var28, var47, var2, var36
	})
	local var69 = reactModule.useCallback(function(_, _)
		-- upvalues: var11 (ref), var1 (ref)
		var11(false)
		
		if var1.onDragEnded then
			var1.onDragEnded()
		end
	end, { var1.onDragEnded })
	local var70 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), flagsModule (copy), controlStateModule (copy), var3 (ref), var24 (ref), var19 (write), getSelectionEntryDirectionModule (copy), var2 (ref)
		var9(p3)
		
		if flagsModule.FoundationSliderCapture then
			local var71 = if p3 ~= controlStateModule.Selected then p3 == controlStateModule.SelectedPressed else true
			
			if var3 and var71 and not var24.current then
				var19(getSelectionEntryDirectionModule(var2) < 0)
			end
			var24.current = var71
		end
	end, { var3, var2 })
	local var71 = usePresentationContext()
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var39 (ref)
		local current = var30.current
		
		if current then
			current.ReferenceUIInstance = var39.current
			
			return
		end
	end, {})
	local var72 = if var2 then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local var73 = if var1.isContained then var28:map(function(p3)
		-- upvalues: var1 (ref), var2 (ref)
		local var74 = (p3 - var1.range.Min) / (var1.range.Max - var1.range.Min)
		
		return if var2 then Vector2.new(0.5, 1 - var74) else Vector2.new(var74, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local uDim = UDim.new(0, getKnobSizeModule(var7, var1.size).X.Offset)
	local var74 = if var2 then UDim2.new(uDim, var1.width) else UDim2.new(var1.width, uDim)
	local var75 = reactModule.useMemo(function()
		-- upvalues: var43 (ref), blendTransparenciesModule (copy), var12 (ref)
		local stroke = var43.knob.stroke
		
		return if stroke == nil then nil else {
			Color = stroke.Color,
			Thickness = stroke.Thickness,
			Transparency = blendTransparenciesModule(if typeof(stroke.Transparency) == "number" then stroke.Transparency else nil, if var12 then 0 else 1)
		}
	end, { var43, var12 })
	local var76, var77 = reactModule.useBinding(Vector2.zero)
	local var78 = reactModule.useCallback(function(p3)
		-- upvalues: var77 (ref)
		var77(p3.AbsoluteSize)
	end, {})
	local var79 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var12 (ref), var10 (ref), var26 (ref), var43 (ref), var44 (ref), var75 (ref)
		return {
			size = var1.size,
			style = if var12 and var10 and not var26 then var43.knob.dragStyle else var44,
			stroke = var75,
			hasShadow = var43.knob.hasShadow
		}
	end, {
		var1.size, var12, var10, var26, var43.knob.dragStyle, var44, var75,
		var43.knob.hasShadow
	})
	local var80 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var12 (ref), var10 (ref), var26 (ref), var43 (ref), var44 (ref), var75 (ref)
		return {
			size = var1.size,
			style = if var12 and var10 and var26 then var43.knob.dragStyle else var44,
			stroke = var75,
			hasShadow = var43.knob.hasShadow
		}
	end, {
		var1.size, var12, var10, var26, var43.knob.dragStyle, var44, var75,
		var43.knob.hasShadow
	})
	local var81 = var29:map(function(p3)
		-- upvalues: var53 (ref)
		return var53(p3.Min)
	end)
	local var82 = var29:map(function(p3)
		-- upvalues: var53 (ref)
		return var53(p3.Max)
	end)
	local var83 = var45 and (not flagsModule.FoundationSliderCapture or var14)
	local var84 = if flagsModule.FoundationSliderCapture and var3 then if var18 then var82 else var81 else nil
	local var85 = if flagsModule.FoundationSliderCapture and var3 then if var1.isContained then var84:map(function(p3)
		-- upvalues: var2 (ref)
		return if var2 then Vector2.new(0.5, 1 - p3) else Vector2.new(p3, 0.5)
	end) else Vector2.new(0.5, 0.5) else nil
	local var86 = if flagsModule.FoundationSliderCapture and var3 then if var1.knob then var76:map(function(p3)
		return UDim2.fromOffset(p3.X, p3.Y)
	end) else getKnobSizeModule(var7, var1.size) else nil
	local var87 = if flagsModule.FoundationSliderCapture then reactModule.useCallback(function(_) end, {}) else nil
	local var88 = flagsModule.FoundationSliderCapture and (var38 == inputModeModule.Directional and var45)
	local var89 = if var88 then nil elseif var3 then reactModule.createElement("UIDragDetector", {
		DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
		[reactModule.Event.DragStart] = var61,
		[reactModule.Event.DragContinue] = var62,
		[reactModule.Event.DragEnd] = var63,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not var1.isDisabled
	}) else reactModule.createElement("UIDragDetector", {
		ref = var30,
		ReferenceUIInstance = var40,
		DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
		DragAxis = if var2 then Vector2.new(0, 1) else Vector2.new(1, 0),
		ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
		DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
		MinDragTranslation = var32,
		MaxDragTranslation = var34,
		[reactModule.Event.DragStart] = var68,
		[reactModule.Event.DragContinue] = var67,
		[reactModule.Event.DragEnd] = var69,
		SelectionModeDragSpeed = UDim2.new(),
		Enabled = not var1.isDisabled
	})
	local var90 = reactModule.createElement(viewModule, {
		tag = var43.bar.tag,
		Size = if var2 then UDim2.new(0, var43.bar.height, 1, 0) else UDim2.new(1, 0, 0, var43.bar.height),
		testId = `{var1.testId}--bar`
	}, if var3 then {
		Fill = reactModule.createElement(viewModule, {
			tag = var43.fill.tag,
			AnchorPoint = Vector2.new(0, 0),
			Position = if var2 then var82:map(function(p3)
				return UDim2.fromScale(0, 1 - p3)
			end) else var81:map(function(p3)
				return UDim2.fromScale(p3, 0)
			end),
			Size = var29:map(function(p3)
				-- upvalues: var53 (ref), var2 (ref)
				local var91 = var53(p3.Max) - var53(p3.Min)
				
				return if var2 then UDim2.fromScale(1, var91) else UDim2.fromScale(var91, 1)
			end),
			testId = `{var1.testId}--fill`
		}),
		MinKnob = reactModule.createElement(sliderThumbModule, {
			LayoutOrder = 1,
			trackRef = var39,
			fraction = var81,
			isVertical = var2,
			isDisabled = var1.isDisabled,
			isDragEnabled = not var88,
			knobAppearance = var79,
			knob = var1.knob,
			isContained = var1.isContained,
			onSeek = var58,
			getBounds = var56,
			onDragStarted = var51,
			onDragEnded = var50,
			Visible = var12,
			onAbsoluteSizeChanged = if flagsModule.FoundationSliderCapture then var78 else nil,
			testId = `{var1.testId}--min`
		}),
		MaxKnob = reactModule.createElement(sliderThumbModule, {
			LayoutOrder = 2,
			trackRef = var39,
			fraction = var82,
			isVertical = var2,
			isDisabled = var1.isDisabled,
			isDragEnabled = not var88,
			knobAppearance = var80,
			knob = var1.knob,
			isContained = var1.isContained,
			onSeek = var59,
			getBounds = var57,
			onDragStarted = var52,
			onDragEnded = var50,
			Visible = var12,
			onAbsoluteSizeChanged = if flagsModule.FoundationSliderCapture then var78 else nil,
			testId = `{var1.testId}--max`
		}),
		SelectionCursor = if flagsModule.FoundationSliderCapture and var83 then reactModule.createElement(viewModule, {
			ZIndex = 3,
			Size = var86,
			AnchorPoint = var85,
			Position = var84:map(function(p3)
				-- upvalues: var2 (ref)
				return if var2 then UDim2.fromScale(0.5, 1 - p3) else UDim2.fromScale(p3, 0.5)
			end),
			selection = { Selectable = true },
			selectionGroup = t_4,
			cursor = cursorTypeModule.Invisible,
			onStateChanged = var87,
			ref = var23,
			testId = `{var1.testId}--selection-cursor`
		}, {
			Cursor = reactModule.createElement(cursorComponentModule, {
				isVisible = true,
				cornerRadius = UDim.new(0.5, 0),
				offset = var7.Padding.XSmall,
				borderWidth = var7.Stroke.Thicker,
				colorNamespace = var71.colorNamespace
			})
		}) else nil
	} else {
		Fill = reactModule.createElement(viewModule, {
			tag = var43.fill.tag,
			AnchorPoint = if var2 then Vector2.new(0, 1) else nil,
			Position = if var2 then UDim2.fromScale(0, 1) else nil,
			Size = var28:map(function(p3)
				-- upvalues: var1 (ref), var2 (ref)
				local var91 = (p3 - var1.range.Min) / (var1.range.Max - var1.range.Min)
				
				return if var2 then UDim2.fromScale(1, var91) else UDim2.fromScale(var91, 1)
			end),
			testId = `{var1.testId}--fill`
		}, {
			SelectionCursor = if var83 then reactModule.createElement(viewModule, {
				Size = if var1.knob then var76:map(function(p3)
					return UDim2.fromOffset(p3.X, p3.Y)
				end) else getKnobSizeModule(var7, var1.size),
				AnchorPoint = var73,
				Position = var72,
				selection = if flagsModule.FoundationSliderCapture then { Selectable = true } else nil,
				selectionGroup = if flagsModule.FoundationSliderCapture then t_4 else nil,
				cursor = if flagsModule.FoundationSliderCapture then cursorTypeModule.Invisible else nil,
				onStateChanged = var87,
				ref = var23,
				testId = `{var1.testId}--selection-cursor`
			}, {
				Cursor = reactModule.createElement(cursorComponentModule, {
					isVisible = true,
					cornerRadius = UDim.new(0.5, 0),
					offset = var7.Padding.XSmall,
					borderWidth = var7.Stroke.Thicker,
					colorNamespace = var71.colorNamespace
				})
			}) else nil,
			Knob = if var1.knob then reactModule.createElement(viewModule, {
				tag = "size-0-0 auto-xy",
				AnchorPoint = var73,
				Position = var72,
				Visible = var12,
				onAbsoluteSizeChanged = var78,
				testId = `{var1.testId}--custom-knob`
			}, var1.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
				Knob = reactModule.createElement(knobModule, {
					AnchorPoint = var73,
					Position = var72,
					size = var1.size,
					style = var44,
					stroke = var75,
					hasShadow = var43.knob.hasShadow,
					testId = `{var1.testId}--knob`
				})
			})
		})
	})
	
	return if flagsModule.FoundationSliderCapture then reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		Size = var74,
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		selectionGroup = if var14 then t_2 else t_3,
		ref = if var3 then var39 else var42
	}), {
		FocusTarget = reactModule.createElement(viewModule, {
			ZIndex = 0,
			Size = UDim2.fromScale(1, 1),
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			cursor = if var14 then cursorTypeModule.Invisible else nil,
			onStateChanged = var70,
			isDisabled = var1.isDisabled,
			ref = var22,
			testId = `{var1.testId}--focus-target`
		}, { DragDetector = var89 }),
		Bar = var90
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		Size = var74,
		GroupTransparency = if var1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if var3 then nil else var43.selectionGroup,
		cursor = cursorTypeModule.Invisible,
		onStateChanged = var70,
		isDisabled = var1.isDisabled,
		ref = if var3 then var39 else var42
	}), { DragDetector = var89, Bar = var90 })
end)