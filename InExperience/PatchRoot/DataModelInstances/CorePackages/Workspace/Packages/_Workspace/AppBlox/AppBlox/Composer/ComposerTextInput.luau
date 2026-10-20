local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local Parent = Foundation.Parent
local Parent1 = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local FFlagComposerControlAlignment = require(Parent1.SharedFlags).FFlagComposerControlAlignment
local ComposerMultiLineCaretFix = game:DefineFastFlag("ComposerMultiLineCaretFix", false)
local FoundationFontFaceMigration = require(Parent1.Foundation).Utility.Flags.FoundationFontFaceMigration
local Components = Foundation.Components
local IconModule = require(Components.Icon)
local PaddingModule = require(Components.Padding)
local NormalizeFontFaceModule = require(Foundation.Utility.normalizeFontFace)
local ScrollViewModule = require(Components.ScrollView)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local ConstantsModule = require(Foundation.Constants)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local GetBindableValueModule = require(Foundation.Utility.getBindableValue)
local GetDisabledStyleModule = require(Foundation.Utility.getDisabledStyle)
local GetMultiLineTextHeightModule = require(Foundation.Utility.getMultiLineTextHeight)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local TruncateTextToCursorModule = require(Foundation.Components.InternalTextInput.truncateTextToCursor)
local ComposerDebugModule = require(script.Parent.composerDebug)
local MeasureTextLineCountModule = require(script.Parent.measureTextLineCount)
local UseComposerFocusLockModule = require(script.Parent.useComposerFocusLock)
local UseComposerKeyboardConnectionsModule = require(script.Parent.useComposerKeyboardConnections)
local UseBindableModule = require(Foundation.Utility.useBindable)
local UsePreferredInputModule = require(Foundation.Utility.usePreferredInput)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local UseTextInputVariantsModule = require(Components.TextInput.useTextInputVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InputFocusBehaviorModule = require(Foundation.Enums.InputFocusBehavior)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local RadiusModule = require(Foundation.Enums.Radius)
local ControlStateModule = require(Foundation.Enums.ControlState)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local config = {
	numLines = 1,
	testId = "--foundation-internal-text-input",
	Selectable = true,
	size = require(Foundation.Enums.InputSize).Large,
	variant = InputVariantModule.Standard
}
local MemoResult = ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceModule (copy), IsPluginSecurityModule (copy), PaddingModule (copy)
	local IsBoundsChecker = p1.isBoundsChecker
	local IsMultiLine = p1.isMultiLine or IsBoundsChecker
	
	return ReactModule.createElement("TextBox", {
		ClearTextOnFocus = false,
		Selectable = false,
		Active = not IsBoundsChecker and nil,
		Visible = not IsBoundsChecker and nil,
		Font = if FoundationFontFaceMigration then nil else p1.fontStyle.Font,
		FontFace = if FoundationFontFaceMigration then NormalizeFontFaceModule(p1.fontStyle.Font) else nil,
		TextSize = p1.fontStyle.FontSize,
		LineHeight = p1.fontStyle.LineHeight,
		TextColor3 = if p1.textStyle then p1.textStyle.Color3 else nil,
		TextTransparency = if p1.textStyle then p1.textStyle.Transparency else nil,
		MultiLine = IsMultiLine,
		TextWrapped = IsMultiLine,
		TextYAlignment = if IsMultiLine then Enum.TextYAlignment.Top else Enum.TextYAlignment.Center,
		TextEditable = not IsBoundsChecker and not p1.isDisabled,
		PlaceholderText = p1.placeholder,
		TextInputType = if IsPluginSecurityModule() then p1.textInputType else nil,
		ManualFocusRelease = if p1.manualFocusRelease then true else nil,
		ShouldEmitReturnEvents = if p1.shouldEmitReturnEvents then true else nil,
		OverlayNativeInput = if p1.overlayNativeInput then true else nil,
		Size = if p1.Size == nil then UDim2.fromScale(1, 1) else p1.Size,
		AutomaticSize = p1.automaticSize,
		Text = if IsBoundsChecker then nil elseif typeof(p1.text) == "string" then p1.text else p1.text,
		ref = Ref,
		[ReactModule.Tag] = p1.tag,
		[ReactModule.Change.Text] = p1.onTextChanged,
		[ReactModule.Change.CursorPosition] = p1.onCursorPositionChanged,
		[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged,
		[ReactModule.Event.Focused] = p1.onFocusGained,
		[ReactModule.Event.FocusLost] = p1.onFocusLost,
		[ReactModule.Event.InputChanged] = p1.onInputChanged,
		[ReactModule.Event.InputEnded] = p1.onInputEnded
	}, if p1.padding then {
		Padding = ReactModule.createElement(PaddingModule, { value = p1.padding })
	} else nil, p1.children)
end))

return ReactModule.memo(ReactModule.forwardRef(function(Tbl, p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), GetBindableValueModule (copy), UseTextInputVariantsModule (copy), FFlagComposerControlAlignment (copy), InputVariantModule (copy), UseStyleTagsModule (copy), UsePreferredInputModule (copy), UseComposerFocusLockModule (copy), GetDisabledStyleModule (copy), GetMultiLineTextHeightModule (copy), ComposerDebugModule (copy), MeasureTextLineCountModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceModule (copy), ComposerMultiLineCaretFix (copy), InputFocusBehaviorModule (copy), UseComposerKeyboardConnectionsModule (copy), ControlStateModule (copy), RadiusModule (copy), TruncateTextToCursorModule (copy), UseBindableModule (copy), ReactUtilsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy), StateLayerAffordanceModule (copy), ScrollViewModule (copy), MemoResult (copy), MapBindableModule (copy), IconModule (copy)
	local Tbl1 = Tbl
	
	if Tbl.Selectable == nil then
		Tbl1 = table.clone(Tbl)
		Tbl1.Selectable = true
	end
	local WithDefaultsModuleResult = WithDefaultsModule(Tbl1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef("")
	local UseRefResult5 = ReactModule.useRef(GetBindableValueModule(WithDefaultsModuleResult.text))
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(Vector2.zero)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseRefResult9 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, WithDefaultsModuleResult.radius, UseStateResult1, WithDefaultsModuleResult.hasError)
	local Container = UseTextInputVariantsModuleResult.container
	local XSmall = if WithDefaultsModuleResult.leadingElement == nil then if FFlagComposerControlAlignment and WithDefaultsModuleResult.trailingElement ~= nil then UseTokensModuleResult.Gap.XSmall else nil else UseTokensModuleResult.Gap.Small
	local Replaced = if XSmall == nil and WithDefaultsModuleResult.trailingElement and typeof(Container.tag) == "string" then string.gsub(Container.tag, "gap%-large", "gap-xsmall") else Container.tag
	local Default = if FFlagComposerControlAlignment and UseStateResult1 and WithDefaultsModuleResult.variant == InputVariantModule.Standard and not WithDefaultsModuleResult.hasError then UseTokensModuleResult.Color.Stroke.Default else Container.strokeStyle
	local UseStyleTagsModuleResult = UseStyleTagsModule(UseTextInputVariantsModuleResult.textBox.tag)
	local IsDisabled = WithDefaultsModuleResult.isDisabled
	local UseRefResult10 = ReactModule.useRef(IsDisabled)
	UseRefResult10.current = IsDisabled
	local NoTrailingElement: boolean = WithDefaultsModuleResult.isDisabled and WithDefaultsModuleResult.trailingElement == nil
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local IsUsePreferredInputModuleResultMatch = UsePreferredInputModuleResult == Enum.PreferredInput.Touch
	ReactModule.useEffect(function()
		-- upvalues: IsDisabled (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		if IsDisabled then
			UseStateResult2_2(false)
			UseStateResult2_1(false)
		end
		return function() end
	end, { IsDisabled })
	local Standard: number = UseTokensModuleResult.Stroke.Standard
	local ScaledCeiled = math.ceil(Standard) * 2
	local ScaledCeiled1 = math.ceil(UseTokensModuleResult.Stroke.Thick) * 2
	UseComposerFocusLockModule(IsDisabled == true, { UseRefResult, UseRefResult1 })
	local DisabledStyleModule = GetDisabledStyleModule(UseTokensModuleResult.Color.Content.Emphasis, IsDisabled)
	local FontStyle = UseTextInputVariantsModuleResult.textBox.fontStyle
	local FontSize = FontStyle.FontSize
	local LineHeight = FontStyle.LineHeight
	local MultiLineTextHeightModule = GetMultiLineTextHeightModule(FontSize, 1, LineHeight)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(1)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(MultiLineTextHeightModule)
	local HasMaxLines = WithDefaultsModuleResult.maxLines ~= nil
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(function()
		-- upvalues: GetBindableValueModule (upval), WithDefaultsModuleResult (copy)
		return GetBindableValueModule(WithDefaultsModuleResult.text)
	end)
	ReactModule.useEffect(function()
		-- upvalues: ComposerDebugModule (upval), WithDefaultsModuleResult (copy)
		ComposerDebugModule.setEnabled(WithDefaultsModuleResult.composerDebug == true)
		
		return function() end
	end, { WithDefaultsModuleResult.composerDebug })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		return if Current and Current.AbsoluteSize.X > 0 then Current.AbsoluteSize.X else 0
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Text)
		-- upvalues: MeasureTextLineCountModule (upval), WithDefaultsModuleResult (copy), MultiLineTextHeightModule (copy), UseResult (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceModule (upval), FontStyle (copy), FontSize (copy), ComposerMultiLineCaretFix (upval), UseStateResult2_4 (copy), GetMultiLineTextHeightModule (upval), LineHeight (copy)
		local MeasureTextLineCountModuleResult = MeasureTextLineCountModule({
			text = Text,
			maxLines = WithDefaultsModuleResult.maxLines,
			singleLineHeight = MultiLineTextHeightModule,
			layoutWidth = UseResult(),
			font = if FoundationFontFaceMigration then NormalizeFontFaceModule(FontStyle.Font) else FontStyle.Font,
			fontSize = FontSize
		})
		
		if ComposerMultiLineCaretFix then
			UseStateResult2_4(GetMultiLineTextHeightModule(FontSize, MeasureTextLineCountModuleResult.unclampedLineCount, LineHeight))
		else
			UseStateResult2_4((math.max(if MeasureTextLineCountModuleResult.boundsY and MeasureTextLineCountModuleResult.boundsY > 0 then math.ceil(MeasureTextLineCountModuleResult.boundsY) else MultiLineTextHeightModule, MeasureTextLineCountModuleResult.lineCount * MultiLineTextHeightModule)))
		end
		return MeasureTextLineCountModuleResult.lineCount
	end, {
		FontSize, LineHeight, FontStyle.Font, WithDefaultsModuleResult.maxLines,
		UseResult, MultiLineTextHeightModule
	})
	local Text = if HasMaxLines then WithDefaultsModuleResult.text else GetBindableValueModule(WithDefaultsModuleResult.text)
	local Largest = math.max(1, (math.floor(WithDefaultsModuleResult.minLines or 1)))
	
	if WithDefaultsModuleResult.maxLines then
		Largest = math.min(Largest, WithDefaultsModuleResult.maxLines)
	end
	local Largest1: number = if WithDefaultsModuleResult.maxLines then math.max(Largest, UseStateResult4) else math.max(Largest, WithDefaultsModuleResult.numLines)
	local IsLargestAbove: boolean = if WithDefaultsModuleResult.alwaysMultiLine then true else Largest1 > 1
	local UseStateResult3_1 = IsLargestAbove and UseStateResult3
	ReactModule.useEffect(function()
		-- upvalues: HasMaxLines (copy), GetBindableValueModule (upval), WithDefaultsModuleResult (copy), UseRefResult5 (copy), ComposerDebugModule (upval), UseStateResult2_5 (copy), UseStateResult2_3 (copy), UseResult1 (copy)
		if not HasMaxLines then
			return function() end
		end
		local BindableValueModule = GetBindableValueModule(WithDefaultsModuleResult.text)
		
		if BindableValueModule ~= UseRefResult5.current then
			ComposerDebugModule.log("syncFromParent", `len={utf8.len(BindableValueModule) or #BindableValueModule}`)
			UseRefResult5.current = BindableValueModule
			UseStateResult2_5(BindableValueModule)
			UseStateResult2_3(UseResult1(BindableValueModule))
			task.defer(function()
				-- upvalues: UseStateResult2_3 (upval), UseResult1 (upval), BindableValueModule (copy)
				UseStateResult2_3(UseResult1(BindableValueModule))
			end)
		end
		return function() end
	end, { WithDefaultsModuleResult.text, UseResult1, HasMaxLines })
	local UseResult2 = ReactModule.useCallback(function(SelectionStart)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current.SelectionStart = SelectionStart
		end
		if UseRefResult1.current then
			UseRefResult1.current.SelectionStart = SelectionStart
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(CursorPosition)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current.CursorPosition = CursorPosition
		end
		if UseRefResult1.current then
			UseRefResult1.current.CursorPosition = CursorPosition
		end
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseResult2 (copy), UseResult3 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		if Current == nil or Current.Parent == nil then return end
		local Length = utf8.len(Current.Text)
		
		if Length then
			UseResult2(0)
			UseResult3(Length + 1)
		end
	end, { UseResult2, UseResult3 })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: IsLargestAbove (copy), IsUsePreferredInputModuleResultMatch (copy), UseStateResult3 (copy), UseRefResult (copy), UseRefResult4 (copy), UseStateResult2_2 (copy), UseRefResult1 (copy), WithDefaultsModuleResult (copy), InputFocusBehaviorModule (upval), UseResult4 (copy)
		if IsLargestAbove and IsUsePreferredInputModuleResultMatch and not UseStateResult3 then
			if UseRefResult.current and UseRefResult.current.Parent then
				UseRefResult4.current = UseRefResult.current.Text
			end
			UseStateResult2_2(true)
			
			return
		else
			local Current = UseRefResult.current or UseRefResult1.current
			
			if Current == nil then return end
			Current:CaptureFocus()
			
			if WithDefaultsModuleResult.focusBehavior == InputFocusBehaviorModule.Highlight then
				task.spawn(UseResult4)
			end
		end
	end, {
		UseResult4,
		WithDefaultsModuleResult.focusBehavior,
		IsLargestAbove,
		IsUsePreferredInputModuleResultMatch,
		UseStateResult3
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
		if UseRefResult.current then
			UseRefResult.current:ReleaseFocus()
		end
		if UseRefResult1.current then
			UseRefResult1.current:ReleaseFocus()
		end
		UseStateResult2_2(false)
		UseStateResult2_1(false)
	end, {})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		return if Current then Current:IsFocused() else nil
	end, {})
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		return if Current then Current.SelectionStart else nil
	end, {})
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		return if Current then Current.CursorPosition else nil
	end, {})
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		if Current then
			Current.Text = ""
		end
	end, {})
	ReactModule.useImperativeHandle(p1, function()
		-- upvalues: UseResult7 (copy), UseResult5 (copy), UseResult6 (copy), UseStateResult2 (copy), UseResult8 (copy), UseResult9 (copy), UseResult3 (copy), UseResult2 (copy)
		return {
			getIsFocused = UseResult7,
			focus = UseResult5,
			releaseFocus = UseResult6,
			setHover = UseStateResult2,
			getSelectionStart = UseResult8,
			getCursorPosition = UseResult9,
			setCursorPosition = UseResult3,
			setSelectionStart = UseResult2
		}
	end, {
		UseResult9, UseResult7, UseResult8, UseResult5, UseResult6, UseResult3,
		UseResult2
	})
	local UseResult11 = ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult4 (copy), UseRefResult10 (copy), UseRefResult8 (copy), UseRefResult5 (copy), IsLargestAbove (copy), UseRefResult2 (copy), HasMaxLines (copy), UseStateResult2_5 (copy), WithDefaultsModuleResult (copy), UseStateResult2_3 (copy), UseResult1 (copy)
		if p2 == nil or p2.Parent == nil or UseRefResult4.current ~= "" then return end
		if UseRefResult10.current then return end
		local Text = p2.Text
		
		if UseRefResult8.current and Text ~= "" then return end
		if Text == UseRefResult5.current then return end
		UseRefResult5.current = Text
		
		if IsLargestAbove and UseRefResult2.current then
			UseRefResult2.current.Text = Text
		end
		if HasMaxLines then
			UseStateResult2_5(Text)
		end
		if WithDefaultsModuleResult.maxLines then
			UseStateResult2_3(UseResult1(Text))
			task.defer(function()
				-- upvalues: UseStateResult2_3 (upval), UseResult1 (upval), Text (copy)
				UseStateResult2_3(UseResult1(Text))
			end)
		end
		WithDefaultsModuleResult.onChanged(Text)
	end, {
		WithDefaultsModuleResult.onChanged,
		IsLargestAbove,
		WithDefaultsModuleResult.maxLines,
		UseResult1,
		HasMaxLines
	})
	local UseRefResult11 = ReactModule.useRef(false)
	local UseResult12 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult11 (copy)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			UseRefResult11.current = false
		end
	end, {})
	local UseResult13 = ReactModule.useCallback(function(_, Input)
		-- upvalues: UseRefResult11 (copy), UseResult4 (copy)
		if not UseRefResult11.current then return end
		UseRefResult11.current = false
		
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			UseResult4()
			
			return
		end
	end, { UseResult2, UseResult3, UseResult4 })
	local UseResult14 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult5 (copy), HasMaxLines (copy), UseStateResult2_5 (copy), WithDefaultsModuleResult (copy), UseStateResult2_3 (copy), UseResult1 (copy)
		UseRefResult5.current = Current
		
		if HasMaxLines then
			UseStateResult2_5(Current)
		end
		if WithDefaultsModuleResult.maxLines then
			UseStateResult2_3(UseResult1(Current))
		end
		WithDefaultsModuleResult.onChanged(Current)
	end, {
		WithDefaultsModuleResult.maxLines,
		UseResult1,
		WithDefaultsModuleResult.onChanged,
		HasMaxLines
	})
	local NoIsUsePreferredInputModuleResultMatch: boolean = WithDefaultsModuleResult.onReturnPressed ~= nil and not IsUsePreferredInputModuleResultMatch
	local UseResult15 = ReactModule.useCallback(function(_, p2)
		-- upvalues: WithDefaultsModuleResult (copy), UseRefResult9 (copy), ComposerDebugModule (upval), UseRefResult8 (copy)
		if WithDefaultsModuleResult.onReturnPressed == nil then return end
		local ClockTime = os.clock()
		
		if ClockTime - UseRefResult9.current < 0.15 then
			ComposerDebugModule.log("returnSubmit", `source={p2} skipped=debounced`)
			
			return
		else
			ComposerDebugModule.log("returnSubmit", `source={p2}`)
			UseRefResult9.current = ClockTime
			UseRefResult8.current = true
			WithDefaultsModuleResult.onReturnPressed()
			task.delay(0.15, function()
				-- upvalues: UseRefResult8 (upval)
				UseRefResult8.current = false
			end)
		end
	end, { WithDefaultsModuleResult.onReturnPressed })
	local UseComposerKeyboardConnectionsModuleResult = UseComposerKeyboardConnectionsModule({
		enabled = NoIsUsePreferredInputModuleResultMatch == true,
		onReturnPressed = ReactModule.useCallback(function(_, p2)
			-- upvalues: UseRefResult (copy), ComposerDebugModule (upval), UseResult14 (copy), UseResult15 (copy)
			local Current = UseRefResult.current
			
			if Current == nil or Current:IsFocused() ~= true then return end
			if p2 then
				local Text = Current.Text
				task.defer(function()
					-- upvalues: Current (copy), Text (copy), ComposerDebugModule (upval), UseResult14 (upval)
					if Current.Parent == nil then return end
					local Text1 = Current.Text
					
					if Text1 ~= Text then
						ComposerDebugModule.log("returnNewline", "source=UserInputService.InputBegan-shift engineInserted=true")
						UseResult14(Text1)
					end
				end)
				
				return
			else
				UseResult15(Current, "UserInputService.InputBegan")
			end
		end, { UseResult15, UseResult14 })
	})
	local ConnectFunction = UseComposerKeyboardConnectionsModuleResult.connect
	local DisconnectFunction = UseComposerKeyboardConnectionsModuleResult.disconnect
	local UseResult16 = ReactModule.useCallback(function()
		-- upvalues: IsDisabled (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy), NoIsUsePreferredInputModuleResultMatch (copy), ConnectFunction (copy), InputFocusBehaviorModule (upval), UseRefResult (copy), UseRefResult1 (copy), UseRefResult11 (copy)
		if IsDisabled then return end
		UseStateResult2_1(true)
		
		if WithDefaultsModuleResult.onFocus then
			WithDefaultsModuleResult.onFocus()
		end
		if NoIsUsePreferredInputModuleResultMatch then
			ConnectFunction()
		end
		local FocusBehavior = WithDefaultsModuleResult.focusBehavior
		
		if FocusBehavior == InputFocusBehaviorModule.Clear then
			if UseRefResult.current then
				UseRefResult.current.Text = ""
			end
			if UseRefResult1.current then
				UseRefResult1.current.Text = ""
				
				return
			end
		elseif FocusBehavior == InputFocusBehaviorModule.Highlight then
			UseRefResult11.current = true
		end
	end, {
		WithDefaultsModuleResult.onFocus,
		IsDisabled,
		WithDefaultsModuleResult.focusBehavior,
		NoIsUsePreferredInputModuleResultMatch,
		ConnectFunction
	})
	local UseResult17 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseResult13 (copy)
		UseResult13(p2, p3)
	end, { UseResult13 })
	local UseResult18 = ReactModule.useCallback(function(p2, p3, p4)
		-- upvalues: ComposerDebugModule (upval), NoIsUsePreferredInputModuleResultMatch (copy), DisconnectFunction (copy), UseStateResult2_1 (copy), UseRefResult11 (copy), IsLargestAbove (copy), UseStateResult2_2 (copy), WithDefaultsModuleResult (copy), UseResult15 (copy)
		ComposerDebugModule.log("textBox.FocusLost", `enterPressed={p3}`)
		
		if NoIsUsePreferredInputModuleResultMatch then
			DisconnectFunction()
		end
		UseStateResult2_1(false)
		UseRefResult11.current = false
		
		if IsLargestAbove then
			UseStateResult2_2(false)
		end
		if WithDefaultsModuleResult.onFocusLost then
			WithDefaultsModuleResult.onFocusLost(p4)
		end
		if p3 and NoIsUsePreferredInputModuleResultMatch then
			UseResult15(p2, "TextBox.FocusLost")
		end
	end, {
		IsLargestAbove,
		WithDefaultsModuleResult.onFocusLost,
		NoIsUsePreferredInputModuleResultMatch,
		UseResult15,
		DisconnectFunction
	})
	local UseResult19 = ReactModule.useCallback(function(Hover)
		-- upvalues: UseStateResult2 (copy), ControlStateModule (upval)
		UseStateResult2(Hover == ControlStateModule.Hover)
	end, {})
	local UseResult20 = ReactModule.useCallback(function(p2, Current)
		-- upvalues: UseRefResult6 (copy), WithDefaultsModuleResult (copy)
		UseRefResult6.current = Current
		
		if WithDefaultsModuleResult.onDragStarted then
			WithDefaultsModuleResult.onDragStarted(p2, Current)
		end
	end, { WithDefaultsModuleResult.onDragStarted })
	local UseResult21 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: WithDefaultsModuleResult (copy)
		if WithDefaultsModuleResult.onDrag then
			WithDefaultsModuleResult.onDrag(p2, p3)
		end
	end, { WithDefaultsModuleResult.onDrag })
	local UseResult22 = ReactModule.useCallback(function(p2, Current)
		-- upvalues: UseRefResult6 (copy), UseResult5 (copy), UseResult6 (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
		if UseRefResult6.current == Current then
			UseResult5()
		else
			UseResult6()
			UseStateResult2_1(false)
		end
		UseRefResult6.current = nil
		
		if WithDefaultsModuleResult.onDragEnded then
			WithDefaultsModuleResult.onDragEnded(p2, Current)
		end
	end, {
		WithDefaultsModuleResult.onDragEnded,
		UseResult5,
		UseResult6
	})
	local MultiLineTextHeightModule1 = if WithDefaultsModuleResult.maxLines then GetMultiLineTextHeightModule(FontSize, WithDefaultsModuleResult.maxLines, LineHeight) else nil
	local MultiLineTextHeightModule2 = GetMultiLineTextHeightModule(FontSize, Largest, LineHeight)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), MultiLineTextHeightModule2 (copy), UseStateResult5 (copy), MultiLineTextHeightModule1 (copy), GetMultiLineTextHeightModule (upval), FontSize (copy), Largest1 (copy), LineHeight (copy)
		return if WithDefaultsModuleResult.maxLines then math.clamp(math.max(MultiLineTextHeightModule2, UseStateResult5), MultiLineTextHeightModule2, MultiLineTextHeightModule1) else GetMultiLineTextHeightModule(FontSize, Largest1, LineHeight)
	end, {
		WithDefaultsModuleResult.maxLines, MultiLineTextHeightModule2, UseStateResult5,
		MultiLineTextHeightModule1, FontSize, Largest1, LineHeight
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim
		-- upvalues: GetMultiLineTextHeightModule (upval), FontSize (copy), LineHeight (copy), Container (copy), ScaledCeiled (copy)
		local MultiLineTextHeightModule = GetMultiLineTextHeightModule(FontSize, 1, LineHeight)
		
		return UDim.new(0, (math.ceil((MultiLineTextHeightModule + math.round(math.round((Container.minHeight - ScaledCeiled - MultiLineTextHeightModule) * 2) / 2) + ScaledCeiled) / 2)))
	end, { Container.minHeight, ScaledCeiled, FontSize, LineHeight })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseMemoResult1 (copy), RadiusModule (upval), Container (copy)
		return if WithDefaultsModuleResult.maxLines then UseMemoResult1 elseif WithDefaultsModuleResult.radius == RadiusModule.Circle then UDim.new(0, (math.ceil(Container.minHeight / 2))) else nil
	end, {
		WithDefaultsModuleResult.maxLines,
		UseMemoResult1,
		Container.minHeight,
		WithDefaultsModuleResult.radius
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult2 (copy), Container (copy), UseTokensModuleResult (copy)
		return {
			radius = if UseMemoResult2 then UseMemoResult2 else UDim.new(0, Container.radius),
			offset = UseTokensModuleResult.Stroke.Thick,
			borderWidth = UseTokensModuleResult.Stroke.Thick
		}
	end, { UseTokensModuleResult, Container.radius, UseMemoResult2 })
	local UseMemoResult4, UseMemoResult2_1 = ReactModule.useMemo(function()
		-- upvalues: Container (copy), ScaledCeiled (copy), GetMultiLineTextHeightModule (upval), FontSize (copy), LineHeight (copy), UseMemoResult (copy)
		local RoundedRatio = math.round((Container.minHeight - ScaledCeiled - GetMultiLineTextHeightModule(FontSize, 1, LineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, (math.floor(RoundedRatio / 2))),
			bottom = UDim.new(0, (math.ceil(RoundedRatio / 2))),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, UseMemoResult + math.round(RoundedRatio) + ScaledCeiled
	end, {
		Container.minHeight, ScaledCeiled, ScaledCeiled1, FontSize, UseMemoResult,
		LineHeight
	})
	local NewOffset = UseMemoResult4.bottom.Offset + UseMemoResult4.top.Offset
	local NoUseStateResult3: boolean = IsLargestAbove and (WithDefaultsModuleResult.maxLines ~= nil and not UseStateResult3)
	local IsTextPaddingOnParent = WithDefaultsModuleResult.textPaddingOnParent == true
	local NoUseStateResult3_1: boolean = IsTextPaddingOnParent and NoUseStateResult3
	local NoNoUseStateResult3_1: boolean = IsTextPaddingOnParent and not NoUseStateResult3_1
	local UseMemoResult5 = if IsTextPaddingOnParent then nil else UseMemoResult4
	local YOffset = if IsTextPaddingOnParent then UseMemoResult else UseMemoResult + NewOffset
	local UseStateResult7 = if IsTextPaddingOnParent then UseStateResult5 else UseStateResult5 + NewOffset
	local Largest2 = if NoUseStateResult3 then math.max(YOffset, UseStateResult7) else YOffset
	local YOffset1 = if NoNoUseStateResult3_1 then Largest2 + NewOffset else Largest2
	local _UDim2 = UDim2.new(1, 0, 0, Largest2)
	local _UDim2_1 = UDim2.new(1, 0, 0, YOffset)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), ComposerDebugModule (upval), Largest1 (copy), UseMemoResult2_1 (copy)
		if WithDefaultsModuleResult.maxLines then
			ComposerDebugModule.log("layout", `lineCount={Largest1} borderFrameHeight={UseMemoResult2_1}`)
		end
		return function() end
	end, {
		Largest1,
		UseMemoResult2_1,
		WithDefaultsModuleResult.maxLines
	})
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: IsLargestAbove (copy), WithDefaultsModuleResult (copy)
		return if IsLargestAbove then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = if WithDefaultsModuleResult.maxLines == nil then Enum.ItemLineAlignment.Center else Enum.ItemLineAlignment.Start
		} else nil
	end, { IsLargestAbove, WithDefaultsModuleResult.maxLines })
	local UseMemoResult7 = ReactModule.useMemo(function()
		-- upvalues: IsLargestAbove (copy)
		return if IsLargestAbove then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { IsLargestAbove })
	local UseResult23 = ReactModule.useCallback(function(Label)
		-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy), TruncateTextToCursorModule (upval), UseMemoResult4 (copy)
		local Current = UseRefResult3.current
		local Current1 = UseRefResult2.current
		
		if Current == nil or Current1 == nil then return end
		local ScaledTextSize = Label.TextSize * Label.LineHeight
		local Y = Current.CanvasPosition.Y
		Current1.Text = TruncateTextToCursorModule(Label)
		local Y1 = Current1.TextBounds.Y
		local NewY = Y - UseMemoResult4.top.Offset + UseMemoResult4.bottom.Offset
		local YDelta = Y + Current.AbsoluteSize.Y - UseMemoResult4.top.Offset - UseMemoResult4.bottom.Offset
		
		if Y1 - ScaledTextSize < NewY then
			Current.CanvasPosition += Vector2.new(0, Y1 - ScaledTextSize - NewY)
		end
		if YDelta < Y1 then
			Current.CanvasPosition += Vector2.new(0, Y1 - YDelta)
		end
	end, { UseMemoResult4 })
	local UseResult24 = if ComposerMultiLineCaretFix then ReactModule.useCallback(function(TextBox)
		-- upvalues: UseResult23 (copy)
		if TextBox:IsFocused() then
			TextBox.CursorPosition = TextBox.CursorPosition
			UseResult23(TextBox)
			
			return
		end
	end, { UseResult23 }) else nil
	local UseResult25 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy), UseRefResult7 (copy)
		if Current ~= nil then
			UseRefResult3.current = Current
			Current.ClipsDescendants = true
			Current.CanvasPosition = UseRefResult7.current
			
			return
		end
	end, {})
	local UseResult26 = ReactModule.useCallback(function(TextBox)
		-- upvalues: UseRefResult4 (copy)
		if TextBox then
			TextBox.Text = UseRefResult4.current
			UseRefResult4.current = ""
			task.delay(0, function()
				-- upvalues: TextBox (copy)
				if TextBox.Parent ~= nil then
					TextBox:CaptureFocus()
				end
			end)
		end
	end, {})
	local UseResult27 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult7 (copy)
		UseRefResult7.current = ScrollFrame.CanvasPosition
	end, {})
	local UseMemoResult8 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), ReactModule (upval), UseResult20 (copy), UseResult21 (copy), UseResult22 (copy), UseStateResult1 (copy), IsDisabled (copy)
		return if WithDefaultsModuleResult.onDragStarted or WithDefaultsModuleResult.onDrag or WithDefaultsModuleResult.onDragEnded then ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[ReactModule.Event.DragStart] = UseResult20,
			[ReactModule.Event.DragContinue] = UseResult21,
			[ReactModule.Event.DragEnd] = UseResult22,
			Enabled = not UseStateResult1 and not IsDisabled
		}) else nil
	end, {
		UseResult20, UseResult21, UseResult22, UseStateResult1, IsDisabled,
		WithDefaultsModuleResult.onDragStarted, WithDefaultsModuleResult.onDrag,
		WithDefaultsModuleResult.onDragEnded
	})
	local UseBindableModuleResult = UseBindableModule(WithDefaultsModuleResult.horizontalPadding and WithDefaultsModuleResult.horizontalPadding.left or UDim.new(0, 0))
	local UseBindableModuleResult1 = UseBindableModule(WithDefaultsModuleResult.horizontalPadding and WithDefaultsModuleResult.horizontalPadding.right or UDim.new(0, 0))
	local UseMemoResult9 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), Container (copy), UseTokensModuleResult (copy)
		return if WithDefaultsModuleResult.hasClearButton then UDim2.fromOffset(0, (Container.minHeight - UseTokensModuleResult.Stroke.Standard) / 2) else nil
	end, {
		WithDefaultsModuleResult.hasClearButton,
		Container.minHeight,
		UseTokensModuleResult.Stroke.Standard
	})
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(UseRefResult1, UseResult26)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Size = UDim2.new(1, 0, 0, UseMemoResult2_1),
		selection = {
			Selectable = WithDefaultsModuleResult.Selectable and not IsDisabled,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
			NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
		},
		cursor = UseMemoResult3,
		stroke = if Default and Container.strokeThickness then {
			Color = Default.Color3,
			Transparency = if IsDisabled then BlendTransparenciesModule(Default.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else Default.Transparency,
			Thickness = Container.strokeThickness,
			BorderStrokePosition = if UseStateResult1 or UseStateResult then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = UseMemoResult2,
		padding = {
			left = UseBindableModuleResult:map(function(p2): UDim
				-- upvalues: Standard (copy)
				return UDim.new(0, Standard) + p2
			end),
			right = if WithDefaultsModuleResult.trailingElement == nil and WithDefaultsModuleResult.hasClearButton then UDim.new(0, Standard) else UseBindableModuleResult1:map(function(p2): UDim
				-- upvalues: Standard (copy)
				return UDim.new(0, Standard) + p2
			end),
			top = UDim.new(0, Standard),
			bottom = UDim.new(0, Standard)
		},
		onActivated = if IsDisabled then nil else UseResult5,
		onStateChanged = UseResult19,
		isDisabled = NoTrailingElement,
		backgroundStyle = if Container.bgStyle then GetDisabledStyleModule({
			Color3 = Container.bgStyle.Color3,
			Transparency = if WithDefaultsModuleResult.backgroundGradient then 0 else Container.bgStyle.Transparency
		}, NoTrailingElement) else nil,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		layout = if XSmall == nil then nil else {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, XSmall),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		tag = Replaced,
		testId = `{WithDefaultsModuleResult.testId}--outer-container`
	}), {
		DragDetector = UseMemoResult8,
		Background = WithDefaultsModuleResult.backgroundGradient,
		Leading = if WithDefaultsModuleResult.leadingElement then ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = "col align-y-bottom self-stretch size-0-full auto-x",
			GroupTransparency = if NoTrailingElement then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{WithDefaultsModuleResult.testId}--leading`
		}, WithDefaultsModuleResult.leadingElement) else nil,
		TextBoxWrapper = ReactModule.createElement(if IsLargestAbove then ScrollViewModule else ViewModule, {
			LayoutOrder = 2,
			tag = "fill size-full clip",
			padding = if NoUseStateResult3_1 then UseMemoResult4 else nil,
			selection = { Selectable = false },
			scroll = UseMemoResult7,
			layout = UseMemoResult6,
			onCanvasPositionChanged = if IsLargestAbove then UseResult27 else nil,
			scrollingFrameRef = if IsLargestAbove then UseResult25 else nil
		}, {
			TextContent = ReactModule.createElement(ViewModule, {
				Size = if NoUseStateResult3 then UDim2.new(1, 0, 0, YOffset1) else nil,
				tag = { ["fill size-full"] = not NoUseStateResult3 },
				padding = if NoNoUseStateResult3_1 then UseMemoResult4 else nil,
				selection = { Selectable = false },
				onActivated = if IsDisabled then nil else UseResult5,
				stateLayer = { affordance = StateLayerAffordanceModule.None }
			}, {
				TextBox = if UseStateResult3 then nil else ReactModule.createElement(MemoResult, {
					overlayNativeInput = nil,
					text = Text,
					placeholder = WithDefaultsModuleResult.placeholder,
					textInputType = WithDefaultsModuleResult.textInputType,
					fontStyle = FontStyle,
					textStyle = DisabledStyleModule,
					isMultiLine = IsLargestAbove,
					isDisabled = IsDisabled,
					ref = UseRefResult,
					tag = `{UseStyleTagsModuleResult or ""} data-testid={WithDefaultsModuleResult.testId}--textbox`,
					Size = if IsLargestAbove then _UDim2 else nil,
					automaticSize = if WithDefaultsModuleResult.maxLines then nil elseif HasMaxLines then if IsLargestAbove and not UseStateResult3 and UseStateResult6 ~= "" then Enum.AutomaticSize.Y else nil else MapBindableModule(WithDefaultsModuleResult.text, function(p2)
						-- upvalues: IsLargestAbove (copy), UseStateResult3 (copy)
						return if IsLargestAbove and not UseStateResult3 and p2 ~= "" then Enum.AutomaticSize.Y else nil
					end),
					padding = UseMemoResult5,
					onFocusGained = UseResult16,
					onFocusLost = if IsLargestAbove and IsUsePreferredInputModuleResultMatch then nil else UseResult18,
					onTextChanged = UseResult11,
					onCursorPositionChanged = if IsLargestAbove then UseResult23 else nil,
					onAbsoluteSizeChanged = if ComposerMultiLineCaretFix and IsLargestAbove then UseResult24 else nil,
					onInputChanged = UseResult12,
					onInputEnded = UseResult17,
					manualFocusRelease = if IsUsePreferredInputModuleResultMatch then WithDefaultsModuleResult.manualFocusRelease else nil,
					shouldEmitReturnEvents = IsUsePreferredInputModuleResultMatch and WithDefaultsModuleResult.manualFocusRelease == true and WithDefaultsModuleResult.alwaysMultiLine == true or nil
				}, {
					DragDetector = UseMemoResult8,
					BoundsChecker = if IsLargestAbove then ReactModule.createElement(MemoResult, {
						isBoundsChecker = true,
						fontStyle = FontStyle,
						textStyle = DisabledStyleModule,
						Size = if IsTextPaddingOnParent then UDim2.fromScale(1, 1) else UDim2.new(1, 0, 1, NewOffset),
						ref = UseRefResult2
					}) else nil
				}),
				MobileFocusTarget = if IsLargestAbove and IsUsePreferredInputModuleResultMatch and not UseStateResult3 and not IsDisabled then ReactModule.createElement(ViewModule, {
					tag = "size-full",
					ZIndex = 2,
					onActivated = UseResult5,
					selection = { Selectable = false },
					stateLayer = { affordance = StateLayerAffordanceModule.None },
					testId = `{WithDefaultsModuleResult.testId}--mobile-focus-target`
				}) else nil,
				MobileTextBox = if UseStateResult3_1 then ReactModule.createElement(MemoResult, {
					overlayNativeInput = nil,
					text = Text,
					placeholder = WithDefaultsModuleResult.placeholder,
					textInputType = WithDefaultsModuleResult.textInputType,
					fontStyle = FontStyle,
					textStyle = DisabledStyleModule,
					isMultiLine = IsLargestAbove,
					isDisabled = IsDisabled,
					padding = UseMemoResult5,
					ref = UseComposedRefResult,
					tag = `{UseStyleTagsModuleResult or ""} data-testid={WithDefaultsModuleResult.testId}--mobile-textbox`,
					Size = _UDim2_1,
					onFocusGained = UseResult16,
					onFocusLost = if IsLargestAbove and IsUsePreferredInputModuleResultMatch then UseResult18 else nil,
					onTextChanged = UseResult11,
					onCursorPositionChanged = if IsLargestAbove then UseResult23 else nil,
					onInputEnded = UseResult17,
					manualFocusRelease = if IsUsePreferredInputModuleResultMatch then WithDefaultsModuleResult.manualFocusRelease else nil,
					shouldEmitReturnEvents = IsUsePreferredInputModuleResultMatch and WithDefaultsModuleResult.manualFocusRelease == true and WithDefaultsModuleResult.alwaysMultiLine == true or nil
				}) else nil
			})
		}),
		Clear = if WithDefaultsModuleResult.hasClearButton then ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			isDisabled = IsDisabled,
			GroupTransparency = if IsDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			Visible = MapBindableModule(WithDefaultsModuleResult.text, function(p2): boolean
				return p2 ~= ""
			end),
			tag = UseTextInputVariantsModuleResult.clearButton.tag
		}, {
			ClearButton = ReactModule.createElement(ViewModule, {
				tag = "anchor-center-left auto-xy",
				onActivated = UseResult10,
				padding = UDim.new(0, UseTextInputVariantsModuleResult.clearButton.padding),
				Position = UseMemoResult9,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				testId = `{WithDefaultsModuleResult.testId}--clear-button`
			}, {
				Icon = ReactModule.createElement(IconModule, { name = UseTextInputVariantsModuleResult.clearButton.icon })
			})
		}) else nil,
		Trailing = if WithDefaultsModuleResult.trailingElement then ReactModule.createElement(ViewModule, {
			LayoutOrder = 4,
			GroupTransparency = if NoTrailingElement then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			tag = {
				["col align-y-bottom self-stretch size-0-full auto-x"] = WithDefaultsModuleResult.trailingAlignBottom == true,
				["row align-y-center size-0-full auto-x"] = WithDefaultsModuleResult.trailingAlignBottom ~= true
			},
			testId = `{WithDefaultsModuleResult.testId}--trailing`
		}, WithDefaultsModuleResult.trailingElement) else nil
	})
end))