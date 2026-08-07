local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
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
local blendTransparenciesModule = require(foundation.Utility.blendTransparencies)
local getBindableValueModule = require(foundation.Utility.getBindableValue)
local getDisabledStyleModule = require(foundation.Utility.getDisabledStyle)
local getMultiLineTextHeightModule = require(foundation.Utility.getMultiLineTextHeight)
local isPluginSecurityModule = require(foundation.Utility.isPluginSecurity)
local mapBindableModule = require(foundation.Utility.mapBindable)
local truncateTextToCursorModule = require(foundation.Components.InternalTextInput.truncateTextToCursor)
local chatTextAreaDebugModule = require(script.Parent.chatTextAreaDebug)
local measureTextLineCountModule = require(script.Parent.measureTextLineCount)
local useComposerFocusLockModule = require(script.Parent.useComposerFocusLock)
local useComposerKeyboardConnectionsModule = require(script.Parent.useComposerKeyboardConnections)
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
local var32 = reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 142 ]]
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
		ManualFocusRelease = if p0.manualFocusRelease then true else nil,
		ShouldEmitReturnEvents = if p0.shouldEmitReturnEvents then true else nil,
		OverlayNativeInput = if p0.overlayNativeInput then true else nil,
		Size = if p0.Size ~= nil then UDim2.fromScale(1, 1) else p0.Size,
		AutomaticSize = p0.automaticSize,
		Text = if isBoundsChecker then nil elseif typeof(p0.text) == "string" then p0.text else p0.text,
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

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 191 | named "InternalTextInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), useComposerFocusLockModule (ref), getDisabledStyleModule (ref), getMultiLineTextHeightModule (ref), chatTextAreaDebugModule (ref), measureTextLineCountModule (ref), inputFocusBehaviorModule (ref), useComposerKeyboardConnectionsModule (ref), controlStateModule (ref), radiusModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var32 (ref), mapBindableModule (ref), iconModule (ref)
	local var34 = p2
	
	if p2.Selectable == nil then
		var34 = table.clone(p2)
		var34.Selectable = true
	end
	local createElement_3
	local var35 = withDefaultsModule(var34, t)
	local var36 = useTokensModule()
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useRef("")
	local var42 = reactModule.useRef(getBindableValueModule(var35.text))
	local var43 = reactModule.useRef(nil)
	local var44 = reactModule.useRef(Vector2.zero)
	local var45 = reactModule.useRef(false)
	local var46 = reactModule.useRef(0)
	local var47, var48 = reactModule.useState(false)
	local var49, var50 = reactModule.useState(false)
	local var51 = useTextInputVariantsModule(var36, var35.size, var35.variant, var35.radius, var49, var35.hasError)
	local container = var51.container
	local var52 = if var35.trailingElement and typeof(container.tag) == "string" then string.gsub(container.tag, "gap%-large", "gap-xsmall") else container.tag
	local var53 = useStyleTagsModule(var51.textBox.tag)
	local isDisabled = var35.isDisabled
	local var54 = var35.isDisabled and var35.trailingElement == nil
	local var55 = usePreferredInputModule()
	local var56, var57 = reactModule.useState(false)
	local var58 = var55 == Enum.PreferredInput.Touch
	local standard = var36.Stroke.Standard
	local var59 = math.ceil(standard) * 2
	local var60 = math.ceil(var36.Stroke.Thick) * 2
	useComposerFocusLockModule(isDisabled == true, { var37, var38 })
	local var61 = getDisabledStyleModule(var36.Color.Content.Emphasis, isDisabled)
	local fontStyle = var51.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var62 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
	local var63, var64 = reactModule.useState(1)
	local var65, var66 = reactModule.useState(var62)
	local var67 = var35.maxLines ~= nil
	local var68, var69 = reactModule.useState(function() --[[ line: 246 ]]
		-- upvalues: getBindableValueModule (copy), var35 (ref)
		return getBindableValueModule(var35.text)
	end)
	reactModule.useEffect(function() --[[ line: 250 ]]
		-- upvalues: chatTextAreaDebugModule (copy), var35 (ref)
		chatTextAreaDebugModule.setEnabled(var35.composerDebug == true)
		
		return function() --[[ line: 252 ]] end
	end, { var35.composerDebug })
	local var70 = reactModule.useCallback(function() --[[ line: 255 ]]
		-- upvalues: var37 (ref), var38 (ref)
		local current = var37.current or var38.current
		
		return if current and current.AbsoluteSize.X > 0 then current.AbsoluteSize.X else 0
	end, {})
	local var71 = reactModule.useCallback(function(p4) --[[ line: 264 ]]
		-- upvalues: measureTextLineCountModule (copy), var35 (ref), var62 (ref), var70 (ref), fontStyle (ref), fontSize (ref), var66 (ref)
		local var136 = measureTextLineCountModule({
			text = p4,
			maxLines = var35.maxLines,
			singleLineHeight = var62,
			layoutWidth = var70(),
			font = fontStyle.Font,
			fontSize = fontSize
		})
		var66(math.max(if var136.boundsY and var136.boundsY > 0 then math.ceil(var136.boundsY) else var62, var136.lineCount * var62))
		
		return var136.lineCount
	end, {
		fontSize, lineHeight, fontStyle.Font, var35.maxLines, var70, var62
	})
	local var72 = if var67 then var35.text else getBindableValueModule(var35.text)
	local var73 = if var35.maxLines then var63 else math.max(1, var35.numLines)
	local var74 = if var35.alwaysMultiLine then true else var73 > 1
	reactModule.useEffect(function() --[[ line: 295 ]]
		-- upvalues: var67 (ref), getBindableValueModule (copy), var35 (ref), var42 (ref), chatTextAreaDebugModule (copy), var69 (ref), var64 (ref), var71 (ref)
		if not var67 then
			return function() --[[ line: 297 ]] end
		end
		local var137 = getBindableValueModule(var35.text)
		
		if var137 ~= var42.current then
			chatTextAreaDebugModule.log("syncFromParent", `len={utf8.len(var137) or #var137}`)
			var42.current = var137
			var69(var137)
			var64(var71(var137))
			task.defer(function() --[[ line: 305 ]]
				-- upvalues: var64 (copy), var71 (copy), var137 (ref)
				var64(var71(var137))
			end)
		end
		return function() --[[ line: 309 ]] end
	end, { var35.text, var71, var67 })
	local var75 = reactModule.useCallback(function(p5) --[[ line: 312 ]]
		-- upvalues: var37 (ref), var38 (ref)
		if var37.current then
			var37.current.SelectionStart = p5
		end
		if var38.current then
			var38.current.SelectionStart = p5
		end
	end, {})
	local var76 = reactModule.useCallback(function(p6) --[[ line: 321 ]]
		-- upvalues: var37 (ref), var38 (ref)
		if var37.current then
			var37.current.CursorPosition = p6
		end
		if var38.current then
			var38.current.CursorPosition = p6
		end
	end, {})
	local var77 = reactModule.useCallback(function() --[[ line: 330 ]]
		-- upvalues: var37 (ref), var38 (ref), var75 (ref), var76 (ref)
		local current = var37.current or var38.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var75(0)
			var76(charCount + 1)
		end
	end, { var75, var76 })
	local var78 = reactModule.useCallback(function() --[[ line: 344 ]]
		-- upvalues: var37 (ref), var35 (ref), inputFocusBehaviorModule (copy), var77 (ref)
		if var37.current == nil then return end
		var37.current:CaptureFocus()
		
		if var35.focusBehavior == inputFocusBehaviorModule.Highlight then
			task.spawn(var77)
		end
	end, { var77, var35.focusBehavior })
	local var79 = reactModule.useCallback(function() --[[ line: 361 ]]
		-- upvalues: var37 (ref), var38 (ref), var57 (ref), var50 (ref)
		if var37.current then
			var37.current:ReleaseFocus()
		end
		if var38.current then
			var38.current:ReleaseFocus()
		end
		var57(false)
		var50(false)
	end, {})
	local var80 = reactModule.useCallback(function() --[[ line: 372 ]]
		-- upvalues: var37 (ref)
		return if var37.current then var37.current:IsFocused() else nil
	end, {})
	local var81 = reactModule.useCallback(function() --[[ line: 379 ]]
		-- upvalues: var37 (ref)
		return if var37.current then var37.current.SelectionStart else nil
	end, {})
	local var82 = reactModule.useCallback(function() --[[ line: 386 ]]
		-- upvalues: var37 (ref)
		return if var37.current then var37.current.CursorPosition else nil
	end, {})
	local var83 = reactModule.useCallback(function() --[[ line: 393 ]]
		-- upvalues: var37 (ref)
		if var37.current then
			var37.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p3, function() --[[ line: 401 ]]
		-- upvalues: var80 (ref), var78 (ref), var79 (ref), var48 (ref), var81 (ref), var82 (ref), var76 (ref), var75 (ref)
		return {
			getIsFocused = var80,
			focus = var78,
			releaseFocus = var79,
			setHover = var48,
			getSelectionStart = var81,
			getCursorPosition = var82,
			setCursorPosition = var76,
			setSelectionStart = var75
		}
	end, {
		var82, var80, var81, var78, var79, var76, var75
	})
	local var84 = reactModule.useCallback(function(p7) --[[ line: 425 ]]
		-- upvalues: var41 (ref), var45 (ref), var42 (ref), var74 (ref), var39 (ref), var67 (ref), var69 (ref), var35 (ref), var64 (ref), var71 (ref)
		if p7 == nil or p7.Parent == nil or var41.current ~= "" then return end
		local text = p7.Text
		
		if var45.current and text ~= "" then return end
		if text == var42.current then return end
		var42.current = text
		
		if var74 and var39.current then
			var39.current.Text = text
		end
		if var67 then
			var69(text)
		end
		if var35.maxLines then
			var64(var71(text))
			task.defer(function() --[[ line: 451 ]]
				-- upvalues: var64 (copy), var71 (copy), text (ref)
				var64(var71(text))
			end)
		end
		var35.onChanged(text)
	end, {
		var35.onChanged, var74, var56, var35.maxLines, var71, var67
	})
	local var85 = reactModule.useRef(false)
	local var86 = reactModule.useCallback(function(_, p8) --[[ line: 463 ]]
		-- upvalues: var85 (ref)
		if p8.UserInputType == Enum.UserInputType.MouseMovement then
			var85.current = false
		end
	end, {})
	local var87 = reactModule.useCallback(function(_, p9) --[[ line: 470 ]]
		-- upvalues: var85 (ref), var77 (ref)
		if not var85.current then return end
		var85.current = false
		
		if p9.UserInputType == Enum.UserInputType.MouseButton1 then
			var77()
			
			return
		end
	end, { var75, var76, var77 })
	local var88 = reactModule.useCallback(function(p10) --[[ line: 489 ]]
		-- upvalues: var42 (ref), var67 (ref), var69 (ref), var35 (ref), var64 (ref), var71 (ref)
		var42.current = p10
		
		if var67 then
			var69(p10)
		end
		if var35.maxLines then
			var64(var71(p10))
		end
		var35.onChanged(p10)
	end, { var35.maxLines, var71, var35.onChanged, var67 })
	local var89 = var35.onReturnPressed ~= nil and not var58
	local var90 = reactModule.useCallback(function(_, p11) --[[ line: 502 ]]
		-- upvalues: var35 (ref), var46 (ref), chatTextAreaDebugModule (copy), var45 (ref)
		if var35.onReturnPressed == nil then return end
		local processTime = os.clock()
		
		if processTime - var46.current < 0.15 then
			chatTextAreaDebugModule.log("returnSubmit", `source={p11} skipped=debounced`)
			
			return
		end
		chatTextAreaDebugModule.log("returnSubmit", `source={p11}`)
		var46.current = processTime
		var45.current = true
		var35.onReturnPressed()
		task.delay(0.15, function() --[[ line: 518 ]]
			-- upvalues: var45 (copy)
			var45.current = false
		end)
	end, { var35.onReturnPressed })
	local var91 = useComposerKeyboardConnectionsModule({
		enabled = var89 == true,
		onReturnPressed = reactModule.useCallback(function(_, p12) --[[ line: 523 ]]
			-- upvalues: var37 (ref), chatTextAreaDebugModule (copy), var88 (ref), var90 (ref)
			local current = var37.current
			
			if current == nil or current:IsFocused() ~= true then return end
			if p12 then
				local text = current.Text
				task.defer(function() --[[ line: 531 ]]
					-- upvalues: current (ref), text (ref), chatTextAreaDebugModule (copy), var88 (copy)
					if current.Parent == nil then return end
					local text_1 = current.Text
					
					if text_1 ~= text then
						chatTextAreaDebugModule.log("returnNewline", "source=UserInputService.InputBegan-shift engineInserted=true")
						var88(text_1)
					end
				end)
				
				return
			end
			var90(current, "UserInputService.InputBegan")
		end, { var90, var88 })
	})
	local connect = var91.connect
	local disconnect = var91.disconnect
	local var92 = reactModule.useCallback(function() --[[ line: 560 ]]
		-- upvalues: isDisabled (ref), var74 (ref), var58 (ref), var37 (ref), var41 (ref), var57 (ref), var50 (ref), var35 (ref), var89 (ref), connect (ref), inputFocusBehaviorModule (copy), var38 (ref), var85 (ref)
		if isDisabled then return end
		if var74 and var58 then
			if var37.current and var37.current.Parent then
				var41.current = var37.current.Text
			end
			var57(true)
		end
		var50(true)
		
		if var35.onFocus then
			var35.onFocus()
		end
		if var89 then
			connect()
		end
		local focusBehavior = var35.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var41.current = ""
			
			if var37.current then
				var37.current.Text = ""
			end
			if var38.current then
				var38.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var85.current = true
		end
	end, {
		var35.onFocus, isDisabled, var58, var74, var35.focusBehavior, var89, connect
	})
	local var93 = reactModule.useCallback(function(p13, p14) --[[ line: 608 ]]
		-- upvalues: var87 (ref)
		var87(p13, p14)
	end, { var87 })
	local var94 = reactModule.useCallback(function(p15, p16, p17) --[[ line: 613 ]]
		-- upvalues: chatTextAreaDebugModule (copy), var89 (ref), disconnect (ref), var50 (ref), var85 (ref), var74 (ref), var57 (ref), var35 (ref), var90 (ref)
		chatTextAreaDebugModule.log("textBox.FocusLost", `enterPressed={p16}`)
		
		if var89 then
			disconnect()
		end
		var50(false)
		var85.current = false
		
		if var74 then
			var57(false)
		end
		if var35.onFocusLost then
			var35.onFocusLost(p17)
		end
		if p16 and var89 then
			var90(p15, "TextBox.FocusLost")
		end
	end, {
		var74,
		var35.onFocusLost,
		var89,
		var90,
		disconnect
	})
	local var95 = reactModule.useCallback(function(p18) --[[ line: 644 ]]
		-- upvalues: var48 (ref), controlStateModule (copy)
		var48(p18 == controlStateModule.Hover)
	end, {})
	local var96 = reactModule.useCallback(function(p19, p20) --[[ line: 648 ]]
		-- upvalues: var43 (ref), var35 (ref)
		var43.current = p20
		
		if var35.onDragStarted then
			var35.onDragStarted(p19, p20)
		end
	end, { var35.onDragStarted })
	local var97 = reactModule.useCallback(function(p21, p22) --[[ line: 655 ]]
		-- upvalues: var35 (ref)
		if var35.onDrag then
			var35.onDrag(p21, p22)
		end
	end, { var35.onDrag })
	local var98 = reactModule.useCallback(function(p23, p24) --[[ line: 661 ]]
		-- upvalues: var43 (ref), var78 (ref), var79 (ref), var50 (ref), var35 (ref)
		if var43.current == p24 then
			var78()
		else
			var79()
			var50(false)
		end
		var43.current = nil
		
		if var35.onDragEnded then
			var35.onDragEnded(p23, p24)
		end
	end, { var35.onDragEnded, var78, var79 })
	local var99 = if var35.maxLines then getMultiLineTextHeightModule(fontSize, var35.maxLines, lineHeight) else nil
	local var100 = reactModule.useMemo(function() --[[ line: 678 ]]
		-- upvalues: var35 (ref), var62 (ref), var65 (ref), var99 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), var73 (ref), lineHeight (ref)
		return if var35.maxLines then math.clamp(math.max(var62, var65), var62, var99) else getMultiLineTextHeightModule(fontSize, var73, lineHeight)
	end, {
		var35.maxLines, var62, var65, var99, fontSize, var73, lineHeight
	})
	local var101 = reactModule.useMemo(function() --[[ line: 700 ]]
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), container (ref), var59 (ref)
		local var141 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
		
		return UDim.new(0, math.ceil((var141 + math.round(math.round((container.minHeight - var59 - var141) * 2) / 2) + var59) / 2))
	end, { container.minHeight, var59, fontSize, lineHeight })
	local var102 = reactModule.useMemo(function() --[[ line: 709 ]]
		-- upvalues: var35 (ref), var101 (ref), radiusModule (copy), container (ref)
		return if var35.maxLines then var101 elseif var35.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil
	end, {
		var35.maxLines,
		var101,
		container.minHeight,
		var35.radius
	})
	local var103 = reactModule.useMemo(function() --[[ line: 719 ]]
		-- upvalues: var102 (ref), container (ref), var36 (ref)
		return {
			radius = var102 or UDim.new(0, container.radius),
			offset = var36.Stroke.Thick,
			borderWidth = var36.Stroke.Thick
		}
	end, { var36, container.radius, var102 })
	local var104, var105 = reactModule.useMemo(function() --[[ line: 728 ]]
		-- upvalues: container (ref), var59 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var100 (ref)
		local var142 = math.round((container.minHeight - var59 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var142 / 2)),
			bottom = UDim.new(0, math.ceil(var142 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var100 + math.round(var142) + var59
	end, {
		container.minHeight, var59, var60, fontSize, var100, lineHeight
	})
	local var106 = var104.bottom.Offset + var104.top.Offset
	local var107 = var35.textPaddingOnParent == true
	local var108 = if var107 then nil else var104
	local var109 = if var107 then var100 else var100 + var106
	local var110 = var74 and (var35.maxLines ~= nil and not var56)
	local var111 = if var110 then math.max(var109, if var107 then var65 else var65 + var106) else var109
	local var112 = if var107 then var111 + var106 else var111
	local uDim2 = UDim2.new(1, 0, 0, var111)
	local uDim2_1 = UDim2.new(1, 0, 0, var109)
	reactModule.useEffect(function() --[[ line: 776 ]]
		-- upvalues: var35 (ref), chatTextAreaDebugModule (copy), var73 (ref), var105 (ref)
		if var35.maxLines then
			chatTextAreaDebugModule.log("layout", `lineCount={var73} borderFrameHeight={var105}`)
		end
		return function() --[[ line: 780 ]] end
	end, { var73, var105, var35.maxLines })
	local var115 = reactModule.useMemo(function() --[[ line: 783 ]]
		-- upvalues: var74 (ref), var35 (ref)
		return if var74 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = if var35.maxLines ~= nil then Enum.ItemLineAlignment.Center else Enum.ItemLineAlignment.Start
		} else nil
	end, { var74, var35.maxLines })
	local var116 = reactModule.useMemo(function() --[[ line: 794 ]]
		-- upvalues: var74 (ref)
		return if var74 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var74 })
	local var117 = reactModule.useCallback(function(p25) --[[ line: 805 ]]
		-- upvalues: var40 (ref), var39 (ref), truncateTextToCursorModule (copy), var104 (ref)
		local current = var40.current
		local current_1 = var39.current
		
		if current == nil or current_1 == nil then return end
		local var143 = p25.TextSize * p25.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p25)
		local y_1 = current_1.TextBounds.Y
		local var144 = y - var104.top.Offset + var104.bottom.Offset
		local var145 = y + current.AbsoluteSize.Y - var104.top.Offset - var104.bottom.Offset
		
		if y_1 - var143 < var144 then
			current.CanvasPosition += Vector2.new(0, y_1 - var143 - var144)
		end
		if var145 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var145)
		end
	end, { var104 })
	local var118 = reactModule.useCallback(function(p26) --[[ line: 838 ]]
		-- upvalues: var40 (ref), var44 (ref)
		if p26 == nil then
			return
		end
		var40.current = p26
		p26.ClipsDescendants = true
		p26.CanvasPosition = var44.current
	end, {})
	local var119 = reactModule.useCallback(function(p27) --[[ line: 848 ]]
		-- upvalues: var41 (ref)
		if p27 then
			p27.Text = var41.current
			var41.current = ""
			task.delay(0, function() --[[ line: 852 ]]
				-- upvalues: p27 (ref)
				if p27.Parent ~= nil then
					p27:CaptureFocus()
				end
			end)
		end
	end, {})
	local var120 = reactModule.useCallback(function(p28) --[[ line: 860 ]]
		-- upvalues: var44 (ref)
		var44.current = p28.CanvasPosition
	end, {})
	local var121 = reactModule.useMemo(function() --[[ line: 865 ]]
		-- upvalues: var35 (ref), reactModule (copy), var96 (ref), var97 (ref), var98 (ref), var49 (ref), isDisabled (ref)
		return if var35.onDragStarted or var35.onDrag or var35.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var96,
			[reactModule.Event.DragContinue] = var97,
			[reactModule.Event.DragEnd] = var98,
			Enabled = not var49 and not isDisabled
		}) else nil
	end, {
		var96, var97, var98, var49, isDisabled, var35.onDragStarted, var35.onDrag,
		var35.onDragEnded
	})
	local var122 = useBindableModule(if var35.horizontalPadding then var35.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var123 = useBindableModule(if var35.horizontalPadding then var35.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var124 = reactModule.useMemo(function() --[[ line: 896 ]]
		-- upvalues: var35 (ref), container (ref), var36 (ref)
		return if var35.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var36.Stroke.Standard) / 2) else nil
	end, {
		var35.hasClearButton,
		container.minHeight,
		var36.Stroke.Standard
	})
	local var125 = reactUtilsModule.useComposedRef(var38, var119)
	local createElement = reactModule.createElement
	local var126 = withCommonPropsModule(var35, {
		Size = UDim2.new(1, 0, 0, var105),
		selection = {
			Selectable = var35.Selectable and not isDisabled,
			NextSelectionUp = var35.NextSelectionUp,
			NextSelectionDown = var35.NextSelectionDown,
			NextSelectionLeft = var35.NextSelectionLeft,
			NextSelectionRight = var35.NextSelectionRight
		},
		cursor = var103,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var49 or var47 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = var102,
		padding = {
			left = var122:map(function(p29) --[[ line: 936 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p29
			end),
			right = if var35.trailingElement == nil and var35.hasClearButton then UDim.new(0, standard) else var123:map(function(p30) --[[ line: 942 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p30
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not isDisabled then var78 else nil,
		onStateChanged = var95,
		isDisabled = var54,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var35.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var54) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = var52,
		testId = `{var35.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var121,
		Background = var35.backgroundGradient,
		Leading = if var35.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var54 then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var35.testId}--leading`
		}, var35.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var128 = if var74 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var116,
		layout = var115,
		onCanvasPositionChanged = if var74 then var120 else nil,
		scrollingFrameRef = if var74 then var118 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var131 = viewModule
	local t_4 = {
		Size = if var110 then UDim2.new(1, 0, 0, var112) else nil,
		tag = { ["fill size-full"] = not var110 },
		padding = if var107 then var104 else nil,
		selection = { Selectable = false },
		onActivated = if not isDisabled then var78 else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}
	local t_5 = {}
	
	if var56 then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(var32, {
			overlayNativeInput = nil,
			text = var72,
			placeholder = var35.placeholder,
			textInputType = var35.textInputType,
			fontStyle = fontStyle,
			textStyle = var61,
			isMultiLine = var74,
			isDisabled = isDisabled,
			ref = var37,
			tag = `{var53 or ""} data-testid={var35.testId}--textbox`,
			Size = if var74 then uDim2 else nil,
			automaticSize = if var35.maxLines then nil elseif not var67 then if var74 and not var56 and var68 ~= "" then Enum.AutomaticSize.Y else nil else mapBindableModule(var35.text, function(p31) --[[ line: 1012 ]]
				-- upvalues: var74 (ref), var56 (ref)
				return if var74 and not var56 and p31 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var108,
			onFocusGained = var92,
			onFocusLost = if var74 and var58 then nil else var94,
			onTextChanged = var84,
			onCursorPositionChanged = if var74 then var117 else nil,
			onInputChanged = var86,
			onInputEnded = var93,
			manualFocusRelease = if var58 then var35.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var58 and var35.manualFocusRelease == true and var35.alwaysMultiLine == true then true else nil
		}, {
			DragDetector = var121,
			BoundsChecker = if var74 then reactModule.createElement(var32, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var61,
				Size = if var107 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, var106),
				ref = var39
			}) else nil
		})
	end
	local var134
	t_5.TextBox = createElement_3
	
	if var74 and var56 then
		var134 = reactModule.createElement
		var134 = var134(var32, {
			overlayNativeInput = nil,
			text = var72,
			placeholder = var35.placeholder,
			textInputType = var35.textInputType,
			fontStyle = fontStyle,
			textStyle = var61,
			isMultiLine = var74,
			isDisabled = isDisabled,
			padding = var108,
			ref = var125,
			tag = `{var53 or ""} data-testid={var35.testId}--mobile-textbox`,
			Size = uDim2_1,
			onFocusLost = if var74 and var58 then var94 else nil,
			onTextChanged = var84,
			onCursorPositionChanged = if var74 then var117 else nil,
			onInputEnded = var93,
			manualFocusRelease = if var58 then var35.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var58 and var35.manualFocusRelease == true and var35.alwaysMultiLine == true then true else nil
		})
	else
		var134 = nil
	end
	t_5.MobileTextBox = var134
	t_3.TextContent = createElement_2(var131, t_4, t_5)
	t_1.TextBoxWrapper = createElement_1(var128, t_2, t_3)
	t_1.Clear = if var35.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = isDisabled,
		GroupTransparency = if isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var35.text, function(p32) --[[ line: 1085 ]]
			return p32 ~= ""
		end),
		tag = var51.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var83,
			padding = UDim.new(0, var51.clearButton.padding),
			Position = var124,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var35.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var51.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var35.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		GroupTransparency = if var54 then constantsModule.DISABLED_TRANSPARENCY else nil,
		tag = {
			["col align-y-bottom self-stretch size-0-full auto-x"] = var35.trailingAlignBottom == true,
			["row align-y-center size-0-full auto-x"] = var35.trailingAlignBottom ~= true
		},
		testId = `{var35.testId}--trailing`
	}, var35.trailingElement) else nil
	
	return createElement(viewModule, var126, t_1)
end))