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
		PlaceholderText = p1.placeholder,
		TextInputType = if isPluginSecurityModule() then p1.textInputType else nil,
		ManualFocusRelease = if p1.manualFocusRelease then true else nil,
		ShouldEmitReturnEvents = if p1.shouldEmitReturnEvents then true else nil,
		OverlayNativeInput = if p1.overlayNativeInput then true else nil,
		Size = if p1.Size ~= nil then UDim2.fromScale(1, 1) else p1.Size,
		AutomaticSize = p1.automaticSize,
		Text = if isBoundsChecker then nil elseif typeof(p1.text) == "string" then p1.text else p1.text,
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
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), useComposerFocusLockModule (ref), getDisabledStyleModule (ref), getMultiLineTextHeightModule (ref), chatTextAreaDebugModule (ref), measureTextLineCountModule (ref), inputFocusBehaviorModule (ref), useComposerKeyboardConnectionsModule (ref), controlStateModule (ref), radiusModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var1 (ref), mapBindableModule (ref), iconModule (ref)
	local var2 = p1
	
	if p1.Selectable == nil then
		var2 = table.clone(p1)
		var2.Selectable = true
	end
	local createElement_3
	local var3 = withDefaultsModule(var2, t)
	local var4 = useTokensModule()
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef("")
	local var10 = reactModule.useRef(getBindableValueModule(var3.text))
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(Vector2.zero)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(0)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(false)
	local var19 = useTextInputVariantsModule(var4, var3.size, var3.variant, var3.radius, var17, var3.hasError)
	local container = var19.container
	local var20 = if var3.trailingElement and typeof(container.tag) == "string" then string.gsub(container.tag, "gap%-large", "gap-xsmall") else container.tag
	local var21 = useStyleTagsModule(var19.textBox.tag)
	local isDisabled = var3.isDisabled
	local var22 = var3.isDisabled and var3.trailingElement == nil
	local var23 = usePreferredInputModule()
	local var24, var25 = reactModule.useState(false)
	local var26 = var23 == Enum.PreferredInput.Touch
	local standard = var4.Stroke.Standard
	local var27 = math.ceil(standard) * 2
	local var28 = math.ceil(var4.Stroke.Thick) * 2
	useComposerFocusLockModule(isDisabled == true, { var5, var6 })
	local var29 = getDisabledStyleModule(var4.Color.Content.Emphasis, isDisabled)
	local fontStyle = var19.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var30 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
	local var31, var32 = reactModule.useState(1)
	local var33, var34 = reactModule.useState(var30)
	local var35 = var3.maxLines ~= nil
	local var36, var37 = reactModule.useState(function()
		-- upvalues: getBindableValueModule (copy), var3 (ref)
		return getBindableValueModule(var3.text)
	end)
	reactModule.useEffect(function()
		-- upvalues: chatTextAreaDebugModule (copy), var3 (ref)
		chatTextAreaDebugModule.setEnabled(var3.composerDebug == true)
		
		return function() end
	end, { var3.composerDebug })
	local var38 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current or var6.current
		
		return if current and current.AbsoluteSize.X > 0 then current.AbsoluteSize.X else 0
	end, {})
	local var39 = reactModule.useCallback(function(p3)
		-- upvalues: measureTextLineCountModule (copy), var3 (ref), var30 (ref), var38 (ref), fontStyle (ref), fontSize (ref), var34 (ref)
		local var40 = measureTextLineCountModule({
			text = p3,
			maxLines = var3.maxLines,
			singleLineHeight = var30,
			layoutWidth = var38(),
			font = fontStyle.Font,
			fontSize = fontSize
		})
		var34(math.max(if var40.boundsY and var40.boundsY > 0 then math.ceil(var40.boundsY) else var30, var40.lineCount * var30))
		
		return var40.lineCount
	end, {
		fontSize, lineHeight, fontStyle.Font, var3.maxLines, var38, var30
	})
	local var40 = if var35 then var3.text else getBindableValueModule(var3.text)
	local var41 = if var3.maxLines then var31 else math.max(1, var3.numLines)
	local var42 = if var3.alwaysMultiLine then true else var41 > 1
	reactModule.useEffect(function()
		-- upvalues: var35 (ref), getBindableValueModule (copy), var3 (ref), var10 (ref), chatTextAreaDebugModule (copy), var37 (ref), var32 (ref), var39 (ref)
		if not var35 then
			return function() end
		end
		local var43 = getBindableValueModule(var3.text)
		
		if var43 ~= var10.current then
			chatTextAreaDebugModule.log("syncFromParent", `len={utf8.len(var43) or #var43}`)
			var10.current = var43
			var37(var43)
			var32(var39(var43))
			task.defer(function()
				-- upvalues: var32 (copy), var39 (copy), var43 (ref)
				var32(var39(var43))
			end)
		end
		return function() end
	end, { var3.text, var39, var35 })
	local var43 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			var5.current.SelectionStart = p3
		end
		if var6.current then
			var6.current.SelectionStart = p3
		end
	end, {})
	local var44 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			var5.current.CursorPosition = p3
		end
		if var6.current then
			var6.current.CursorPosition = p3
		end
	end, {})
	local var45 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref), var43 (ref), var44 (ref)
		local current = var5.current or var6.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var43(0)
			var44(charCount + 1)
		end
	end, { var43, var44 })
	local var46 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var3 (ref), inputFocusBehaviorModule (copy), var45 (ref)
		if var5.current == nil then return end
		var5.current:CaptureFocus()
		
		if var3.focusBehavior == inputFocusBehaviorModule.Highlight then
			task.spawn(var45)
		end
	end, { var45, var3.focusBehavior })
	local var47 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref), var25 (ref), var18 (ref)
		if var5.current then
			var5.current:ReleaseFocus()
		end
		if var6.current then
			var6.current:ReleaseFocus()
		end
		var25(false)
		var18(false)
	end, {})
	local var48 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		return if var5.current then var5.current:IsFocused() else nil
	end, {})
	local var49 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		return if var5.current then var5.current.SelectionStart else nil
	end, {})
	local var50 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		return if var5.current then var5.current.CursorPosition else nil
	end, {})
	local var51 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		if var5.current then
			var5.current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var48 (ref), var46 (ref), var47 (ref), var16 (ref), var49 (ref), var50 (ref), var44 (ref), var43 (ref)
		return {
			getIsFocused = var48,
			focus = var46,
			releaseFocus = var47,
			setHover = var16,
			getSelectionStart = var49,
			getCursorPosition = var50,
			setCursorPosition = var44,
			setSelectionStart = var43
		}
	end, {
		var50, var48, var49, var46, var47, var44, var43
	})
	local var52 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), var13 (ref), var10 (ref), var42 (ref), var7 (ref), var35 (ref), var37 (ref), var3 (ref), var32 (ref), var39 (ref)
		if p3 == nil or p3.Parent == nil or var9.current ~= "" then return end
		local text = p3.Text
		
		if var13.current and text ~= "" then return end
		if text == var10.current then return end
		var10.current = text
		
		if var42 and var7.current then
			var7.current.Text = text
		end
		if var35 then
			var37(text)
		end
		if var3.maxLines then
			var32(var39(text))
			task.defer(function()
				-- upvalues: var32 (copy), var39 (copy), text (ref)
				var32(var39(text))
			end)
		end
		var3.onChanged(text)
	end, {
		var3.onChanged, var42, var24, var3.maxLines, var39, var35
	})
	local var53 = reactModule.useRef(false)
	local var54 = reactModule.useCallback(function(_, p3)
		-- upvalues: var53 (ref)
		if p3.UserInputType == Enum.UserInputType.MouseMovement then
			var53.current = false
		end
	end, {})
	local var55 = reactModule.useCallback(function(_, p3)
		-- upvalues: var53 (ref), var45 (ref)
		if not var53.current then return end
		var53.current = false
		
		if p3.UserInputType == Enum.UserInputType.MouseButton1 then
			var45()
			
			return
		end
	end, { var43, var44, var45 })
	local var56 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var35 (ref), var37 (ref), var3 (ref), var32 (ref), var39 (ref)
		var10.current = p3
		
		if var35 then
			var37(p3)
		end
		if var3.maxLines then
			var32(var39(p3))
		end
		var3.onChanged(p3)
	end, { var3.maxLines, var39, var3.onChanged, var35 })
	local var57 = var3.onReturnPressed ~= nil and not var26
	local var58 = reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var14 (ref), chatTextAreaDebugModule (copy), var13 (ref)
		if var3.onReturnPressed == nil then return end
		local processTime = os.clock()
		
		if processTime - var14.current < 0.15 then
			chatTextAreaDebugModule.log("returnSubmit", `source={p3} skipped=debounced`)
			
			return
		end
		chatTextAreaDebugModule.log("returnSubmit", `source={p3}`)
		var14.current = processTime
		var13.current = true
		var3.onReturnPressed()
		task.delay(0.15, function()
			-- upvalues: var13 (copy)
			var13.current = false
		end)
	end, { var3.onReturnPressed })
	local var59 = useComposerKeyboardConnectionsModule({
		enabled = var57 == true,
		onReturnPressed = reactModule.useCallback(function(_, p3)
			-- upvalues: var5 (ref), chatTextAreaDebugModule (copy), var56 (ref), var58 (ref)
			local current = var5.current
			
			if current == nil or current:IsFocused() ~= true then return end
			if p3 then
				local text = current.Text
				task.defer(function()
					-- upvalues: current (ref), text (ref), chatTextAreaDebugModule (copy), var56 (copy)
					if current.Parent == nil then return end
					local text_1 = current.Text
					
					if text_1 ~= text then
						chatTextAreaDebugModule.log("returnNewline", "source=UserInputService.InputBegan-shift engineInserted=true")
						var56(text_1)
					end
				end)
				
				return
			end
			var58(current, "UserInputService.InputBegan")
		end, { var58, var56 })
	})
	local connect = var59.connect
	local disconnect = var59.disconnect
	local var60 = reactModule.useCallback(function()
		-- upvalues: isDisabled (ref), var42 (ref), var26 (ref), var5 (ref), var9 (ref), var25 (ref), var18 (ref), var3 (ref), var57 (ref), connect (ref), inputFocusBehaviorModule (copy), var6 (ref), var53 (ref)
		if isDisabled then return end
		if var42 and var26 then
			if var5.current and var5.current.Parent then
				var9.current = var5.current.Text
			end
			var25(true)
		end
		var18(true)
		
		if var3.onFocus then
			var3.onFocus()
		end
		if var57 then
			connect()
		end
		local focusBehavior = var3.focusBehavior
		
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
			var53.current = true
		end
	end, {
		var3.onFocus, isDisabled, var26, var42, var3.focusBehavior, var57, connect
	})
	local var61 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var55 (ref)
		var55(p3, p4)
	end, { var55 })
	local var62 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: chatTextAreaDebugModule (copy), var57 (ref), disconnect (ref), var18 (ref), var53 (ref), var42 (ref), var25 (ref), var3 (ref), var58 (ref)
		chatTextAreaDebugModule.log("textBox.FocusLost", `enterPressed={p4}`)
		
		if var57 then
			disconnect()
		end
		var18(false)
		var53.current = false
		
		if var42 then
			var25(false)
		end
		if var3.onFocusLost then
			var3.onFocusLost(p5)
		end
		if p4 and var57 then
			var58(p3, "TextBox.FocusLost")
		end
	end, {
		var42,
		var3.onFocusLost,
		var57,
		var58,
		disconnect
	})
	local var63 = reactModule.useCallback(function(p3)
		-- upvalues: var16 (ref), controlStateModule (copy)
		var16(p3 == controlStateModule.Hover)
	end, {})
	local var64 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), var3 (ref)
		var11.current = p4
		
		if var3.onDragStarted then
			var3.onDragStarted(p3, p4)
		end
	end, { var3.onDragStarted })
	local var65 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var3 (ref)
		if var3.onDrag then
			var3.onDrag(p3, p4)
		end
	end, { var3.onDrag })
	local var66 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), var46 (ref), var47 (ref), var18 (ref), var3 (ref)
		if var11.current == p4 then
			var46()
		else
			var47()
			var18(false)
		end
		var11.current = nil
		
		if var3.onDragEnded then
			var3.onDragEnded(p3, p4)
		end
	end, { var3.onDragEnded, var46, var47 })
	local var67 = if var3.maxLines then getMultiLineTextHeightModule(fontSize, var3.maxLines, lineHeight) else nil
	local var68 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var30 (ref), var33 (ref), var67 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), var41 (ref), lineHeight (ref)
		return if var3.maxLines then math.clamp(math.max(var30, var33), var30, var67) else getMultiLineTextHeightModule(fontSize, var41, lineHeight)
	end, {
		var3.maxLines, var30, var33, var67, fontSize, var41, lineHeight
	})
	local var69 = reactModule.useMemo(function()
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), container (ref), var27 (ref)
		local var70 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
		
		return UDim.new(0, math.ceil((var70 + math.round(math.round((container.minHeight - var27 - var70) * 2) / 2) + var27) / 2))
	end, { container.minHeight, var27, fontSize, lineHeight })
	local var70 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var69 (ref), radiusModule (copy), container (ref)
		return if var3.maxLines then var69 elseif var3.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil
	end, {
		var3.maxLines,
		var69,
		container.minHeight,
		var3.radius
	})
	local var71 = reactModule.useMemo(function()
		-- upvalues: var70 (ref), container (ref), var4 (ref)
		return {
			radius = var70 or UDim.new(0, container.radius),
			offset = var4.Stroke.Thick,
			borderWidth = var4.Stroke.Thick
		}
	end, { var4, container.radius, var70 })
	local var72, var73 = reactModule.useMemo(function()
		-- upvalues: container (ref), var27 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var68 (ref)
		local var74 = math.round((container.minHeight - var27 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var74 / 2)),
			bottom = UDim.new(0, math.ceil(var74 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var68 + math.round(var74) + var27
	end, {
		container.minHeight, var27, var28, fontSize, var68, lineHeight
	})
	local var74 = var72.bottom.Offset + var72.top.Offset
	local var75 = var3.textPaddingOnParent == true
	local var76 = if var75 then nil else var72
	local var77 = if var75 then var68 else var68 + var74
	local var78 = var42 and (var3.maxLines ~= nil and not var24)
	local var79 = if var78 then math.max(var77, if var75 then var33 else var33 + var74) else var77
	local var80 = if var75 then var79 + var74 else var79
	local uDim2 = UDim2.new(1, 0, 0, var79)
	local uDim2_1 = UDim2.new(1, 0, 0, var77)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), chatTextAreaDebugModule (copy), var41 (ref), var73 (ref)
		if var3.maxLines then
			chatTextAreaDebugModule.log("layout", `lineCount={var41} borderFrameHeight={var73}`)
		end
		return function() end
	end, { var41, var73, var3.maxLines })
	local var81 = reactModule.useMemo(function()
		-- upvalues: var42 (ref), var3 (ref)
		return if var42 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = if var3.maxLines ~= nil then Enum.ItemLineAlignment.Center else Enum.ItemLineAlignment.Start
		} else nil
	end, { var42, var3.maxLines })
	local var82 = reactModule.useMemo(function()
		-- upvalues: var42 (ref)
		return if var42 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var42 })
	local var83 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var7 (ref), truncateTextToCursorModule (copy), var72 (ref)
		local current = var8.current
		local current_1 = var7.current
		
		if current == nil or current_1 == nil then return end
		local var84 = p3.TextSize * p3.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p3)
		local y_1 = current_1.TextBounds.Y
		local var85 = y - var72.top.Offset + var72.bottom.Offset
		local var86 = y + current.AbsoluteSize.Y - var72.top.Offset - var72.bottom.Offset
		
		if y_1 - var84 < var85 then
			current.CanvasPosition += Vector2.new(0, y_1 - var84 - var85)
		end
		if var86 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var86)
		end
	end, { var72 })
	local var84 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var12 (ref)
		if p3 == nil then
			return
		end
		var8.current = p3
		p3.ClipsDescendants = true
		p3.CanvasPosition = var12.current
	end, {})
	local var85 = reactModule.useCallback(function(p3)
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
	local var86 = reactModule.useCallback(function(p3)
		-- upvalues: var12 (ref)
		var12.current = p3.CanvasPosition
	end, {})
	local var87 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), reactModule (copy), var64 (ref), var65 (ref), var66 (ref), var17 (ref), isDisabled (ref)
		return if var3.onDragStarted or var3.onDrag or var3.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var64,
			[reactModule.Event.DragContinue] = var65,
			[reactModule.Event.DragEnd] = var66,
			Enabled = not var17 and not isDisabled
		}) else nil
	end, {
		var64, var65, var66, var17, isDisabled, var3.onDragStarted, var3.onDrag,
		var3.onDragEnded
	})
	local var88 = useBindableModule(if var3.horizontalPadding then var3.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var89 = useBindableModule(if var3.horizontalPadding then var3.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var90 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), container (ref), var4 (ref)
		return if var3.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var4.Stroke.Standard) / 2) else nil
	end, {
		var3.hasClearButton,
		container.minHeight,
		var4.Stroke.Standard
	})
	local var91 = reactUtilsModule.useComposedRef(var6, var85)
	local createElement = reactModule.createElement
	local var92 = withCommonPropsModule(var3, {
		Size = UDim2.new(1, 0, 0, var73),
		selection = {
			Selectable = var3.Selectable and not isDisabled,
			NextSelectionUp = var3.NextSelectionUp,
			NextSelectionDown = var3.NextSelectionDown,
			NextSelectionLeft = var3.NextSelectionLeft,
			NextSelectionRight = var3.NextSelectionRight
		},
		cursor = var71,
		stroke = if container.strokeStyle and container.strokeThickness then {
			Color = container.strokeStyle.Color3,
			Transparency = if isDisabled then blendTransparenciesModule(container.strokeStyle.Transparency, constantsModule.DISABLED_TRANSPARENCY) else container.strokeStyle.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var17 or var15 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = var70,
		padding = {
			left = var88:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			right = if var3.trailingElement == nil and var3.hasClearButton then UDim.new(0, standard) else var89:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not isDisabled then var46 else nil,
		onStateChanged = var63,
		isDisabled = var22,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var3.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var22) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		tag = var20,
		testId = `{var3.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var87,
		Background = var3.backgroundGradient,
		Leading = if var3.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if var22 then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var3.testId}--leading`
		}, var3.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var93 = if var42 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		selection = { Selectable = false },
		scroll = var82,
		layout = var81,
		onCanvasPositionChanged = if var42 then var86 else nil,
		scrollingFrameRef = if var42 then var84 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var94 = viewModule
	local t_4 = {
		Size = if var78 then UDim2.new(1, 0, 0, var80) else nil,
		tag = { ["fill size-full"] = not var78 },
		padding = if var75 then var72 else nil,
		selection = { Selectable = false },
		onActivated = if not isDisabled then var46 else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}
	local t_5 = {}
	
	if var24 then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(var1, {
			overlayNativeInput = nil,
			text = var40,
			placeholder = var3.placeholder,
			textInputType = var3.textInputType,
			fontStyle = fontStyle,
			textStyle = var29,
			isMultiLine = var42,
			isDisabled = isDisabled,
			ref = var5,
			tag = `{var21 or ""} data-testid={var3.testId}--textbox`,
			Size = if var42 then uDim2 else nil,
			automaticSize = if var3.maxLines then nil elseif not var35 then if var42 and not var24 and var36 ~= "" then Enum.AutomaticSize.Y else nil else mapBindableModule(var3.text, function(p3)
				-- upvalues: var42 (ref), var24 (ref)
				return if var42 and not var24 and p3 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var76,
			onFocusGained = var60,
			onFocusLost = if var42 and var26 then nil else var62,
			onTextChanged = var52,
			onCursorPositionChanged = if var42 then var83 else nil,
			onInputChanged = var54,
			onInputEnded = var61,
			manualFocusRelease = if var26 then var3.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var26 and var3.manualFocusRelease == true and var3.alwaysMultiLine == true then true else nil
		}, {
			DragDetector = var87,
			BoundsChecker = if var42 then reactModule.createElement(var1, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var29,
				Size = if var75 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, var74),
				ref = var7
			}) else nil
		})
	end
	local var95
	t_5.TextBox = createElement_3
	
	if var42 and var24 then
		var95 = reactModule.createElement
		var95 = var95(var1, {
			overlayNativeInput = nil,
			text = var40,
			placeholder = var3.placeholder,
			textInputType = var3.textInputType,
			fontStyle = fontStyle,
			textStyle = var29,
			isMultiLine = var42,
			isDisabled = isDisabled,
			padding = var76,
			ref = var91,
			tag = `{var21 or ""} data-testid={var3.testId}--mobile-textbox`,
			Size = uDim2_1,
			onFocusLost = if var42 and var26 then var62 else nil,
			onTextChanged = var52,
			onCursorPositionChanged = if var42 then var83 else nil,
			onInputEnded = var61,
			manualFocusRelease = if var26 then var3.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var26 and var3.manualFocusRelease == true and var3.alwaysMultiLine == true then true else nil
		})
	else
		var95 = nil
	end
	t_5.MobileTextBox = var95
	t_3.TextContent = createElement_2(var94, t_4, t_5)
	t_1.TextBoxWrapper = createElement_1(var93, t_2, t_3)
	t_1.Clear = if var3.hasClearButton then reactModule.createElement(viewModule, {
		LayoutOrder = 3,
		isDisabled = isDisabled,
		GroupTransparency = if isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		Visible = mapBindableModule(var3.text, function(p3)
			return p3 ~= ""
		end),
		tag = var19.clearButton.tag
	}, {
		ClearButton = reactModule.createElement(viewModule, {
			tag = "anchor-center-left auto-xy",
			onActivated = var51,
			padding = UDim.new(0, var19.clearButton.padding),
			Position = var90,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var3.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var19.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var3.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		GroupTransparency = if var22 then constantsModule.DISABLED_TRANSPARENCY else nil,
		tag = {
			["col align-y-bottom self-stretch size-0-full auto-x"] = var3.trailingAlignBottom == true,
			["row align-y-center size-0-full auto-x"] = var3.trailingAlignBottom ~= true
		},
		testId = `{var3.testId}--trailing`
	}, var3.trailingElement) else nil
	
	return createElement(viewModule, var92, t_1)
end))