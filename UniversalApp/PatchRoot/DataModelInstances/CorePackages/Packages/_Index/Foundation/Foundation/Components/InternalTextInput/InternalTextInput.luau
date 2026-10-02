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
local normalizeFontFaceModule = require(foundation.Utility.normalizeFontFace)
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
	-- upvalues: reactModule (ref), flagsModule (ref), normalizeFontFaceModule (ref), isPluginSecurityModule (ref), paddingModule (ref)
	local isBoundsChecker = p1.isBoundsChecker
	local isMultiLine = p1.isMultiLine or isBoundsChecker
	
	return reactModule.createElement("TextBox", {
		ClearTextOnFocus = false,
		Selectable = false,
		Active = if isBoundsChecker then false else nil,
		Visible = if isBoundsChecker then false else nil,
		Font = if flagsModule.FoundationFontFaceMigration then nil else p1.fontStyle.Font,
		FontFace = if flagsModule.FoundationFontFaceMigration then normalizeFontFaceModule(p1.fontStyle.Font) else nil,
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
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), getDisabledStyleModule (ref), inputFocusBehaviorModule (ref), getMultiLineTextHeightModule (ref), flagsModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), radiusModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var1 (ref), mapBindableModule (ref), iconModule (ref)
	if p1.Selectable == nil then
		p1.Selectable = true
	end
	local createElement_2
	local var2 = withDefaultsModule(p1, t)
	local var3 = useTokensModule()
	local maxValue = math.max(1, var2.numLines)
	local var4 = maxValue > 1
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef("")
	local var10 = reactModule.useRef(getBindableValueModule(var2.text))
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(Vector2.zero)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useBinding(false)
	local var17 = reactModule.useCallback(function(p3)
		-- upvalues: var16 (ref), var14 (ref)
		var16(p3)
		var14(p3)
	end, {})
	local var18 = useTextInputVariantsModule(var3, var2.size, var2.variant, var2.radius, var13, var2.hasError)
	local container = var18.container
	local var19 = useStyleTagsModule(var18.textBox.tag)
	local var20 = usePreferredInputModule()
	local var21, var22 = reactModule.useState(false)
	local var23 = var20 == Enum.PreferredInput.Touch
	local standard = var3.Stroke.Standard
	local var24 = math.ceil(standard) * 2
	local var25 = math.ceil(var3.Stroke.Thick) * 2
	local var26 = getDisabledStyleModule(var3.Color.Content.Emphasis, var2.isDisabled)
	local fontStyle = var18.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var27 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			var5.current.SelectionStart = p3
		end
		if var6.current then
			var6.current.SelectionStart = p3
		end
	end, {})
	local var28 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			var5.current.CursorPosition = p3
		end
		if var6.current then
			var6.current.CursorPosition = p3
		end
	end, {})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref), var27 (ref), var28 (ref)
		local current = var5.current or var6.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var27(0)
			var28(charCount + 1)
		end
	end, { var27, var28 })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var2 (ref), inputFocusBehaviorModule (copy), var29 (ref)
		if var5.current == nil then return end
		var5.current:CaptureFocus()
		
		if var2.focusBehavior == inputFocusBehaviorModule.Highlight then
			task.spawn(var29)
		end
	end, { var29, var2.focusBehavior })
	local var31 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		if var5.current then
			var5.current:ReleaseFocus()
		end
	end, {})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		return if var5.current then var5.current:IsFocused() else nil
	end, {})
	local var33 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		return if var5.current then var5.current.SelectionStart else nil
	end, {})
	local var34 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		return if var5.current then var5.current.CursorPosition else nil
	end, {})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		if var5.current then
			var5.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var32 (ref), var30 (ref), var31 (ref), var33 (ref), var34 (ref), var28 (ref), var27 (ref)
		return {
			getIsFocused = var32,
			focus = var30,
			releaseFocus = var31,
			getSelectionStart = var33,
			getCursorPosition = var34,
			setCursorPosition = var28,
			setSelectionStart = var27
		}
	end, {
		var34, var32, var33, var30, var31, var28, var27
	})
	local var36 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), var10 (ref), var4 (ref), var7 (ref), var2 (ref)
		if p3 == nil or p3.Parent == nil or var9.current ~= "" then return end
		local text = p3.Text
		
		if text == var10.current then return end
		var10.current = text
		
		if var4 and var7.current then
			var7.current.Text = text
		end
		var2.onChanged(text)
	end, { var2.onChanged, var4, var21 })
	local var37 = reactModule.useRef(false)
	local var38 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var4 (ref), var23 (ref), var5 (ref), var9 (ref), var22 (ref), var17 (ref), inputFocusBehaviorModule (copy), var6 (ref), var37 (ref)
		if var2.isDisabled then return end
		if var4 and var23 then
			if var5.current and var5.current.Parent then
				var9.current = var5.current.Text
			end
			var22(true)
		end
		var17(true)
		
		if var2.onFocus then
			var2.onFocus()
		end
		local focusBehavior = var2.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var9.current = ""
			
			if var5.current then
				var5.current.Text = ""
			end
			if var6.current then
				var6.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var37.current = true
		end
	end, {
		var2.onFocus,
		var2.isDisabled,
		var23,
		var4,
		var2.focusBehavior
	})
	local var39 = reactModule.useCallback(function(_, p3)
		-- upvalues: var37 (ref)
		if p3.UserInputType == Enum.UserInputType.MouseMovement then
			var37.current = false
		end
	end, {})
	local var40 = reactModule.useCallback(function(_, p3)
		-- upvalues: var37 (ref), var29 (ref)
		if not var37.current then return end
		var37.current = false
		
		if p3.UserInputType == Enum.UserInputType.MouseButton1 then
			var29()
			
			return
		end
	end, { var27, var28, var29 })
	local var41 = reactModule.useCallback(function(_, p3, p4)
		-- upvalues: var17 (ref), var37 (ref), var4 (ref), var22 (ref), var2 (ref)
		var17(false)
		var37.current = false
		
		if var4 then
			var22(false)
		end
		if var2.onFocusLost then
			var2.onFocusLost(p4)
		end
		if p3 and var2.onReturnPressed then
			var2.onReturnPressed()
		end
	end, { var2.onReturnPressed, var4, var2.onFocusLost })
	local var42 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), var2 (ref)
		var11.current = p4
		
		if var2.onDragStarted then
			var2.onDragStarted(p3, p4)
		end
	end, { var2.onDragStarted })
	local var43 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var2 (ref)
		if var2.onDrag then
			var2.onDrag(p3, p4)
		end
	end, { var2.onDrag })
	local var44 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), var30 (ref), var31 (ref), var17 (ref), var2 (ref)
		if var11.current == p4 then
			var30()
		else
			var31()
			var17(false)
		end
		var11.current = nil
		
		if var2.onDragEnded then
			var2.onDragEnded(p3, p4)
		end
	end, { var2.onDragEnded })
	local var45 = reactModule.useMemo(function()
		-- upvalues: container (ref), var3 (ref)
		return {
			radius = UDim.new(0, container.radius),
			offset = var3.Stroke.Thick,
			borderWidth = var3.Stroke.Thick
		}
	end, { var3, container.radius })
	local var46 = reactModule.useMemo(function()
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), maxValue (ref), lineHeight (ref)
		return getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	end, { fontSize, maxValue, lineHeight })
	local var47, var48 = reactModule.useMemo(function()
		-- upvalues: container (ref), var24 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var46 (ref)
		local var49 = math.round((container.minHeight - var24 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var49 / 2)),
			bottom = UDim.new(0, math.ceil(var49 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var46 + math.round(var49) + var24
	end, {
		container.minHeight, var24, var25, fontSize, var46, lineHeight
	})
	local var49 = if flagsModule.FoundationNumberInputBeta then reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return {
			left = if var2.horizontalPadding then var2.horizontalPadding.innerLeft else nil,
			right = if var2.horizontalPadding then var2.horizontalPadding.innerRight else nil
		}
	end, { var2.horizontalPadding }) else nil
	local var50 = var47.bottom.Offset + var47.top.Offset
	local uDim2 = UDim2.new(1, 0, 0, var46 + var50)
	local var51 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return if var4 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		} else nil
	end, { var4 })
	local var52 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return if var4 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var4 })
	local var53 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var7 (ref), truncateTextToCursorModule (copy), var47 (ref)
		local current = var8.current
		local current_1 = var7.current
		
		if current == nil or current_1 == nil then return end
		local var54 = p3.TextSize * p3.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p3)
		local y_1 = current_1.TextBounds.Y
		local var55 = y - var47.top.Offset + var47.bottom.Offset
		local var56 = y + current.AbsoluteSize.Y - var47.top.Offset - var47.bottom.Offset
		
		if y_1 - var54 < var55 then
			current.CanvasPosition += Vector2.new(0, y_1 - var54 - var55)
		end
		if var56 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var56)
		end
	end, { var47 })
	local var54 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var12 (ref)
		if p3 == nil then
			return
		end
		var8.current = p3
		p3.ClipsDescendants = true
		p3.CanvasPosition = var12.current
	end, {})
	local var55 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref)
		if p3 then
			p3.Text = var9.current
			var9.current = ""
			task.delay(0, function()
				-- upvalues: p3 (ref)
				if p3.Parent ~= nil then
					p3:CaptureFocus()
				end
			end)
		end
	end, {})
	local var56 = reactModule.useCallback(function(p3)
		-- upvalues: var12 (ref)
		var12.current = p3.CanvasPosition
	end, {})
	local var57 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), reactModule (copy), var42 (ref), var43 (ref), var44 (ref), var13 (ref)
		return if var2.onDragStarted or var2.onDrag or var2.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var42,
			[reactModule.Event.DragContinue] = var43,
			[reactModule.Event.DragEnd] = var44,
			Enabled = not var13 and not var2.isDisabled
		}) else nil
	end, {
		var42,
		var43,
		var44,
		var13,
		var2.isDisabled
	})
	local var58 = useBindableModule(if var2.horizontalPadding then var2.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var59 = useBindableModule(if var2.horizontalPadding then var2.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var60 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), container (ref), var3 (ref)
		return if var2.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var3.Stroke.Standard) / 2) else nil
	end, {
		var2.hasClearButton,
		container.minHeight,
		var3.Stroke.Standard
	})
	local var61 = reactUtilsModule.useComposedRef(var6, var55)
	local createElement = reactModule.createElement
	local var62 = withCommonPropsModule(var2, {
		ref = var2.inputRef,
		Size = UDim2.new(1, 0, 0, var48),
		selection = {
			Selectable = var2.Selectable and not var2.isDisabled,
			NextSelectionUp = var2.NextSelectionUp,
			NextSelectionDown = var2.NextSelectionDown,
			NextSelectionLeft = var2.NextSelectionLeft,
			NextSelectionRight = var2.NextSelectionRight
		},
		cursor = var45,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if var2.isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var13 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = if var2.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil,
		padding = {
			left = var58:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			right = if var2.trailingElement == nil and var2.hasClearButton then UDim.new(0, standard) else var59:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not var2.isDisabled then var30 else nil,
		isDisabled = var2.isDisabled,
		backgroundStyle = if flagsModule.FoundationFixColorOnScrubbableNumberInput and var2.backgroundGradient then getDisabledStyleModule({ Transparency = 0.001, Color3 = Color3.new(1, 1, 1) }, var2.isDisabled) elseif container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if flagsModule.FoundationFixColorOnScrubbableNumberInput or not var2.backgroundGradient then container.bgStyle.Transparency else 0
		}, var2.isDisabled) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = container.tag,
		testId = `{var2.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var57,
		Background = var2.backgroundGradient,
		Leading = if var2.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var2.testId}--leading`
		}, var2.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var63 = if var4 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var52,
		layout = var51,
		onCanvasPositionChanged = if var4 then var56 else nil,
		scrollingFrameRef = if var4 then var54 else nil,
		padding = if flagsModule.FoundationNumberInputBeta then var49 else nil,
		testId = `{var2.testId}--textbox-wrapper`
	}
	local t_3 = {}
	
	if var21 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(var1, {
			text = var2.text,
			placeholder = var2.placeholder,
			textInputType = var2.textInputType,
			fontStyle = fontStyle,
			textStyle = var26,
			isMultiLine = var4,
			isDisabled = var2.isDisabled,
			ref = var5,
			tag = `{var19 or ""} data-testid={var2.testId}--textbox`,
			Interactable = if var57 ~= nil then nil else var15,
			Size = if var4 then uDim2 else nil,
			automaticSize = mapBindableModule(var2.text, function(p3)
				-- upvalues: var4 (ref), var21 (ref)
				return if var4 and not var21 and p3 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var47,
			onFocusGained = var38,
			onFocusLost = if var4 and var23 then nil else var41,
			onTextChanged = var36,
			onCursorPositionChanged = if var4 then var53 else nil,
			onInputChanged = var39,
			onInputEnded = var40
		}, {
			BoundsChecker = if var4 then reactModule.createElement(var1, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var26,
				Size = UDim2.new(1, 0, 1, var50),
				ref = var7
			}) else nil
		})
	end
	local var64
	t_3.TextBox = createElement_2
	
	if var4 and var21 then
		var64 = reactModule.createElement
		var64 = var64(var1, {
			text = var2.text,
			placeholder = var2.placeholder,
			textInputType = var2.textInputType,
			fontStyle = fontStyle,
			textStyle = var26,
			isMultiLine = var4,
			isDisabled = var2.isDisabled,
			padding = var47,
			ref = var61,
			tag = `{var19 or ""} data-testid={var2.testId}--mobile-textbox`,
			Interactable = if var57 ~= nil then nil else var15,
			Size = uDim2,
			onFocusLost = if var4 and var23 then var41 else nil,
			onTextChanged = var36,
			onCursorPositionChanged = if var4 then var53 else nil
		})
	else
		var64 = nil
	end
	t_3.MobileTextBox = var64
	t_1.TextBoxWrapper = createElement_1(var63, t_2, t_3)
	t_1.Clear = if var2.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = var2.isDisabled,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var2.text, function(p3)
			return p3 ~= ""
		end),
		tag = var18.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var35,
			padding = UDim.new(0, var18.clearButton.padding),
			Position = var60,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var2.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var18.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var2.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-0-full auto-x",
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = `{var2.testId}--trailing`
	}, var2.trailingElement) else nil
	
	return createElement(viewModule, var62, t_1)
end))