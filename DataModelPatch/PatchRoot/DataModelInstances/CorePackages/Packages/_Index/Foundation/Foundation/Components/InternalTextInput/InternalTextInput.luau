local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local Components = Foundation.Components
local IconModule = require(Components.Icon)
local PaddingModule = require(Components.Padding)
local ScrollViewModule = require(Components.ScrollView)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local BlendTransparenciesModule = require(Foundation.Utility.blendTransparencies)
local GetBindableValueModule = require(Foundation.Utility.getBindableValue)
local GetDisabledStyleModule = require(Foundation.Utility.getDisabledStyle)
local GetMultiLineTextHeightModule = require(Foundation.Utility.getMultiLineTextHeight)
local IsPluginSecurityModule = require(Foundation.Utility.isPluginSecurity)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local TruncateTextToCursorModule = require(script.Parent.truncateTextToCursor)
local UseBindableModule = require(Foundation.Utility.useBindable)
local UsePreferredInputModule = require(Foundation.Utility.usePreferredInput)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local UseTextInputVariantsModule = require(Components.TextInput.useTextInputVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InputFocusBehaviorModule = require(Foundation.Enums.InputFocusBehavior)
local RadiusModule = require(Foundation.Enums.Radius)
local ControlStateModule = require(Foundation.Enums.ControlState)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local config = {
	numLines = 1,
	testId = "--foundation-internal-text-input",
	Selectable = true,
	size = require(Foundation.Enums.InputSize).Large,
	variant = require(Foundation.Enums.InputVariant).Standard
}
local MemoResult = ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: ReactModule (copy), IsPluginSecurityModule (copy), PaddingModule (copy)
	local IsBoundsChecker = p1.isBoundsChecker
	local IsMultiLine = p1.isMultiLine or IsBoundsChecker
	
	return ReactModule.createElement("TextBox", {
		ClearTextOnFocus = false,
		Selectable = false,
		Active = not IsBoundsChecker and nil,
		Visible = not IsBoundsChecker and nil,
		Font = p1.fontStyle.Font,
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
		Size = if p1.Size == nil then UDim2.fromScale(1, 1) else p1.Size,
		AutomaticSize = p1.automaticSize,
		Text = if IsBoundsChecker then nil else p1.text,
		ref = Ref,
		[ReactModule.Tag] = p1.tag,
		[ReactModule.Change.Text] = p1.onTextChanged,
		[ReactModule.Change.CursorPosition] = p1.onCursorPositionChanged,
		[ReactModule.Event.Focused] = p1.onFocusGained,
		[ReactModule.Event.FocusLost] = p1.onFocusLost,
		[ReactModule.Event.InputChanged] = p1.onInputChanged,
		[ReactModule.Event.InputEnded] = p1.onInputEnded
	}, if p1.padding then {
		Padding = ReactModule.createElement(PaddingModule, { value = p1.padding })
	} else nil, p1.children)
end))

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: FlagsModule (copy), WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), GetBindableValueModule (copy), UseTextInputVariantsModule (copy), UseStyleTagsModule (copy), UsePreferredInputModule (copy), GetDisabledStyleModule (copy), InputFocusBehaviorModule (copy), ControlStateModule (copy), GetMultiLineTextHeightModule (copy), TruncateTextToCursorModule (copy), UseBindableModule (copy), ReactUtilsModule (copy), ViewModule (copy), WithCommonPropsModule (copy), BlendTransparenciesModule (copy), ConstantsModule (copy), RadiusModule (copy), StateLayerAffordanceModule (copy), ScrollViewModule (copy), MemoResult (copy), MapBindableModule (copy), IconModule (copy)
	if FlagsModule.FoundationInputSelectionProps and p1.Selectable == nil then
		p1.Selectable = true
	end
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Largest = math.max(1, WithDefaultsModuleResult.numLines)
	local IsLargestAbove = Largest > 1
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseRefResult4 = ReactModule.useRef("")
	local UseRefResult5 = ReactModule.useRef(GetBindableValueModule(WithDefaultsModuleResult.text))
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseRefResult7 = ReactModule.useRef(Vector2.zero)
	local v1 = nil
	local Callback = nil
	
	if not FlagsModule.FoundationTextInputsBetaUpdate then
		v1, Callback = ReactModule.useState(false)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, WithDefaultsModuleResult.radius, UseStateResult, if FlagsModule.FoundationTextInputsBetaUpdate then nil else v1, WithDefaultsModuleResult.hasError)
	local Container = UseTextInputVariantsModuleResult.container
	local UseStyleTagsModuleResult = UseStyleTagsModule(UseTextInputVariantsModuleResult.textBox.tag)
	local UsePreferredInputModuleResult = UsePreferredInputModule()
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local IsUsePreferredInputModuleResultMatch = UsePreferredInputModuleResult == Enum.PreferredInput.Touch
	local Standard: number = UseTokensModuleResult.Stroke.Standard
	local ScaledCeiled = math.ceil(Standard) * 2
	local ScaledCeiled1 = math.ceil(UseTokensModuleResult.Stroke.Thick) * 2
	local DisabledStyleModule = GetDisabledStyleModule(UseTokensModuleResult.Color.Content.Emphasis, WithDefaultsModuleResult.isDisabled)
	local FontStyle = UseTextInputVariantsModuleResult.textBox.fontStyle
	local FontSize = FontStyle.FontSize
	local LineHeight = FontStyle.LineHeight
	local UseResult = ReactModule.useCallback(function(SelectionStart)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current.SelectionStart = SelectionStart
		end
		if UseRefResult1.current then
			UseRefResult1.current.SelectionStart = SelectionStart
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(CursorPosition)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		if UseRefResult.current then
			UseRefResult.current.CursorPosition = CursorPosition
		end
		if UseRefResult1.current then
			UseRefResult1.current.CursorPosition = CursorPosition
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseResult (copy), UseResult1 (copy)
		local Current = UseRefResult.current or UseRefResult1.current
		
		if Current == nil or Current.Parent == nil then return end
		local Length = utf8.len(Current.Text)
		
		if Length then
			UseResult(0)
			UseResult1(Length + 1)
		end
	end, { UseResult, UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FlagsModule (upval), UseRefResult (copy), WithDefaultsModuleResult (copy), InputFocusBehaviorModule (upval), UseResult2 (copy)
		if FlagsModule.FoundationTextInputHighlightFix then
			if UseRefResult.current == nil then return end
			UseRefResult.current:CaptureFocus()
			
			if WithDefaultsModuleResult.focusBehavior == InputFocusBehaviorModule.Highlight then
				task.spawn(UseResult2)
				
				return
			end
		elseif UseRefResult.current then
			UseRefResult.current:CaptureFocus()
		end
	end, {
		if FlagsModule.FoundationTextInputHighlightFix then UseResult2 else nil,
		if FlagsModule.FoundationTextInputHighlightFix then WithDefaultsModuleResult.focusBehavior else nil
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:ReleaseFocus()
		end
	end, {})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return if UseRefResult.current then UseRefResult.current:IsFocused() else nil
	end, {})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return if UseRefResult.current then UseRefResult.current.SelectionStart else nil
	end, {})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return if UseRefResult.current then UseRefResult.current.CursorPosition else nil
	end, {})
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current.Text = ""
		end
	end, {})
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseResult5 (copy), UseResult3 (copy), UseResult4 (copy), FlagsModule (upval), Callback (ref), UseResult6 (copy), UseResult7 (copy), UseResult1 (copy), UseResult (copy)
		return {
			getIsFocused = UseResult5,
			focus = UseResult3,
			releaseFocus = UseResult4,
			setHover = if FlagsModule.FoundationTextInputsBetaUpdate then nil else Callback,
			getSelectionStart = UseResult6,
			getCursorPosition = UseResult7,
			setCursorPosition = UseResult1,
			setSelectionStart = UseResult
		}
	end, {
		UseResult7, UseResult5, UseResult6, UseResult3, UseResult4, UseResult1,
		UseResult
	})
	local UseResult9 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult4 (copy), UseRefResult5 (copy), IsLargestAbove (copy), UseRefResult2 (copy), WithDefaultsModuleResult (copy)
		if p3 == nil or p3.Parent == nil or UseRefResult4.current ~= "" then return end
		local Text = p3.Text
		
		if Text == UseRefResult5.current then return end
		UseRefResult5.current = Text
		
		if IsLargestAbove and UseRefResult2.current then
			UseRefResult2.current.Text = Text
		end
		WithDefaultsModuleResult.onChanged(Text)
	end, {
		WithDefaultsModuleResult.onChanged,
		IsLargestAbove,
		UseStateResult1
	})
	local UseRefResult8 = ReactModule.useRef(false)
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: WithDefaultsModuleResult (copy), IsLargestAbove (copy), IsUsePreferredInputModuleResultMatch (copy), UseRefResult (copy), UseRefResult4 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), InputFocusBehaviorModule (upval), UseRefResult1 (copy), FlagsModule (upval), UseRefResult8 (copy), UseResult (copy), UseResult1 (copy)
		if WithDefaultsModuleResult.isDisabled then return end
		if IsLargestAbove and IsUsePreferredInputModuleResultMatch then
			if UseRefResult.current and UseRefResult.current.Parent then
				UseRefResult4.current = UseRefResult.current.Text
			end
			UseStateResult2_1(true)
		end
		UseStateResult2(true)
		
		if WithDefaultsModuleResult.onFocus then
			WithDefaultsModuleResult.onFocus()
		end
		local FocusBehavior = WithDefaultsModuleResult.focusBehavior
		
		if FocusBehavior == InputFocusBehaviorModule.Clear then
			UseRefResult4.current = ""
			
			if UseRefResult.current then
				UseRefResult.current.Text = ""
			end
			if UseRefResult1.current then
				UseRefResult1.current.Text = ""
				
				return
			end
		elseif FocusBehavior == InputFocusBehaviorModule.Highlight then
			if FlagsModule.FoundationTextInputHighlightFix then
				UseRefResult8.current = true
				
				return
			end
			task.spawn(function()
				-- upvalues: UseRefResult (upval), UseRefResult1 (upval), UseResult (upval), UseResult1 (upval)
				local Current = UseRefResult.current or UseRefResult1.current
				
				if Current and Current.Parent ~= nil then
					local Length = utf8.len(Current.Text)
					
					if Length then
						UseResult(0)
						UseResult1(Length + 1)
					end
				end
			end)
		end
	end, {
		WithDefaultsModuleResult.onFocus, WithDefaultsModuleResult.isDisabled,
		IsUsePreferredInputModuleResultMatch, IsLargestAbove,
		WithDefaultsModuleResult.focusBehavior,
		if FlagsModule.FoundationTextInputHighlightFix then nil else UseResult,
		if FlagsModule.FoundationTextInputHighlightFix then nil else UseResult1
	})
	local UseResult11 = ReactModule.useCallback(function(_, Input)
		-- upvalues: FlagsModule (upval), UseRefResult8 (copy)
		if not FlagsModule.FoundationTextInputHighlightFix then return end
		if Input.UserInputType == Enum.UserInputType.MouseMovement then
			UseRefResult8.current = false
		end
	end, {})
	local UseResult12 = ReactModule.useCallback(function(_, Input)
		-- upvalues: FlagsModule (upval), UseRefResult8 (copy), UseResult2 (copy)
		if not FlagsModule.FoundationTextInputHighlightFix then return end
		if not UseRefResult8.current then return end
		UseRefResult8.current = false
		
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			UseResult2()
			
			return
		end
	end, {
		if FlagsModule.FoundationTextInputHighlightFix then UseResult else nil,
		if FlagsModule.FoundationTextInputHighlightFix then UseResult1 else nil,
		if FlagsModule.FoundationTextInputHighlightFix then UseResult2 else nil
	})
	local UseResult13 = ReactModule.useCallback(function(_, p3, p4)
		-- upvalues: UseStateResult2 (copy), UseRefResult8 (copy), IsLargestAbove (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(false)
		UseRefResult8.current = false
		
		if IsLargestAbove then
			UseStateResult2_1(false)
		end
		if WithDefaultsModuleResult.onFocusLost then
			WithDefaultsModuleResult.onFocusLost(p4)
		end
		if p3 and WithDefaultsModuleResult.onReturnPressed then
			WithDefaultsModuleResult.onReturnPressed()
		end
	end, {
		WithDefaultsModuleResult.onReturnPressed,
		IsLargestAbove,
		WithDefaultsModuleResult.onFocusLost
	})
	local UseResult14 = if FlagsModule.FoundationTextInputsBetaUpdate then nil else ReactModule.useCallback(function(Hover)
		-- upvalues: Callback (ref), ControlStateModule (upval)
		Callback(Hover == ControlStateModule.Hover)
	end, {})
	local UseResult15 = ReactModule.useCallback(function(p3, Current)
		-- upvalues: UseRefResult6 (copy), WithDefaultsModuleResult (copy)
		UseRefResult6.current = Current
		
		if WithDefaultsModuleResult.onDragStarted then
			WithDefaultsModuleResult.onDragStarted(p3, Current)
		end
	end, { WithDefaultsModuleResult.onDragStarted })
	local UseResult16 = ReactModule.useCallback(function(p3, p4)
		-- upvalues: WithDefaultsModuleResult (copy)
		if WithDefaultsModuleResult.onDrag then
			WithDefaultsModuleResult.onDrag(p3, p4)
		end
	end, { WithDefaultsModuleResult.onDrag })
	local UseResult17 = ReactModule.useCallback(function(p3, Current)
		-- upvalues: UseRefResult6 (copy), UseResult3 (copy), UseResult4 (copy), UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		if UseRefResult6.current == Current then
			UseResult3()
		else
			UseResult4()
			UseStateResult2(false)
		end
		UseRefResult6.current = nil
		
		if WithDefaultsModuleResult.onDragEnded then
			WithDefaultsModuleResult.onDragEnded(p3, Current)
		end
	end, { WithDefaultsModuleResult.onDragEnded })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Container (copy), UseTokensModuleResult (copy)
		return {
			radius = UDim.new(0, Container.radius),
			offset = UseTokensModuleResult.Stroke.Thick,
			borderWidth = UseTokensModuleResult.Stroke.Thick
		}
	end, { UseTokensModuleResult, Container.radius })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetMultiLineTextHeightModule (upval), FontSize (copy), Largest (copy), LineHeight (copy)
		return GetMultiLineTextHeightModule(FontSize, Largest, LineHeight)
	end, { FontSize, Largest, LineHeight })
	local UseMemoResult2, UseMemoResult2_1 = ReactModule.useMemo(function()
		-- upvalues: Container (copy), ScaledCeiled (copy), GetMultiLineTextHeightModule (upval), FontSize (copy), LineHeight (copy), UseMemoResult1 (copy)
		local RoundedRatio = math.round((Container.minHeight - ScaledCeiled - GetMultiLineTextHeightModule(FontSize, 1, LineHeight)) * 2) / 2
		
		return {
			top = UDim.new(0, (math.floor(RoundedRatio / 2))),
			bottom = UDim.new(0, (math.ceil(RoundedRatio / 2))),
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, UseMemoResult1 + math.round(RoundedRatio) + ScaledCeiled
	end, {
		Container.minHeight, ScaledCeiled, ScaledCeiled1, FontSize, UseMemoResult1,
		LineHeight
	})
	local UseMemoResult3 = if FlagsModule.FoundationNumberInputBeta then ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy)
		return {
			left = if WithDefaultsModuleResult.horizontalPadding then WithDefaultsModuleResult.horizontalPadding.innerLeft else nil,
			right = if WithDefaultsModuleResult.horizontalPadding then WithDefaultsModuleResult.horizontalPadding.innerRight else nil
		}
	end, { WithDefaultsModuleResult.horizontalPadding }) else nil
	local NewOffset = UseMemoResult2.bottom.Offset + UseMemoResult2.top.Offset
	local _UDim2 = UDim2.new(1, 0, 0, UseMemoResult1 + NewOffset)
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: IsLargestAbove (copy)
		return if IsLargestAbove then {
			FillDirection = Enum.FillDirection.Vertical,
			ItemLineAlignment = Enum.ItemLineAlignment.Center
		} else nil
	end, { IsLargestAbove })
	local UseMemoResult5 = ReactModule.useMemo(function()
		-- upvalues: IsLargestAbove (copy)
		return if IsLargestAbove then {
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.fromOffset(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			VerticalScrollBarInset = Enum.ScrollBarInset.Always
		} else nil
	end, { IsLargestAbove })
	local UseResult18 = ReactModule.useCallback(function(Label)
		-- upvalues: UseRefResult3 (copy), UseRefResult2 (copy), TruncateTextToCursorModule (upval), UseMemoResult2 (copy)
		local Current = UseRefResult3.current
		local Current1 = UseRefResult2.current
		
		if Current == nil or Current1 == nil then return end
		local ScaledTextSize = Label.TextSize * Label.LineHeight
		local Y = Current.CanvasPosition.Y
		Current1.Text = TruncateTextToCursorModule(Label)
		local Y1 = Current1.TextBounds.Y
		local NewY = Y - UseMemoResult2.top.Offset + UseMemoResult2.bottom.Offset
		local YDelta = Y + Current.AbsoluteSize.Y - UseMemoResult2.top.Offset - UseMemoResult2.bottom.Offset
		
		if Y1 - ScaledTextSize < NewY then
			Current.CanvasPosition += Vector2.new(0, Y1 - ScaledTextSize - NewY)
		end
		if YDelta < Y1 then
			Current.CanvasPosition += Vector2.new(0, Y1 - YDelta)
		end
	end, { UseMemoResult2 })
	local UseResult19 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult3 (copy), UseRefResult7 (copy)
		if Current ~= nil then
			UseRefResult3.current = Current
			Current.ClipsDescendants = true
			Current.CanvasPosition = UseRefResult7.current
			
			return
		end
	end, {})
	local UseResult20 = ReactModule.useCallback(function(TextBox)
		-- upvalues: UseRefResult4 (copy), FlagsModule (upval)
		if TextBox then
			TextBox.Text = UseRefResult4.current
			UseRefResult4.current = ""
			
			if FlagsModule.FoundationTextAreaDelayMobileFocus then
				task.delay(0, function()
					-- upvalues: TextBox (copy)
					if TextBox.Parent ~= nil then
						TextBox:CaptureFocus()
					end
				end)
				
				return
			end
			TextBox:CaptureFocus()
		end
	end, {})
	local UseResult21 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult7 (copy)
		UseRefResult7.current = ScrollFrame.CanvasPosition
	end, {})
	local UseMemoResult6 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), ReactModule (upval), UseResult15 (copy), UseResult16 (copy), UseResult17 (copy), UseStateResult (copy)
		return if WithDefaultsModuleResult.onDragStarted or WithDefaultsModuleResult.onDrag or WithDefaultsModuleResult.onDragEnded then ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[ReactModule.Event.DragStart] = UseResult15,
			[ReactModule.Event.DragContinue] = UseResult16,
			[ReactModule.Event.DragEnd] = UseResult17,
			Enabled = not UseStateResult and not WithDefaultsModuleResult.isDisabled
		}) else nil
	end, {
		UseResult15,
		UseResult16,
		UseResult17,
		UseStateResult,
		WithDefaultsModuleResult.isDisabled
	})
	local UseBindableModuleResult = UseBindableModule(WithDefaultsModuleResult.horizontalPadding and WithDefaultsModuleResult.horizontalPadding.left or UDim.new(0, 0))
	local UseBindableModuleResult1 = UseBindableModule(WithDefaultsModuleResult.horizontalPadding and WithDefaultsModuleResult.horizontalPadding.right or UDim.new(0, 0))
	local UseMemoResult7 = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), Container (copy), UseTokensModuleResult (copy)
		return if WithDefaultsModuleResult.hasClearButton then UDim2.fromOffset(0, (Container.minHeight - UseTokensModuleResult.Stroke.Standard) / 2) else nil
	end, {
		WithDefaultsModuleResult.hasClearButton,
		Container.minHeight,
		UseTokensModuleResult.Stroke.Standard
	})
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(UseRefResult1, UseResult20)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		ref = WithDefaultsModuleResult.inputRef,
		Size = UDim2.new(1, 0, 0, UseMemoResult2_1),
		selection = {
			Selectable = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.Selectable and not WithDefaultsModuleResult.isDisabled else not WithDefaultsModuleResult.isDisabled,
			NextSelectionUp = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionUp else nil,
			NextSelectionDown = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionDown else nil,
			NextSelectionLeft = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionLeft else nil,
			NextSelectionRight = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionRight else nil
		},
		cursor = UseMemoResult,
		stroke = if Container.strokeStyle and Container.strokeThickness then {
			Color = Container.strokeStyle.Color3,
			Transparency = if WithDefaultsModuleResult.isDisabled then BlendTransparenciesModule(Container.strokeStyle.Transparency, ConstantsModule.DISABLED_TRANSPARENCY) else Container.strokeStyle.Transparency,
			Thickness = Container.strokeThickness,
			BorderStrokePosition = if UseStateResult or v1 and not FlagsModule.FoundationTextInputsBetaUpdate then Enum.BorderStrokePosition.Center else Enum.BorderStrokePosition.Inner
		} else nil,
		cornerRadius = if WithDefaultsModuleResult.radius == RadiusModule.Circle then UDim.new(0, (math.ceil(Container.minHeight / 2))) else nil,
		padding = {
			left = UseBindableModuleResult:map(function(p3): UDim
				-- upvalues: Standard (copy)
				return UDim.new(0, Standard) + p3
			end),
			right = if WithDefaultsModuleResult.trailingElement == nil and WithDefaultsModuleResult.hasClearButton then UDim.new(0, Standard) else UseBindableModuleResult1:map(function(p3): UDim
				-- upvalues: Standard (copy)
				return UDim.new(0, Standard) + p3
			end),
			top = UDim.new(0, Standard),
			bottom = UDim.new(0, Standard)
		},
		onActivated = if WithDefaultsModuleResult.isDisabled then nil else UseResult3,
		onStateChanged = if FlagsModule.FoundationTextInputsBetaUpdate then nil else UseResult14,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		backgroundStyle = if Container.bgStyle then GetDisabledStyleModule({
			Color3 = Container.bgStyle.Color3,
			Transparency = if WithDefaultsModuleResult.backgroundGradient then 0 else Container.bgStyle.Transparency
		}, WithDefaultsModuleResult.isDisabled) else nil,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		tag = Container.tag,
		testId = `{WithDefaultsModuleResult.testId}--outer-container`
	}), {
		DragDetector = UseMemoResult6,
		Background = WithDefaultsModuleResult.backgroundGradient,
		Leading = if WithDefaultsModuleResult.leadingElement then ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{WithDefaultsModuleResult.testId}--leading`
		}, WithDefaultsModuleResult.leadingElement) else nil,
		TextBoxWrapper = ReactModule.createElement(if IsLargestAbove then ScrollViewModule else ViewModule, {
			LayoutOrder = 2,
			tag = "fill size-full clip",
			selection = { Selectable = false },
			scroll = UseMemoResult5,
			layout = UseMemoResult4,
			onCanvasPositionChanged = if IsLargestAbove then UseResult21 else nil,
			scrollingFrameRef = if IsLargestAbove then UseResult19 else nil,
			padding = if FlagsModule.FoundationNumberInputBeta then UseMemoResult3 else nil,
			testId = `{WithDefaultsModuleResult.testId}--textbox-wrapper`
		}, {
			TextBox = if UseStateResult1 then nil else ReactModule.createElement(MemoResult, {
				text = WithDefaultsModuleResult.text,
				placeholder = WithDefaultsModuleResult.placeholder,
				textInputType = WithDefaultsModuleResult.textInputType,
				fontStyle = FontStyle,
				textStyle = DisabledStyleModule,
				isMultiLine = IsLargestAbove,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				ref = UseRefResult,
				tag = `{UseStyleTagsModuleResult or ""} data-testid={WithDefaultsModuleResult.testId}--textbox`,
				Size = if IsLargestAbove then _UDim2 else nil,
				automaticSize = MapBindableModule(WithDefaultsModuleResult.text, function(p3)
					-- upvalues: IsLargestAbove (copy), UseStateResult1 (copy)
					return if IsLargestAbove and not UseStateResult1 and p3 ~= "" then Enum.AutomaticSize.Y else nil
				end),
				padding = UseMemoResult2,
				onFocusGained = UseResult10,
				onFocusLost = if IsLargestAbove and IsUsePreferredInputModuleResultMatch then nil else UseResult13,
				onTextChanged = UseResult9,
				onCursorPositionChanged = if IsLargestAbove then UseResult18 else nil,
				onInputChanged = UseResult11,
				onInputEnded = UseResult12
			}, {
				DragDetector = UseMemoResult6,
				BoundsChecker = if IsLargestAbove then ReactModule.createElement(MemoResult, {
					isBoundsChecker = true,
					fontStyle = FontStyle,
					textStyle = DisabledStyleModule,
					Size = UDim2.new(1, 0, 1, NewOffset),
					ref = UseRefResult2
				}) else nil
			}),
			MobileTextBox = if IsLargestAbove and UseStateResult1 then ReactModule.createElement(MemoResult, {
				text = WithDefaultsModuleResult.text,
				placeholder = WithDefaultsModuleResult.placeholder,
				textInputType = WithDefaultsModuleResult.textInputType,
				fontStyle = FontStyle,
				textStyle = DisabledStyleModule,
				isMultiLine = IsLargestAbove,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				padding = UseMemoResult2,
				ref = UseComposedRefResult,
				tag = `{UseStyleTagsModuleResult or ""} data-testid={WithDefaultsModuleResult.testId}--mobile-textbox`,
				Size = _UDim2,
				onFocusLost = if IsLargestAbove and IsUsePreferredInputModuleResultMatch then UseResult13 else nil,
				onTextChanged = UseResult9,
				onCursorPositionChanged = if IsLargestAbove then UseResult18 else nil
			}) else nil
		}),
		Clear = if WithDefaultsModuleResult.hasClearButton then ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			Visible = MapBindableModule(WithDefaultsModuleResult.text, function(p3): boolean
				return p3 ~= ""
			end),
			tag = UseTextInputVariantsModuleResult.clearButton.tag
		}, {
			ClearButton = ReactModule.createElement(ViewModule, {
				tag = "anchor-center-left auto-xy",
				onActivated = UseResult8,
				padding = UDim.new(0, UseTextInputVariantsModuleResult.clearButton.padding),
				Position = UseMemoResult7,
				stateLayer = { affordance = StateLayerAffordanceModule.None },
				testId = `{WithDefaultsModuleResult.testId}--clear-button`
			}, {
				Icon = ReactModule.createElement(IconModule, { name = UseTextInputVariantsModuleResult.clearButton.icon })
			})
		}) else nil,
		Trailing = if WithDefaultsModuleResult.trailingElement then ReactModule.createElement(ViewModule, {
			LayoutOrder = 4,
			tag = "size-0-full auto-x",
			GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{WithDefaultsModuleResult.testId}--trailing`
		}, WithDefaultsModuleResult.trailingElement) else nil
	})
end))