local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local reactUtilsModule = require(parent.ReactUtils)
local components = foundation.Components
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.InputLabelSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local numberInputControlsVariantModule = require(foundation.Enums.NumberInputControlsVariant)
local scrubBehaviorModule = require(foundation.Enums.ScrubBehavior)
local onChangeCallbackReasonModule = require(foundation.Enums.OnChangeCallbackReason)
local flagsModule = require(foundation.Utility.Flags)
local iconModule = require(components.Icon)
local inputFieldModule = require(components.InputField)
local internalTextInputModule = require(components.InternalTextInput)
local textModule = require(components.Text)
local _ = require(components.Types)
local viewModule = require(components.View)
local getBindableValueModule = require(foundation.Utility.getBindableValue)
local getInputTextSizeModule = require(foundation.Utility.getInputTextSize)
local getMultiLineTextHeightModule = require(foundation.Utility.getMultiLineTextHeight)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)
local joinBindablesModule = require(foundation.Utility.joinBindables)
local mapBindableModule = require(foundation.Utility.mapBindable)
local useIconSizeModule = require(foundation.Utility.useIconSize)
local useTextInputVariantsModule = require(components.TextInput.useTextInputVariants)
local useTextSizeModule = require(foundation.Utility.useTextSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local numberInputControlsModule = require(script.Parent.NumberInputControls)
local useNumberInputVariantsModule = require(script.Parent.useNumberInputVariants)
local constantsModule = require(foundation.Constants)
local calculateNumberInputValueFromPositionsModule = require(script.Parent.calculateNumberInputValueFromPositions)
local _ = require(foundation.Enums.InputFocusBehavior)

local function _(value, p1)
	local var1 = 10 ^ (p1 or 0)
	
	return math.floor(value * var1 + 0.5) / var1
end

local t = {
	[scrubBehaviorModule.On] = 1,
	[scrubBehaviorModule.Off] = 0
}
local t_1 = {
	minimum = -1e999,
	maximum = 1e999,
	step = 1,
	precision = 3,
	value = 0,
	isScrubbable = false,
	hasControls = false,
	testId = "--foundation-number-input",
	variant = inputVariantModule.Standard,
	controlsVariant = if flagsModule.FoundationNumberInputBeta then nil else numberInputControlsVariantModule.Stacked,
	size = inputSizeModule.Large,
	formatAsString = function(p1)
		return tostring(p1)
	end,
	scrubBehavior = scrubBehaviorModule.Off
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useTextInputVariantsModule (ref), useNumberInputVariantsModule (ref), flagsModule (ref), reactModule (ref), reactUtilsModule (ref), scrubBehaviorModule (ref), t (ref), mapBindableModule (ref), getBindableValueModule (ref), inputSizeModule (ref), useTextSizeModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), getMultiLineTextHeightModule (ref), constantsModule (ref), onChangeCallbackReasonModule (ref), numberInputControlsVariantModule (ref), numberInputControlsModule (ref), calculateNumberInputValueFromPositionsModule (ref), reactIsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), joinBindablesModule (ref), viewModule (ref), iconModule (ref), textModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = useTokensModule()
	local var3 = useTextInputVariantsModule(var2, var1.size, var1.variant)
	local var4 = useNumberInputVariantsModule(var2, var1.size, if flagsModule.FoundationNumberInputBeta then nil else var1.controlsVariant)
	local var5 = if flagsModule.FoundationNumberInputBeta then var4.controls else nil
	local var6 = reactModule.useRef(nil)
	local var7 = reactUtilsModule.useComposedRef(var6, var1.textBoxRef)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		return if var6.current then var6.current.getIsFocused() else false
	end, {})
	local var1, var2 = reactModule.useState(false)
	local hasError = var1.hasError or var1
	local controlsVariant = var1.controlsVariant
	local var3 = if var1.isScrubbable then scrubBehaviorModule.On else var1.scrubBehavior
	local var4 = var3 and var3 ~= scrubBehaviorModule.Off
	local var5 = if flagsModule.FoundationNumberInputBeta then t[var3] else nil
	local var6 = reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref)
		return math.clamp(p1, var1.minimum, var1.maximum)
	end, { var1.minimum, var1.maximum })
	local var7 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var1 (ref)
		return p2(p1 / var1.step) * var1.step
	end, { var1.step })
	local var8 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref), var7 (ref), var6 (ref)
		return mapBindableModule(var1.value, function(p1)
			-- upvalues: var1 (copy), var7 (copy), var6 (copy)
			local var1 = 10 ^ (var1.precision or 0)
			local var2 = math.floor(p1 * var1 + 0.5) / var1
			local var3 = 10 ^ (var1.precision or 0)
			local var4 = math.floor((p1 + var1.step) * var3 + 0.5) / var3
			local var5 = 10 ^ (var1.precision or 0)
			local var6 = math.floor(var7(p1, math.ceil) * var5 + 0.5) / var5
			
			if var2 ~= var6 then
				var4 = var6
			end
			return var6(var4)
		end)
	end, {
		var1.value,
		var1.step,
		var1.precision,
		var6,
		var7
	})
	local var9 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref), var7 (ref), var6 (ref)
		return mapBindableModule(var1.value, function(p1)
			-- upvalues: var1 (copy), var7 (copy), var6 (copy)
			local var1 = 10 ^ (var1.precision or 0)
			local var2 = math.floor(p1 * var1 + 0.5) / var1
			local var3 = 10 ^ (var1.precision or 0)
			local var4 = math.floor((p1 - var1.step) * var3 + 0.5) / var3
			local var5 = 10 ^ (var1.precision or 0)
			local var6 = math.floor(var7(p1, math.floor) * var5 + 0.5) / var5
			
			if var2 ~= var6 then
				var4 = var6
			end
			return var6(var4)
		end)
	end, {
		var1.value,
		var1.step,
		var1.precision,
		var6,
		var7
	})
	local var10 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref)
		return mapBindableModule(var1.value, function(p1)
			-- upvalues: var1 (copy)
			return var1.isDisabled or p1 == var1.maximum
		end)
	end, { var1.isDisabled, var1.value, var1.maximum })
	local var11 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref)
		return mapBindableModule(var1.value, function(p1)
			-- upvalues: var1 (copy)
			return var1.isDisabled or p1 == var1.minimum
		end)
	end, { var1.isDisabled, var1.value, var1.minimum })
	local var12 = reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref)
		local var1 = 10 ^ (var1.precision or 0)
		
		return math.floor(math.clamp(p1, var1.minimum, var1.maximum) * var1 + 0.5) / var1
	end, { var1.minimum, var1.maximum, var1.precision })
	local var13, var14 = reactModule.useBinding(var1.formatAsString(var12(getBindableValueModule(var1.value))))
	local var15 = if flagsModule.FoundationNumberInputBeta then if var1.size == inputSizeModule.XSmall then var2.Gap.Small - var2.Gap.XSmall / 2 else var2.Gap.Small else nil
	local var16 = nil
	local _ = nil
	local var17 = nil
	local var18 = nil
	local var19 = nil
	
	if flagsModule.FoundationNumberInputBeta then
		local var20
		local fontStyle = var3.textBox.fontStyle
		local fontSize = fontStyle.FontSize
		
		if var1.prefix then
			var20 = if var1.prefix == "" then var1.suffix and var1.suffix ~= "" else true
		end
		var16 = var20
		var17 = useTextSizeModule(if var1.prefix then var1.prefix .. " " else nil, reactModule.useMemo(function()
			-- upvalues: fontStyle (ref), fontSize (ref)
			return {
				Font = fontStyle.Font,
				FontSize = math.floor(fontSize),
				LineHeight = fontStyle.LineHeight
			}
		end, { fontStyle, fontSize }))
		local var21 = if var1.leadingIcon then useIconSizeModule(var3.icon.size, isBuilderIconModule(var1.leadingIcon)).X.Offset else 0
		local var22 = if flagsModule.FoundationNumberInputBeta and var1.trailingIcon then useIconSizeModule(var3.icon.size, isBuilderIconModule(var1.trailingIcon)).X.Offset else 0
		local var23 = if var1.size == inputSizeModule.XSmall then var2.Gap.Small elseif var1.size == inputSizeModule.Small then var2.Gap.Medium else var2.Gap.Large
		local var24 = if var1.leadingIcon then var23 else 0
		local var25 = if flagsModule.FoundationNumberInputBeta and var1.trailingIcon then var23 else 0
		var19 = reactModule.useMemo(function()
			-- upvalues: var3 (ref), var21 (ref), var24 (ref), var22 (ref), var25 (ref)
			return {
				left = UDim.new(0, var3.container.horizontalPadding.Offset + var21 + var24),
				right = UDim.new(0, var3.container.horizontalPadding.Offset + var22 + var25)
			}
		end, {
			var3.container.horizontalPadding,
			var24,
			var25,
			var21,
			var22
		})
		var18 = reactModule.useMemo(function()
			-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), fontStyle (ref), var3 (ref)
			local var1 = math.round((var3.container.minHeight - 2 - getMultiLineTextHeightModule(fontSize, 1, fontStyle.LineHeight)) * 2) / 2
			
			return {
				top = UDim.new(0, math.floor(var1 / 2) + 1),
				bottom = UDim.new(0, math.ceil(var1 / 2) + 1),
				left = UDim.new(),
				right = UDim.new()
			}
		end, { var3.container.minHeight, fontStyle, fontSize })
	end
	local var26
	local var27 = if var1.width then var1.width elseif flagsModule.FoundationNumberInputBeta then UDim.new(0, constantsModule.DEFAULT_NUMBER_INPUT_WIDTH) else UDim.new(0, var4.container.width)
	local var28 = reactModule.useCallback(function()
		-- upvalues: var14 (ref), getBindableValueModule (copy), var1 (ref)
		var14(tostring(getBindableValueModule(var1.value)))
		
		if var1.onFocusGained then
			var1.onFocusGained()
		end
	end, { var1.onFocusGained, var1.value })
	local var29 = reactModule.useCallback(function(p1, p2)
		-- upvalues: var12 (ref), var14 (ref), var10 (ref), var1 (ref)
		local var1 = var12(p1)
		var14(if var10() then tostring(var1) else var1.formatAsString(var1))
		var1.onChanged(var1, p2)
	end, { var1.onChanged, var1.formatAsString, var12, var10 })
	local var2 = reactModule.useCallback(function(p1)
		-- upvalues: var2 (ref), var29 (ref), getBindableValueModule (copy), var1 (ref), onChangeCallbackReasonModule (copy)
		var2(false)
		var29(getBindableValueModule(var1.value), onChangeCallbackReasonModule.FocusLost)
		
		if var1.onFocusLost then
			var1.onFocusLost(p1)
		end
	end, { var29, var1.onFocusLost, var1.value, var12 })
	local var3 = reactModule.useCallback(function(p1)
		-- upvalues: var14 (ref), var10 (ref), flagsModule (copy), var1 (ref), var2 (ref), onChangeCallbackReasonModule (copy)
		var14(p1)
		
		if not var10() then return end
		if flagsModule.FoundationNumberInputOnTextChanged then
			local var1 = tonumber(p1)
			
			if var1.onTextChanged == nil then
				if var1 == nil then
					var2(true)
					
					return
				elseif var1 == nil then
					return
				else
					var2(false)
					var1.onChanged(var1, onChangeCallbackReasonModule.Keyboard)
					
					return
				end
			else
				var1.onTextChanged(p1)
			end
		else
			local var2 = tonumber(p1)
			
			if var2 == nil then
				var2(true)
				
				return
			end
			var2(false)
			var1.onChanged(var2, onChangeCallbackReasonModule.Keyboard)
		end
	end, {
		var10,
		var1.onChanged,
		if flagsModule.FoundationNumberInputOnTextChanged then var1.onTextChanged else nil
	})
	local var4 = reactModule.useCallback(function()
		-- upvalues: getBindableValueModule (copy), var10 (ref), var29 (ref), var8 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var10) then
			return
		end
		var29(getBindableValueModule(var8), onChangeCallbackReasonModule.Activate)
	end, { var10, var8, var29 })
	local var5 = reactModule.useCallback(function()
		-- upvalues: getBindableValueModule (copy), var11 (ref), var29 (ref), var9 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var11) then
			return
		end
		var29(getBindableValueModule(var9), onChangeCallbackReasonModule.Activate)
	end, { var11, var9, var29 })
	
	if flagsModule.FoundationNumberInputBeta then
		var26 = var1.hasControls
		
		if var26 then
			var26 = false
			
			if controlsVariant ~= numberInputControlsVariantModule.None then
				var26 = controlsVariant ~= numberInputControlsVariantModule.Stacked
				var26 = nil
			end
		end
	else
		var26 = nil
	end
	local var6 = if flagsModule.FoundationNumberInputBeta and var26 or not flagsModule.FoundationNumberInputBeta then reactModule.createElement(numberInputControlsModule, {
		variant = var1.variant,
		controlsVariant = if flagsModule.FoundationNumberInputBeta then nil else controlsVariant,
		size = var1.size,
		increment = { isDisabled = var10, onClick = var4 },
		decrement = { isDisabled = var11, onClick = var5 },
		testId = var1.testId
	}) else nil
	local var7 = reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var26 (ref), var5 (ref), var15 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), var4 (ref), var2 (ref)
		if flagsModule.FoundationNumberInputBeta then
			if var26 then
				return UDim.new(0, var5.width + var15)
			end
		else
			return if controlsVariant == numberInputControlsVariantModule.Split then UDim.new(0, 2 * var4.splitButton.size + 2 * var2.Gap.XSmall) else UDim.new()
		end
	end, {
		var2, controlsVariant,
		if flagsModule.FoundationNumberInputBeta then nil else var4.splitButton.size,
		var2.Gap.XSmall, if flagsModule.FoundationNumberInputBeta then var5 else nil,
		if flagsModule.FoundationNumberInputBeta then var15 else nil,
		if flagsModule.FoundationNumberInputBeta then var26 else nil
	})
	local var1 = reactModule.useCallback(function(_, p1)
		-- upvalues: var1 (ref), var9 (ref), var8 (ref), getBindableValueModule (copy)
		local value = var1.value
		var9.current = false
		
		if value then
			var8.current = { position = p1.X, value = getBindableValueModule(value) }
		end
	end, { var1.value })
	local var2 = reactModule.useCallback(function(_, p1)
		-- upvalues: var8 (ref), calculateNumberInputValueFromPositionsModule (copy), var1 (ref), flagsModule (copy), var5 (ref), var29 (ref), onChangeCallbackReasonModule (copy), var9 (ref)
		if var8.current then
			var29(calculateNumberInputValueFromPositionsModule(var8.current.value, var8.current.position, p1.X, var1.step, if flagsModule.FoundationNumberInputBeta then var5 else nil), onChangeCallbackReasonModule.Drag)
			
			if flagsModule.FoundationNumberInputScrubCallbackProps and var1.onScrubStarted and not var9.current then
				var1.onScrubStarted()
				var9.current = true
			end
		end
	end, {
		var29,
		var1.step,
		var12,
		if flagsModule.FoundationNumberInputScrubCallbackProps then var1.onScrubStarted else nil,
		if flagsModule.FoundationNumberInputBeta then var5 else nil
	})
	local var1 = reactModule.useCallback(function()
		-- upvalues: var8 (ref), flagsModule (copy), var1 (ref), var9 (ref)
		if var8.current then
			var8.current = nil
			
			if flagsModule.FoundationNumberInputScrubCallbackProps and var1.onScrubEnded and var9.current then
				var1.onScrubEnded()
			end
		end
		var9.current = false
	end, {
		if flagsModule.FoundationNumberInputScrubCallbackProps then var1.onScrubEnded else nil
	})
	local transparency = var2.Color.Shift.Shift_300.Transparency
	local transparency_1 = var2.Color.Shift.Shift_100.Transparency
	local var2 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref), var6 (ref), transparency_1 (ref), transparency (ref)
		return mapBindableModule(var1.value, function(p1)
			-- upvalues: var1 (copy), var6 (copy), transparency_1 (copy), transparency (copy)
			local var1 = if p1 and var1.maximum and var1.minimum then if var1.maximum == var1.minimum then 1 else (var6(p1) - var1.minimum) / (var1.maximum - var1.minimum) else 0
			
			if var1 == 0 then
				return NumberSequence.new(transparency_1)
			elseif var1 == 1 then
				return NumberSequence.new(transparency)
			elseif var1 <= 0 and var1 >= 1 then
				return NumberSequence.new(transparency_1)
			end
			local list = {
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(var1, transparency),
				NumberSequenceKeypoint.new(math.min(var1 + 0.001, 1), transparency_1)
			}
			
			if var1 < 0.999 then
				table.insert(list, NumberSequenceKeypoint.new(1, transparency_1))
			end
			return NumberSequence.new(list)
		end)
	end, {
		transparency, transparency_1, var1.value, var6, var1.maximum, var1.minimum
	})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), reactIsModule (copy), var1 (ref), var14 (ref), var12 (ref)
		if not var10() and not reactIsModule.isBinding(var1.value) then
			var14(var1.formatAsString(var12(var1.value)))
		end
	end, { var1.value, var1.formatAsString, var12, var10 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var1, {
		width = var27,
		ref = p2,
		hasError = hasError,
		label = var1.label,
		size = getInputTextSizeModule(var1.size),
		isRequired = var1.isRequired,
		isDisabled = var1.isDisabled,
		hint = var1.hint,
		textBoxRef = var7,
		input = function(p1)
			-- upvalues: flagsModule (copy), var26 (ref), var6 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), reactModule (copy), internalTextInputModule (copy), var1 (ref), joinBindablesModule (copy), var13 (ref), var10 (ref), var12 (ref), hasError (ref), var3 (ref), var17 (write), p1 (ref), var3 (ref), var2 (ref), var28 (ref), var4 (ref), var1 (ref), var2 (ref), var1 (ref), var2 (ref), var2 (ref), viewModule (copy), iconModule (copy), var16 (write), textModule (copy), var19 (write), var18 (write), var27 (ref), var7 (ref), var15 (ref)
			local var1 = if flagsModule.FoundationNumberInputBeta then var26 and var6 else controlsVariant == numberInputControlsVariantModule.Split
			local createElement = reactModule.createElement
			createElement = createElement(internalTextInputModule, {
				inputRef = var1.inputRef,
				text = joinBindablesModule({ text = var13, value = var1.value }, function(p1)
					-- upvalues: var10 (copy), var1 (copy), var12 (copy)
					return if var10() then p1.text else var1.formatAsString(var12(p1.value))
				end),
				hasError = hasError,
				variant = var1.variant,
				size = var1.size,
				Selectable = var1.Selectable,
				NextSelectionUp = var1.NextSelectionUp,
				NextSelectionDown = var1.NextSelectionDown,
				NextSelectionLeft = var1.NextSelectionLeft,
				NextSelectionRight = var1.NextSelectionRight,
				horizontalPadding = {
					left = var3.container.horizontalPadding,
					right = if flagsModule.FoundationNumberInputBeta then var3.container.horizontalPadding else nil,
					innerLeft = if not flagsModule.FoundationNumberInputBeta then if var17 and var17.X > 0 then UDim.new(0, var17.X) else nil else nil
				},
				focusBehavior = p1.focusBehavior,
				onChanged = var3,
				onFocusLost = var2,
				onFocus = var28,
				onDragStarted = if var4 then var1 else nil,
				onDrag = if var4 then var2 else nil,
				onDragEnded = if var4 then var1 else nil,
				onReturnPressed = var1.onReturnPressed,
				ref = p1,
				backgroundGradient = if var4 and var2 then reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = ColorSequence.new(var2.Color.Shift.Shift_300.Color3),
					Transparency = var2
				}) else nil,
				trailingElement = if flagsModule.FoundationNumberInputBeta then if var1.trailingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var1.trailingIcon,
					style = var3.icon.style,
					size = var3.icon.size
				})) else nil elseif controlsVariant == numberInputControlsVariantModule.Stacked then var6 else nil,
				leadingElement = if var1.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var1.leadingIcon,
					style = var3.icon.style,
					size = var3.icon.size
				})) else nil,
				isDisabled = var1.isDisabled,
				LayoutOrder = if var1 and flagsModule.FoundationNumberInputBeta then 0 else nil,
				testId = `{var1.testId}--field`
			})
			local var1 = if flagsModule.FoundationNumberInputBeta and var16 then reactModule.createElement(textModule, {
				tag = "text-align-x-left text-align-y-center content-muted",
				RichText = true,
				ClipsDescendants = true,
				fontStyle = var3.textBox.fontStyle,
				Size = UDim2.new(1, -(var19.left.Offset + var19.right.Offset), 1, 0),
				Position = UDim2.fromOffset(var19.left.Offset, 0),
				Text = var13:map(function(p1)
					-- upvalues: var1 (copy)
					return `{if var1.prefix then var1.prefix .. " " else ""}<font transparency="1">{p1}</font>{if var1.suffix then " " .. var34.suffix else ""}`
				end),
				padding = var18,
				testId = `{var1.testId}--units`
			}) else nil
			
			if flagsModule.FoundationNumberInputBeta then
				createElement = reactModule.createElement(viewModule, { tag = "size-full-0 auto-y" }, { Input = createElement, Units = var1 })
			end
			return if var1 or flagsModule.FoundationNumberInputBeta then reactModule.createElement(viewModule, {
				Size = if flagsModule.FoundationNumberInputBeta then UDim2.new(var27.Scale - var7.Scale, var27.Offset - var7.Offset, 0, 0) else UDim2.fromOffset(var27.Offset - var7.Offset, 0),
				tag = if flagsModule.FoundationNumberInputBeta then "row align-y-center auto-y" else "row align-y-center gap-xsmall auto-y",
				layout = if flagsModule.FoundationNumberInputBeta then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var15),
					SortOrder = Enum.SortOrder.LayoutOrder
				} else nil
			}, {
				InputField = createElement,
				Controls = if var1 then var6 else nil
			}) else createElement
		end
	}))
end))