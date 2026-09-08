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
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), orientationModule (ref), useTokensModule (ref), reactModule (ref), controlStateModule (ref), useBindableModule (ref), useLastInputModeModule (ref), reactUtilsModule (ref), usePointerPositionModule (ref), useSliderVariantsModule (ref), useSliderMotionStatesModule (ref), visibilityModule (ref), calculateSliderValueFromPositionModule (ref), calculateSliderStepValueModule (ref), useSliderDirectionalInputModule (ref), inputModeModule (ref), calculatePixelsPerStepModule (ref), calculateNextStepValueModule (ref), calculateSliderPositionDeltaModule (ref), calculateSliderFractionModule (ref), getGuiInputPositionModule (ref), usePresentationContext (ref), getKnobSizeModule (ref), blendTransparenciesModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), t_2 (ref), cursorTypeModule (ref), cursorComponentModule (ref), presentationContextModule (ref), t_1 (ref), knobModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	
	if flagsModule.FoundationSliderBeta then
		var1 = var2.orientation == orientationModule.Vertical
		var1 = nil
	else
		var1 = nil
	end
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
	local var14 = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	
	if flagsModule.FoundationSliderBeta then
		local var18, var19 = reactModule.useBinding(UDim2.new())
		var14 = var18
		var15 = var19
		local var20, var21 = reactModule.useBinding(UDim2.new())
		var16 = var20
		var17 = var21
	end
	local var22 = if flagsModule.FoundationSliderBeta then reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), var15 (write), var17 (write)
		if var1 then
			var15(UDim2.fromScale(0, p3 - 1))
			var17(UDim2.fromScale(0, p3))
			
			return
		end
		var15(UDim2.fromScale(-p3, 0))
		var17(UDim2.fromScale(1 - p3, 0))
	end, { var1 }) else nil
	local var23 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useRef(0) else nil
	local var24 = useLastInputModeModule()
	local var25 = reactModule.useRef(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var25 (ref)
		return var25.current
	end, {})
	local var26 = nil
	local var27 = nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		local var28, var29 = reactModule.useBinding(nil)
		var26 = var28
		var27 = var29
	end
	local var30
	local var31 = if flagsModule.FoundationSliderOffloadDraggingMath then reactUtilsModule.useComposedRef(var25, var27) else nil
	local var32 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else usePointerPositionModule(var25.current)
	local var33 = useSliderVariantsModule(var3, var2.size, var2.variant, var1)
	local var34 = if flagsModule.FoundationSliderBeta then nil else useSliderMotionStatesModule(var33.knob.style, var33.knob.dragStyle)
	local var35 = if flagsModule.FoundationSliderBeta then nil else reactModule.useMemo(function()
		-- upvalues: var8 (ref), var34 (ref), var6 (ref)
		return if var8 then if var6 then var34.Dragging else var34.Idle else var34.Hidden
	end, { var3, var8, var6, var34 })
	local var36 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var8 (ref), var33 (ref), var6 (ref)
		return if var8 then if var6 then var33.knob.dragStyle else var33.knob.style else { Transparency = 1, Color3 = var33.knob.style.Color3 }
	end, { var33, var8, var6 }) else nil
	
	if flagsModule.FoundationSliderKnobSelection then
		var30 = true
		
		if var4 ~= controlStateModule.Selected then
			local _ = var4 == controlStateModule.SelectedPressed
		end
	else
		var30 = nil
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var2 (ref), var9 (ref), visibilityModule (copy), var30 (write), var6 (ref), var4 (ref), controlStateModule (copy)
		if flagsModule.FoundationSliderBeta and var2.isDisabled then
			var9(false)
			
			return
		elseif var2.knobVisibility == visibilityModule.None then
			var9(if flagsModule.FoundationSliderKnobSelection then var30 else false)
			
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
		if flagsModule.FoundationSliderBeta then var2.isDisabled else nil,
		if flagsModule.FoundationSliderKnobSelection then var30 else nil
	})
	local var37 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function(p3)
		-- upvalues: var25 (ref), calculateSliderValueFromPositionModule (copy), var2 (ref), calculateSliderStepValueModule (copy)
		if not var25.current then
			return 0
		end
		local var38 = calculateSliderValueFromPositionModule(p3, var25.current, var2.range)
		
		return if var2.step then calculateSliderStepValueModule(var38, var2.step, var2.range) else var38
	end, { var25, var2.range, var2.step })
	local var38 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var2 (ref)
		if p3 ~= var10:getValue() and var2.onValueChanged then
			var2.onValueChanged(p3)
		end
	end, { var10, var2.onValueChanged })
	local var39 = if flagsModule.FoundationSliderOffloadDraggingMath then nil else reactModule.useCallback(function()
		-- upvalues: var37 (ref), var32 (ref), var38 (ref)
		var38(var37(var32:getValue()))
	end, { var37, var32, var38 })
	
	if flagsModule.FoundationSliderAsSeenOnTV then
		if not flagsModule.FoundationSliderKnobSelection then
			var30 = if var4 ~= controlStateModule.Selected then var4 == controlStateModule.SelectedPressed else true
		end
		useSliderDirectionalInputModule(var30 and not var2.isDisabled, var2.step, var2.range, var1, {
			getValue = function()
				-- upvalues: var10 (ref)
				return var10:getValue()
			end,
			onStep = function(p3)
				-- upvalues: var38 (ref), var2 (ref), calculateSliderStepValueModule (copy)
				var38(if var2.step then calculateSliderStepValueModule(p3, var2.step, var2.range) else p3)
			end
		})
	end
	local var40 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, _)
		-- upvalues: var12 (ref), var2 (ref), flagsModule (copy), var1 (ref), var24 (ref), inputModeModule (copy), var23 (ref), var13 (ref), var10 (ref), var22 (ref), var38 (ref), calculateSliderStepValueModule (copy)
		local current = var12.current
		
		if not current then return end
		local var41 = var2.range.Max - var2.range.Min
		local var42 = if flagsModule.FoundationSliderBeta and var1 then -current.DragUDim2.Y.Scale else current.DragUDim2.X.Scale
		
		if var24 ~= inputModeModule.Directional or math.abs(var42 - var23.current) <= 0.01 then
			var23.current = var42
			local var43 = var2.range.Min + math.clamp(var13.current + var42, 0, 1) * var41
			var38(if var2.step then calculateSliderStepValueModule(var43, var2.step, var2.range) else var43)
			
			return
		end
		var13.current = (var10:getValue() - var2.range.Min) / var41 - var42
		var23.current = var42
		
		if flagsModule.FoundationSliderBeta then
			var22(var13.current)
		end
	end, {
		var2.step, var2.range, var24, var10, var38,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var22 else nil
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var25 (ref), var11 (ref), var2 (ref), var24 (ref), inputModeModule (copy), calculatePixelsPerStepModule (copy), var10 (ref), calculateNextStepValueModule (copy), var38 (ref), var37 (ref), calculateSliderPositionDeltaModule (copy)
		if var25.current and var11.current then
			if var2.step and var2.step > 0 then
				if var24 ~= inputModeModule.Directional then
					var38(var37(p3))
					var11.current = p3
					
					return
				end
				local var41 = p3 - var11.current
				local absValue = math.abs(var41.X)
				local var42 = calculatePixelsPerStepModule(var25.current.AbsoluteSize.X, var2.step, var2.range)
				
				if var42 * 2 < absValue then
					var11.current = p3
					
					return
				elseif absValue < var42 / 2 then return end
				local value = var10:getValue()
				local var43 = calculateNextStepValueModule(var41.X, value, var2.step, var2.range)
				
				if var43 == value then
					return
				else
					var38(var43)
					var11.current = p3
					
					return
				end
			else
				local var44 = calculateSliderPositionDeltaModule(p3, var11.current, var25.current.AbsoluteSize.Magnitude)
				var11.current = p3
				
				if var24 == inputModeModule.Directional and math.abs(var44) > 0.01 then return end
				var38(var37(p3))
			end
		end
	end, {
		var2.step, var2.range, var24, var10, var38, var37
	})
	local var41 = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.useCallback(function(_, p3)
		-- upvalues: var7 (ref), var2 (ref), var23 (ref), var24 (ref), inputModeModule (copy), var13 (ref), var10 (ref), flagsModule (copy), var22 (ref), var25 (ref), calculateSliderFractionModule (copy), getGuiInputPositionModule (copy), var1 (ref), calculateSliderValueFromPositionModule (copy), var38 (ref), calculateSliderStepValueModule (copy)
		var7(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
		var23.current = 0
		local var42 = var2.range.Max - var2.range.Min
		
		if var24 == inputModeModule.Directional then
			var13.current = (var10:getValue() - var2.range.Min) / var42
			
			if flagsModule.FoundationSliderBeta then
				var22(var13.current)
			end
			return
		else
			local var43 = if flagsModule.FoundationSliderBeta then if var25.current then var2.range.Min + calculateSliderFractionModule(getGuiInputPositionModule(p3, var25.current), var25.current, var1) * var42 else var2.range.Min elseif var25.current then calculateSliderValueFromPositionModule(p3, var25.current, var2.range) else var2.range.Min
			var13.current = (var43 - var2.range.Min) / var42
			var38(if var2.step then calculateSliderStepValueModule(var43, var2.step, var2.range) else var43)
			
			if flagsModule.FoundationSliderBeta then
				var22(var13.current)
			end
		end
	end, {
		var2.onDragStarted, var2.step, var2.range, var24, var10, var38,
		if flagsModule.FoundationSliderBeta then var1 else nil,
		if flagsModule.FoundationSliderBeta then var22 else nil
	}) else reactModule.useCallback(function(_, p3)
		-- upvalues: var11 (ref), var7 (ref), var2 (ref)
		var11.current = p3
		var7(true)
		
		if var2.onDragStarted then
			var2.onDragStarted()
		end
	end, { var2.onDragStarted })
	local var42 = reactModule.useCallback(function(_, _)
		-- upvalues: var7 (ref), flagsModule (copy), var11 (ref), var2 (ref)
		var7(false)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath then
			var11.current = nil
		end
		if var2.onDragEnded then
			var2.onDragEnded()
		end
	end, { var2.onDragEnded })
	local var43 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), flagsModule (copy), controlStateModule (copy), var39 (ref)
		var5(p3)
		
		if not flagsModule.FoundationSliderOffloadDraggingMath and p3 == controlStateModule.Pressed then
			var39()
		end
	end, { var39 })
	local var44 = if flagsModule.FoundationSliderKnobSelection then usePresentationContext() else nil
	
	if flagsModule.FoundationSliderOffloadDraggingMath then
		reactModule.useEffect(function()
			-- upvalues: var12 (ref), flagsModule (copy), var25 (ref), var13 (ref)
			local current = var12.current
			
			if not current then return end
			if flagsModule.FoundationSliderBeta then
				current.ReferenceUIInstance = var25.current
				
				return
			end
			local var45 = current:AddConstraintFunction(1, function(p3, p4)
				-- upvalues: var13 (copy)
				local current = var13.current
				
				return UDim2.fromScale(math.clamp(p3.X.Scale, -current, 1 - current), 0), p4
			end)
			
			return function()
				-- upvalues: var45 (ref)
				var45:Disconnect()
			end
		end, {})
	end
	local var45 = if var1 then UDim2.fromScale(0.5, 0) else UDim2.fromScale(1, 0.5)
	local var46 = if var2.isContained then var10:map(function(p3)
		-- upvalues: var2 (ref), var1 (ref)
		local var47 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
		
		return if var1 then Vector2.new(0.5, 1 - var47) else Vector2.new(var47, 0.5)
	end) else Vector2.new(0.5, 0.5)
	local uDim = UDim.new(0, if flagsModule.FoundationSliderBeta then getKnobSizeModule(var3, var2.size).X.Offset else var33.hitbox.height)
	local var47 = if var1 then UDim2.new(uDim, var2.width) else UDim2.new(var2.width, uDim)
	local var48 = if flagsModule.FoundationSliderBeta then reactModule.useMemo(function()
		-- upvalues: var33 (ref), blendTransparenciesModule (copy), var8 (ref)
		local stroke = var33.knob.stroke
		
		return if stroke == nil then nil else {
			Color = stroke.Color,
			Thickness = stroke.Thickness,
			Transparency = blendTransparenciesModule(if typeof(stroke.Transparency) == "number" then stroke.Transparency else nil, if var8 then 0 else 1)
		}
	end, { var33, var8 }) else nil
	local var49 = nil
	local var50 = nil
	
	if flagsModule.FoundationSliderKnobSelection then
		local var51, var52 = reactModule.useBinding(Vector2.zero)
		var49 = var51
		var50 = var52
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, {
		Size = var47,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selectionGroup = if flagsModule.FoundationSliderAsSeenOnTV then if flagsModule.FoundationSliderBeta then var33.selectionGroup else t_2 else nil,
		cursor = if flagsModule.FoundationSliderKnobSelection then cursorTypeModule.Invisible else nil,
		onStateChanged = var43,
		isDisabled = var2.isDisabled,
		ref = if flagsModule.FoundationSliderOffloadDraggingMath then var31 else var25
	}), {
		DragDetector = if flagsModule.FoundationSliderOffloadDraggingMath then reactModule.createElement("UIDragDetector", {
			ref = var12,
			ReferenceUIInstance = var26,
			DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine,
			DragAxis = if var1 then Vector2.new(0, 1) else Vector2.new(1, 0),
			ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomScale,
			DragRelativity = Enum.UIDragDetectorDragRelativity.Absolute,
			MinDragTranslation = if flagsModule.FoundationSliderBeta then var14 else nil,
			MaxDragTranslation = if flagsModule.FoundationSliderBeta then var16 else nil,
			[reactModule.Event.DragStart] = var41,
			[reactModule.Event.DragContinue] = var40,
			[reactModule.Event.DragEnd] = var42,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}) else reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var41,
			[reactModule.Event.DragContinue] = var40,
			[reactModule.Event.DragEnd] = var42,
			SelectionModeDragSpeed = if flagsModule.FoundationSliderAsSeenOnTV then UDim2.new() else nil,
			Enabled = not var2.isDisabled
		}),
		Bar = reactModule.createElement(viewModule, {
			tag = var33.bar.tag,
			Size = if flagsModule.FoundationSliderBeta then if var1 then UDim2.new(0, var33.bar.height, 1, 0) else UDim2.new(1, 0, 0, var33.bar.height) else nil,
			testId = `{var2.testId}--bar`
		}, {
			Fill = reactModule.createElement(viewModule, {
				tag = var33.fill.tag,
				AnchorPoint = if var1 then Vector2.new(0, 1) else nil,
				Position = if var1 then UDim2.fromScale(0, 1) else nil,
				Size = var10:map(function(p3)
					-- upvalues: var2 (ref), var1 (ref)
					local var53 = (p3 - var2.range.Min) / (var2.range.Max - var2.range.Min)
					
					return if var1 then UDim2.fromScale(1, var53) else UDim2.fromScale(var53, 1)
				end),
				testId = `{var2.testId}--fill`
			}, {
				SelectionCursor = if flagsModule.FoundationSliderKnobSelection and var30 then reactModule.createElement(viewModule, {
					Size = if var2.knob then var49:map(function(p3)
						return UDim2.fromOffset(p3.X, p3.Y)
					end) else getKnobSizeModule(var3, var2.size),
					AnchorPoint = var46,
					Position = var45,
					testId = `{var2.testId}--selection-cursor`
				}, {
					Cursor = reactModule.createElement(cursorComponentModule, {
						isVisible = true,
						cornerRadius = UDim.new(0.5, 0),
						offset = var3.Padding.XSmall,
						borderWidth = var3.Stroke.Thicker,
						colorNamespace = var44.colorNamespace
					})
				}) else nil,
				Knob = if var2.knob then reactModule.createElement(viewModule, {
					tag = "size-0-0 auto-xy",
					AnchorPoint = var46,
					Position = var45,
					Visible = var8,
					onAbsoluteSizeChanged = if flagsModule.FoundationSliderKnobSelection then if flagsModule.FoundationSliderKnobSelection then reactModule.useCallback(function(p3)
						-- upvalues: var50 (write)
						var50(p3.AbsoluteSize)
					end, {}) else nil else nil,
					testId = `{var2.testId}--custom-knob`
				}, var2.knob) else reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, {
					Knob = reactModule.createElement(knobModule, {
						AnchorPoint = var46,
						Position = var45,
						size = var2.size,
						style = if flagsModule.FoundationSliderBeta then var36 else var35.knobStyle,
						stroke = if flagsModule.FoundationSliderBeta then var48 else var33.knob.stroke,
						hasShadow = var33.knob.hasShadow,
						testId = `{var2.testId}--knob`
					})
				})
			})
		})
	})
end)