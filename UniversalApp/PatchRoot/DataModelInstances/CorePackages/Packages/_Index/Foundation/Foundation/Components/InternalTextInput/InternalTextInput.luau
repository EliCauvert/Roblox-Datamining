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
local var29 = reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 132 ]]
	-- upvalues: reactModule (ref), isPluginSecurityModule (ref), paddingModule (ref)
	local isBoundsChecker = p0.isBoundsChecker
	local isMultiLine = p0.isMultiLine or isBoundsChecker
	
	return reactModule.createElement("TextBox", {
		ClearTextOnFocus = false,
		Selectable = false,
		Active = if isBoundsChecker then false else nil,
		Visible = if isBoundsChecker then false else nil,
		Font = p0.fontStyle.Font,
		TextSize = p0.fontStyle.FontSize,
		LineHeight = p0.fontStyle.LineHeight,
		TextColor3 = if p0.textStyle then p0.textStyle.Color3 else nil,
		TextTransparency = if p0.textStyle then p0.textStyle.Transparency else nil,
		MultiLine = isMultiLine,
		TextWrapped = isMultiLine,
		TextYAlignment = if isMultiLine then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center,
		TextEditable = if isBoundsChecker then false else not p0.isDisabled,
		Interactable = p0.Interactable,
		PlaceholderText = p0.placeholder,
		TextInputType = if isPluginSecurityModule() then p0.textInputType else nil,
		Size = if p0.Size ~= nil then UDim2.fromScale(1, 1) else p0.Size,
		AutomaticSize = p0.automaticSize,
		Text = if isBoundsChecker then nil else p0.text,
		ref = p1,
		[reactModule.Tag] = p0.tag,
		[reactModule.Change.Text] = p0.onTextChanged,
		[reactModule.Change.CursorPosition] = p0.onCursorPositionChanged,
		[reactModule.Event.Focused] = p0.onFocusGained,
		[reactModule.Event.FocusLost] = p0.onFocusLost,
		[reactModule.Event.InputChanged] = p0.onInputChanged,
		[reactModule.Event.InputEnded] = p0.onInputEnded
	}, if p0.padding then {
		Padding = reactModule.createElement(paddingModule, { value = p0.padding })
	} else nil, p0.children)
end))

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 179 | named "InternalTextInput" ]]
	-- upvalues: flagsModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), getDisabledStyleModule (ref), inputFocusBehaviorModule (ref), getMultiLineTextHeightModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), radiusModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var29 (ref), mapBindableModule (ref), iconModule (ref)
	if flagsModule.FoundationInputSelectionProps and p2.Selectable == nil then
		p2.Selectable = true
	end
	local var46, var47
	local var31 = withDefaultsModule(p2, t)
	local var32 = useTokensModule()
	local maxValue = math.max(1, var31.numLines)
	local var34 = maxValue > 1
	local var35 = reactModule.useRef(nil)
	local var36 = reactModule.useRef(nil)
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef("")
	local var40 = reactModule.useRef(getBindableValueModule(var31.text))
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useRef(Vector2.zero)
	local _ = nil
	local _ = nil
	local var43 = nil
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes then
		local var48, var49 = reactModule.useState(false)
		var46 = var48
		local var50 = var49
		local var51, var52 = reactModule.useBinding(false)
		var43 = var51
		local var53 = var52
		var47 = reactModule.useCallback(function(p4) --[[ line: 207 ]]
			-- upvalues: var53 (write), var50 (write)
			var53(p4)
			var50(p4)
		end, {})
	else
		local var44, var45 = reactModule.useState(false)
		var46 = var44
		var47 = var45
	end
	local createElement_2
	local var54 = useTextInputVariantsModule(var32, var31.size, var31.variant, var31.radius, var46, var31.hasError)
	local container = var54.container
	local var55 = useStyleTagsModule(var54.textBox.tag)
	local var56 = usePreferredInputModule()
	local var57, var58 = reactModule.useState(false)
	local var59 = var56 == Enum.PreferredInput.Touch
	local standard = var32.Stroke.Standard
	local var60 = math.ceil(standard) * 2
	local var61 = math.ceil(var32.Stroke.Thick) * 2
	local var62 = getDisabledStyleModule(var32.Color.Content.Emphasis, var31.isDisabled)
	local fontStyle = var54.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var63 = reactModule.useCallback(function(p5) --[[ line: 234 ]]
		-- upvalues: var35 (ref), var36 (ref)
		if var35.current then
			var35.current.SelectionStart = p5
		end
		if var36.current then
			var36.current.SelectionStart = p5
		end
	end, {})
	local var64 = reactModule.useCallback(function(p6) --[[ line: 243 ]]
		-- upvalues: var35 (ref), var36 (ref)
		if var35.current then
			var35.current.CursorPosition = p6
		end
		if var36.current then
			var36.current.CursorPosition = p6
		end
	end, {})
	local var65 = reactModule.useCallback(function() --[[ line: 252 ]]
		-- upvalues: var35 (ref), var36 (ref), var63 (ref), var64 (ref)
		local current = var35.current or var36.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var63(0)
			var64(charCount + 1)
		end
	end, { var63, var64 })
	local var66 = reactModule.useCallback(function() --[[ line: 266 ]]
		-- upvalues: var35 (ref), var31 (ref), inputFocusBehaviorModule (copy), var65 (ref)
		if var35.current == nil then return end
		var35.current:CaptureFocus()
		
		if var31.focusBehavior == inputFocusBehaviorModule.Highlight then
			task.spawn(var65)
		end
	end, { var65, var31.focusBehavior })
	local var67 = reactModule.useCallback(function() --[[ line: 283 ]]
		-- upvalues: var35 (ref)
		if var35.current then
			var35.current:ReleaseFocus()
		end
	end, {})
	local var68 = reactModule.useCallback(function() --[[ line: 289 ]]
		-- upvalues: var35 (ref)
		return if var35.current then var35.current:IsFocused() else nil
	end, {})
	local var69 = reactModule.useCallback(function() --[[ line: 296 ]]
		-- upvalues: var35 (ref)
		return if var35.current then var35.current.SelectionStart else nil
	end, {})
	local var70 = reactModule.useCallback(function() --[[ line: 303 ]]
		-- upvalues: var35 (ref)
		return if var35.current then var35.current.CursorPosition else nil
	end, {})
	local var71 = reactModule.useCallback(function() --[[ line: 310 ]]
		-- upvalues: var35 (ref)
		if var35.current then
			var35.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p3, function() --[[ line: 318 ]]
		-- upvalues: var68 (ref), var66 (ref), var67 (ref), var69 (ref), var70 (ref), var64 (ref), var63 (ref)
		return {
			getIsFocused = var68,
			focus = var66,
			releaseFocus = var67,
			getSelectionStart = var69,
			getCursorPosition = var70,
			setCursorPosition = var64,
			setSelectionStart = var63
		}
	end, {
		var70, var68, var69, var66, var67, var64, var63
	})
	local var72 = reactModule.useCallback(function(p7) --[[ line: 340 ]]
		-- upvalues: var39 (ref), var40 (ref), var34 (ref), var37 (ref), var31 (ref)
		if p7 == nil or p7.Parent == nil or var39.current ~= "" then return end
		local text = p7.Text
		
		if text == var40.current then return end
		var40.current = text
		
		if var34 and var37.current then
			var37.current.Text = text
		end
		var31.onChanged(text)
	end, { var31.onChanged, var34, var57 })
	local var73 = reactModule.useRef(false)
	local var74 = reactModule.useCallback(function() --[[ line: 362 ]]
		-- upvalues: var31 (ref), var34 (ref), var59 (ref), var35 (ref), var39 (ref), var58 (ref), var47 (write), inputFocusBehaviorModule (copy), var36 (ref), var73 (ref)
		if var31.isDisabled then return end
		if var34 and var59 then
			if var35.current and var35.current.Parent then
				var39.current = var35.current.Text
			end
			var58(true)
		end
		var47(true)
		
		if var31.onFocus then
			var31.onFocus()
		end
		local focusBehavior = var31.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var39.current = ""
			
			if var35.current then
				var35.current.Text = ""
			end
			if var36.current then
				var36.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var73.current = true
		end
	end, {
		var31.onFocus,
		var31.isDisabled,
		var59,
		var34,
		var31.focusBehavior
	})
	local var75 = reactModule.useCallback(function(_, p8) --[[ line: 403 ]]
		-- upvalues: var73 (ref)
		if p8.UserInputType == Enum.UserInputType.MouseMovement then
			var73.current = false
		end
	end, {})
	local var76 = reactModule.useCallback(function(_, p9) --[[ line: 410 ]]
		-- upvalues: var73 (ref), var65 (ref)
		if not var73.current then return end
		var73.current = false
		
		if p9.UserInputType == Enum.UserInputType.MouseButton1 then
			var65()
			
			return
		end
	end, { var63, var64, var65 })
	local var77 = reactModule.useCallback(function(_, p10, p11) --[[ line: 430 ]]
		-- upvalues: var47 (write), var73 (ref), var34 (ref), var58 (ref), var31 (ref)
		var47(false)
		var73.current = false
		
		if var34 then
			var58(false)
		end
		if var31.onFocusLost then
			var31.onFocusLost(p11)
		end
		if p10 and var31.onReturnPressed then
			var31.onReturnPressed()
		end
	end, { var31.onReturnPressed, var34, var31.onFocusLost })
	local var78 = reactModule.useCallback(function(p12, p13) --[[ line: 449 ]]
		-- upvalues: var41 (ref), var31 (ref)
		var41.current = p13
		
		if var31.onDragStarted then
			var31.onDragStarted(p12, p13)
		end
	end, { var31.onDragStarted })
	local var79 = reactModule.useCallback(function(p14, p15) --[[ line: 456 ]]
		-- upvalues: var31 (ref)
		if var31.onDrag then
			var31.onDrag(p14, p15)
		end
	end, { var31.onDrag })
	local var80 = reactModule.useCallback(function(p16, p17) --[[ line: 462 ]]
		-- upvalues: var41 (ref), var66 (ref), var67 (ref), var47 (write), var31 (ref)
		if var41.current == p17 then
			var66()
		else
			var67()
			var47(false)
		end
		var41.current = nil
		
		if var31.onDragEnded then
			var31.onDragEnded(p16, p17)
		end
	end, { var31.onDragEnded })
	local var81 = reactModule.useMemo(function() --[[ line: 475 ]]
		-- upvalues: container (ref), var32 (ref)
		return {
			radius = UDim.new(0, container.radius),
			offset = var32.Stroke.Thick,
			borderWidth = var32.Stroke.Thick
		}
	end, { var32, container.radius })
	local var82 = reactModule.useMemo(function() --[[ line: 483 ]]
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), maxValue (ref), lineHeight (ref)
		return getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	end, { fontSize, maxValue, lineHeight })
	local var83, var84 = reactModule.useMemo(function() --[[ line: 488 ]]
		-- upvalues: container (ref), var60 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var82 (ref)
		local var107 = math.round((container.minHeight - var60 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var107 / 2)),
			bottom = UDim.new(0, math.ceil(var107 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var82 + math.round(var107) + var60
	end, {
		container.minHeight, var60, var61, fontSize, var82, lineHeight
	})
	local var85 = if flagsModule.FoundationNumberInputBeta then reactModule.useMemo(function() --[[ line: 518 ]]
		-- upvalues: var31 (ref)
		return {
			left = if var31.horizontalPadding then var31.horizontalPadding.innerLeft else nil,
			right = if var31.horizontalPadding then var31.horizontalPadding.innerRight else nil
		}
	end, { var31.horizontalPadding }) else nil
	local var86 = var83.bottom.Offset + var83.top.Offset
	local uDim2 = UDim2.new(1, 0, 0, var82 + var86)
	local var88 = reactModule.useMemo(function() --[[ line: 529 ]]
		-- upvalues: var34 (ref)
		return if var34 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		} else nil
	end, { var34 })
	local var89 = reactModule.useMemo(function() --[[ line: 538 ]]
		-- upvalues: var34 (ref)
		return if var34 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var34 })
	local var90 = reactModule.useCallback(function(p18) --[[ line: 549 ]]
		-- upvalues: var38 (ref), var37 (ref), truncateTextToCursorModule (copy), var83 (ref)
		local current = var38.current
		local current_1 = var37.current
		
		if current == nil or current_1 == nil then return end
		local var108 = p18.TextSize * p18.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p18)
		local y_1 = current_1.TextBounds.Y
		local var109 = y - var83.top.Offset + var83.bottom.Offset
		local var110 = y + current.AbsoluteSize.Y - var83.top.Offset - var83.bottom.Offset
		
		if y_1 - var108 < var109 then
			current.CanvasPosition += Vector2.new(0, y_1 - var108 - var109)
		end
		if var110 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var110)
		end
	end, { var83 })
	local var91 = reactModule.useCallback(function(p19) --[[ line: 582 ]]
		-- upvalues: var38 (ref), var42 (ref)
		if p19 == nil then
			return
		end
		var38.current = p19
		p19.ClipsDescendants = true
		p19.CanvasPosition = var42.current
	end, {})
	local var92 = reactModule.useCallback(function(p20) --[[ line: 592 ]]
		-- upvalues: var39 (ref), flagsModule (copy)
		if p20 then
			p20.Text = var39.current
			var39.current = ""
			
			if flagsModule.FoundationTextAreaDelayMobileFocus then
				task.delay(0, function() --[[ line: 597 ]]
					-- upvalues: p20 (ref)
					if p20.Parent ~= nil then
						p20:CaptureFocus()
					end
				end)
				
				return
			end
			p20:CaptureFocus()
		end
	end, {})
	local var93 = reactModule.useCallback(function(p21) --[[ line: 608 ]]
		-- upvalues: var42 (ref)
		var42.current = p21.CanvasPosition
	end, {})
	local var94 = reactModule.useMemo(function() --[[ line: 612 ]]
		-- upvalues: var31 (ref), reactModule (copy), var78 (ref), var79 (ref), var80 (ref), var46 (write)
		return if var31.onDragStarted or var31.onDrag or var31.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var78,
			[reactModule.Event.DragContinue] = var79,
			[reactModule.Event.DragEnd] = var80,
			Enabled = not var46 and not var31.isDisabled
		}) else nil
	end, {
		var78,
		var79,
		var80,
		var46,
		var31.isDisabled
	})
	local var95 = useBindableModule(if var31.horizontalPadding then var31.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var96 = useBindableModule(if var31.horizontalPadding then var31.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var97 = reactModule.useMemo(function() --[[ line: 632 ]]
		-- upvalues: var31 (ref), container (ref), var32 (ref)
		return if var31.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var32.Stroke.Standard) / 2) else nil
	end, {
		var31.hasClearButton,
		container.minHeight,
		var32.Stroke.Standard
	})
	local var98 = reactUtilsModule.useComposedRef(var36, var92)
	local createElement = reactModule.createElement
	local var99 = withCommonPropsModule(var31, {
		ref = var31.inputRef,
		Size = UDim2.new(1, 0, 0, var84),
		selection = {
			Selectable = if flagsModule.FoundationInputSelectionProps then var31.Selectable and not var31.isDisabled else not var31.isDisabled,
			NextSelectionUp = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionUp else nil,
			NextSelectionDown = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionDown else nil,
			NextSelectionLeft = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionLeft else nil,
			NextSelectionRight = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionRight else nil
		},
		cursor = var81,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if var31.isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var46 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = if var31.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil,
		padding = {
			left = var95:map(function(p22) --[[ line: 677 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p22
			end),
			right = if var31.trailingElement == nil and var31.hasClearButton then UDim.new(0, standard) else var96:map(function(p23) --[[ line: 683 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p23
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not var31.isDisabled then var66 else nil,
		isDisabled = var31.isDisabled,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var31.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var31.isDisabled) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = container.tag,
		testId = `{var31.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var94,
		Background = var31.backgroundGradient,
		Leading = if var31.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var31.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var31.testId}--leading`
		}, var31.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var101 = if var34 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var89,
		layout = var88,
		onCanvasPositionChanged = if var34 then var93 else nil,
		scrollingFrameRef = if var34 then var91 else nil,
		padding = if flagsModule.FoundationNumberInputBeta then var85 else nil,
		testId = `{var31.testId}--textbox-wrapper`
	}
	local t_3 = {}
	
	if var57 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(var29, {
			text = var31.text,
			placeholder = var31.placeholder,
			textInputType = var31.textInputType,
			fontStyle = fontStyle,
			textStyle = var62,
			isMultiLine = var34,
			isDisabled = var31.isDisabled,
			ref = var35,
			tag = `{var55 or ""} data-testid={var31.testId}--textbox`,
			Interactable = if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes and var94 ~= nil then var43 else nil,
			Size = if var34 then uDim2 else nil,
			automaticSize = mapBindableModule(var31.text, function(p24) --[[ line: 741 ]]
				-- upvalues: var34 (ref), var57 (ref)
				return if var34 and not var57 and p24 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var83,
			onFocusGained = var74,
			onFocusLost = if var34 and var59 then nil else var77,
			onTextChanged = var72,
			onCursorPositionChanged = if var34 then var90 else nil,
			onInputChanged = var75,
			onInputEnded = var76
		}, {
			DragDetector = if not flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes then var94 else nil,
			BoundsChecker = if var34 then reactModule.createElement(var29, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var62,
				Size = UDim2.new(1, 0, 1, var86),
				ref = var37
			}) else nil
		})
	end
	local var104
	t_3.TextBox = createElement_2
	
	if var34 and var57 then
		var104 = reactModule.createElement
		var104 = var104(var29, {
			text = var31.text,
			placeholder = var31.placeholder,
			textInputType = var31.textInputType,
			fontStyle = fontStyle,
			textStyle = var62,
			isMultiLine = var34,
			isDisabled = var31.isDisabled,
			padding = var83,
			ref = var98,
			tag = `{var55 or ""} data-testid={var31.testId}--mobile-textbox`,
			Interactable = if flagsModule.FoundationRemoveSecondUIDDFromScrubbableTextboxes and var94 ~= nil then var43 else nil,
			Size = uDim2,
			onFocusLost = if var34 and var59 then var77 else nil,
			onTextChanged = var72,
			onCursorPositionChanged = if var34 then var90 else nil
		})
	else
		var104 = nil
	end
	t_3.MobileTextBox = var104
	t_1.TextBoxWrapper = createElement_1(var101, t_2, t_3)
	t_1.Clear = if var31.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = var31.isDisabled,
		GroupTransparency = if var31.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var31.text, function(p25) --[[ line: 802 ]]
			return p25 ~= ""
		end),
		tag = var54.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var71,
			padding = UDim.new(0, var54.clearButton.padding),
			Position = var97,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var31.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var54.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var31.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-0-full auto-x",
		GroupTransparency = if var31.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = `{var31.testId}--trailing`
	}, var31.trailingElement) else nil
	
	return createElement(viewModule, var99, t_1)
end))