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
local flagsModule = require(foundation.Utility.Flags)
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
local var33 = reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 143 ]]
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

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 192 | named "InternalTextInput" ]]
	-- upvalues: flagsModule (ref), withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), useComposerFocusLockModule (ref), getDisabledStyleModule (ref), getMultiLineTextHeightModule (ref), chatTextAreaDebugModule (ref), measureTextLineCountModule (ref), inputFocusBehaviorModule (ref), useComposerKeyboardConnectionsModule (ref), controlStateModule (ref), radiusModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var33 (ref), mapBindableModule (ref), iconModule (ref)
	local var35 = p2
	
	if flagsModule.FoundationInputSelectionProps and p2.Selectable == nil then
		var35 = table.clone(p2)
		var35.Selectable = true
	end
	local createElement_3
	local var36 = withDefaultsModule(var35, t)
	local var37 = useTokensModule()
	local var38 = reactModule.useRef(nil)
	local var39 = reactModule.useRef(nil)
	local var40 = reactModule.useRef(nil)
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useRef("")
	local var43 = reactModule.useRef(getBindableValueModule(var36.text))
	local var44 = reactModule.useRef(nil)
	local var45 = reactModule.useRef(Vector2.zero)
	local var46 = reactModule.useRef(false)
	local var47 = reactModule.useRef(0)
	local var48, var49 = reactModule.useState(false)
	local var50, var51 = reactModule.useState(false)
	local var52 = useTextInputVariantsModule(var37, var36.size, var36.variant, var36.radius, var50, var48, var36.hasError)
	local container = var52.container
	local var53 = if var36.trailingElement and typeof(container.tag) == "string" then string.gsub(container.tag, "gap%-large", "gap-xsmall") else container.tag
	local var54 = useStyleTagsModule(var52.textBox.tag)
	local isDisabled = var36.isDisabled
	local var55 = var36.isDisabled and var36.trailingElement == nil
	local var56 = usePreferredInputModule()
	local var57, var58 = reactModule.useState(false)
	local var59 = var56 == Enum.PreferredInput.Touch
	local standard = var37.Stroke.Standard
	local var60 = math.ceil(standard) * 2
	local var61 = math.ceil(var37.Stroke.Thick) * 2
	useComposerFocusLockModule(isDisabled == true, { var38, var39 })
	local var62 = getDisabledStyleModule(var37.Color.Content.Emphasis, isDisabled)
	local fontStyle = var52.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var63 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
	local var64, var65 = reactModule.useState(1)
	local var66, var67 = reactModule.useState(var63)
	local var68 = var36.maxLines ~= nil
	local var69, var70 = reactModule.useState(function() --[[ line: 249 ]]
		-- upvalues: getBindableValueModule (copy), var36 (ref)
		return getBindableValueModule(var36.text)
	end)
	reactModule.useEffect(function() --[[ line: 253 ]]
		-- upvalues: chatTextAreaDebugModule (copy), var36 (ref)
		chatTextAreaDebugModule.setEnabled(var36.composerDebug == true)
		
		return function() --[[ line: 255 ]] end
	end, { var36.composerDebug })
	local var71 = reactModule.useCallback(function() --[[ line: 258 ]]
		-- upvalues: var38 (ref), var39 (ref)
		local current = var38.current or var39.current
		
		return if current and current.AbsoluteSize.X > 0 then current.AbsoluteSize.X else 0
	end, {})
	local var72 = reactModule.useCallback(function(p4) --[[ line: 267 ]]
		-- upvalues: measureTextLineCountModule (copy), var36 (ref), var63 (ref), var71 (ref), fontStyle (ref), fontSize (ref), var67 (ref)
		local var137 = measureTextLineCountModule({
			text = p4,
			maxLines = var36.maxLines,
			singleLineHeight = var63,
			layoutWidth = var71(),
			font = fontStyle.Font,
			fontSize = fontSize
		})
		var67(math.max(if var137.boundsY and var137.boundsY > 0 then math.ceil(var137.boundsY) else var63, var137.lineCount * var63))
		
		return var137.lineCount
	end, {
		fontSize, lineHeight, fontStyle.Font, var36.maxLines, var71, var63
	})
	local var73 = if var68 then var36.text else getBindableValueModule(var36.text)
	local var74 = if var36.maxLines then var64 else math.max(1, var36.numLines)
	local var75 = if var36.alwaysMultiLine then true else var74 > 1
	reactModule.useEffect(function() --[[ line: 298 ]]
		-- upvalues: var68 (ref), getBindableValueModule (copy), var36 (ref), var43 (ref), chatTextAreaDebugModule (copy), var70 (ref), var65 (ref), var72 (ref)
		if not var68 then
			return function() --[[ line: 300 ]] end
		end
		local var138 = getBindableValueModule(var36.text)
		
		if var138 ~= var43.current then
			chatTextAreaDebugModule.log("syncFromParent", `len={utf8.len(var138) or #var138}`)
			var43.current = var138
			var70(var138)
			var65(var72(var138))
			task.defer(function() --[[ line: 308 ]]
				-- upvalues: var65 (copy), var72 (copy), var138 (ref)
				var65(var72(var138))
			end)
		end
		return function() --[[ line: 312 ]] end
	end, { var36.text, var72, var68 })
	local var76 = reactModule.useCallback(function(p5) --[[ line: 315 ]]
		-- upvalues: var38 (ref), var39 (ref)
		if var38.current then
			var38.current.SelectionStart = p5
		end
		if var39.current then
			var39.current.SelectionStart = p5
		end
	end, {})
	local var77 = reactModule.useCallback(function(p6) --[[ line: 324 ]]
		-- upvalues: var38 (ref), var39 (ref)
		if var38.current then
			var38.current.CursorPosition = p6
		end
		if var39.current then
			var39.current.CursorPosition = p6
		end
	end, {})
	local var78 = reactModule.useCallback(function() --[[ line: 333 ]]
		-- upvalues: var38 (ref), var39 (ref), var76 (ref), var77 (ref)
		local current = var38.current or var39.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var76(0)
			var77(charCount + 1)
		end
	end, { var76, var77 })
	local var79 = reactModule.useCallback(function() --[[ line: 346 ]]
		-- upvalues: flagsModule (copy), var38 (ref), var36 (ref), inputFocusBehaviorModule (copy), var78 (ref)
		if flagsModule.FoundationTextInputHighlightFix then
			if var38.current == nil then return end
			var38.current:CaptureFocus()
			
			if var36.focusBehavior == inputFocusBehaviorModule.Highlight then
				task.spawn(var78)
				
				return
			end
		elseif var38.current then
			var38.current:CaptureFocus()
		end
	end, {
		if flagsModule.FoundationTextInputHighlightFix then var78 else nil,
		if flagsModule.FoundationTextInputHighlightFix then var36.focusBehavior else nil
	})
	local var80 = reactModule.useCallback(function() --[[ line: 367 ]]
		-- upvalues: var38 (ref), var39 (ref), var58 (ref), var51 (ref)
		if var38.current then
			var38.current:ReleaseFocus()
		end
		if var39.current then
			var39.current:ReleaseFocus()
		end
		var58(false)
		var51(false)
	end, {})
	local var81 = reactModule.useCallback(function() --[[ line: 378 ]]
		-- upvalues: var38 (ref)
		return if var38.current then var38.current:IsFocused() else nil
	end, {})
	local var82 = reactModule.useCallback(function() --[[ line: 385 ]]
		-- upvalues: var38 (ref)
		return if var38.current then var38.current.SelectionStart else nil
	end, {})
	local var83 = reactModule.useCallback(function() --[[ line: 392 ]]
		-- upvalues: var38 (ref)
		return if var38.current then var38.current.CursorPosition else nil
	end, {})
	local var84 = reactModule.useCallback(function() --[[ line: 399 ]]
		-- upvalues: var38 (ref)
		if var38.current then
			var38.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p3, function() --[[ line: 407 ]]
		-- upvalues: var81 (ref), var79 (ref), var80 (ref), var49 (ref), var82 (ref), var83 (ref), var77 (ref), var76 (ref)
		return {
			getIsFocused = var81,
			focus = var79,
			releaseFocus = var80,
			setHover = var49,
			getSelectionStart = var82,
			getCursorPosition = var83,
			setCursorPosition = var77,
			setSelectionStart = var76
		}
	end, {
		var83, var81, var82, var79, var80, var77, var76
	})
	local var85 = reactModule.useCallback(function(p7) --[[ line: 431 ]]
		-- upvalues: var42 (ref), var46 (ref), var43 (ref), var75 (ref), var40 (ref), var68 (ref), var70 (ref), var36 (ref), var65 (ref), var72 (ref)
		if p7 == nil or p7.Parent == nil or var42.current ~= "" then return end
		local text = p7.Text
		
		if var46.current and text ~= "" then return end
		if text == var43.current then return end
		var43.current = text
		
		if var75 and var40.current then
			var40.current.Text = text
		end
		if var68 then
			var70(text)
		end
		if var36.maxLines then
			var65(var72(text))
			task.defer(function() --[[ line: 457 ]]
				-- upvalues: var65 (copy), var72 (copy), text (ref)
				var65(var72(text))
			end)
		end
		var36.onChanged(text)
	end, {
		var36.onChanged, var75, var57, var36.maxLines, var72, var68
	})
	local var86 = reactModule.useRef(false)
	local var87 = reactModule.useCallback(function(_, p8) --[[ line: 469 ]]
		-- upvalues: flagsModule (copy), var86 (ref)
		if not flagsModule.FoundationTextInputHighlightFix then return end
		if p8.UserInputType == Enum.UserInputType.MouseMovement then
			var86.current = false
		end
	end, {})
	local var88 = reactModule.useCallback(function(_, p9) --[[ line: 480 ]]
		-- upvalues: flagsModule (copy), var86 (ref), var78 (ref)
		if not flagsModule.FoundationTextInputHighlightFix then return end
		if not var86.current then return end
		var86.current = false
		
		if p9.UserInputType == Enum.UserInputType.MouseButton1 then
			var78()
			
			return
		end
	end, {
		if flagsModule.FoundationTextInputHighlightFix then var76 else nil,
		if flagsModule.FoundationTextInputHighlightFix then var77 else nil,
		if flagsModule.FoundationTextInputHighlightFix then var78 else nil
	})
	local var89 = reactModule.useCallback(function(p10) --[[ line: 503 ]]
		-- upvalues: var43 (ref), var68 (ref), var70 (ref), var36 (ref), var65 (ref), var72 (ref)
		var43.current = p10
		
		if var68 then
			var70(p10)
		end
		if var36.maxLines then
			var65(var72(p10))
		end
		var36.onChanged(p10)
	end, { var36.maxLines, var72, var36.onChanged, var68 })
	local var90 = var36.onReturnPressed ~= nil and not var59
	local var91 = reactModule.useCallback(function(_, p11) --[[ line: 516 ]]
		-- upvalues: var36 (ref), var47 (ref), chatTextAreaDebugModule (copy), var46 (ref)
		if var36.onReturnPressed == nil then return end
		local processTime = os.clock()
		
		if processTime - var47.current < 0.15 then
			chatTextAreaDebugModule.log("returnSubmit", `source={p11} skipped=debounced`)
			
			return
		end
		chatTextAreaDebugModule.log("returnSubmit", `source={p11}`)
		var47.current = processTime
		var46.current = true
		var36.onReturnPressed()
		task.delay(0.15, function() --[[ line: 532 ]]
			-- upvalues: var46 (copy)
			var46.current = false
		end)
	end, { var36.onReturnPressed })
	local var92 = useComposerKeyboardConnectionsModule({
		enabled = var90 == true,
		onReturnPressed = reactModule.useCallback(function(_, p12) --[[ line: 537 ]]
			-- upvalues: var38 (ref), chatTextAreaDebugModule (copy), var89 (ref), var91 (ref)
			local current = var38.current
			
			if current == nil or current:IsFocused() ~= true then return end
			if p12 then
				local text = current.Text
				task.defer(function() --[[ line: 545 ]]
					-- upvalues: current (ref), text (ref), chatTextAreaDebugModule (copy), var89 (copy)
					if current.Parent == nil then return end
					local text_1 = current.Text
					
					if text_1 ~= text then
						chatTextAreaDebugModule.log("returnNewline", "source=UserInputService.InputBegan-shift engineInserted=true")
						var89(text_1)
					end
				end)
				
				return
			end
			var91(current, "UserInputService.InputBegan")
		end, { var91, var89 })
	})
	local connect = var92.connect
	local disconnect = var92.disconnect
	local var93 = reactModule.useCallback(function() --[[ line: 574 ]]
		-- upvalues: isDisabled (ref), var75 (ref), var59 (ref), var38 (ref), var42 (ref), var58 (ref), var51 (ref), var36 (ref), var90 (ref), connect (ref), inputFocusBehaviorModule (copy), var39 (ref), flagsModule (copy), var86 (ref), var76 (ref), var77 (ref)
		if isDisabled then return end
		if var75 and var59 then
			if var38.current and var38.current.Parent then
				var42.current = var38.current.Text
			end
			var58(true)
		end
		var51(true)
		
		if var36.onFocus then
			var36.onFocus()
		end
		if var90 then
			connect()
		end
		local focusBehavior = var36.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			var42.current = ""
			
			if var38.current then
				var38.current.Text = ""
			end
			if var39.current then
				var39.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			if flagsModule.FoundationTextInputHighlightFix then
				var86.current = true
				
				return
			end
			task.spawn(function() --[[ line: 612 ]]
				-- upvalues: var38 (copy), var39 (copy), var76 (copy), var77 (copy)
				local current = var38.current or var39.current
				
				if current and current.Parent ~= nil then
					local charCount = utf8.len(current.Text)
					
					if charCount then
						var76(0)
						var77(charCount + 1)
					end
				end
			end)
		end
	end, {
		var36.onFocus, isDisabled, var59, var75, var36.focusBehavior, var90, connect,
		if not flagsModule.FoundationTextInputHighlightFix then var76 else nil,
		if not flagsModule.FoundationTextInputHighlightFix then var77 else nil
	})
	local var94 = reactModule.useCallback(function(p13, p14) --[[ line: 638 ]]
		-- upvalues: var88 (ref)
		var88(p13, p14)
	end, { var88 })
	local var95 = reactModule.useCallback(function(p15, p16, p17) --[[ line: 643 ]]
		-- upvalues: chatTextAreaDebugModule (copy), var90 (ref), disconnect (ref), var51 (ref), var86 (ref), var75 (ref), var58 (ref), var36 (ref), var91 (ref)
		chatTextAreaDebugModule.log("textBox.FocusLost", `enterPressed={p16}`)
		
		if var90 then
			disconnect()
		end
		var51(false)
		var86.current = false
		
		if var75 then
			var58(false)
		end
		if var36.onFocusLost then
			var36.onFocusLost(p17)
		end
		if p16 and var90 then
			var91(p15, "TextBox.FocusLost")
		end
	end, {
		var75,
		var36.onFocusLost,
		var90,
		var91,
		disconnect
	})
	local var96 = reactModule.useCallback(function(p18) --[[ line: 674 ]]
		-- upvalues: var49 (ref), controlStateModule (copy)
		var49(p18 == controlStateModule.Hover)
	end, {})
	local var97 = reactModule.useCallback(function(p19, p20) --[[ line: 678 ]]
		-- upvalues: var44 (ref), var36 (ref)
		var44.current = p20
		
		if var36.onDragStarted then
			var36.onDragStarted(p19, p20)
		end
	end, { var36.onDragStarted })
	local var98 = reactModule.useCallback(function(p21, p22) --[[ line: 685 ]]
		-- upvalues: var36 (ref)
		if var36.onDrag then
			var36.onDrag(p21, p22)
		end
	end, { var36.onDrag })
	local var99 = reactModule.useCallback(function(p23, p24) --[[ line: 691 ]]
		-- upvalues: var44 (ref), var79 (ref), var80 (ref), var51 (ref), var36 (ref)
		if var44.current == p24 then
			var79()
		else
			var80()
			var51(false)
		end
		var44.current = nil
		
		if var36.onDragEnded then
			var36.onDragEnded(p23, p24)
		end
	end, { var36.onDragEnded, var79, var80 })
	local var100 = if var36.maxLines then getMultiLineTextHeightModule(fontSize, var36.maxLines, lineHeight) else nil
	local var101 = reactModule.useMemo(function() --[[ line: 708 ]]
		-- upvalues: var36 (ref), var63 (ref), var66 (ref), var100 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), var74 (ref), lineHeight (ref)
		return if var36.maxLines then math.clamp(math.max(var63, var66), var63, var100) else getMultiLineTextHeightModule(fontSize, var74, lineHeight)
	end, {
		var36.maxLines, var63, var66, var100, fontSize, var74, lineHeight
	})
	local var102 = reactModule.useMemo(function() --[[ line: 730 ]]
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), container (ref), var60 (ref)
		local var144 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
		
		return UDim.new(0, math.ceil((var144 + math.round(math.round((container.minHeight - var60 - var144) * 2) / 2) + var60) / 2))
	end, { container.minHeight, var60, fontSize, lineHeight })
	local var103 = reactModule.useMemo(function() --[[ line: 739 ]]
		-- upvalues: var36 (ref), var102 (ref), radiusModule (copy), container (ref)
		return if var36.maxLines then var102 elseif var36.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil
	end, {
		var36.maxLines,
		var102,
		container.minHeight,
		var36.radius
	})
	local var104 = reactModule.useMemo(function() --[[ line: 749 ]]
		-- upvalues: var103 (ref), container (ref), var37 (ref)
		return {
			radius = var103 or UDim.new(0, container.radius),
			offset = var37.Stroke.Thick,
			borderWidth = var37.Stroke.Thick
		}
	end, { var37, container.radius, var103 })
	local var105, var106 = reactModule.useMemo(function() --[[ line: 758 ]]
		-- upvalues: container (ref), var60 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var101 (ref)
		local var145 = math.round((container.minHeight - var60 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var145 / 2)),
			bottom = UDim.new(0, math.ceil(var145 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var101 + math.round(var145) + var60
	end, {
		container.minHeight, var60, var61, fontSize, var101, lineHeight
	})
	local var107 = var105.bottom.Offset + var105.top.Offset
	local var108 = var36.textPaddingOnParent == true
	local var109 = if var108 then nil else var105
	local var110 = if var108 then var101 else var101 + var107
	local var111 = var75 and (var36.maxLines ~= nil and not var57)
	local var112 = if var111 then math.max(var110, if var108 then var66 else var66 + var107) else var110
	local var113 = if var108 then var112 + var107 else var112
	local uDim2 = UDim2.new(1, 0, 0, var112)
	local uDim2_1 = UDim2.new(1, 0, 0, var110)
	reactModule.useEffect(function() --[[ line: 806 ]]
		-- upvalues: var36 (ref), chatTextAreaDebugModule (copy), var74 (ref), var106 (ref)
		if var36.maxLines then
			chatTextAreaDebugModule.log("layout", `lineCount={var74} borderFrameHeight={var106}`)
		end
		return function() --[[ line: 810 ]] end
	end, { var74, var106, var36.maxLines })
	local var116 = reactModule.useMemo(function() --[[ line: 813 ]]
		-- upvalues: var75 (ref), var36 (ref)
		return if var75 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = if var36.maxLines ~= nil then Enum.ItemLineAlignment.Center else Enum.ItemLineAlignment.Start
		} else nil
	end, { var75, var36.maxLines })
	local var117 = reactModule.useMemo(function() --[[ line: 824 ]]
		-- upvalues: var75 (ref)
		return if var75 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var75 })
	local var118 = reactModule.useCallback(function(p25) --[[ line: 835 ]]
		-- upvalues: var41 (ref), var40 (ref), truncateTextToCursorModule (copy), var105 (ref)
		local current = var41.current
		local current_1 = var40.current
		
		if current == nil or current_1 == nil then return end
		local var146 = p25.TextSize * p25.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p25)
		local y_1 = current_1.TextBounds.Y
		local var147 = y - var105.top.Offset + var105.bottom.Offset
		local var148 = y + current.AbsoluteSize.Y - var105.top.Offset - var105.bottom.Offset
		
		if y_1 - var146 < var147 then
			current.CanvasPosition += Vector2.new(0, y_1 - var146 - var147)
		end
		if var148 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var148)
		end
	end, { var105 })
	local var119 = reactModule.useCallback(function(p26) --[[ line: 868 ]]
		-- upvalues: var41 (ref), var45 (ref)
		if p26 == nil then
			return
		end
		var41.current = p26
		p26.ClipsDescendants = true
		p26.CanvasPosition = var45.current
	end, {})
	local var120 = reactModule.useCallback(function(p27) --[[ line: 878 ]]
		-- upvalues: var42 (ref), flagsModule (copy)
		if p27 then
			p27.Text = var42.current
			var42.current = ""
			
			if flagsModule.FoundationTextAreaDelayMobileFocus then
				task.delay(0, function() --[[ line: 883 ]]
					-- upvalues: p27 (ref)
					if p27.Parent ~= nil then
						p27:CaptureFocus()
					end
				end)
				
				return
			end
			p27:CaptureFocus()
		end
	end, {})
	local var121 = reactModule.useCallback(function(p28) --[[ line: 894 ]]
		-- upvalues: var45 (ref)
		var45.current = p28.CanvasPosition
	end, {})
	local var122 = reactModule.useMemo(function() --[[ line: 899 ]]
		-- upvalues: var36 (ref), reactModule (copy), var97 (ref), var98 (ref), var99 (ref), var50 (ref), isDisabled (ref)
		return if var36.onDragStarted or var36.onDrag or var36.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var97,
			[reactModule.Event.DragContinue] = var98,
			[reactModule.Event.DragEnd] = var99,
			Enabled = not var50 and not isDisabled
		}) else nil
	end, {
		var97, var98, var99, var50, isDisabled, var36.onDragStarted, var36.onDrag,
		var36.onDragEnded
	})
	local var123 = useBindableModule(if var36.horizontalPadding then var36.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var124 = useBindableModule(if var36.horizontalPadding then var36.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var125 = reactModule.useMemo(function() --[[ line: 930 ]]
		-- upvalues: var36 (ref), container (ref), var37 (ref)
		return if var36.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var37.Stroke.Standard) / 2) else nil
	end, {
		var36.hasClearButton,
		container.minHeight,
		var37.Stroke.Standard
	})
	local var126 = reactUtilsModule.useComposedRef(var39, var120)
	local createElement = reactModule.createElement
	local var127 = withCommonPropsModule(var36, {
		Size = UDim2.new(1, 0, 0, var106),
		selection = {
			Selectable = if flagsModule.FoundationInputSelectionProps then var36.Selectable and not isDisabled else not isDisabled,
			NextSelectionUp = if flagsModule.FoundationInputSelectionProps then var36.NextSelectionUp else nil,
			NextSelectionDown = if flagsModule.FoundationInputSelectionProps then var36.NextSelectionDown else nil,
			NextSelectionLeft = if flagsModule.FoundationInputSelectionProps then var36.NextSelectionLeft else nil,
			NextSelectionRight = if flagsModule.FoundationInputSelectionProps then var36.NextSelectionRight else nil
		},
		cursor = var104,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var50 or var48 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = var103,
		padding = {
			left = var123:map(function(p29) --[[ line: 972 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p29
			end),
			right = if var36.trailingElement == nil and var36.hasClearButton then UDim.new(0, standard) else var124:map(function(p30) --[[ line: 978 ]]
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p30
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not isDisabled then var79 else nil,
		onStateChanged = var96,
		isDisabled = var55,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var36.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var55) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = var53,
		testId = `{var36.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var122,
		Background = var36.backgroundGradient,
		Leading = if var36.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var55 then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var36.testId}--leading`
		}, var36.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var129 = if var75 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var117,
		layout = var116,
		onCanvasPositionChanged = if var75 then var121 else nil,
		scrollingFrameRef = if var75 then var119 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var132 = viewModule
	local t_4 = {
		Size = if var111 then UDim2.new(1, 0, 0, var113) else nil,
		tag = { ["fill size-full"] = not var111 },
		padding = if var108 then var105 else nil,
		selection = { Selectable = false },
		onActivated = if not isDisabled then var79 else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}
	local t_5 = {}
	
	if var57 then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(var33, {
			overlayNativeInput = nil,
			text = var73,
			placeholder = var36.placeholder,
			textInputType = var36.textInputType,
			fontStyle = fontStyle,
			textStyle = var62,
			isMultiLine = var75,
			isDisabled = isDisabled,
			ref = var38,
			tag = `{var54 or ""} data-testid={var36.testId}--textbox`,
			Size = if var75 then uDim2 else nil,
			automaticSize = if var36.maxLines then nil elseif not var68 then if var75 and not var57 and var69 ~= "" then Enum.AutomaticSize.Y else nil else mapBindableModule(var36.text, function(p31) --[[ line: 1048 ]]
				-- upvalues: var75 (ref), var57 (ref)
				return if var75 and not var57 and p31 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var109,
			onFocusGained = var93,
			onFocusLost = if var75 and var59 then nil else var95,
			onTextChanged = var85,
			onCursorPositionChanged = if var75 then var118 else nil,
			onInputChanged = var87,
			onInputEnded = var94,
			manualFocusRelease = if var59 then var36.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var59 and var36.manualFocusRelease == true and var36.alwaysMultiLine == true then true else nil
		}, {
			DragDetector = var122,
			BoundsChecker = if var75 then reactModule.createElement(var33, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var62,
				Size = if var108 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, var107),
				ref = var40
			}) else nil
		})
	end
	local var135
	t_5.TextBox = createElement_3
	
	if var75 and var57 then
		var135 = reactModule.createElement
		var135 = var135(var33, {
			overlayNativeInput = nil,
			text = var73,
			placeholder = var36.placeholder,
			textInputType = var36.textInputType,
			fontStyle = fontStyle,
			textStyle = var62,
			isMultiLine = var75,
			isDisabled = isDisabled,
			padding = var109,
			ref = var126,
			tag = `{var54 or ""} data-testid={var36.testId}--mobile-textbox`,
			Size = uDim2_1,
			onFocusLost = if var75 and var59 then var95 else nil,
			onTextChanged = var85,
			onCursorPositionChanged = if var75 then var118 else nil,
			onInputEnded = var94,
			manualFocusRelease = if var59 then var36.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var59 and var36.manualFocusRelease == true and var36.alwaysMultiLine == true then true else nil
		})
	else
		var135 = nil
	end
	t_5.MobileTextBox = var135
	t_3.TextContent = createElement_2(var132, t_4, t_5)
	t_1.TextBoxWrapper = createElement_1(var129, t_2, t_3)
	t_1.Clear = if var36.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = isDisabled,
		GroupTransparency = if isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var36.text, function(p32) --[[ line: 1121 ]]
			return p32 ~= ""
		end),
		tag = var52.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var84,
			padding = UDim.new(0, var52.clearButton.padding),
			Position = var125,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var36.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var52.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var36.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		GroupTransparency = if var55 then constantsModule.DISABLED_TRANSPARENCY else nil,
		tag = {
			["col align-y-bottom self-stretch size-0-full auto-x"] = var36.trailingAlignBottom == true,
			["row align-y-center size-0-full auto-x"] = var36.trailingAlignBottom ~= true
		},
		testId = `{var36.testId}--trailing`
	}, var36.trailingElement) else nil
	
	return createElement(viewModule, var127, t_1)
end))