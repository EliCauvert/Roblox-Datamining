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
local controlStateModule = require(foundation.Enums.ControlState)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local t = {
	numLines = 1,
	testId = "--foundation-internal-text-input",
	Selectable = true,
	size = inputSizeModule.Large,
	variant = inputVariantModule.Standard
}
local var30 = reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 131 ]]
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

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 177 | named "InternalTextInput" ]]
	-- upvalues: flagsModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), getDisabledStyleModule (ref), inputFocusBehaviorModule (ref), controlStateModule (ref), getMultiLineTextHeightModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), radiusModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var30 (ref), mapBindableModule (ref), iconModule (ref)
	if flagsModule.FoundationInputSelectionProps and p2.Selectable == nil then
		p2.Selectable = true
	end
	local var32 = withDefaultsModule(p2, t)
	local var33 = useTokensModule()
	local maxValue = math.max(1, var32.numLines)
	local var35 = maxValue > 1
	local var36 = reactModule.useRef(nil)
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef("")
	local var41 = reactModule.useRef(getBindableValueModule(var32.text))
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useRef(Vector2.zero)
	local var44 = nil
	local var45 = nil
	
	if not flagsModule.FoundationTextInputsBetaUpdate then
		local var46, var47 = reactModule.useState(false)
		var44 = var46
		var45 = var47
	end
	local createElement_2
	local var48, var49 = reactModule.useState(false)
	local var50 = useTextInputVariantsModule(var33, var32.size, var32.variant, var32.radius, var48, if flagsModule.FoundationTextInputsBetaUpdate then nil else var44, var32.hasError)
	local container = var50.container
	local var51 = useStyleTagsModule(var50.textBox.tag)
	local var52 = usePreferredInputModule()
	local var53, var54 = reactModule.useState(false)
	local var55 = var52 == Enum.PreferredInput.Touch
	local standard = var33.Stroke.Standard
	local var56 = math.ceil(standard) * 2
	local var57 = math.ceil(var33.Stroke.Thick) * 2
	local var58 = getDisabledStyleModule(var33.Color.Content.Emphasis, var32.isDisabled)
	local fontStyle = var50.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var59 = reactModule.useCallback(function(p4) --[[ line: 230 ]]
		-- upvalues: var36 (ref), var37 (ref)
		if var36.current then
			var36.current.SelectionStart = p4
		end
		if var37.current then
			var37.current.SelectionStart = p4
		end
	end, {})
	local var60 = reactModule.useCallback(function(p5) --[[ line: 239 ]]
		-- upvalues: var36 (ref), var37 (ref)
		if var36.current then
			var36.current.CursorPosition = p5
		end
		if var37.current then
			var37.current.CursorPosition = p5
		end
	end, {})
	local var61 = reactModule.useCallback(function() --[[ line: 248 ]]
		-- upvalues: var36 (ref), var37 (ref), var59 (ref), var60 (ref)
		local current = var36.current or var37.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var59(0)
			var60(charCount + 1)
		end
	end, { var59, var60 })
	local var62 = reactModule.useCallback(function() --[[ line: 261 ]]
		-- upvalues: flagsModule (copy), var36 (ref), var32 (ref), inputFocusBehaviorModule (copy), var61 (ref)
		if flagsModule.FoundationTextInputHighlightFix then
			if var36.current == nil then return end
			var36.current:CaptureFocus()
			
			if var32.focusBehavior == inputFocusBehaviorModule.Highlight then
				task.spawn(var61)
				
				return
			end
		elseif var36.current then
			var36.current:CaptureFocus()
		end
	end, {
		if flagsModule.FoundationTextInputHighlightFix then var61 else nil,
		if flagsModule.FoundationTextInputHighlightFix then var32.focusBehavior else nil
	})
	local var63 = reactModule.useCallback(function() --[[ line: 282 ]]
		-- upvalues: var36 (ref)
		if var36.current then
			var36.current:ReleaseFocus()
		end
	end, {})
	local var64 = reactModule.useCallback(function() --[[ line: 288 ]]
		-- upvalues: var36 (ref)
		return if var36.current then var36.current:IsFocused() else nil
	end, {})
	local var65 = reactModule.useCallback(function() --[[ line: 295 ]]
		-- upvalues: var36 (ref)
		return if var36.current then var36.current.SelectionStart else nil
	end, {})
	local var66 = reactModule.useCallback(function() --[[ line: 302 ]]
		-- upvalues: var36 (ref)
		return if var36.current then var36.current.CursorPosition else nil
	end, {})
	local var67 = reactModule.useCallback(function() --[[ line: 309 ]]
		-- upvalues: var36 (ref)
		if var36.current then
			var36.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p3, function() --[[ line: 317 ]]
		-- upvalues: var64 (ref), var62 (ref), var63 (ref), flagsModule (copy), var45 (write), var65 (ref), var66 (ref), var60 (ref), var59 (ref)
		return {
			getIsFocused = var64,
			focus = var62,
			releaseFocus = var63,
			setHover = if flagsModule.FoundationTextInputsBetaUpdate then nil else var45,
			getSelectionStart = var65,
			getCursorPosition = var66,
			setCursorPosition = var60,
			setSelectionStart = var59
		}
	end, {
		var66, var64, var65, var62, var63, var60, var59
	})
	local var68 = reactModule.useCallback(function(p6) --[[ line: 340 ]]
		-- upvalues: var40 (ref), var41 (ref), var35 (ref), var38 (ref), var32 (ref)
		if p6 == nil or p6.Parent == nil or var40.current ~= "" then return end
		local text = p6.Text
		
		if text == var41.current then return end
		var41.current = text
		
		if var35 and var38.current then
			var38.current.Text = text
		end
		var32.onChanged(text)
	end, { var32.onChanged, var35, var53 })
	local var69 = reactModule.useRef(false)
	local var70 = reactModule.useCallback(function() --[[ line: 362 ]]
		-- upvalues: var32 (ref), var35 (ref), var55 (ref), var36 (ref), var40 (ref), var54 (ref), var49 (ref), inputFocusBehaviorModule (copy), var37 (ref), flagsModule (copy), var69 (ref), var59 (ref), var60 (ref)
		if var32.isDisabled then return end
		if var35 and var55 then
			if var36.current and var36.current.Parent then
				var40.current = var36.current.Text
			end
			var54(true)
		end
		var49(true)
		
		if var32.onFocus then
			var32.onFocus()
		end
		local focusBehavior = var32.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var40.current = ""
			
			if var36.current then
				var36.current.Text = ""
			end
			if var37.current then
				var37.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			if flagsModule.FoundationTextInputHighlightFix then
				var69.current = true
				
				return
			end
			task.spawn(function() --[[ line: 395 ]]
				-- upvalues: var36 (copy), var37 (copy), var59 (copy), var60 (copy)
				local current = var36.current or var37.current
				
				if current and current.Parent ~= nil then
					local charCount = utf8.len(current.Text)
					
					if charCount then
						var59(0)
						var60(charCount + 1)
					end
				end
			end)
		end
	end, {
		var32.onFocus, var32.isDisabled, var55, var35, var32.focusBehavior,
		if not flagsModule.FoundationTextInputHighlightFix then var59 else nil,
		if not flagsModule.FoundationTextInputHighlightFix then var60 else nil
	})
	local var71 = reactModule.useCallback(function(_, p7) --[[ line: 419 ]]
		-- upvalues: flagsModule (copy), var69 (ref)
		if not flagsModule.FoundationTextInputHighlightFix then return end
		if p7.UserInputType == Enum.UserInputType.MouseMovement then
			var69.current = false
		end
	end, {})
	local var72 = reactModule.useCallback(function(_, p8) --[[ line: 430 ]]
		-- upvalues: flagsModule (copy), var69 (ref), var61 (ref)
		if not flagsModule.FoundationTextInputHighlightFix then return end
		if not var69.current then return end
		var69.current = false
		
		if p8.UserInputType == Enum.UserInputType.MouseButton1 then
			var61()
			
			return
		end
	end, {
		if flagsModule.FoundationTextInputHighlightFix then var59 else nil,
		if flagsModule.FoundationTextInputHighlightFix then var60 else nil,
		if flagsModule.FoundationTextInputHighlightFix then var61 else nil
	})
	local var73 = reactModule.useCallback(function(_, p9, p10) --[[ line: 454 ]]
		-- upvalues: var49 (ref), var69 (ref), var35 (ref), var54 (ref), var32 (ref)
		var49(false)
		var69.current = false
		
		if var35 then
			var54(false)
		end
		if var32.onFocusLost then
			var32.onFocusLost(p10)
		end
		if p9 and var32.onReturnPressed then
			var32.onReturnPressed()
		end
	end, { var32.onReturnPressed, var35, var32.onFocusLost })
	local var74 = if flagsModule.FoundationTextInputsBetaUpdate then nil else reactModule.useCallback(function(p11) --[[ line: 476 ]]
		-- upvalues: var45 (write), controlStateModule (copy)
		var45(p11 == controlStateModule.Hover)
	end, {})
	local var75 = reactModule.useCallback(function(p12, p13) --[[ line: 480 ]]
		-- upvalues: var42 (ref), var32 (ref)
		var42.current = p13
		
		if var32.onDragStarted then
			var32.onDragStarted(p12, p13)
		end
	end, { var32.onDragStarted })
	local var76 = reactModule.useCallback(function(p14, p15) --[[ line: 487 ]]
		-- upvalues: var32 (ref)
		if var32.onDrag then
			var32.onDrag(p14, p15)
		end
	end, { var32.onDrag })
	local var77 = reactModule.useCallback(function(p16, p17) --[[ line: 493 ]]
		-- upvalues: var42 (ref), var62 (ref), var63 (ref), var49 (ref), var32 (ref)
		if var42.current == p17 then
			var62()
		else
			var63()
			var49(false)
		end
		var42.current = nil
		
		if var32.onDragEnded then
			var32.onDragEnded(p16, p17)
		end
	end, { var32.onDragEnded })
	local var78 = reactModule.useMemo(function() --[[ line: 506 ]]
		-- upvalues: container (ref), var33 (ref)
		return {
			radius = UDim.new(0, container.radius),
			offset = var33.Stroke.Thick,
			borderWidth = var33.Stroke.Thick
		}
	end, { var33, container.radius })
	local var79 = reactModule.useMemo(function() --[[ line: 514 ]]
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), maxValue (ref), lineHeight (ref)
		return getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	end, { fontSize, maxValue, lineHeight })
	local var80, var81 = reactModule.useMemo(function() --[[ line: 519 ]]
		-- upvalues: container (ref), var56 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var79 (ref)
		local var106 = math.round((container.minHeight - var56 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var106 / 2)),
			bottom = UDim.new(0, math.ceil(var106 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var79 + math.round(var106) + var56
	end, {
		container.minHeight, var56, var57, fontSize, var79, lineHeight
	})
	local var82 = if flagsModule.FoundationSupportPrefixSuffixNumberInput then reactModule.useMemo(function() --[[ line: 549 ]]
		-- upvalues: var32 (ref)
		return {
			left = if var32.horizontalPadding then var32.horizontalPadding.innerLeft else nil,
			right = if var32.horizontalPadding then var32.horizontalPadding.innerRight else nil
		}
	end, { var32.horizontalPadding }) else nil
	local var83 = var80.bottom.Offset + var80.top.Offset
	local uDim2 = UDim2.new(1, 0, 0, var79 + var83)
	local var85 = reactModule.useMemo(function() --[[ line: 560 ]]
		-- upvalues: var35 (ref)
		return if var35 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		} else nil
	end, { var35 })
	local var86 = reactModule.useMemo(function() --[[ line: 569 ]]
		-- upvalues: var35 (ref)
		return if var35 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var35 })
	local var87 = reactModule.useCallback(function(p18) --[[ line: 580 ]]
		-- upvalues: var39 (ref), var38 (ref), truncateTextToCursorModule (copy), var80 (ref)
		local current = var39.current
		local current_1 = var38.current
		
		if current == nil or current_1 == nil then return end
		local var107 = p18.TextSize * p18.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p18)
		local y_1 = current_1.TextBounds.Y
		local var108 = y - var80.top.Offset + var80.bottom.Offset
		local var109 = y + current.AbsoluteSize.Y - var80.top.Offset - var80.bottom.Offset
		
		if y_1 - var107 < var108 then
			current.CanvasPosition += Vector2.new(0, y_1 - var107 - var108)
		end
		if var109 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var109)
		end
	end, { var80 })
	local var88 = reactModule.useCallback(function(p19) --[[ line: 613 ]]
		-- upvalues: var39 (ref), var43 (ref)
		if p19 == nil then
			return
		end
		var39.current = p19
		p19.ClipsDescendants = true
		p19.CanvasPosition = var43.current
	end, {})
	local var89 = reactModule.useCallback(function(p20) --[[ line: 623 ]]
		-- upvalues: var40 (ref), flagsModule (copy)
		if p20 then
			p20.Text = var40.current
			var40.current = ""
			
			if flagsModule.FoundationTextAreaDelayMobileFocus then
				task.delay(0, function() --[[ line: 628 ]]
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
	local var90 = reactModule.useCallback(function(p21) --[[ line: 639 ]]
		-- upvalues: var43 (ref)
		var43.current = p21.CanvasPosition
	end, {})
	local var91 = reactModule.useMemo(function() --[[ line: 643 ]]
		-- upvalues: var32 (ref), reactModule (copy), var75 (ref), var76 (ref), var77 (ref), var48 (ref)
		return if var32.onDragStarted or var32.onDrag or var32.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var75,
			[reactModule.Event.DragContinue] = var76,
			[reactModule.Event.DragEnd] = var77,
			Enabled = not var48 and not var32.isDisabled
		}) else nil
	end, {
		var75,
		var76,
		var77,
		var48,
		var32.isDisabled
	})
	local var92 = useBindableModule(if var32.horizontalPadding then var32.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var93 = useBindableModule(if var32.horizontalPadding then var32.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var94 = reactModule.useMemo(function() --[[ line: 663 ]]
		-- upvalues: var32 (ref), container (ref), var33 (ref)
		return if var32.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var33.Stroke.Standard) / 2) else nil
	end, {
		var32.hasClearButton,
		container.minHeight,
		var33.Stroke.Standard
	})
	local var95 = reactUtilsModule.useComposedRef(var37, var89)
	local createElement = reactModule.createElement
	local var96 = withCommonPropsModule(var32, {
		ref = var32.inputRef,
		Size = UDim2.new(1, 0, 0, var81),
		selection = {
			Selectable = if flagsModule.FoundationInputSelectionProps then var32.Selectable and not var32.isDisabled else not var32.isDisabled,
			NextSelectionUp = if flagsModule.FoundationInputSelectionProps then var32.NextSelectionUp else nil,
			NextSelectionDown = if flagsModule.FoundationInputSelectionProps then var32.NextSelectionDown else nil,
			NextSelectionLeft = if flagsModule.FoundationInputSelectionProps then var32.NextSelectionLeft else nil,
			NextSelectionRight = if flagsModule.FoundationInputSelectionProps then var32.NextSelectionRight else nil
		},
		cursor = var78,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if var32.isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var48 or var44 and not flagsModule.FoundationTextInputsBetaUpdate then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = if var32.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil,
		padding = {
			left = var92:map(function(p22) --[[ line: 708 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p22
			end),
			right = if var32.trailingElement == nil and var32.hasClearButton then UDim.new(0, standard) else var93:map(function(p23) --[[ line: 714 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p23
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not var32.isDisabled then var62 else nil,
		onStateChanged = if flagsModule.FoundationTextInputsBetaUpdate then nil else var74,
		isDisabled = var32.isDisabled,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var32.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var32.isDisabled) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = container.tag,
		testId = `{var32.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var91,
		Background = var32.backgroundGradient,
		Leading = if var32.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var32.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var32.testId}--leading`
		}, var32.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var98 = if var35 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var86,
		layout = var85,
		onCanvasPositionChanged = if var35 then var90 else nil,
		scrollingFrameRef = if var35 then var88 else nil,
		padding = if flagsModule.FoundationSupportPrefixSuffixNumberInput then var82 else nil,
		testId = `{var32.testId}--textbox-wrapper`
	}
	local t_3 = {}
	
	if var53 then
		createElement_2 = nil
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(var30, {
			text = var32.text,
			placeholder = var32.placeholder,
			textInputType = var32.textInputType,
			fontStyle = fontStyle,
			textStyle = var58,
			isMultiLine = var35,
			isDisabled = var32.isDisabled,
			ref = var36,
			tag = `{var51 or ""} data-testid={var32.testId}--textbox`,
			Size = if var35 then uDim2 else nil,
			automaticSize = mapBindableModule(var32.text, function(p24) --[[ line: 769 ]]
				-- upvalues: var35 (ref), var53 (ref)
				return if var35 and not var53 and p24 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var80,
			onFocusGained = var70,
			onFocusLost = if var35 and var55 then nil else var73,
			onTextChanged = var68,
			onCursorPositionChanged = if var35 then var87 else nil,
			onInputChanged = var71,
			onInputEnded = var72
		}, {
			DragDetector = var91,
			BoundsChecker = if var35 then reactModule.createElement(var30, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var58,
				Size = UDim2.new(1, 0, 1, var83),
				ref = var38
			}) else nil
		})
	end
	local var101
	t_3.TextBox = createElement_2
	
	if var35 and var53 then
		var101 = reactModule.createElement
		var101 = var101(var30, {
			text = var32.text,
			placeholder = var32.placeholder,
			textInputType = var32.textInputType,
			fontStyle = fontStyle,
			textStyle = var58,
			isMultiLine = var35,
			isDisabled = var32.isDisabled,
			padding = var80,
			ref = var95,
			tag = `{var51 or ""} data-testid={var32.testId}--mobile-textbox`,
			Size = uDim2,
			onFocusLost = if var35 and var55 then var73 else nil,
			onTextChanged = var68,
			onCursorPositionChanged = if var35 then var87 else nil
		})
	else
		var101 = nil
	end
	t_3.MobileTextBox = var101
	t_1.TextBoxWrapper = createElement_1(var98, t_2, t_3)
	t_1.Clear = if var32.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = var32.isDisabled,
		GroupTransparency = if var32.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var32.text, function(p25) --[[ line: 824 ]]
			return p25 ~= ""
		end),
		tag = var50.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var67,
			padding = UDim.new(0, var50.clearButton.padding),
			Position = var94,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var32.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var50.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var32.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		tag = "size-0-full auto-x",
		GroupTransparency = if var32.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = `{var32.testId}--trailing`
	}, var32.trailingElement) else nil
	
	return createElement(viewModule, var96, t_1)
end))