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
local composerDebugModule = require(script.Parent.composerDebug)
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
local var32 = reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 144 ]]
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

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 193 | named "InternalTextInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), useComposerFocusLockModule (ref), getDisabledStyleModule (ref), getMultiLineTextHeightModule (ref), composerDebugModule (ref), measureTextLineCountModule (ref), inputFocusBehaviorModule (ref), useComposerKeyboardConnectionsModule (ref), controlStateModule (ref), radiusModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var32 (ref), mapBindableModule (ref), iconModule (ref)
	local var34 = p2
	
	if p2.Selectable == nil then
		var34 = table.clone(p2)
		var34.Selectable = true
	end
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
	local var54 = reactModule.useRef(isDisabled)
	var54.current = isDisabled
	local var55 = var35.isDisabled and var35.trailingElement == nil
	local var56 = usePreferredInputModule()
	local var57, var58 = reactModule.useState(false)
	local var59 = var56 == Enum.PreferredInput.Touch
	reactModule.useEffect(function() --[[ line: 233 ]]
		-- upvalues: isDisabled (ref), var58 (ref), var50 (ref)
		if isDisabled then
			var58(false)
			var50(false)
		end
		return function() --[[ line: 238 ]] end
	end, { isDisabled })
	local standard = var36.Stroke.Standard
	local var60 = math.ceil(standard) * 2
	local var61 = math.ceil(var36.Stroke.Thick) * 2
	useComposerFocusLockModule(isDisabled == true, { var37, var38 })
	local var62 = getDisabledStyleModule(var36.Color.Content.Emphasis, isDisabled)
	local fontStyle = var51.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var63 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
	local var64, var65 = reactModule.useState(1)
	local var66, var67 = reactModule.useState(var63)
	local var68 = var35.maxLines ~= nil
	local var69, var70 = reactModule.useState(function() --[[ line: 257 ]]
		-- upvalues: getBindableValueModule (copy), var35 (ref)
		return getBindableValueModule(var35.text)
	end)
	reactModule.useEffect(function() --[[ line: 261 ]]
		-- upvalues: composerDebugModule (copy), var35 (ref)
		composerDebugModule.setEnabled(var35.composerDebug == true)
		
		return function() --[[ line: 263 ]] end
	end, { var35.composerDebug })
	local var71 = reactModule.useCallback(function() --[[ line: 266 ]]
		-- upvalues: var37 (ref), var38 (ref)
		local current = var37.current or var38.current
		
		return if current and current.AbsoluteSize.X > 0 then current.AbsoluteSize.X else 0
	end, {})
	local var72 = reactModule.useCallback(function(p4) --[[ line: 275 ]]
		-- upvalues: measureTextLineCountModule (copy), var35 (ref), var63 (ref), var71 (ref), fontStyle (ref), fontSize (ref), var67 (ref)
		local var142 = measureTextLineCountModule({
			text = p4,
			maxLines = var35.maxLines,
			singleLineHeight = var63,
			layoutWidth = var71(),
			font = fontStyle.Font,
			fontSize = fontSize
		})
		var67(math.max(if var142.boundsY and var142.boundsY > 0 then math.ceil(var142.boundsY) else var63, var142.lineCount * var63))
		
		return var142.lineCount
	end, {
		fontSize, lineHeight, fontStyle.Font, var35.maxLines, var71, var63
	})
	local var73 = if var68 then var35.text else getBindableValueModule(var35.text)
	local maxValue = math.max(1, math.floor(var35.minLines or 1))
	
	if var35.maxLines then
		maxValue = math.min(maxValue, var35.maxLines)
	end
	local createElement_3
	local var75 = if var35.maxLines then math.max(maxValue, var64) else math.max(maxValue, var35.numLines)
	local var76 = if var35.alwaysMultiLine then true else var75 > 1
	local var57_1 = var76 and var57
	reactModule.useEffect(function() --[[ line: 313 ]]
		-- upvalues: var68 (ref), getBindableValueModule (copy), var35 (ref), var42 (ref), composerDebugModule (copy), var70 (ref), var65 (ref), var72 (ref)
		if not var68 then
			return function() --[[ line: 315 ]] end
		end
		local var143 = getBindableValueModule(var35.text)
		
		if var143 ~= var42.current then
			composerDebugModule.log("syncFromParent", `len={utf8.len(var143) or #var143}`)
			var42.current = var143
			var70(var143)
			var65(var72(var143))
			task.defer(function() --[[ line: 323 ]]
				-- upvalues: var65 (copy), var72 (copy), var143 (ref)
				var65(var72(var143))
			end)
		end
		return function() --[[ line: 327 ]] end
	end, { var35.text, var72, var68 })
	local var78 = reactModule.useCallback(function(p5) --[[ line: 330 ]]
		-- upvalues: var37 (ref), var38 (ref)
		if var37.current then
			var37.current.SelectionStart = p5
		end
		if var38.current then
			var38.current.SelectionStart = p5
		end
	end, {})
	local var79 = reactModule.useCallback(function(p6) --[[ line: 339 ]]
		-- upvalues: var37 (ref), var38 (ref)
		if var37.current then
			var37.current.CursorPosition = p6
		end
		if var38.current then
			var38.current.CursorPosition = p6
		end
	end, {})
	local var80 = reactModule.useCallback(function() --[[ line: 348 ]]
		-- upvalues: var37 (ref), var38 (ref), var78 (ref), var79 (ref)
		local current = var37.current or var38.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var78(0)
			var79(charCount + 1)
		end
	end, { var78, var79 })
	local var81 = reactModule.useCallback(function() --[[ line: 362 ]]
		-- upvalues: var76 (ref), var59 (ref), var57 (ref), var37 (ref), var41 (ref), var58 (ref), var38 (ref), var35 (ref), inputFocusBehaviorModule (copy), var80 (ref)
		if var76 and var59 and not var57 then
			if var37.current and var37.current.Parent then
				var41.current = var37.current.Text
			end
			var58(true)
			
			return
		else
			local current = var37.current or var38.current
			
			if current == nil then return end
			current:CaptureFocus()
			
			if var35.focusBehavior == inputFocusBehaviorModule.Highlight then
				task.spawn(var80)
			end
		end
	end, {
		var80,
		var35.focusBehavior,
		var76,
		var59,
		var57
	})
	local var82 = reactModule.useCallback(function() --[[ line: 391 ]]
		-- upvalues: var37 (ref), var38 (ref), var58 (ref), var50 (ref)
		if var37.current then
			var37.current:ReleaseFocus()
		end
		if var38.current then
			var38.current:ReleaseFocus()
		end
		var58(false)
		var50(false)
	end, {})
	local var83 = reactModule.useCallback(function() --[[ line: 402 ]]
		-- upvalues: var37 (ref), var38 (ref)
		local current = var37.current or var38.current
		
		return if current then current:IsFocused() else nil
	end, {})
	local var84 = reactModule.useCallback(function() --[[ line: 410 ]]
		-- upvalues: var37 (ref), var38 (ref)
		local current = var37.current or var38.current
		
		return if current then current.SelectionStart else nil
	end, {})
	local var85 = reactModule.useCallback(function() --[[ line: 418 ]]
		-- upvalues: var37 (ref), var38 (ref)
		local current = var37.current or var38.current
		
		return if current then current.CursorPosition else nil
	end, {})
	local var86 = reactModule.useCallback(function() --[[ line: 426 ]]
		-- upvalues: var37 (ref), var38 (ref)
		local current = var37.current or var38.current
		
		if current then
			current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p3, function() --[[ line: 435 ]]
		-- upvalues: var83 (ref), var81 (ref), var82 (ref), var48 (ref), var84 (ref), var85 (ref), var79 (ref), var78 (ref)
		return {
			getIsFocused = var83,
			focus = var81,
			releaseFocus = var82,
			setHover = var48,
			getSelectionStart = var84,
			getCursorPosition = var85,
			setCursorPosition = var79,
			setSelectionStart = var78
		}
	end, {
		var85, var83, var84, var81, var82, var79, var78
	})
	local var87 = reactModule.useCallback(function(p7) --[[ line: 458 ]]
		-- upvalues: var41 (ref), var54 (ref), var45 (ref), var42 (ref), var76 (ref), var39 (ref), var68 (ref), var70 (ref), var35 (ref), var65 (ref), var72 (ref)
		if p7 == nil or p7.Parent == nil or var41.current ~= "" then return end
		if var54.current then return end
		local text = p7.Text
		
		if var45.current and text ~= "" then return end
		if text == var42.current then return end
		var42.current = text
		
		if var76 and var39.current then
			var39.current.Text = text
		end
		if var68 then
			var70(text)
		end
		if var35.maxLines then
			var65(var72(text))
			task.defer(function() --[[ line: 488 ]]
				-- upvalues: var65 (copy), var72 (copy), text (ref)
				var65(var72(text))
			end)
		end
		var35.onChanged(text)
	end, {
		var35.onChanged,
		var76,
		var35.maxLines,
		var72,
		var68
	})
	local var88 = reactModule.useRef(false)
	local var89 = reactModule.useCallback(function(_, p8) --[[ line: 498 ]]
		-- upvalues: var88 (ref)
		if p8.UserInputType == Enum.UserInputType.MouseMovement then
			var88.current = false
		end
	end, {})
	local var90 = reactModule.useCallback(function(_, p9) --[[ line: 505 ]]
		-- upvalues: var88 (ref), var80 (ref)
		if not var88.current then return end
		var88.current = false
		
		if p9.UserInputType == Enum.UserInputType.MouseButton1 then
			var80()
			
			return
		end
	end, { var78, var79, var80 })
	local var91 = reactModule.useCallback(function(p10) --[[ line: 524 ]]
		-- upvalues: var42 (ref), var68 (ref), var70 (ref), var35 (ref), var65 (ref), var72 (ref)
		var42.current = p10
		
		if var68 then
			var70(p10)
		end
		if var35.maxLines then
			var65(var72(p10))
		end
		var35.onChanged(p10)
	end, { var35.maxLines, var72, var35.onChanged, var68 })
	local var92 = var35.onReturnPressed ~= nil and not var59
	local var93 = reactModule.useCallback(function(_, p11) --[[ line: 537 ]]
		-- upvalues: var35 (ref), var46 (ref), composerDebugModule (copy), var45 (ref)
		if var35.onReturnPressed == nil then return end
		local processTime = os.clock()
		
		if processTime - var46.current < 0.15 then
			composerDebugModule.log("returnSubmit", `source={p11} skipped=debounced`)
			
			return
		end
		composerDebugModule.log("returnSubmit", `source={p11}`)
		var46.current = processTime
		var45.current = true
		var35.onReturnPressed()
		task.delay(0.15, function() --[[ line: 553 ]]
			-- upvalues: var45 (copy)
			var45.current = false
		end)
	end, { var35.onReturnPressed })
	local var94 = useComposerKeyboardConnectionsModule({
		enabled = var92 == true,
		onReturnPressed = reactModule.useCallback(function(_, p12) --[[ line: 558 ]]
			-- upvalues: var37 (ref), composerDebugModule (copy), var91 (ref), var93 (ref)
			local current = var37.current
			
			if current == nil or current:IsFocused() ~= true then return end
			if p12 then
				local text = current.Text
				task.defer(function() --[[ line: 566 ]]
					-- upvalues: current (ref), text (ref), composerDebugModule (copy), var91 (copy)
					if current.Parent == nil then return end
					local text_1 = current.Text
					
					if text_1 ~= text then
						composerDebugModule.log("returnNewline", "source=UserInputService.InputBegan-shift engineInserted=true")
						var91(text_1)
					end
				end)
				
				return
			end
			var93(current, "UserInputService.InputBegan")
		end, { var93, var91 })
	})
	local connect = var94.connect
	local disconnect = var94.disconnect
	local var95 = reactModule.useCallback(function() --[[ line: 592 ]]
		-- upvalues: isDisabled (ref), var50 (ref), var35 (ref), var92 (ref), connect (ref), inputFocusBehaviorModule (copy), var37 (ref), var38 (ref), var88 (ref)
		if isDisabled then return end
		var50(true)
		
		if var35.onFocus then
			var35.onFocus()
		end
		if var92 then
			connect()
		end
		local focusBehavior = var35.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			if var37.current then
				var37.current.Text = ""
			end
			if var38.current then
				var38.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var88.current = true
		end
	end, {
		var35.onFocus,
		isDisabled,
		var35.focusBehavior,
		var92,
		connect
	})
	local var96 = reactModule.useCallback(function(p13, p14) --[[ line: 627 ]]
		-- upvalues: var90 (ref)
		var90(p13, p14)
	end, { var90 })
	local var97 = reactModule.useCallback(function(p15, p16, p17) --[[ line: 632 ]]
		-- upvalues: composerDebugModule (copy), var92 (ref), disconnect (ref), var50 (ref), var88 (ref), var76 (ref), var58 (ref), var35 (ref), var93 (ref)
		composerDebugModule.log("textBox.FocusLost", `enterPressed={p16}`)
		
		if var92 then
			disconnect()
		end
		var50(false)
		var88.current = false
		
		if var76 then
			var58(false)
		end
		if var35.onFocusLost then
			var35.onFocusLost(p17)
		end
		if p16 and var92 then
			var93(p15, "TextBox.FocusLost")
		end
	end, {
		var76,
		var35.onFocusLost,
		var92,
		var93,
		disconnect
	})
	local var98 = reactModule.useCallback(function(p18) --[[ line: 663 ]]
		-- upvalues: var48 (ref), controlStateModule (copy)
		var48(p18 == controlStateModule.Hover)
	end, {})
	local var99 = reactModule.useCallback(function(p19, p20) --[[ line: 667 ]]
		-- upvalues: var43 (ref), var35 (ref)
		var43.current = p20
		
		if var35.onDragStarted then
			var35.onDragStarted(p19, p20)
		end
	end, { var35.onDragStarted })
	local var100 = reactModule.useCallback(function(p21, p22) --[[ line: 674 ]]
		-- upvalues: var35 (ref)
		if var35.onDrag then
			var35.onDrag(p21, p22)
		end
	end, { var35.onDrag })
	local var101 = reactModule.useCallback(function(p23, p24) --[[ line: 680 ]]
		-- upvalues: var43 (ref), var81 (ref), var82 (ref), var50 (ref), var35 (ref)
		if var43.current == p24 then
			var81()
		else
			var82()
			var50(false)
		end
		var43.current = nil
		
		if var35.onDragEnded then
			var35.onDragEnded(p23, p24)
		end
	end, { var35.onDragEnded, var81, var82 })
	local var102 = if var35.maxLines then getMultiLineTextHeightModule(fontSize, var35.maxLines, lineHeight) else nil
	local var103 = getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	local var104 = reactModule.useMemo(function() --[[ line: 698 ]]
		-- upvalues: var35 (ref), var103 (ref), var66 (ref), var102 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), var75 (ref), lineHeight (ref)
		return if var35.maxLines then math.clamp(math.max(var103, var66), var103, var102) else getMultiLineTextHeightModule(fontSize, var75, lineHeight)
	end, {
		var35.maxLines, var103, var66, var102, fontSize, var75, lineHeight
	})
	local var105 = reactModule.useMemo(function() --[[ line: 720 ]]
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), container (ref), var60 (ref)
		local var152 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
		
		return UDim.new(0, math.ceil((var152 + math.round(math.round((container.minHeight - var60 - var152) * 2) / 2) + var60) / 2))
	end, { container.minHeight, var60, fontSize, lineHeight })
	local var106 = reactModule.useMemo(function() --[[ line: 729 ]]
		-- upvalues: var35 (ref), var105 (ref), radiusModule (copy), container (ref)
		return if var35.maxLines then var105 elseif var35.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil
	end, {
		var35.maxLines,
		var105,
		container.minHeight,
		var35.radius
	})
	local var107 = reactModule.useMemo(function() --[[ line: 739 ]]
		-- upvalues: var106 (ref), container (ref), var36 (ref)
		return {
			radius = var106 or UDim.new(0, container.radius),
			offset = var36.Stroke.Thick,
			borderWidth = var36.Stroke.Thick
		}
	end, { var36, container.radius, var106 })
	local var108, var109 = reactModule.useMemo(function() --[[ line: 748 ]]
		-- upvalues: container (ref), var60 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var104 (ref)
		local var153 = math.round((container.minHeight - var60 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var153 / 2)),
			bottom = UDim.new(0, math.ceil(var153 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var104 + math.round(var153) + var60
	end, {
		container.minHeight, var60, var61, fontSize, var104, lineHeight
	})
	local var110 = var108.bottom.Offset + var108.top.Offset
	local var111 = var76 and (var35.maxLines ~= nil and not var57)
	local var112 = var35.textPaddingOnParent == true
	local var111_1 = var112 and var111
	local var114 = var112 and not var111_1
	local var115 = if var112 then nil else var108
	local var116 = if var112 then var104 else var104 + var110
	local var117 = if var111 then math.max(var116, if var112 then var66 else var66 + var110) else var116
	local var118 = if var114 then var117 + var110 else var117
	local uDim2 = UDim2.new(1, 0, 0, var117)
	local uDim2_1 = UDim2.new(1, 0, 0, var116)
	reactModule.useEffect(function() --[[ line: 798 ]]
		-- upvalues: var35 (ref), composerDebugModule (copy), var75 (ref), var109 (ref)
		if var35.maxLines then
			composerDebugModule.log("layout", `lineCount={var75} borderFrameHeight={var109}`)
		end
		return function() --[[ line: 802 ]] end
	end, { var75, var109, var35.maxLines })
	local var121 = reactModule.useMemo(function() --[[ line: 805 ]]
		-- upvalues: var76 (ref), var35 (ref)
		return if var76 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = if var35.maxLines ~= nil then Enum.ItemLineAlignment.Center else Enum.ItemLineAlignment.Start
		} else nil
	end, { var76, var35.maxLines })
	local var122 = reactModule.useMemo(function() --[[ line: 816 ]]
		-- upvalues: var76 (ref)
		return if var76 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var76 })
	local var123 = reactModule.useCallback(function(p25) --[[ line: 827 ]]
		-- upvalues: var40 (ref), var39 (ref), truncateTextToCursorModule (copy), var108 (ref)
		local current = var40.current
		local current_1 = var39.current
		
		if current == nil or current_1 == nil then return end
		local var154 = p25.TextSize * p25.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p25)
		local y_1 = current_1.TextBounds.Y
		local var155 = y - var108.top.Offset + var108.bottom.Offset
		local var156 = y + current.AbsoluteSize.Y - var108.top.Offset - var108.bottom.Offset
		
		if y_1 - var154 < var155 then
			current.CanvasPosition += Vector2.new(0, y_1 - var154 - var155)
		end
		if var156 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var156)
		end
	end, { var108 })
	local var124 = reactModule.useCallback(function(p26) --[[ line: 860 ]]
		-- upvalues: var40 (ref), var44 (ref)
		if p26 == nil then
			return
		end
		var40.current = p26
		p26.ClipsDescendants = true
		p26.CanvasPosition = var44.current
	end, {})
	local var125 = reactModule.useCallback(function(p27) --[[ line: 870 ]]
		-- upvalues: var41 (ref)
		if p27 then
			p27.Text = var41.current
			var41.current = ""
			task.delay(0, function() --[[ line: 874 ]]
				-- upvalues: p27 (ref)
				if p27.Parent ~= nil then
					p27:CaptureFocus()
				end
			end)
		end
	end, {})
	local var126 = reactModule.useCallback(function(p28) --[[ line: 882 ]]
		-- upvalues: var44 (ref)
		var44.current = p28.CanvasPosition
	end, {})
	local var127 = reactModule.useMemo(function() --[[ line: 887 ]]
		-- upvalues: var35 (ref), reactModule (copy), var99 (ref), var100 (ref), var101 (ref), var49 (ref), isDisabled (ref)
		return if var35.onDragStarted or var35.onDrag or var35.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var99,
			[reactModule.Event.DragContinue] = var100,
			[reactModule.Event.DragEnd] = var101,
			Enabled = not var49 and not isDisabled
		}) else nil
	end, {
		var99, var100, var101, var49, isDisabled, var35.onDragStarted, var35.onDrag,
		var35.onDragEnded
	})
	local var128 = useBindableModule(if var35.horizontalPadding then var35.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var129 = useBindableModule(if var35.horizontalPadding then var35.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var130 = reactModule.useMemo(function() --[[ line: 918 ]]
		-- upvalues: var35 (ref), container (ref), var36 (ref)
		return if var35.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var36.Stroke.Standard) / 2) else nil
	end, {
		var35.hasClearButton,
		container.minHeight,
		var36.Stroke.Standard
	})
	local var131 = reactUtilsModule.useComposedRef(var38, var125)
	local createElement = reactModule.createElement
	local var132 = withCommonPropsModule(var35, {
		Size = UDim2.new(1, 0, 0, var109),
		selection = {
			Selectable = var35.Selectable and not isDisabled,
			NextSelectionUp = var35.NextSelectionUp,
			NextSelectionDown = var35.NextSelectionDown,
			NextSelectionLeft = var35.NextSelectionLeft,
			NextSelectionRight = var35.NextSelectionRight
		},
		cursor = var107,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var49 or var47 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = var106,
		padding = {
			left = var128:map(function(p29) --[[ line: 958 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p29
			end),
			right = if var35.trailingElement == nil and var35.hasClearButton then UDim.new(0, standard) else var129:map(function(p30) --[[ line: 964 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p30
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not isDisabled then var81 else nil,
		onStateChanged = var98,
		isDisabled = var55,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var35.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var55) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = var52,
		testId = `{var35.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var127,
		Background = var35.backgroundGradient,
		Leading = if var35.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var55 then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var35.testId}--leading`
		}, var35.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var134 = if var76 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		padding = if var111_1 then var108 else nil,
		selection = { Selectable = false },
		scroll = var122,
		layout = var121,
		onCanvasPositionChanged = if var76 then var126 else nil,
		scrollingFrameRef = if var76 then var124 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var137 = viewModule
	local t_4 = {
		Size = if var111 then UDim2.new(1, 0, 0, var118) else nil,
		tag = { ["fill size-full"] = not var111 },
		padding = if var114 then var108 else nil,
		selection = { Selectable = false },
		onActivated = if not isDisabled then var81 else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}
	local t_5 = {}
	
	if var57 then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(var32, {
			overlayNativeInput = nil,
			text = var73,
			placeholder = var35.placeholder,
			textInputType = var35.textInputType,
			fontStyle = fontStyle,
			textStyle = var62,
			isMultiLine = var76,
			isDisabled = isDisabled,
			ref = var37,
			tag = `{var53 or ""} data-testid={var35.testId}--textbox`,
			Size = if var76 then uDim2 else nil,
			automaticSize = if var35.maxLines then nil elseif not var68 then if var76 and not var57 and var69 ~= "" then Enum.AutomaticSize.Y else nil else mapBindableModule(var35.text, function(p31) --[[ line: 1035 ]]
				-- upvalues: var76 (ref), var57 (ref)
				return if var76 and not var57 and p31 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var115,
			onFocusGained = var95,
			onFocusLost = if var76 and var59 then nil else var97,
			onTextChanged = var87,
			onCursorPositionChanged = if var76 then var123 else nil,
			onInputChanged = var89,
			onInputEnded = var96,
			manualFocusRelease = if var59 then var35.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var59 and var35.manualFocusRelease == true and var35.alwaysMultiLine == true then true else nil
		}, {
			DragDetector = var127,
			BoundsChecker = if var76 then reactModule.createElement(var32, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var62,
				Size = if var112 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, var110),
				ref = var39
			}) else nil
		})
	end
	local var140
	t_5.TextBox = createElement_3
	t_5.MobileFocusTarget = if var76 and var59 and (not var57 and not isDisabled) then reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = 2,
		onActivated = var81,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		testId = `{var35.testId}--mobile-focus-target`
	}) else nil
	
	if var57_1 then
		var140 = reactModule.createElement
		var140 = var140(var32, {
			overlayNativeInput = nil,
			text = var73,
			placeholder = var35.placeholder,
			textInputType = var35.textInputType,
			fontStyle = fontStyle,
			textStyle = var62,
			isMultiLine = var76,
			isDisabled = isDisabled,
			padding = var115,
			ref = var131,
			tag = `{var53 or ""} data-testid={var35.testId}--mobile-textbox`,
			Size = uDim2_1,
			onFocusGained = var95,
			onFocusLost = if var76 and var59 then var97 else nil,
			onTextChanged = var87,
			onCursorPositionChanged = if var76 then var123 else nil,
			onInputEnded = var96,
			manualFocusRelease = if var59 then var35.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var59 and var35.manualFocusRelease == true and var35.alwaysMultiLine == true then true else nil
		})
	else
		var140 = nil
	end
	t_5.MobileTextBox = var140
	t_3.TextContent = createElement_2(var137, t_4, t_5)
	t_1.TextBoxWrapper = createElement_1(var134, t_2, t_3)
	t_1.Clear = if var35.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = isDisabled,
		GroupTransparency = if isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var35.text, function(p32) --[[ line: 1124 ]]
			return p32 ~= ""
		end),
		tag = var51.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var86,
			padding = UDim.new(0, var51.clearButton.padding),
			Position = var130,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var35.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var51.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var35.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		GroupTransparency = if var55 then constantsModule.DISABLED_TRANSPARENCY else nil,
		tag = {
			["col align-y-bottom self-stretch size-0-full auto-x"] = var35.trailingAlignBottom == true,
			["row align-y-center size-0-full auto-x"] = var35.trailingAlignBottom ~= true
		},
		testId = `{var35.testId}--trailing`
	}, var35.trailingElement) else nil
	
	return createElement(viewModule, var132, t_1)
end))