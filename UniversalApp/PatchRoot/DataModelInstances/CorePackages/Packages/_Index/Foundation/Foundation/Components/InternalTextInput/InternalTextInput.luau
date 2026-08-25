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
	local var1, var2
	local var3 = withDefaultsModule(p1, t)
	local var4 = useTokensModule()
	local maxValue = math.max(1, var3.numLines)
	local var5 = maxValue > 1
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef("")
	local var11 = reactModule.useRef(getBindableValueModule(var3.text))
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(Vector2.zero)
	local _ = nil
	local _ = nil
	local var14 = nil
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes then
		local var15, var16 = reactModule.useState(false)
		var1 = var15
		local var17 = var16
		local var18, var19 = reactModule.useBinding(false)
		var14 = var18
		local var20 = var19
		var2 = reactModule.useCallback(function(p1)
			-- upvalues: var20 (write), var17 (write)
			var20(p1)
			var17(p1)
		end, {})
	else
		local var21, var22 = reactModule.useState(false)
		var1 = var21
		var2 = var22
	end
	local createElement_2
	local var23 = useTextInputVariantsModule(var4, var3.size, var3.variant, var3.radius, var1, var3.hasError)
	local container = var23.container
	local var24 = useStyleTagsModule(var23.textBox.tag)
	local var25 = usePreferredInputModule()
	local var26, var27 = reactModule.useState(false)
	local var28 = var25 == Enum.PreferredInput.Touch
	local standard = var4.Stroke.Standard
	local var29 = math.ceil(standard) * 2
	local var30 = math.ceil(var4.Stroke.Thick) * 2
	local var31 = getDisabledStyleModule(var4.Color.Content.Emphasis, var3.isDisabled)
	local fontStyle = var23.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var32 = reactModule.useCallback(function(p1)
		-- upvalues: var6 (ref), var7 (ref)
		if var6.current then
			var6.current.SelectionStart = p1
		end
		if var7.current then
			var7.current.SelectionStart = p1
		end
	end, {})
	local var33 = reactModule.useCallback(function(p1)
		-- upvalues: var6 (ref), var7 (ref)
		if var6.current then
			var6.current.CursorPosition = p1
		end
		if var7.current then
			var7.current.CursorPosition = p1
		end
	end, {})
	local var34 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var7 (ref), var32 (ref), var33 (ref)
		local current = var6.current or var7.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var32(0)
			var33(charCount + 1)
		end
	end, { var32, var33 })
	local var35 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var3 (ref), inputFocusBehaviorModule (copy), var34 (ref)
		if var6.current == nil then return end
		var6.current:CaptureFocus()
		
		if var3.focusBehavior == inputFocusBehaviorModule.Highlight then
			task.spawn(var34)
		end
	end, { var34, var3.focusBehavior })
	local var36 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		if var6.current then
			var6.current:ReleaseFocus()
		end
	end, {})
	local var37 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		return if var6.current then var6.current:IsFocused() else nil
	end, {})
	local var1 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		return if var6.current then var6.current.SelectionStart else nil
	end, {})
	local var1 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		return if var6.current then var6.current.CursorPosition else nil
	end, {})
	local var1 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		if var6.current then
			var6.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var37 (ref), var35 (ref), var36 (ref), var1 (ref), var1 (ref), var33 (ref), var32 (ref)
		return {
			getIsFocused = var37,
			focus = var35,
			releaseFocus = var36,
			getSelectionStart = var1,
			getCursorPosition = var1,
			setCursorPosition = var33,
			setSelectionStart = var32
		}
	end, {
		var1, var37, var1, var35, var36, var33, var32
	})
	local var2 = reactModule.useCallback(function(p1)
		-- upvalues: var10 (ref), var11 (ref), var5 (ref), var8 (ref), var3 (ref)
		if p1 == nil or p1.Parent == nil or var10.current ~= "" then return end
		local text = p1.Text
		
		if text == var11.current then return end
		var11.current = text
		
		if var5 and var8.current then
			var8.current.Text = text
		end
		var3.onChanged(text)
	end, { var3.onChanged, var5, var26 })
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref), var28 (ref), var6 (ref), var10 (ref), var27 (ref), var2 (write), inputFocusBehaviorModule (copy), var7 (ref), var3 (ref)
		if var3.isDisabled then return end
		if var5 and var28 then
			if var6.current and var6.current.Parent then
				var10.current = var6.current.Text
			end
			var27(true)
		end
		var2(true)
		
		if var3.onFocus then
			var3.onFocus()
		end
		local focusBehavior = var3.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var10.current = ""
			
			if var6.current then
				var6.current.Text = ""
			end
			if var7.current then
				var7.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var3.current = true
		end
	end, {
		var3.onFocus,
		var3.isDisabled,
		var28,
		var5,
		var3.focusBehavior
	})
	local var5 = reactModule.useCallback(function(_, p1)
		-- upvalues: var3 (ref)
		if p1.UserInputType == Enum.UserInputType.MouseMovement then
			var3.current = false
		end
	end, {})
	local var6 = reactModule.useCallback(function(_, p1)
		-- upvalues: var3 (ref), var34 (ref)
		if not var3.current then return end
		var3.current = false
		
		if p1.UserInputType == Enum.UserInputType.MouseButton1 then
			var34()
			
			return
		end
	end, { var32, var33, var34 })
	local var7 = reactModule.useCallback(function(_, p1, p2)
		-- upvalues: var2 (write), var3 (ref), var5 (ref), var27 (ref), var3 (ref)
		var2(false)
		var3.current = false
		
		if var5 then
			var27(false)
		end
		if var3.onFocusLost then
			var3.onFocusLost(p2)
		end
		if p1 and var3.onReturnPressed then
			var3.onReturnPressed()
		end
	end, { var3.onReturnPressed, var5, var3.onFocusLost })
	local var8 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var12 (ref), var3 (ref)
		var12.current = p2
		
		if var3.onDragStarted then
			var3.onDragStarted(p1, p2)
		end
	end, { var3.onDragStarted })
	local var9 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var3 (ref)
		if var3.onDrag then
			var3.onDrag(p1, p2)
		end
	end, { var3.onDrag })
	local var10 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var12 (ref), var35 (ref), var36 (ref), var2 (write), var3 (ref)
		if var12.current == p2 then
			var35()
		else
			var36()
			var2(false)
		end
		var12.current = nil
		
		if var3.onDragEnded then
			var3.onDragEnded(p1, p2)
		end
	end, { var3.onDragEnded })
	local var11 = reactModule.useMemo(function()
		-- upvalues: container (ref), var4 (ref)
		return {
			radius = UDim.new(0, container.radius),
			offset = var4.Stroke.Thick,
			borderWidth = var4.Stroke.Thick
		}
	end, { var4, container.radius })
	local var12 = reactModule.useMemo(function()
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), maxValue (ref), lineHeight (ref)
		return getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	end, { fontSize, maxValue, lineHeight })
	local var13, var14 = reactModule.useMemo(function()
		-- upvalues: container (ref), var29 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var12 (ref)
		local var1 = math.round((container.minHeight - var29 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var1 / 2)),
			bottom = UDim.new(0, math.ceil(var1 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var12 + math.round(var1) + var29
	end, {
		container.minHeight, var29, var30, fontSize, var12, lineHeight
	})
	local var15 = if flagsModule.FoundationNumberInputBeta then reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return {
			left = if var3.horizontalPadding then var3.horizontalPadding.innerLeft else nil,
			right = if var3.horizontalPadding then var3.horizontalPadding.innerRight else nil
		}
	end, { var3.horizontalPadding }) else nil
	local var1 = var13.bottom.Offset + var13.top.Offset
	local uDim2 = UDim2.new(1, 0, 0, var12 + var1)
	local var2 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return if var5 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		} else nil
	end, { var5 })
	local var1 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		return if var5 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var5 })
	local var1 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var8 (ref), truncateTextToCursorModule (copy), var13 (ref)
		local current = var9.current
		local current_1 = var8.current
		
		if current == nil or current_1 == nil then return end
		local var1 = p1.TextSize * p1.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p1)
		local y_1 = current_1.TextBounds.Y
		local var2 = y - var13.top.Offset + var13.bottom.Offset
		local var3 = y + current.AbsoluteSize.Y - var13.top.Offset - var13.bottom.Offset
		
		if y_1 - var1 < var2 then
			current.CanvasPosition += Vector2.new(0, y_1 - var1 - var2)
		end
		if var3 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var3)
		end
	end, { var13 })
	local var2 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var13 (ref)
		if p1 == nil then
			return
		end
		var9.current = p1
		p1.ClipsDescendants = true
		p1.CanvasPosition = var13.current
	end, {})
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: var10 (ref)
		if p1 then
			p1.Text = var10.current
			var10.current = ""
			task.delay(0, function()
				-- upvalues: p1 (ref)
				if p1.Parent ~= nil then
					p1:CaptureFocus()
				end
			end)
		end
	end, {})
	local var4 = reactModule.useCallback(function(p1)
		-- upvalues: var13 (ref)
		var13.current = p1.CanvasPosition
	end, {})
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), reactModule (copy), var8 (ref), var9 (ref), var10 (ref), var1 (write)
		return if var3.onDragStarted or var3.onDrag or var3.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var8,
			[reactModule.Event.DragContinue] = var9,
			[reactModule.Event.DragEnd] = var10,
			Enabled = not var1 and not var3.isDisabled
		}) else nil
	end, {
		var8,
		var9,
		var10,
		var1,
		var3.isDisabled
	})
	local var1 = useBindableModule(if var3.horizontalPadding then var3.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var2 = useBindableModule(if var3.horizontalPadding then var3.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var3 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), container (ref), var4 (ref)
		return if var3.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var4.Stroke.Standard) / 2) else nil
	end, {
		var3.hasClearButton,
		container.minHeight,
		var4.Stroke.Standard
	})
	local var1 = reactUtilsModule.useComposedRef(var7, var3)
	local createElement = reactModule.createElement
	local var2 = withCommonPropsModule(var3, {
		ref = var3.inputRef,
		Size = UDim2.new(1, 0, 0, var14),
		selection = {
			Selectable = var3.Selectable and not var3.isDisabled,
			NextSelectionUp = var3.NextSelectionUp,
			NextSelectionDown = var3.NextSelectionDown,
			NextSelectionLeft = var3.NextSelectionLeft,
			NextSelectionRight = var3.NextSelectionRight
		},
		cursor = var11,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if var3.isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var1 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = if var3.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil,
		padding = {
			left = var1:map(function(p1)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p1
			end),
			right = if var3.trailingElement == nil and var3.hasClearButton then UDim.new(0, standard) else var2:map(function(p1)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p1
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not var3.isDisabled then var35 else nil,
		isDisabled = var3.isDisabled,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var3.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var3.isDisabled) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = container.tag,
		testId = `{var3.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var5,
		Background = var3.backgroundGradient,
		Leading = if var3.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var3.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var3.testId}--leading`
		}, var3.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var3 = if var5 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var1,
		layout = var2,
		onCanvasPositionChanged = if var5 then var4 else nil,
		scrollingFrameRef = if var5 then var2 else nil,
		padding = if flagsModule.FoundationNumberInputBeta then var15 else nil,
		testId = `{var3.testId}--textbox-wrapper`
	}
	local t_3 = {}
	
	if var26 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(var1, {
			text = var3.text,
			placeholder = var3.placeholder,
			textInputType = var3.textInputType,
			fontStyle = fontStyle,
			textStyle = var31,
			isMultiLine = var5,
			isDisabled = var3.isDisabled,
			ref = var6,
			tag = `{var24 or ""} data-testid={var3.testId}--textbox`,
			Interactable = if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes and var5 ~= nil then var14 else nil,
			Size = if var5 then uDim2 else nil,
			automaticSize = mapBindableModule(var3.text, function(p1)
				-- upvalues: var5 (ref), var26 (ref)
				return if var5 and not var26 and p1 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var13,
			onFocusGained = var4,
			onFocusLost = if var5 and var28 then nil else var7,
			onTextChanged = var2,
			onCursorPositionChanged = if var5 then var1 else nil,
			onInputChanged = var5,
			onInputEnded = var6
		}, {
			DragDetector = if not flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes then var5 else nil,
			BoundsChecker = if var5 then reactModule.createElement(var1, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var31,
				Size = UDim2.new(1, 0, 1, var1),
				ref = var8
			}) else nil
		})
	end
	local var1
	t_3.TextBox = createElement_2
	
	if var5 and var26 then
		var1 = reactModule.createElement
		var1 = var1(var1, {
			text = var3.text,
			placeholder = var3.placeholder,
			textInputType = var3.textInputType,
			fontStyle = fontStyle,
			textStyle = var31,
			isMultiLine = var5,
			isDisabled = var3.isDisabled,
			padding = var13,
			ref = var1,
			tag = `{var24 or ""} data-testid={var3.testId}--mobile-textbox`,
			Interactable = if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes and var5 ~= nil then var14 else nil,
			Size = uDim2,
			onFocusLost = if var5 and var28 then var7 else nil,
			onTextChanged = var2,
			onCursorPositionChanged = if var5 then var1 else nil
		})
	else
		var1 = nil
	end
	t_3.MobileTextBox = var1
	t_1.TextBoxWrapper = createElement_1(var3, t_2, t_3)
	t_1.Clear = if var3.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = var3.isDisabled,
		GroupTransparency = if var3.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var3.text, function(p1)
			return p1 ~= ""
		end),
		tag = var23.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var1,
			padding = UDim.new(0, var23.clearButton.padding),
			Position = var3,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var3.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var23.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var3.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-0-full auto-x",
		GroupTransparency = if var3.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = `{var3.testId}--trailing`
	}, var3.trailingElement) else nil
	
	return createElement(viewModule, var2, t_1)
end))