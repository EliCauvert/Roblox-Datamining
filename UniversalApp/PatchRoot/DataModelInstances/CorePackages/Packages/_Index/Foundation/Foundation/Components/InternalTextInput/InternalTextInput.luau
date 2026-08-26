local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local components = foundation.Components
local iconModule = require(components.Icon)
local paddingModule = require(components.Padding)
local scrollViewModule = require(components.ScrollView)
local _ = require(components.Types)
local viewModule = require(components.View)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local blendTransparenciesModule = require(foundation.Utility.blendTransparencies)
local getBindableValueModule = require(foundation.Utility.getBindableValue)
local getDisabledStyleModule = require(foundation.Utility.getDisabledStyle)
local getMultiLineTextHeightModule = require(foundation.Utility.getMultiLineTextHeight)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local mapBindableModule = require(foundation.Utility.mapBindable)
local truncateTextToCursorModule = require(script.Parent.truncateTextToCursor)
local useBindableModule = require(foundation.Utility.useBindable)
local usePreferredInputModule = require(foundation.Utility.usePreferredInput)
local useStyleTagsModule = require(foundation.Providers.Style.useStyleTags)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputFocusBehaviorModule = require(foundation.Enums.InputFocusBehavior)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local radiusModule = require(foundation.Enums.Radius)
local _ = require(foundation.Enums.ControlState)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local t = {
	numLines = 1,
	testId = "--foundation-internal-text-input",
	Selectable = true,
	size = inputSizeModule.Large,
	variant = inputVariantModule.Standard
}
local var1 = reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), isPluginSecurityModule (ref), paddingModule (ref)
	local isBoundsChecker = p1.isBoundsChecker
	local isMultiLine = p1.isMultiLine or isBoundsChecker
	
	return reactModule.createElement("TextBox", {
		ClearTextOnFocus = false,
		Selectable = false,
		Active = if isBoundsChecker then false else nil,
		Visible = if isBoundsChecker then false else nil,
		Font = p1.fontStyle.Font,
		TextSize = p1.fontStyle.FontSize,
		LineHeight = p1.fontStyle.LineHeight,
		TextColor3 = if p1.textStyle then p1.textStyle.Color3 else nil,
		TextTransparency = if p1.textStyle then p1.textStyle.Transparency else nil,
		MultiLine = isMultiLine,
		TextWrapped = isMultiLine,
		TextYAlignment = if isMultiLine then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center,
		TextEditable = if isBoundsChecker then false else not p1.isDisabled,
		Interactable = p1.Interactable,
		PlaceholderText = p1.placeholder,
		TextInputType = if isPluginSecurityModule() then p1.textInputType else nil,
		Size = if p1.Size ~= nil then UDim2.fromScale(1, 1) else p1.Size,
		AutomaticSize = p1.automaticSize,
		Text = if isBoundsChecker then nil else p1.text,
		ref = p2,
		[reactModule.Tag] = p1.tag,
		[reactModule.Change.Text] = p1.onTextChanged,
		[reactModule.Change.CursorPosition] = p1.onCursorPositionChanged,
		[reactModule.Event.Focused] = p1.onFocusGained,
		[reactModule.Event.FocusLost] = p1.onFocusLost,
		[reactModule.Event.InputChanged] = p1.onInputChanged,
		[reactModule.Event.InputEnded] = p1.onInputEnded
	}, if p1.padding then {
		Padding = reactModule.createElement(paddingModule, { value = p1.padding })
	} else nil, p1.children)
end))

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), flagsModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), getDisabledStyleModule (ref), inputFocusBehaviorModule (ref), getMultiLineTextHeightModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), radiusModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var1 (ref), mapBindableModule (ref), iconModule (ref)
	if p1.Selectable == nil then
		p1.Selectable = true
	end
	local var2, var3
	local var4 = withDefaultsModule(p1, t)
	local var5 = useTokensModule()
	local maxValue = math.max(1, var4.numLines)
	local var6 = maxValue > 1
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef("")
	local var12 = reactModule.useRef(getBindableValueModule(var4.text))
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useRef(Vector2.zero)
	local _ = nil
	local _ = nil
	local var15 = nil
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes then
		local var16, var17 = reactModule.useState(false)
		var2 = var16
		local var18 = var17
		local var19, var20 = reactModule.useBinding(false)
		var15 = var19
		local var21 = var20
		var3 = reactModule.useCallback(function(p3)
			-- upvalues: var21 (write), var18 (write)
			var21(p3)
			var18(p3)
		end, {})
	else
		local var22, var23 = reactModule.useState(false)
		var2 = var22
		var3 = var23
	end
	local createElement_2
	local var24 = useTextInputVariantsModule(var5, var4.size, var4.variant, var4.radius, var2, var4.hasError)
	local container = var24.container
	local var25 = useStyleTagsModule(var24.textBox.tag)
	local var26 = usePreferredInputModule()
	local var27, var28 = reactModule.useState(false)
	local var29 = var26 == Enum.PreferredInput.Touch
	local standard = var5.Stroke.Standard
	local var30 = math.ceil(standard) * 2
	local var31 = math.ceil(var5.Stroke.Thick) * 2
	local var32 = getDisabledStyleModule(var5.Color.Content.Emphasis, var4.isDisabled)
	local fontStyle = var24.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var33 = reactModule.useCallback(function(p3)
		-- upvalues: var7 (ref), var8 (ref)
		if var7.current then
			var7.current.SelectionStart = p3
		end
		if var8.current then
			var8.current.SelectionStart = p3
		end
	end, {})
	local var34 = reactModule.useCallback(function(p3)
		-- upvalues: var7 (ref), var8 (ref)
		if var7.current then
			var7.current.CursorPosition = p3
		end
		if var8.current then
			var8.current.CursorPosition = p3
		end
	end, {})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var8 (ref), var33 (ref), var34 (ref)
		local current = var7.current or var8.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var33(0)
			var34(charCount + 1)
		end
	end, { var33, var34 })
	local var36 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var4 (ref), inputFocusBehaviorModule (copy), var35 (ref)
		if var7.current == nil then return end
		var7.current:CaptureFocus()
		
		if var4.focusBehavior == inputFocusBehaviorModule.Highlight then
			task.spawn(var35)
		end
	end, { var35, var4.focusBehavior })
	local var37 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		if var7.current then
			var7.current:ReleaseFocus()
		end
	end, {})
	local var38 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		return if var7.current then var7.current:IsFocused() else nil
	end, {})
	local var39 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		return if var7.current then var7.current.SelectionStart else nil
	end, {})
	local var40 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		return if var7.current then var7.current.CursorPosition else nil
	end, {})
	local var41 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		if var7.current then
			var7.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var38 (ref), var36 (ref), var37 (ref), var39 (ref), var40 (ref), var34 (ref), var33 (ref)
		return {
			getIsFocused = var38,
			focus = var36,
			releaseFocus = var37,
			getSelectionStart = var39,
			getCursorPosition = var40,
			setCursorPosition = var34,
			setSelectionStart = var33
		}
	end, {
		var40, var38, var39, var36, var37, var34, var33
	})
	local var42 = reactModule.useCallback(function(p3)
		-- upvalues: var11 (ref), var12 (ref), var6 (ref), var9 (ref), var4 (ref)
		if p3 == nil or p3.Parent == nil or var11.current ~= "" then return end
		local text = p3.Text
		
		if text == var12.current then return end
		var12.current = text
		
		if var6 and var9.current then
			var9.current.Text = text
		end
		var4.onChanged(text)
	end, { var4.onChanged, var6, var27 })
	local var43 = reactModule.useRef(false)
	local var44 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var6 (ref), var29 (ref), var7 (ref), var11 (ref), var28 (ref), var3 (write), inputFocusBehaviorModule (copy), var8 (ref), var43 (ref)
		if var4.isDisabled then return end
		if var6 and var29 then
			if var7.current and var7.current.Parent then
				var11.current = var7.current.Text
			end
			var28(true)
		end
		var3(true)
		
		if var4.onFocus then
			var4.onFocus()
		end
		local focusBehavior = var4.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var11.current = ""
			
			if var7.current then
				var7.current.Text = ""
			end
			if var8.current then
				var8.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var43.current = true
		end
	end, {
		var4.onFocus,
		var4.isDisabled,
		var29,
		var6,
		var4.focusBehavior
	})
	local var45 = reactModule.useCallback(function(_, p3)
		-- upvalues: var43 (ref)
		if p3.UserInputType == Enum.UserInputType.MouseMovement then
			var43.current = false
		end
	end, {})
	local var46 = reactModule.useCallback(function(_, p3)
		-- upvalues: var43 (ref), var35 (ref)
		if not var43.current then return end
		var43.current = false
		
		if p3.UserInputType == Enum.UserInputType.MouseButton1 then
			var35()
			
			return
		end
	end, { var33, var34, var35 })
	local var47 = reactModule.useCallback(function(_, p3, p4)
		-- upvalues: var3 (write), var43 (ref), var6 (ref), var28 (ref), var4 (ref)
		var3(false)
		var43.current = false
		
		if var6 then
			var28(false)
		end
		if var4.onFocusLost then
			var4.onFocusLost(p4)
		end
		if p3 and var4.onReturnPressed then
			var4.onReturnPressed()
		end
	end, { var4.onReturnPressed, var6, var4.onFocusLost })
	local var48 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var13 (ref), var4 (ref)
		var13.current = p4
		
		if var4.onDragStarted then
			var4.onDragStarted(p3, p4)
		end
	end, { var4.onDragStarted })
	local var49 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var4 (ref)
		if var4.onDrag then
			var4.onDrag(p3, p4)
		end
	end, { var4.onDrag })
	local var50 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var13 (ref), var36 (ref), var37 (ref), var3 (write), var4 (ref)
		if var13.current == p4 then
			var36()
		else
			var37()
			var3(false)
		end
		var13.current = nil
		
		if var4.onDragEnded then
			var4.onDragEnded(p3, p4)
		end
	end, { var4.onDragEnded })
	local var51 = reactModule.useMemo(function()
		-- upvalues: container (ref), var5 (ref)
		return {
			radius = UDim.new(0, container.radius),
			offset = var5.Stroke.Thick,
			borderWidth = var5.Stroke.Thick
		}
	end, { var5, container.radius })
	local var52 = reactModule.useMemo(function()
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), maxValue (ref), lineHeight (ref)
		return getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	end, { fontSize, maxValue, lineHeight })
	local var53, var54 = reactModule.useMemo(function()
		-- upvalues: container (ref), var30 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var52 (ref)
		local var55 = math.round((container.minHeight - var30 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var55 / 2)),
			bottom = UDim.new(0, math.ceil(var55 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var52 + math.round(var55) + var30
	end, {
		container.minHeight, var30, var31, fontSize, var52, lineHeight
	})
	local var55 = if flagsModule.FoundationNumberInputBeta then reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return {
			left = if var4.horizontalPadding then var4.horizontalPadding.innerLeft else nil,
			right = if var4.horizontalPadding then var4.horizontalPadding.innerRight else nil
		}
	end, { var4.horizontalPadding }) else nil
	local var56 = var53.bottom.Offset + var53.top.Offset
	local uDim2 = UDim2.new(1, 0, 0, var52 + var56)
	local var57 = reactModule.useMemo(function()
		-- upvalues: var6 (ref)
		return if var6 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		} else nil
	end, { var6 })
	local var58 = reactModule.useMemo(function()
		-- upvalues: var6 (ref)
		return if var6 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var6 })
	local var59 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var9 (ref), truncateTextToCursorModule (copy), var53 (ref)
		local current = var10.current
		local current_1 = var9.current
		
		if current == nil or current_1 == nil then return end
		local var60 = p3.TextSize * p3.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p3)
		local y_1 = current_1.TextBounds.Y
		local var61 = y - var53.top.Offset + var53.bottom.Offset
		local var62 = y + current.AbsoluteSize.Y - var53.top.Offset - var53.bottom.Offset
		
		if y_1 - var60 < var61 then
			current.CanvasPosition += Vector2.new(0, y_1 - var60 - var61)
		end
		if var62 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var62)
		end
	end, { var53 })
	local var60 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var14 (ref)
		if p3 == nil then
			return
		end
		var10.current = p3
		p3.ClipsDescendants = true
		p3.CanvasPosition = var14.current
	end, {})
	local var61 = reactModule.useCallback(function(p3)
		-- upvalues: var11 (ref)
		if p3 then
			p3.Text = var11.current
			var11.current = ""
			task.delay(0, function()
				-- upvalues: p3 (ref)
				if p3.Parent ~= nil then
					p3:CaptureFocus()
				end
			end)
		end
	end, {})
	local var62 = reactModule.useCallback(function(p3)
		-- upvalues: var14 (ref)
		var14.current = p3.CanvasPosition
	end, {})
	local var63 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), reactModule (copy), var48 (ref), var49 (ref), var50 (ref), var2 (write)
		return if var4.onDragStarted or var4.onDrag or var4.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var48,
			[reactModule.Event.DragContinue] = var49,
			[reactModule.Event.DragEnd] = var50,
			Enabled = not var2 and not var4.isDisabled
		}) else nil
	end, {
		var48,
		var49,
		var50,
		var2,
		var4.isDisabled
	})
	local var64 = useBindableModule(if var4.horizontalPadding then var4.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var65 = useBindableModule(if var4.horizontalPadding then var4.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var66 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), container (ref), var5 (ref)
		return if var4.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var5.Stroke.Standard) / 2) else nil
	end, {
		var4.hasClearButton,
		container.minHeight,
		var5.Stroke.Standard
	})
	local var67 = reactUtilsModule.useComposedRef(var8, var61)
	local createElement = reactModule.createElement
	local var68 = withCommonPropsModule(var4, {
		ref = var4.inputRef,
		Size = UDim2.new(1, 0, 0, var54),
		selection = {
			Selectable = var4.Selectable and not var4.isDisabled,
			NextSelectionUp = var4.NextSelectionUp,
			NextSelectionDown = var4.NextSelectionDown,
			NextSelectionLeft = var4.NextSelectionLeft,
			NextSelectionRight = var4.NextSelectionRight
		},
		cursor = var51,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if var4.isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var2 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = if var4.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil,
		padding = {
			left = var64:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			right = if var4.trailingElement == nil and var4.hasClearButton then UDim.new(0, standard) else var65:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not var4.isDisabled then var36 else nil,
		isDisabled = var4.isDisabled,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var4.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var4.isDisabled) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = container.tag,
		testId = `{var4.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var63,
		Background = var4.backgroundGradient,
		Leading = if var4.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var4.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var4.testId}--leading`
		}, var4.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var69 = if var6 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var58,
		layout = var57,
		onCanvasPositionChanged = if var6 then var62 else nil,
		scrollingFrameRef = if var6 then var60 else nil,
		padding = if flagsModule.FoundationNumberInputBeta then var55 else nil,
		testId = `{var4.testId}--textbox-wrapper`
	}
	local t_3 = {}
	
	if var27 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(var1, {
			text = var4.text,
			placeholder = var4.placeholder,
			textInputType = var4.textInputType,
			fontStyle = fontStyle,
			textStyle = var32,
			isMultiLine = var6,
			isDisabled = var4.isDisabled,
			ref = var7,
			tag = `{var25 or ""} data-testid={var4.testId}--textbox`,
			Interactable = if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes and var63 ~= nil then var15 else nil,
			Size = if var6 then uDim2 else nil,
			automaticSize = mapBindableModule(var4.text, function(p3)
				-- upvalues: var6 (ref), var27 (ref)
				return if var6 and not var27 and p3 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var53,
			onFocusGained = var44,
			onFocusLost = if var6 and var29 then nil else var47,
			onTextChanged = var42,
			onCursorPositionChanged = if var6 then var59 else nil,
			onInputChanged = var45,
			onInputEnded = var46
		}, {
			DragDetector = if not flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes then var63 else nil,
			BoundsChecker = if var6 then reactModule.createElement(var1, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var32,
				Size = UDim2.new(1, 0, 1, var56),
				ref = var9
			}) else nil
		})
	end
	local var70
	t_3.TextBox = createElement_2
	
	if var6 and var27 then
		var70 = reactModule.createElement
		var70 = var70(var1, {
			text = var4.text,
			placeholder = var4.placeholder,
			textInputType = var4.textInputType,
			fontStyle = fontStyle,
			textStyle = var32,
			isMultiLine = var6,
			isDisabled = var4.isDisabled,
			padding = var53,
			ref = var67,
			tag = `{var25 or ""} data-testid={var4.testId}--mobile-textbox`,
			Interactable = if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes and var63 ~= nil then var15 else nil,
			Size = uDim2,
			onFocusLost = if var6 and var29 then var47 else nil,
			onTextChanged = var42,
			onCursorPositionChanged = if var6 then var59 else nil
		})
	else
		var70 = nil
	end
	t_3.MobileTextBox = var70
	t_1.TextBoxWrapper = createElement_1(var69, t_2, t_3)
	t_1.Clear = if var4.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = var4.isDisabled,
		GroupTransparency = if var4.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var4.text, function(p3)
			return p3 ~= ""
		end),
		tag = var24.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var41,
			padding = UDim.new(0, var24.clearButton.padding),
			Position = var66,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var4.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var24.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var4.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-0-full auto-x",
		GroupTransparency = if var4.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = `{var4.testId}--trailing`
	}, var4.trailingElement) else nil
	
	return createElement(viewModule, var68, t_1)
end))