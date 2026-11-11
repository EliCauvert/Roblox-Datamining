local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local ReactUtilsModule = require(Parent.ReactUtils)
local Components = Foundation.Components
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InputSizeModule = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Enums.InputLabelSize)
local NumberInputControlsVariantModule = require(Foundation.Enums.NumberInputControlsVariant)
local ScrubBehaviorModule = require(Foundation.Enums.ScrubBehavior)
local OnChangeCallbackReasonModule = require(Foundation.Enums.OnChangeCallbackReason)
local FlagsModule = require(Foundation.Utility.Flags)
local IconModule = require(Components.Icon)
local InputFieldModule = require(Components.InputField)
local InternalTextInputModule = require(Components.InternalTextInput)
local TextModule = require(Components.Text)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local GetBindableValueModule = require(Foundation.Utility.getBindableValue)
local GetInputTextSizeModule = require(Foundation.Utility.getInputTextSize)
local GetMultiLineTextHeightModule = require(Foundation.Utility.getMultiLineTextHeight)
local IsBuilderIconModule = require(Foundation.Utility.isBuilderIcon)
local JoinBindablesModule = require(Foundation.Utility.joinBindables)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UseIconSizeModule = require(Foundation.Utility.useIconSize)
local UseTextInputVariantsModule = require(Components.TextInput.useTextInputVariants)
local UseTextSizeModule = require(Foundation.Utility.useTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local NumberInputControlsModule = require(script.Parent.NumberInputControls)
local UseNumberInputVariantsModule = require(script.Parent.useNumberInputVariants)
local ConstantsModule = require(Foundation.Constants)
local CalculateNumberInputValueFromPositionsModule = require(script.Parent.calculateNumberInputValueFromPositions)
local _ = require(Foundation.Enums.InputFocusBehavior)

local function _(p1, p2): number
	local v1 = 10 ^ (p2 or 0)
	
	return math.floor(p1 * v1 + 0.5) / v1
end

local config = {
	[ScrubBehaviorModule.On] = 1,
	[ScrubBehaviorModule.Off] = 0
}
local config1 = {
	minimum = -1e999,
	maximum = 1e999,
	step = 1,
	precision = 3,
	value = 0,
	isScrubbable = false,
	hasControls = false,
	testId = "--foundation-number-input",
	variant = require(Foundation.Enums.InputVariant).Standard,
	controlsVariant = if FlagsModule.FoundationNumberInputBeta then nil else NumberInputControlsVariantModule.Stacked,
	size = InputSizeModule.Large,
	formatAsString = function(p1): string
		return (tostring(p1))
	end,
	scrubBehavior = ScrubBehaviorModule.Off
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTokensModule (copy), UseTextInputVariantsModule (copy), UseNumberInputVariantsModule (copy), FlagsModule (copy), ReactModule (copy), ReactUtilsModule (copy), ScrubBehaviorModule (copy), config (copy), MapBindableModule (copy), GetBindableValueModule (copy), InputSizeModule (copy), UseTextSizeModule (copy), UseIconSizeModule (copy), IsBuilderIconModule (copy), GetMultiLineTextHeightModule (copy), ConstantsModule (copy), OnChangeCallbackReasonModule (copy), NumberInputControlsVariantModule (copy), NumberInputControlsModule (copy), CalculateNumberInputValueFromPositionsModule (copy), ReactIsModule (copy), InputFieldModule (copy), WithCommonPropsModule (copy), GetInputTextSizeModule (copy), InternalTextInputModule (copy), JoinBindablesModule (copy), ViewModule (copy), IconModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTokensModuleResult = UseTokensModule()
	local UseTextInputVariantsModuleResult = UseTextInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant)
	local UseNumberInputVariantsModuleResult = UseNumberInputVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, if FlagsModule.FoundationNumberInputBeta then nil else WithDefaultsModuleResult.controlsVariant)
	local Controls = if FlagsModule.FoundationNumberInputBeta then UseNumberInputVariantsModuleResult.controls else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseComposedRefResult = ReactUtilsModule.useComposedRef(UseRefResult, WithDefaultsModuleResult.textBoxRef)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		return if UseRefResult.current then UseRefResult.current.getIsFocused() else false
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local HasError = WithDefaultsModuleResult.hasError or UseStateResult
	local ControlsVariant = WithDefaultsModuleResult.controlsVariant
	local On = if WithDefaultsModuleResult.isScrubbable then ScrubBehaviorModule.On else WithDefaultsModuleResult.scrubBehavior
	local IsNotOnMatch: boolean = On and On ~= ScrubBehaviorModule.Off
	local Entry = if FlagsModule.FoundationNumberInputBeta then config[On] else nil
	local UseResult1 = ReactModule.useCallback(function(Value: number): number
		-- upvalues: WithDefaultsModuleResult (copy)
		return (math.clamp(Value, WithDefaultsModuleResult.minimum, WithDefaultsModuleResult.maximum))
	end, {
		WithDefaultsModuleResult.minimum,
		WithDefaultsModuleResult.maximum
	})
	local UseResult2 = ReactModule.useCallback(function(p2, Callback)
		-- upvalues: WithDefaultsModuleResult (copy)
		return Callback(p2 / WithDefaultsModuleResult.step) * WithDefaultsModuleResult.step
	end, { WithDefaultsModuleResult.step })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MapBindableModule (upval), WithDefaultsModuleResult (copy), UseResult2 (copy), UseResult1 (copy)
		return MapBindableModule(WithDefaultsModuleResult.value, function(p2)
			-- upvalues: WithDefaultsModuleResult (upval), UseResult2 (upval), UseResult1 (upval)
			local v1 = 10 ^ (WithDefaultsModuleResult.precision or 0)
			local FlooredRatio = math.floor(p2 * v1 + 0.5) / v1
			local v2 = 10 ^ (WithDefaultsModuleResult.precision or 0)
			local FlooredRatio1 = math.floor((p2 + WithDefaultsModuleResult.step) * v2 + 0.5) / v2
			local v3 = 10 ^ (WithDefaultsModuleResult.precision or 0)
			local FlooredRatio2 = math.floor(UseResult2(p2, math.ceil) * v3 + 0.5) / v3
			
			if FlooredRatio ~= FlooredRatio2 then
				FlooredRatio1 = FlooredRatio2
			end
			return UseResult1(FlooredRatio1)
		end)
	end, {
		WithDefaultsModuleResult.value,
		WithDefaultsModuleResult.step,
		WithDefaultsModuleResult.precision,
		UseResult1,
		UseResult2
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: MapBindableModule (upval), WithDefaultsModuleResult (copy), UseResult2 (copy), UseResult1 (copy)
		return MapBindableModule(WithDefaultsModuleResult.value, function(p2)
			-- upvalues: WithDefaultsModuleResult (upval), UseResult2 (upval), UseResult1 (upval)
			local v1 = 10 ^ (WithDefaultsModuleResult.precision or 0)
			local FlooredRatio = math.floor(p2 * v1 + 0.5) / v1
			local v2 = 10 ^ (WithDefaultsModuleResult.precision or 0)
			local FlooredRatio1 = math.floor((p2 - WithDefaultsModuleResult.step) * v2 + 0.5) / v2
			local v3 = 10 ^ (WithDefaultsModuleResult.precision or 0)
			local FlooredRatio2 = math.floor(UseResult2(p2, math.floor) * v3 + 0.5) / v3
			
			if FlooredRatio ~= FlooredRatio2 then
				FlooredRatio1 = FlooredRatio2
			end
			return UseResult1(FlooredRatio1)
		end)
	end, {
		WithDefaultsModuleResult.value,
		WithDefaultsModuleResult.step,
		WithDefaultsModuleResult.precision,
		UseResult1,
		UseResult2
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: MapBindableModule (upval), WithDefaultsModuleResult (copy)
		return MapBindableModule(WithDefaultsModuleResult.value, function(Maximum)
			-- upvalues: WithDefaultsModuleResult (upval)
			return WithDefaultsModuleResult.isDisabled or Maximum == WithDefaultsModuleResult.maximum
		end)
	end, {
		WithDefaultsModuleResult.isDisabled,
		WithDefaultsModuleResult.value,
		WithDefaultsModuleResult.maximum
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: MapBindableModule (upval), WithDefaultsModuleResult (copy)
		return MapBindableModule(WithDefaultsModuleResult.value, function(Minimum)
			-- upvalues: WithDefaultsModuleResult (upval)
			return WithDefaultsModuleResult.isDisabled or Minimum == WithDefaultsModuleResult.minimum
		end)
	end, {
		WithDefaultsModuleResult.isDisabled,
		WithDefaultsModuleResult.value,
		WithDefaultsModuleResult.minimum
	})
	local UseResult3 = ReactModule.useCallback(function(Value: number): number
		-- upvalues: WithDefaultsModuleResult (copy)
		local v1 = 10 ^ (WithDefaultsModuleResult.precision or 0)
		
		return math.floor(math.clamp(Value, WithDefaultsModuleResult.minimum, WithDefaultsModuleResult.maximum) * v1 + 0.5) / v1
	end, {
		WithDefaultsModuleResult.minimum,
		WithDefaultsModuleResult.maximum,
		WithDefaultsModuleResult.precision
	})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(WithDefaultsModuleResult.formatAsString(UseResult3(GetBindableValueModule(WithDefaultsModuleResult.value))))
	local SmallDelta = if FlagsModule.FoundationNumberInputBeta then if WithDefaultsModuleResult.size == InputSizeModule.XSmall then UseTokensModuleResult.Gap.Small - UseTokensModuleResult.Gap.XSmall / 2 else UseTokensModuleResult.Gap.Small else nil
	local IsNotPrefixMatch: boolean? = nil
	local Vector = nil
	local UseMemoResult4 = nil
	local UseMemoResult5 = nil
	
	if FlagsModule.FoundationNumberInputBeta then
		local FontStyle = UseTextInputVariantsModuleResult.textBox.fontStyle
		local FontSize = FontStyle.FontSize
		IsNotPrefixMatch = WithDefaultsModuleResult.prefix and WithDefaultsModuleResult.prefix ~= "" or WithDefaultsModuleResult.suffix and WithDefaultsModuleResult.suffix ~= ""
		Vector = UseTextSizeModule(if WithDefaultsModuleResult.prefix then WithDefaultsModuleResult.prefix .. " " else nil, (ReactModule.useMemo(function()
			-- upvalues: FontStyle (copy), FontSize (copy)
			return {
				Font = FontStyle.Font,
				FontSize = math.floor(FontSize),
				LineHeight = FontStyle.LineHeight
			}
		end, { FontStyle, FontSize })))
		local UseIconSizeModuleResult = UseIconSizeModule(UseTextInputVariantsModuleResult.icon.size, IsBuilderIconModule(WithDefaultsModuleResult.leadingIcon))
		local UseIconSizeModuleResult1 = UseIconSizeModule(UseTextInputVariantsModuleResult.icon.size, IsBuilderIconModule(WithDefaultsModuleResult.trailingIcon))
		local Offset = if WithDefaultsModuleResult.leadingIcon then UseIconSizeModuleResult.X.Offset else 0
		local Offset1 = if FlagsModule.FoundationNumberInputBeta and WithDefaultsModuleResult.trailingIcon then UseIconSizeModuleResult1.X.Offset else 0
		local Small = if WithDefaultsModuleResult.size == InputSizeModule.XSmall then UseTokensModuleResult.Gap.Small elseif WithDefaultsModuleResult.size == InputSizeModule.Small then UseTokensModuleResult.Gap.Medium else UseTokensModuleResult.Gap.Large
		local Small1 = if WithDefaultsModuleResult.leadingIcon then Small else 0
		local Small2 = if FlagsModule.FoundationNumberInputBeta and WithDefaultsModuleResult.trailingIcon then Small else 0
		UseMemoResult5 = ReactModule.useMemo(function()
			-- upvalues: UseTextInputVariantsModuleResult (copy), Offset (copy), Small1 (copy), Offset1 (copy), Small2 (copy)
			return {
				left = UDim.new(0, UseTextInputVariantsModuleResult.container.horizontalPadding.Offset + Offset + Small1),
				right = UDim.new(0, UseTextInputVariantsModuleResult.container.horizontalPadding.Offset + Offset1 + Small2)
			}
		end, {
			UseTextInputVariantsModuleResult.container.horizontalPadding,
			Small1,
			Small2,
			Offset,
			Offset1
		})
		UseMemoResult4 = ReactModule.useMemo(function()
			-- upvalues: GetMultiLineTextHeightModule (upval), FontSize (copy), FontStyle (copy), UseTextInputVariantsModuleResult (copy)
			local RoundedRatio = math.round((UseTextInputVariantsModuleResult.container.minHeight - 2 - GetMultiLineTextHeightModule(FontSize, 1, FontStyle.LineHeight)) * 2) / 2
			
			return {
				top = UDim.new(0, math.floor(RoundedRatio / 2) + 1),
				bottom = UDim.new(0, math.ceil(RoundedRatio / 2) + 1),
				left = UDim.new(),
				right = UDim.new()
			}
		end, {
			UseTextInputVariantsModuleResult.container.minHeight,
			FontStyle,
			FontSize
		})
	end
	local Width = if WithDefaultsModuleResult.width then WithDefaultsModuleResult.width elseif FlagsModule.FoundationNumberInputBeta then UDim.new(0, ConstantsModule.DEFAULT_NUMBER_INPUT_WIDTH) else UDim.new(0, UseNumberInputVariantsModuleResult.container.width)
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseBindingResult2 (copy), GetBindableValueModule (upval), WithDefaultsModuleResult (copy)
		UseBindingResult2((tostring(GetBindableValueModule(WithDefaultsModuleResult.value))))
		
		if WithDefaultsModuleResult.onFocusGained then
			WithDefaultsModuleResult.onFocusGained()
		end
	end, {
		WithDefaultsModuleResult.onFocusGained,
		WithDefaultsModuleResult.value
	})
	local UseResult5 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseResult3 (copy), UseBindingResult2 (copy), UseResult (copy), WithDefaultsModuleResult (copy)
		local UseResultResult = UseResult3(p2)
		UseBindingResult2(if UseResult() then tostring(UseResultResult) else WithDefaultsModuleResult.formatAsString(UseResultResult))
		WithDefaultsModuleResult.onChanged(UseResultResult, p3)
	end, {
		WithDefaultsModuleResult.onChanged,
		WithDefaultsModuleResult.formatAsString,
		UseResult3,
		UseResult
	})
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), UseResult5 (copy), GetBindableValueModule (upval), WithDefaultsModuleResult (copy), OnChangeCallbackReasonModule (upval)
		UseStateResult2(false)
		UseResult5(GetBindableValueModule(WithDefaultsModuleResult.value), OnChangeCallbackReasonModule.FocusLost)
		
		if WithDefaultsModuleResult.onFocusLost then
			WithDefaultsModuleResult.onFocusLost(p2)
		end
	end, {
		UseResult5,
		WithDefaultsModuleResult.onFocusLost,
		WithDefaultsModuleResult.value,
		UseResult3
	})
	local UseResult7 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy), UseResult (copy), UseStateResult2 (copy), WithDefaultsModuleResult (copy), OnChangeCallbackReasonModule (upval)
		UseBindingResult2(p2)
		
		if not UseResult() then return end
		local Number: number? = tonumber(p2)
		
		if Number == nil then
			UseStateResult2(true)
			
			return
		else
			UseStateResult2(false)
			WithDefaultsModuleResult.onChanged(Number, OnChangeCallbackReasonModule.Keyboard)
		end
	end, { UseResult, WithDefaultsModuleResult.onChanged })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: GetBindableValueModule (upval), UseMemoResult2 (copy), UseResult5 (copy), UseMemoResult (copy), OnChangeCallbackReasonModule (upval)
		if not GetBindableValueModule(UseMemoResult2) then
			UseResult5(GetBindableValueModule(UseMemoResult), OnChangeCallbackReasonModule.Activate)
			
			return
		end
	end, { UseMemoResult2, UseMemoResult, UseResult5 })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: GetBindableValueModule (upval), UseMemoResult3 (copy), UseResult5 (copy), UseMemoResult1 (copy), OnChangeCallbackReasonModule (upval)
		if not GetBindableValueModule(UseMemoResult3) then
			UseResult5(GetBindableValueModule(UseMemoResult1), OnChangeCallbackReasonModule.Activate)
			
			return
		end
	end, { UseMemoResult3, UseMemoResult1, UseResult5 })
	local IsNotControlsVariantMatch = if FlagsModule.FoundationNumberInputBeta then WithDefaultsModuleResult.hasControls and (ControlsVariant ~= NumberInputControlsVariantModule.None and ControlsVariant ~= NumberInputControlsVariantModule.Stacked) else nil
	local Element = if FlagsModule.FoundationNumberInputBeta and IsNotControlsVariantMatch then ReactModule.createElement(NumberInputControlsModule, {
		variant = WithDefaultsModuleResult.variant,
		controlsVariant = if FlagsModule.FoundationNumberInputBeta then nil else ControlsVariant,
		size = WithDefaultsModuleResult.size,
		increment = { isDisabled = UseMemoResult2, onClick = UseResult8 },
		decrement = { isDisabled = UseMemoResult3, onClick = UseResult9 },
		testId = WithDefaultsModuleResult.testId
	}) elseif FlagsModule.FoundationNumberInputBeta then nil else ReactModule.createElement(NumberInputControlsModule, {
		variant = WithDefaultsModuleResult.variant,
		controlsVariant = if FlagsModule.FoundationNumberInputBeta then nil else ControlsVariant,
		size = WithDefaultsModuleResult.size,
		increment = { isDisabled = UseMemoResult2, onClick = UseResult8 },
		decrement = { isDisabled = UseMemoResult3, onClick = UseResult9 },
		testId = WithDefaultsModuleResult.testId
	})
	local UseMemoResult6 = ReactModule.useMemo(function(): UDim
		-- upvalues: FlagsModule (upval), IsNotControlsVariantMatch (copy), Controls (copy), SmallDelta (copy), ControlsVariant (copy), NumberInputControlsVariantModule (upval), UseNumberInputVariantsModuleResult (copy), UseTokensModuleResult (copy)
		if FlagsModule.FoundationNumberInputBeta then
			if IsNotControlsVariantMatch then
				return UDim.new(0, Controls.width + SmallDelta)
			end
		elseif ControlsVariant == NumberInputControlsVariantModule.Split then
			return UDim.new(0, 2 * UseNumberInputVariantsModuleResult.splitButton.size + 2 * UseTokensModuleResult.Gap.XSmall)
		end
		return UDim.new()
	end, {
		UseTokensModuleResult, ControlsVariant,
		if FlagsModule.FoundationNumberInputBeta then nil else UseNumberInputVariantsModuleResult.splitButton.size,
		UseTokensModuleResult.Gap.XSmall,
		if FlagsModule.FoundationNumberInputBeta then Controls else nil,
		if FlagsModule.FoundationNumberInputBeta then SmallDelta else nil,
		if FlagsModule.FoundationNumberInputBeta then IsNotControlsVariantMatch else nil
	})
	local UseResult10 = ReactModule.useCallback(function(_, p2)
		-- upvalues: WithDefaultsModuleResult (copy), UseRefResult1 (copy), GetBindableValueModule (upval)
		local Value = WithDefaultsModuleResult.value
		
		if Value then
			UseRefResult1.current = { position = p2.X, value = GetBindableValueModule(Value) }
		end
	end, { WithDefaultsModuleResult.value })
	local UseResult11 = ReactModule.useCallback(function(_, p2)
		-- upvalues: UseRefResult1 (copy), CalculateNumberInputValueFromPositionsModule (upval), WithDefaultsModuleResult (copy), FlagsModule (upval), Entry (copy), UseResult5 (copy), OnChangeCallbackReasonModule (upval)
		if UseRefResult1.current then
			UseResult5(CalculateNumberInputValueFromPositionsModule(UseRefResult1.current.value, UseRefResult1.current.position, p2.X, WithDefaultsModuleResult.step, if FlagsModule.FoundationNumberInputBeta then Entry else nil), OnChangeCallbackReasonModule.Drag)
		end
	end, {
		UseResult5,
		WithDefaultsModuleResult.step,
		UseResult3,
		if FlagsModule.FoundationNumberInputBeta then Entry else nil
	})
	local UseResult12 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		if UseRefResult1.current then
			UseRefResult1.current = nil
		end
	end, {})
	local Transparency = UseTokensModuleResult.Color.Shift.Shift_300.Transparency
	local Transparency1 = UseTokensModuleResult.Color.Shift.Shift_100.Transparency
	local UseMemoResult7 = ReactModule.useMemo(function()
		-- upvalues: MapBindableModule (upval), WithDefaultsModuleResult (copy), UseResult1 (copy), Transparency1 (copy), Transparency (copy)
		return MapBindableModule(WithDefaultsModuleResult.value, function(p2): NumberSequence
			-- upvalues: WithDefaultsModuleResult (upval), UseResult1 (upval), Transparency1 (upval), Transparency (upval)
			local MinimumRatio = 0
			
			if p2 and WithDefaultsModuleResult.maximum and WithDefaultsModuleResult.minimum then
				local UseResultResult = UseResult1(p2)
				MinimumRatio = if WithDefaultsModuleResult.maximum == WithDefaultsModuleResult.minimum then 1 else (UseResultResult - WithDefaultsModuleResult.minimum) / (WithDefaultsModuleResult.maximum - WithDefaultsModuleResult.minimum)
			end
			if MinimumRatio == 0 then
				return NumberSequence.new(Transparency1)
			end
			if MinimumRatio == 1 then
				return NumberSequence.new(Transparency)
			end
			if MinimumRatio <= 0 and MinimumRatio >= 1 then
				return NumberSequence.new(Transparency1)
			end
			local List = {
				NumberSequenceKeypoint.new(0, Transparency),
				NumberSequenceKeypoint.new(MinimumRatio, Transparency),
				NumberSequenceKeypoint.new(math.min(MinimumRatio + 0.001, 1), Transparency1)
			}
			
			if MinimumRatio < 0.999 then
				table.insert(List, NumberSequenceKeypoint.new(1, Transparency1))
			end
			return NumberSequence.new(List)
		end)
	end, {
		Transparency, Transparency1, WithDefaultsModuleResult.value, UseResult1,
		WithDefaultsModuleResult.maximum, WithDefaultsModuleResult.minimum
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), ReactIsModule (upval), WithDefaultsModuleResult (copy), UseBindingResult2 (copy), UseResult3 (copy)
		if not UseResult() and not ReactIsModule.isBinding(WithDefaultsModuleResult.value) then
			UseBindingResult2(WithDefaultsModuleResult.formatAsString(UseResult3(WithDefaultsModuleResult.value)))
		end
	end, {
		WithDefaultsModuleResult.value,
		WithDefaultsModuleResult.formatAsString,
		UseResult3,
		UseResult
	})
	
	return ReactModule.createElement(InputFieldModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		width = Width,
		ref = Ref,
		hasError = HasError,
		label = WithDefaultsModuleResult.label,
		size = GetInputTextSizeModule(WithDefaultsModuleResult.size),
		isRequired = WithDefaultsModuleResult.isRequired,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		hint = WithDefaultsModuleResult.hint,
		textBoxRef = UseComposedRefResult,
		input = function(Ref)
			-- upvalues: FlagsModule (upval), IsNotControlsVariantMatch (copy), Element (copy), ControlsVariant (copy), NumberInputControlsVariantModule (upval), ReactModule (upval), InternalTextInputModule (upval), WithDefaultsModuleResult (copy), JoinBindablesModule (upval), UseBindingResult (copy), UseResult (copy), UseResult3 (copy), HasError (copy), UseTextInputVariantsModuleResult (copy), Vector (ref), p1 (copy), UseResult7 (copy), UseResult6 (copy), UseResult4 (copy), IsNotOnMatch (copy), UseResult10 (copy), UseResult11 (copy), UseResult12 (copy), UseMemoResult7 (copy), UseTokensModuleResult (copy), ViewModule (upval), IconModule (upval), IsNotPrefixMatch (ref), TextModule (upval), UseMemoResult5 (ref), UseMemoResult4 (ref), Width (copy), UseMemoResult6 (copy), SmallDelta (copy)
			local Element1 = if FlagsModule.FoundationNumberInputBeta then IsNotControlsVariantMatch and Element else ControlsVariant == NumberInputControlsVariantModule.Split
			local Element2 = ReactModule.createElement(InternalTextInputModule, {
				inputRef = WithDefaultsModuleResult.inputRef,
				text = JoinBindablesModule({
					text = UseBindingResult,
					value = WithDefaultsModuleResult.value
				}, function(p2)
					-- upvalues: UseResult (upval), WithDefaultsModuleResult (upval), UseResult3 (upval)
					return if UseResult() then p2.text else WithDefaultsModuleResult.formatAsString(UseResult3(p2.value))
				end),
				hasError = HasError,
				variant = WithDefaultsModuleResult.variant,
				size = WithDefaultsModuleResult.size,
				Selectable = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.Selectable else nil,
				NextSelectionUp = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionUp else nil,
				NextSelectionDown = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionDown else nil,
				NextSelectionLeft = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionLeft else nil,
				NextSelectionRight = if FlagsModule.FoundationInputSelectionProps then WithDefaultsModuleResult.NextSelectionRight else nil,
				horizontalPadding = {
					left = UseTextInputVariantsModuleResult.container.horizontalPadding,
					right = if FlagsModule.FoundationNumberInputBeta then UseTextInputVariantsModuleResult.container.horizontalPadding else nil,
					innerLeft = if FlagsModule.FoundationNumberInputBeta and (Vector and Vector.X > 0) then UDim.new(0, Vector.X) else nil
				},
				focusBehavior = p1.focusBehavior,
				onChanged = UseResult7,
				onFocusLost = UseResult6,
				onFocus = UseResult4,
				onDragStarted = if IsNotOnMatch then UseResult10 else nil,
				onDrag = if IsNotOnMatch then UseResult11 else nil,
				onDragEnded = if IsNotOnMatch then UseResult12 else nil,
				onReturnPressed = WithDefaultsModuleResult.onReturnPressed,
				ref = Ref,
				backgroundGradient = if IsNotOnMatch and UseMemoResult7 then ReactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = ColorSequence.new(UseTokensModuleResult.Color.Shift.Shift_300.Color3),
					Transparency = UseMemoResult7
				}) else nil,
				trailingElement = if FlagsModule.FoundationNumberInputBeta then if WithDefaultsModuleResult.trailingIcon then ReactModule.createElement(ViewModule, { tag = "row align-y-center size-0-full auto-x" }, ReactModule.createElement(IconModule, {
					name = WithDefaultsModuleResult.trailingIcon,
					style = UseTextInputVariantsModuleResult.icon.style,
					size = UseTextInputVariantsModuleResult.icon.size
				})) else nil elseif ControlsVariant == NumberInputControlsVariantModule.Stacked then Element else nil,
				leadingElement = if WithDefaultsModuleResult.leadingIcon then ReactModule.createElement(ViewModule, { tag = "row align-y-center size-0-full auto-x" }, ReactModule.createElement(IconModule, {
					name = WithDefaultsModuleResult.leadingIcon,
					style = UseTextInputVariantsModuleResult.icon.style,
					size = UseTextInputVariantsModuleResult.icon.size
				})) else nil,
				isDisabled = WithDefaultsModuleResult.isDisabled,
				LayoutOrder = if Element1 and FlagsModule.FoundationNumberInputBeta then 0 else nil,
				testId = `{WithDefaultsModuleResult.testId}--field`
			})
			local Element3 = if FlagsModule.FoundationNumberInputBeta and IsNotPrefixMatch then ReactModule.createElement(TextModule, {
				tag = "text-align-x-left text-align-y-center content-muted",
				RichText = true,
				ClipsDescendants = true,
				fontStyle = UseTextInputVariantsModuleResult.textBox.fontStyle,
				Size = UDim2.new(1, -(UseMemoResult5.left.Offset + UseMemoResult5.right.Offset), 1, 0),
				Position = UDim2.fromOffset(UseMemoResult5.left.Offset, 0),
				Text = UseBindingResult:map(function(p2): string
					-- upvalues: WithDefaultsModuleResult (upval)
					return `{if WithDefaultsModuleResult.prefix then WithDefaultsModuleResult.prefix .. " " else ""}<font transparency="1">{p2}</font>{if WithDefaultsModuleResult.suffix then " " .. WithDefaultsModuleResult.suffix else ""}`
				end),
				padding = UseMemoResult4,
				testId = `{WithDefaultsModuleResult.testId}--units`
			}) else nil
			
			if FlagsModule.FoundationNumberInputBeta then
				Element2 = ReactModule.createElement(ViewModule, { tag = "size-full-0 auto-y" }, { Input = Element2, Units = Element3 })
			end
			return if Element1 or FlagsModule.FoundationNumberInputBeta then ReactModule.createElement(ViewModule, {
				Size = if FlagsModule.FoundationNumberInputBeta then UDim2.new(Width.Scale - UseMemoResult6.Scale, Width.Offset - UseMemoResult6.Offset, 0, 0) else UDim2.fromOffset(Width.Offset - UseMemoResult6.Offset, 0),
				tag = if FlagsModule.FoundationNumberInputBeta then "row align-y-center auto-y" else "row align-y-center gap-xsmall auto-y",
				layout = if FlagsModule.FoundationNumberInputBeta then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, SmallDelta),
					SortOrder = Enum.SortOrder.LayoutOrder
				} else nil
			}, {
				InputField = Element2,
				Controls = if Element1 then Element else nil
			}) else Element2
		end
	}))
end))