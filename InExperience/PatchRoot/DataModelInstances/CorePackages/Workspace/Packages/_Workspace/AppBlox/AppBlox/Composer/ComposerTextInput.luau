local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local parent = foundation.Parent
local parent_1 = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local fFlagComposerControlAlignment = require(parent_1.SharedFlags).FFlagComposerControlAlignment
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
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), getBindableValueModule (ref), useTextInputVariantsModule (ref), fFlagComposerControlAlignment (ref), inputVariantModule (ref), useStyleTagsModule (ref), usePreferredInputModule (ref), useComposerFocusLockModule (ref), getDisabledStyleModule (ref), getMultiLineTextHeightModule (ref), composerDebugModule (ref), measureTextLineCountModule (ref), inputFocusBehaviorModule (ref), useComposerKeyboardConnectionsModule (ref), controlStateModule (ref), radiusModule (ref), truncateTextToCursorModule (ref), useBindableModule (ref), reactUtilsModule (ref), viewModule (ref), withCommonPropsModule (ref), blendTransparenciesModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), scrollViewModule (ref), var1 (ref), mapBindableModule (ref), iconModule (ref)
	local var2 = p1
	
	if p1.Selectable == nil then
		var2 = table.clone(p1)
		var2.Selectable = true
	end
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
	local var20 = if var3.leadingElement ~= nil then if fFlagComposerControlAlignment and var3.trailingElement ~= nil then var4.Gap.XSmall else nil else var4.Gap.Small
	local var21 = if var20 == nil and var3.trailingElement and typeof(container.tag) == "string" then string.gsub(container.tag, "gap%-large", "gap-xsmall") else container.tag
	local var22 = if fFlagComposerControlAlignment and var17 and (var3.variant == inputVariantModule.Standard and not var3.hasError) then var4.Color.Stroke.Default else container.strokeStyle
	local var23 = useStyleTagsModule(var19.textBox.tag)
	local isDisabled = var3.isDisabled
	local var24 = reactModule.useRef(isDisabled)
	var24.current = isDisabled
	local var25 = var3.isDisabled and var3.trailingElement == nil
	local var26 = usePreferredInputModule()
	local var27, var28 = reactModule.useState(false)
	local var29 = var26 == Enum.PreferredInput.Touch
	reactModule.useEffect(function()
		-- upvalues: isDisabled (ref), var28 (ref), var18 (ref)
		if isDisabled then
			var28(false)
			var18(false)
		end
		return function() end
	end, { isDisabled })
	local standard = var4.Stroke.Standard
	local var30 = math.ceil(standard) * 2
	local var31 = math.ceil(var4.Stroke.Thick) * 2
	useComposerFocusLockModule(isDisabled == true, { var5, var6 })
	local var32 = getDisabledStyleModule(var4.Color.Content.Emphasis, isDisabled)
	local fontStyle = var19.textBox.fontStyle
	local fontSize = fontStyle.FontSize
	local lineHeight = fontStyle.LineHeight
	local var33 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
	local var34, var35 = reactModule.useState(1)
	local var36, var37 = reactModule.useState(var33)
	local var38 = var3.maxLines ~= nil
	local var39, var40 = reactModule.useState(function()
		-- upvalues: getBindableValueModule (copy), var3 (ref)
		return getBindableValueModule(var3.text)
	end)
	reactModule.useEffect(function()
		-- upvalues: composerDebugModule (copy), var3 (ref)
		composerDebugModule.setEnabled(var3.composerDebug == true)
		
		return function() end
	end, { var3.composerDebug })
	local var41 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current or var6.current
		
		return if current and current.AbsoluteSize.X > 0 then current.AbsoluteSize.X else 0
	end, {})
	local var42 = reactModule.useCallback(function(p3)
		-- upvalues: measureTextLineCountModule (copy), var3 (ref), var33 (ref), var41 (ref), fontStyle (ref), fontSize (ref), var37 (ref)
		local var43 = measureTextLineCountModule({
			text = p3,
			maxLines = var3.maxLines,
			singleLineHeight = var33,
			layoutWidth = var41(),
			font = fontStyle.Font,
			fontSize = fontSize
		})
		var37(math.max(if var43.boundsY and var43.boundsY > 0 then math.ceil(var43.boundsY) else var33, var43.lineCount * var33))
		
		return var43.lineCount
	end, {
		fontSize, lineHeight, fontStyle.Font, var3.maxLines, var41, var33
	})
	local var43 = if var38 then var3.text else getBindableValueModule(var3.text)
	local maxValue = math.max(1, math.floor(var3.minLines or 1))
	
	if var3.maxLines then
		maxValue = math.min(maxValue, var3.maxLines)
	end
	local createElement_3
	local var44 = if var3.maxLines then math.max(maxValue, var34) else math.max(maxValue, var3.numLines)
	local var45 = if var3.alwaysMultiLine then true else var44 > 1
	local var46 = var45 and var27
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), getBindableValueModule (copy), var3 (ref), var10 (ref), composerDebugModule (copy), var40 (ref), var35 (ref), var42 (ref)
		if not var38 then
			return function() end
		end
		local var47 = getBindableValueModule(var3.text)
		
		if var47 ~= var10.current then
			composerDebugModule.log("syncFromParent", `len={utf8.len(var47) or #var47}`)
			var10.current = var47
			var40(var47)
			var35(var42(var47))
			task.defer(function()
				-- upvalues: var35 (copy), var42 (copy), var47 (ref)
				var35(var42(var47))
			end)
		end
		return function() end
	end, { var3.text, var42, var38 })
	local var47 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			var5.current.SelectionStart = p3
		end
		if var6.current then
			var6.current.SelectionStart = p3
		end
	end, {})
	local var48 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var6 (ref)
		if var5.current then
			var5.current.CursorPosition = p3
		end
		if var6.current then
			var6.current.CursorPosition = p3
		end
	end, {})
	local var49 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref), var47 (ref), var48 (ref)
		local current = var5.current or var6.current
		
		if current == nil or current.Parent == nil then return end
		local charCount = utf8.len(current.Text)
		
		if charCount then
			var47(0)
			var48(charCount + 1)
		end
	end, { var47, var48 })
	local var50 = reactModule.useCallback(function()
		-- upvalues: var45 (ref), var29 (ref), var27 (ref), var5 (ref), var9 (ref), var28 (ref), var6 (ref), var3 (ref), inputFocusBehaviorModule (copy), var49 (ref)
		if var45 and var29 and not var27 then
			if var5.current and var5.current.Parent then
				var9.current = var5.current.Text
			end
			var28(true)
			
			return
		else
			local current = var5.current or var6.current
			
			if current == nil then return end
			current:CaptureFocus()
			
			if var3.focusBehavior == inputFocusBehaviorModule.Highlight then
				task.spawn(var49)
			end
		end
	end, {
		var49,
		var3.focusBehavior,
		var45,
		var29,
		var27
	})
	local var51 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref), var28 (ref), var18 (ref)
		if var5.current then
			var5.current:ReleaseFocus()
		end
		if var6.current then
			var6.current:ReleaseFocus()
		end
		var28(false)
		var18(false)
	end, {})
	local var52 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current or var6.current
		
		return if current then current:IsFocused() else nil
	end, {})
	local var53 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current or var6.current
		
		return if current then current.SelectionStart else nil
	end, {})
	local var54 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current or var6.current
		
		return if current then current.CursorPosition else nil
	end, {})
	local var55 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var6 (ref)
		local current = var5.current or var6.current
		
		if current then
			current.Text = ""
		end
	end, {})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var52 (ref), var50 (ref), var51 (ref), var16 (ref), var53 (ref), var54 (ref), var48 (ref), var47 (ref)
		return {
			getIsFocused = var52,
			focus = var50,
			releaseFocus = var51,
			setHover = var16,
			getSelectionStart = var53,
			getCursorPosition = var54,
			setCursorPosition = var48,
			setSelectionStart = var47
		}
	end, {
		var54, var52, var53, var50, var51, var48, var47
	})
	local var56 = reactModule.useCallback(function(p3)
		-- upvalues: var9 (ref), var24 (ref), var13 (ref), var10 (ref), var45 (ref), var7 (ref), var38 (ref), var40 (ref), var3 (ref), var35 (ref), var42 (ref)
		if p3 == nil or p3.Parent == nil or var9.current ~= "" then return end
		if var24.current then return end
		local text = p3.Text
		
		if var13.current and text ~= "" then return end
		if text == var10.current then return end
		var10.current = text
		
		if var45 and var7.current then
			var7.current.Text = text
		end
		if var38 then
			var40(text)
		end
		if var3.maxLines then
			var35(var42(text))
			task.defer(function()
				-- upvalues: var35 (copy), var42 (copy), text (ref)
				var35(var42(text))
			end)
		end
		var3.onChanged(text)
	end, {
		var3.onChanged,
		var45,
		var3.maxLines,
		var42,
		var38
	})
	local var57 = reactModule.useRef(false)
	local var58 = reactModule.useCallback(function(_, p3)
		-- upvalues: var57 (ref)
		if p3.UserInputType == Enum.UserInputType.MouseMovement then
			var57.current = false
		end
	end, {})
	local var59 = reactModule.useCallback(function(_, p3)
		-- upvalues: var57 (ref), var49 (ref)
		if not var57.current then return end
		var57.current = false
		
		if p3.UserInputType == Enum.UserInputType.MouseButton1 then
			var49()
			
			return
		end
	end, { var47, var48, var49 })
	local var60 = reactModule.useCallback(function(p3)
		-- upvalues: var10 (ref), var38 (ref), var40 (ref), var3 (ref), var35 (ref), var42 (ref)
		var10.current = p3
		
		if var38 then
			var40(p3)
		end
		if var3.maxLines then
			var35(var42(p3))
		end
		var3.onChanged(p3)
	end, { var3.maxLines, var42, var3.onChanged, var38 })
	local var61 = var3.onReturnPressed ~= nil and not var29
	local var62 = reactModule.useCallback(function(_, p3)
		-- upvalues: var3 (ref), var14 (ref), composerDebugModule (copy), var13 (ref)
		if var3.onReturnPressed == nil then return end
		local processTime = os.clock()
		
		if processTime - var14.current < 0.15 then
			composerDebugModule.log("returnSubmit", `source={p3} skipped=debounced`)
			
			return
		end
		composerDebugModule.log("returnSubmit", `source={p3}`)
		var14.current = processTime
		var13.current = true
		var3.onReturnPressed()
		task.delay(0.15, function()
			-- upvalues: var13 (copy)
			var13.current = false
		end)
	end, { var3.onReturnPressed })
	local var63 = useComposerKeyboardConnectionsModule({
		enabled = var61 == true,
		onReturnPressed = reactModule.useCallback(function(_, p3)
			-- upvalues: var5 (ref), composerDebugModule (copy), var60 (ref), var62 (ref)
			local current = var5.current
			
			if current == nil or current:IsFocused() ~= true then return end
			if p3 then
				local text = current.Text
				task.defer(function()
					-- upvalues: current (ref), text (ref), composerDebugModule (copy), var60 (copy)
					if current.Parent == nil then return end
					local text_1 = current.Text
					
					if text_1 ~= text then
						composerDebugModule.log("returnNewline", "source=UserInputService.InputBegan-shift engineInserted=true")
						var60(text_1)
					end
				end)
				
				return
			end
			var62(current, "UserInputService.InputBegan")
		end, { var62, var60 })
	})
	local connect = var63.connect
	local disconnect = var63.disconnect
	local var64 = reactModule.useCallback(function()
		-- upvalues: isDisabled (ref), var18 (ref), var3 (ref), var61 (ref), connect (ref), inputFocusBehaviorModule (copy), var5 (ref), var6 (ref), var57 (ref)
		if isDisabled then return end
		var18(true)
		
		if var3.onFocus then
			var3.onFocus()
		end
		if var61 then
			connect()
		end
		local focusBehavior = var3.focusBehavior
		
		if focusBehavior == inputFocusBehaviorModule.Clear then
			if var5.current then
				var5.current.Text = ""
			end
			if var6.current then
				var6.current.Text = ""
				
				return
			end
		elseif focusBehavior == inputFocusBehaviorModule.Highlight then
			var57.current = true
		end
	end, {
		var3.onFocus,
		isDisabled,
		var3.focusBehavior,
		var61,
		connect
	})
	local var65 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var59 (ref)
		var59(p3, p4)
	end, { var59 })
	local var66 = reactModule.useCallback(function(p3, p4, p5)
		-- upvalues: composerDebugModule (copy), var61 (ref), disconnect (ref), var18 (ref), var57 (ref), var45 (ref), var28 (ref), var3 (ref), var62 (ref)
		composerDebugModule.log("textBox.FocusLost", `enterPressed={p4}`)
		
		if var61 then
			disconnect()
		end
		var18(false)
		var57.current = false
		
		if var45 then
			var28(false)
		end
		if var3.onFocusLost then
			var3.onFocusLost(p5)
		end
		if p4 and var61 then
			var62(p3, "TextBox.FocusLost")
		end
	end, {
		var45,
		var3.onFocusLost,
		var61,
		var62,
		disconnect
	})
	local var67 = reactModule.useCallback(function(p3)
		-- upvalues: var16 (ref), controlStateModule (copy)
		var16(p3 == controlStateModule.Hover)
	end, {})
	local var68 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), var3 (ref)
		var11.current = p4
		
		if var3.onDragStarted then
			var3.onDragStarted(p3, p4)
		end
	end, { var3.onDragStarted })
	local var69 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var3 (ref)
		if var3.onDrag then
			var3.onDrag(p3, p4)
		end
	end, { var3.onDrag })
	local var70 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var11 (ref), var50 (ref), var51 (ref), var18 (ref), var3 (ref)
		if var11.current == p4 then
			var50()
		else
			var51()
			var18(false)
		end
		var11.current = nil
		
		if var3.onDragEnded then
			var3.onDragEnded(p3, p4)
		end
	end, { var3.onDragEnded, var50, var51 })
	local var71 = if var3.maxLines then getMultiLineTextHeightModule(fontSize, var3.maxLines, lineHeight) else nil
	local var72 = getMultiLineTextHeightModule(fontSize, maxValue, lineHeight)
	local var73 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var72 (ref), var36 (ref), var71 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), var44 (ref), lineHeight (ref)
		return if var3.maxLines then math.clamp(math.max(var72, var36), var72, var71) else getMultiLineTextHeightModule(fontSize, var44, lineHeight)
	end, {
		var3.maxLines, var72, var36, var71, fontSize, var44, lineHeight
	})
	local var74 = reactModule.useMemo(function()
		-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), container (ref), var30 (ref)
		local var75 = getMultiLineTextHeightModule(fontSize, 1, lineHeight)
		
		return UDim.new(0, math.ceil((var75 + math.round(math.round((container.minHeight - var30 - var75) * 2) / 2) + var30) / 2))
	end, { container.minHeight, var30, fontSize, lineHeight })
	local var75 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var74 (ref), radiusModule (copy), container (ref)
		return if var3.maxLines then var74 elseif var3.radius == radiusModule.Circle then UDim.new(0, math.ceil(container.minHeight / 2)) else nil
	end, {
		var3.maxLines,
		var74,
		container.minHeight,
		var3.radius
	})
	local var76 = reactModule.useMemo(function()
		-- upvalues: var75 (ref), container (ref), var4 (ref)
		return {
			radius = var75 or UDim.new(0, container.radius),
			offset = var4.Stroke.Thick,
			borderWidth = var4.Stroke.Thick
		}
	end, { var4, container.radius, var75 })
	local var77, var78 = reactModule.useMemo(function()
		-- upvalues: container (ref), var30 (ref), getMultiLineTextHeightModule (copy), fontSize (ref), lineHeight (ref), var73 (ref)
		local var79 = math.round((container.minHeight - var30 - getMultiLineTextHeightModule(fontSize, 1, lineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, math.floor(var79 / 2)),
			bottom = UDim.new(0, math.ceil(var79 / 2)),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, var73 + math.round(var79) + var30
	end, {
		container.minHeight, var30, var31, fontSize, var73, lineHeight
	})
	local var79 = var77.bottom.Offset + var77.top.Offset
	local var80 = var45 and (var3.maxLines ~= nil and not var27)
	local var81 = var3.textPaddingOnParent == true
	local var82 = var81 and var80
	local var83 = var81 and not var82
	local var84 = if var81 then nil else var77
	local var85 = if var81 then var73 else var73 + var79
	local var86 = if var80 then math.max(var85, if var81 then var36 else var36 + var79) else var85
	local var87 = if var83 then var86 + var79 else var86
	local uDim2 = UDim2.new(1, 0, 0, var86)
	local uDim2_1 = UDim2.new(1, 0, 0, var85)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), composerDebugModule (copy), var44 (ref), var78 (ref)
		if var3.maxLines then
			composerDebugModule.log("layout", `lineCount={var44} borderFrameHeight={var78}`)
		end
		return function() end
	end, { var44, var78, var3.maxLines })
	local var88 = reactModule.useMemo(function()
		-- upvalues: var45 (ref), var3 (ref)
		return if var45 then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = if var3.maxLines ~= nil then Enum.ItemLineAlignment.Center else Enum.ItemLineAlignment.Start
		} else nil
	end, { var45, var3.maxLines })
	local var89 = reactModule.useMemo(function()
		-- upvalues: var45 (ref)
		return if var45 then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { var45 })
	local var90 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var7 (ref), truncateTextToCursorModule (copy), var77 (ref)
		local current = var8.current
		local current_1 = var7.current
		
		if current == nil or current_1 == nil then return end
		local var91 = p3.TextSize * p3.LineHeight
		local y = current.CanvasPosition.Y
		current_1.Text = truncateTextToCursorModule(p3)
		local y_1 = current_1.TextBounds.Y
		local var92 = y - var77.top.Offset + var77.bottom.Offset
		local var93 = y + current.AbsoluteSize.Y - var77.top.Offset - var77.bottom.Offset
		
		if y_1 - var91 < var92 then
			current.CanvasPosition += Vector2.new(0, y_1 - var91 - var92)
		end
		if var93 < y_1 then
			current.CanvasPosition += Vector2.new(0, y_1 - var93)
		end
	end, { var77 })
	local var91 = reactModule.useCallback(function(p3)
		-- upvalues: var8 (ref), var12 (ref)
		if p3 == nil then
			return
		end
		var8.current = p3
		p3.ClipsDescendants = true
		p3.CanvasPosition = var12.current
	end, {})
	local var92 = reactModule.useCallback(function(p3)
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
	local var93 = reactModule.useCallback(function(p3)
		-- upvalues: var12 (ref)
		var12.current = p3.CanvasPosition
	end, {})
	local var94 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), reactModule (copy), var68 (ref), var69 (ref), var70 (ref), var17 (ref), isDisabled (ref)
		return if var3.onDragStarted or var3.onDrag or var3.onDragEnded then reactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[reactModule.Event.DragStart] = var68,
			[reactModule.Event.DragContinue] = var69,
			[reactModule.Event.DragEnd] = var70,
			Enabled = not var17 and not isDisabled
		}) else nil
	end, {
		var68, var69, var70, var17, isDisabled, var3.onDragStarted, var3.onDrag,
		var3.onDragEnded
	})
	local var95 = useBindableModule(if var3.horizontalPadding then var3.horizontalPadding.left or UDim.new(0, 0) else UDim.new(0, 0))
	local var96 = useBindableModule(if var3.horizontalPadding then var3.horizontalPadding.right or UDim.new(0, 0) else UDim.new(0, 0))
	local var97 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), container (ref), var4 (ref)
		return if var3.hasClearButton then UDim2.fromOffset(0, (container.minHeight - var4.Stroke.Standard) / 2) else nil
	end, {
		var3.hasClearButton,
		container.minHeight,
		var4.Stroke.Standard
	})
	local var98 = reactUtilsModule.useComposedRef(var6, var92)
	local createElement = reactModule.createElement
	local var99 = withCommonPropsModule(var3, {
		Size = UDim2.new(1, 0, 0, var78),
		selection = {
			Selectable = var3.Selectable and not isDisabled,
			NextSelectionUp = var3.NextSelectionUp,
			NextSelectionDown = var3.NextSelectionDown,
			NextSelectionLeft = var3.NextSelectionLeft,
			NextSelectionRight = var3.NextSelectionRight
		},
		cursor = var76,
		stroke = if var22 and container.strokeThickness then {
			Color = var22.Color3,
			Transparency = if isDisabled then blendTransparenciesModule(var22.Transparency, constantsModule.DISABLED_TRANSPARENCY) else var22.Transparency,
			Thickness = container.strokeThickness,
			BorderStrokePosition = if var17 or var15 then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = var75,
		padding = {
			left = var95:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			right = if var3.trailingElement == nil and var3.hasClearButton then UDim.new(0, standard) else var96:map(function(p3)
				-- upvalues: standard (ref)
				return UDim.new(0, standard) + p3
			end),
			top = UDim.new(0, standard),
			bottom = UDim.new(0, standard)
		},
		onActivated = if not isDisabled then var50 else nil,
		onStateChanged = var67,
		isDisabled = var25,
		backgroundStyle = if container.bgStyle then getDisabledStyleModule({
			Color3 = container.bgStyle.Color3,
			Transparency = if var3.backgroundGradient then 0 else container.bgStyle.Transparency
		}, var25) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		layout = if var20 ~= nil then nil else {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, var20),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		tag = var21,
		testId = `{var3.testId}--outer-container`
	})
	local t_1 = {
		DragDetector = var94,
		Background = var3.backgroundGradient,
		Leading = if var3.leadingElement then reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = "col align-y-bottom self-stretch size-0-full auto-x",
			GroupTransparency = if var25 then constantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{var3.testId}--leading`
		}, var3.leadingElement) else nil
	}
	local createElement_1 = reactModule.createElement
	local var100 = if var45 then scrollViewModule else viewModule
	local t_2 = {
		LayoutOrder = 2,
		tag = "fill size-full clip",
		padding = if var82 then var77 else nil,
		selection = { Selectable = false },
		scroll = var89,
		layout = var88,
		onCanvasPositionChanged = if var45 then var93 else nil,
		scrollingFrameRef = if var45 then var91 else nil
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local var101 = viewModule
	local t_4 = {
		Size = if var80 then UDim2.new(1, 0, 0, var87) else nil,
		tag = { ["fill size-full"] = not var80 },
		padding = if var83 then var77 else nil,
		selection = { Selectable = false },
		onActivated = if not isDisabled then var50 else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None }
	}
	local t_5 = {}
	
	if var27 then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(var1, {
			overlayNativeInput = nil,
			text = var43,
			placeholder = var3.placeholder,
			textInputType = var3.textInputType,
			fontStyle = fontStyle,
			textStyle = var32,
			isMultiLine = var45,
			isDisabled = isDisabled,
			ref = var5,
			tag = `{var23 or ""} data-testid={var3.testId}--textbox`,
			Size = if var45 then uDim2 else nil,
			automaticSize = if var3.maxLines then nil elseif not var38 then if var45 and not var27 and var39 ~= "" then Enum.AutomaticSize.Y else nil else mapBindableModule(var3.text, function(p3)
				-- upvalues: var45 (ref), var27 (ref)
				return if var45 and not var27 and p3 ~= "" then Enum.AutomaticSize.Y else nil
			end),
			padding = var84,
			onFocusGained = var64,
			onFocusLost = if var45 and var29 then nil else var66,
			onTextChanged = var56,
			onCursorPositionChanged = if var45 then var90 else nil,
			onInputChanged = var58,
			onInputEnded = var65,
			manualFocusRelease = if var29 then var3.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var29 and var3.manualFocusRelease == true and var3.alwaysMultiLine == true then true else nil
		}, {
			DragDetector = var94,
			BoundsChecker = if var45 then reactModule.createElement(var1, {
				isBoundsChecker = true,
				fontStyle = fontStyle,
				textStyle = var32,
				Size = if var81 then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, var79),
				ref = var7
			}) else nil
		})
	end
	local var102
	t_5.TextBox = createElement_3
	t_5.MobileFocusTarget = if var45 and var29 and (not var27 and not isDisabled) then reactModule.createElement(viewModule, {
		tag = "size-full",
		ZIndex = 2,
		onActivated = var50,
		selection = { Selectable = false },
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		testId = `{var3.testId}--mobile-focus-target`
	}) else nil
	
	if var46 then
		var102 = reactModule.createElement
		var102 = var102(var1, {
			overlayNativeInput = nil,
			text = var43,
			placeholder = var3.placeholder,
			textInputType = var3.textInputType,
			fontStyle = fontStyle,
			textStyle = var32,
			isMultiLine = var45,
			isDisabled = isDisabled,
			padding = var84,
			ref = var98,
			tag = `{var23 or ""} data-testid={var3.testId}--mobile-textbox`,
			Size = uDim2_1,
			onFocusGained = var64,
			onFocusLost = if var45 and var29 then var66 else nil,
			onTextChanged = var56,
			onCursorPositionChanged = if var45 then var90 else nil,
			onInputEnded = var65,
			manualFocusRelease = if var29 then var3.manualFocusRelease else nil,
			shouldEmitReturnEvents = if var29 and var3.manualFocusRelease == true and var3.alwaysMultiLine == true then true else nil
		})
	else
		var102 = nil
	end
	t_5.MobileTextBox = var102
	t_3.TextContent = createElement_2(var101, t_4, t_5)
	t_1.TextBoxWrapper = createElement_1(var100, t_2, t_3)
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
			onActivated = var55,
			padding = UDim.new(0, var19.clearButton.padding),
			Position = var97,
			stateLayer = { affordance = stateLayerAffordanceModule.None },
			testId = `{var3.testId}--clear-button`
		}, {
			Icon = reactModule.createElement(iconModule, { name = var19.clearButton.icon })
		})
	}) else nil
	t_1.Trailing = if var3.trailingElement then reactModule.createElement(viewModule, {
		LayoutOrder = 4,
		GroupTransparency = if var25 then constantsModule.DISABLED_TRANSPARENCY else nil,
		tag = {
			["col align-y-bottom self-stretch size-0-full auto-x"] = var3.trailingAlignBottom == true,
			["row align-y-center size-0-full auto-x"] = var3.trailingAlignBottom ~= true
		},
		testId = `{var3.testId}--trailing`
	}, var3.trailingElement) else nil
	
	return createElement(viewModule, var99, t_1)
end))