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
	local var11, var12 = reactModule.useState(false)
	local hasError = var1.hasError or var11
	local controlsVariant = var1.controlsVariant
	local var13 = if var1.isScrubbable then scrubBehaviorModule.On else var1.scrubBehavior
	local var14 = var13 and var13 ~= scrubBehaviorModule.Off
	local var15 = if flagsModule.FoundationNumberInputBeta then t[var13] else nil
	local var16 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref)
		return math.clamp(p3, var1.minimum, var1.maximum)
	end, { var1.minimum, var1.maximum })
	local var17 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var1 (ref)
		return p4(p3 / var1.step) * var1.step
	end, { var1.step })
	local var18 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref), var17 (ref), var16 (ref)
		return mapBindableModule(var1.value, function(p3)
			-- upvalues: var1 (copy), var17 (copy), var16 (copy)
			local var19 = 10 ^ (var1.precision or 0)
			local var20 = math.floor(p3 * var19 + 0.5) / var19
			local var21 = 10 ^ (var1.precision or 0)
			local var22 = math.floor((p3 + var1.step) * var21 + 0.5) / var21
			local var23 = 10 ^ (var1.precision or 0)
			local var24 = math.floor(var17(p3, math.ceil) * var23 + 0.5) / var23
			
			if var20 ~= var24 then
				var22 = var24
			end
			return var16(var22)
		end)
	end, {
		var1.value,
		var1.step,
		var1.precision,
		var16,
		var17
	})
	local var19 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref), var17 (ref), var16 (ref)
		return mapBindableModule(var1.value, function(p3)
			-- upvalues: var1 (copy), var17 (copy), var16 (copy)
			local var20 = 10 ^ (var1.precision or 0)
			local var21 = math.floor(p3 * var20 + 0.5) / var20
			local var22 = 10 ^ (var1.precision or 0)
			local var23 = math.floor((p3 - var1.step) * var22 + 0.5) / var22
			local var24 = 10 ^ (var1.precision or 0)
			local var25 = math.floor(var17(p3, math.floor) * var24 + 0.5) / var24
			
			if var21 ~= var25 then
				var23 = var25
			end
			return var16(var23)
		end)
	end, {
		var1.value,
		var1.step,
		var1.precision,
		var16,
		var17
	})
	local var20 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref)
		return mapBindableModule(var1.value, function(p3)
			-- upvalues: var1 (copy)
			return var1.isDisabled or p3 == var1.maximum
		end)
	end, { var1.isDisabled, var1.value, var1.maximum })
	local var21 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref)
		return mapBindableModule(var1.value, function(p3)
			-- upvalues: var1 (copy)
			return var1.isDisabled or p3 == var1.minimum
		end)
	end, { var1.isDisabled, var1.value, var1.minimum })
	local var22 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref)
		local var23 = 10 ^ (var1.precision or 0)
		
		return math.floor(math.clamp(p3, var1.minimum, var1.maximum) * var23 + 0.5) / var23
	end, { var1.minimum, var1.maximum, var1.precision })
	local var23, var24 = reactModule.useBinding(var1.formatAsString(var22(getBindableValueModule(var1.value))))
	local var25 = if flagsModule.FoundationNumberInputBeta then if var1.size == inputSizeModule.XSmall then var2.Gap.Small - var2.Gap.XSmall / 2 else var2.Gap.Small else nil
	local var26 = nil
	local _ = nil
	local var27 = nil
	local var28 = nil
	local var29 = nil
	
	if flagsModule.FoundationNumberInputBeta then
		local var30
		local fontStyle = var3.textBox.fontStyle
		local fontSize = fontStyle.FontSize
		
		if var1.prefix then
			var30 = if var1.prefix == "" then var1.suffix and var1.suffix ~= "" else true
		end
		var26 = var30
		var27 = useTextSizeModule(if var1.prefix then var1.prefix .. " " else nil, reactModule.useMemo(function()
			-- upvalues: fontStyle (ref), fontSize (ref)
			return {
				Font = fontStyle.Font,
				FontSize = math.floor(fontSize),
				LineHeight = fontStyle.LineHeight
			}
		end, { fontStyle, fontSize }))
		local var31 = if var1.leadingIcon then useIconSizeModule(var3.icon.size, isBuilderIconModule(var1.leadingIcon)).X.Offset else 0
		local var32 = if flagsModule.FoundationNumberInputBeta and var1.trailingIcon then useIconSizeModule(var3.icon.size, isBuilderIconModule(var1.trailingIcon)).X.Offset else 0
		local var33 = if var1.size == inputSizeModule.XSmall then var2.Gap.Small elseif var1.size == inputSizeModule.Small then var2.Gap.Medium else var2.Gap.Large
		local var34 = if var1.leadingIcon then var33 else 0
		local var35 = if flagsModule.FoundationNumberInputBeta and var1.trailingIcon then var33 else 0
		var29 = reactModule.useMemo(function()
			-- upvalues: var3 (ref), var31 (ref), var34 (ref), var32 (ref), var35 (ref)
			return {
				left = UDim.new(0, var3.container.horizontalPadding.Offset + var31 + var34),
				right = UDim.new(0, var3.container.horizontalPadding.Offset + var32 + var35)
			}
		end, {
			var3.container.horizontalPadding,
			var34,
			var35,
			var31,
			var32
		})
		var28 = reactModule.useMemo(function()
			-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), fontStyle (ref), var3 (ref)
			local var36 = math.round((var3.container.minHeight - 2 - getMultiLineTextHeightModule(fontSize, 1, fontStyle.LineHeight)) * 2) / 2
			
			return {
				top = UDim.new(0, math.floor(var36 / 2) + 1),
				bottom = UDim.new(0, math.ceil(var36 / 2) + 1),
				left = UDim.new(),
				right = UDim.new()
			}
		end, { var3.container.minHeight, fontStyle, fontSize })
	end
	local var36
	local var37 = if var1.width then var1.width elseif flagsModule.FoundationNumberInputBeta then UDim.new(0, constantsModule.DEFAULT_NUMBER_INPUT_WIDTH) else UDim.new(0, var4.container.width)
	local var38 = reactModule.useCallback(function()
		-- upvalues: var24 (ref), getBindableValueModule (copy), var1 (ref)
		var24(tostring(getBindableValueModule(var1.value)))
		
		if var1.onFocusGained then
			var1.onFocusGained()
		end
	end, { var1.onFocusGained, var1.value })
	local var39 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var22 (ref), var24 (ref), var10 (ref), var1 (ref)
		local var40 = var22(p3)
		var24(if var10() then tostring(var40) else var1.formatAsString(var40))
		var1.onChanged(var40, p4)
	end, { var1.onChanged, var1.formatAsString, var22, var10 })
	local var40 = reactModule.useCallback(function(p3)
		-- upvalues: var12 (ref), var39 (ref), getBindableValueModule (copy), var1 (ref), onChangeCallbackReasonModule (copy)
		var12(false)
		var39(getBindableValueModule(var1.value), onChangeCallbackReasonModule.FocusLost)
		
		if var1.onFocusLost then
			var1.onFocusLost(p3)
		end
	end, { var39, var1.onFocusLost, var1.value, var22 })
	local var41 = reactModule.useCallback(function(p3)
		-- upvalues: var24 (ref), var10 (ref), flagsModule (copy), var1 (ref), var12 (ref), onChangeCallbackReasonModule (copy)
		var24(p3)
		
		if not var10() then return end
		if flagsModule.FoundationNumberInputOnTextChanged then
			local var42 = tonumber(p3)
			
			if var1.onTextChanged == nil then
				if var42 == nil then
					var12(true)
					
					return
				elseif var42 == nil then
					return
				else
					var12(false)
					var1.onChanged(var42, onChangeCallbackReasonModule.Keyboard)
					
					return
				end
			else
				var1.onTextChanged(p3)
			end
		else
			local var43 = tonumber(p3)
			
			if var43 == nil then
				var12(true)
				
				return
			end
			var12(false)
			var1.onChanged(var43, onChangeCallbackReasonModule.Keyboard)
		end
	end, {
		var10,
		var1.onChanged,
		if flagsModule.FoundationNumberInputOnTextChanged then var1.onTextChanged else nil
	})
	local var42 = reactModule.useCallback(function()
		-- upvalues: getBindableValueModule (copy), var20 (ref), var39 (ref), var18 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var20) then
			return
		end
		var39(getBindableValueModule(var18), onChangeCallbackReasonModule.Activate)
	end, { var20, var18, var39 })
	local var43 = reactModule.useCallback(function()
		-- upvalues: getBindableValueModule (copy), var21 (ref), var39 (ref), var19 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var21) then
			return
		end
		var39(getBindableValueModule(var19), onChangeCallbackReasonModule.Activate)
	end, { var21, var19, var39 })
	
	if flagsModule.FoundationNumberInputBeta then
		var36 = var1.hasControls
		
		if var36 then
			var36 = false
			
			if controlsVariant ~= numberInputControlsVariantModule.None then
				var36 = controlsVariant ~= numberInputControlsVariantModule.Stacked
				var36 = nil
			end
		end
	else
		var36 = nil
	end
	local var44 = if flagsModule.FoundationNumberInputBeta and var36 or not flagsModule.FoundationNumberInputBeta then reactModule.createElement(numberInputControlsModule, {
		variant = var1.variant,
		controlsVariant = if flagsModule.FoundationNumberInputBeta then nil else controlsVariant,
		size = var1.size,
		increment = { isDisabled = var20, onClick = var42 },
		decrement = { isDisabled = var21, onClick = var43 },
		testId = var1.testId
	}) else nil
	local var45 = reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var36 (ref), var5 (ref), var25 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), var4 (ref), var2 (ref)
		if flagsModule.FoundationNumberInputBeta then
			if var36 then
				return UDim.new(0, var5.width + var25)
			end
		else
			return if controlsVariant == numberInputControlsVariantModule.Split then UDim.new(0, 2 * var4.splitButton.size + 2 * var2.Gap.XSmall) else UDim.new()
		end
	end, {
		var2, controlsVariant,
		if flagsModule.FoundationNumberInputBeta then nil else var4.splitButton.size,
		var2.Gap.XSmall, if flagsModule.FoundationNumberInputBeta then var5 else nil,
		if flagsModule.FoundationNumberInputBeta then var25 else nil,
		if flagsModule.FoundationNumberInputBeta then var36 else nil
	})
	local var46 = reactModule.useCallback(function(_, p3)
		-- upvalues: var1 (ref), var9 (ref), var8 (ref), getBindableValueModule (copy)
		local value = var1.value
		var9.current = false
		
		if value then
			var8.current = { position = p3.X, value = getBindableValueModule(value) }
		end
	end, { var1.value })
	local var47 = reactModule.useCallback(function(_, p3)
		-- upvalues: var8 (ref), flagsModule (copy), var1 (ref), var9 (ref), calculateNumberInputValueFromPositionsModule (copy), var15 (ref), var39 (ref), onChangeCallbackReasonModule (copy)
		if var8.current then
			if flagsModule.FoundationNumberInputScrubCallbackProps and var1.onScrubStarted and not var9.current then
				var1.onScrubStarted()
				var9.current = true
			end
			var39(calculateNumberInputValueFromPositionsModule(var8.current.value, var8.current.position, p3.X, var1.step, if flagsModule.FoundationNumberInputBeta then var15 else nil), onChangeCallbackReasonModule.Drag)
		end
	end, {
		var39,
		var1.step,
		var22,
		if flagsModule.FoundationNumberInputScrubCallbackProps then var1.onScrubStarted else nil,
		if flagsModule.FoundationNumberInputBeta then var15 else nil
	})
	local var48 = reactModule.useCallback(function()
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
	local var49 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var1 (ref), var16 (ref), transparency_1 (ref), transparency (ref)
		return mapBindableModule(var1.value, function(p3)
			-- upvalues: var1 (copy), var16 (copy), transparency_1 (copy), transparency (copy)
			local var50 = if p3 and var1.maximum and var1.minimum then if var1.maximum == var1.minimum then 1 else (var16(p3) - var1.minimum) / (var1.maximum - var1.minimum) else 0
			
			if var50 == 0 then
				return NumberSequence.new(transparency_1)
			elseif var50 == 1 then
				return NumberSequence.new(transparency)
			elseif var50 <= 0 and var50 >= 1 then
				return NumberSequence.new(transparency_1)
			end
			local list = {
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(var50, transparency),
				NumberSequenceKeypoint.new(math.min(var50 + 0.001, 1), transparency_1)
			}
			
			if var50 < 0.999 then
				table.insert(list, NumberSequenceKeypoint.new(1, transparency_1))
			end
			return NumberSequence.new(list)
		end)
	end, {
		transparency, transparency_1, var1.value, var16, var1.maximum, var1.minimum
	})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), reactIsModule (copy), var1 (ref), var24 (ref), var22 (ref)
		if not var10() and not reactIsModule.isBinding(var1.value) then
			var24(var1.formatAsString(var22(var1.value)))
		end
	end, { var1.value, var1.formatAsString, var22, var10 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var1, {
		width = var37,
		ref = p2,
		hasError = hasError,
		label = var1.label,
		size = getInputTextSizeModule(var1.size),
		isRequired = var1.isRequired,
		isDisabled = var1.isDisabled,
		hint = var1.hint,
		textBoxRef = var7,
		input = function(p3)
			-- upvalues: flagsModule (copy), var36 (ref), var44 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), reactModule (copy), internalTextInputModule (copy), var1 (ref), joinBindablesModule (copy), var23 (ref), var10 (ref), var22 (ref), hasError (ref), var3 (ref), var27 (write), p1 (ref), var41 (ref), var40 (ref), var38 (ref), var14 (ref), var46 (ref), var47 (ref), var48 (ref), var49 (ref), var2 (ref), viewModule (copy), iconModule (copy), var26 (write), textModule (copy), var29 (write), var28 (write), var37 (ref), var45 (ref), var25 (ref)
			local var50 = if flagsModule.FoundationNumberInputBeta then var36 and var44 else controlsVariant == numberInputControlsVariantModule.Split
			local createElement = reactModule.createElement
			createElement = createElement(internalTextInputModule, {
				inputRef = var1.inputRef,
				text = joinBindablesModule({ text = var23, value = var1.value }, function(p4)
					-- upvalues: var10 (copy), var1 (copy), var22 (copy)
					return if var10() then p4.text else var1.formatAsString(var22(p4.value))
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
					innerLeft = if not flagsModule.FoundationNumberInputBeta then if var27 and var27.X > 0 then UDim.new(0, var27.X) else nil else nil
				},
				focusBehavior = p1.focusBehavior,
				onChanged = var41,
				onFocusLost = var40,
				onFocus = var38,
				onDragStarted = if var14 then var46 else nil,
				onDrag = if var14 then var47 else nil,
				onDragEnded = if var14 then var48 else nil,
				onReturnPressed = var1.onReturnPressed,
				ref = p3,
				backgroundGradient = if var14 and var49 then reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = ColorSequence.new(var2.Color.Shift.Shift_300.Color3),
					Transparency = var49
				}) else nil,
				trailingElement = if flagsModule.FoundationNumberInputBeta then if var1.trailingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var1.trailingIcon,
					style = var3.icon.style,
					size = var3.icon.size
				})) else nil elseif controlsVariant == numberInputControlsVariantModule.Stacked then var44 else nil,
				leadingElement = if var1.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var1.leadingIcon,
					style = var3.icon.style,
					size = var3.icon.size
				})) else nil,
				isDisabled = var1.isDisabled,
				LayoutOrder = if var50 and flagsModule.FoundationNumberInputBeta then 0 else nil,
				testId = `{var1.testId}--field`
			})
			local var51 = if flagsModule.FoundationNumberInputBeta and var26 then reactModule.createElement(textModule, {
				tag = "text-align-x-left text-align-y-center content-muted",
				RichText = true,
				ClipsDescendants = true,
				fontStyle = var3.textBox.fontStyle,
				Size = UDim2.new(1, -(var29.left.Offset + var29.right.Offset), 1, 0),
				Position = UDim2.fromOffset(var29.left.Offset, 0),
				Text = var23:map(function(p4)
					-- upvalues: var1 (copy)
					return `{if var1.prefix then var1.prefix .. " " else ""}<font transparency="1">{p4}</font>{if var1.suffix then " " .. var34.suffix else ""}`
				end),
				padding = var28,
				testId = `{var1.testId}--units`
			}) else nil
			
			if flagsModule.FoundationNumberInputBeta then
				createElement = reactModule.createElement(viewModule, { tag = "size-full-0 auto-y" }, { Input = createElement, Units = var51 })
			end
			return if var50 or flagsModule.FoundationNumberInputBeta then reactModule.createElement(viewModule, {
				Size = if flagsModule.FoundationNumberInputBeta then UDim2.new(var37.Scale - var45.Scale, var37.Offset - var45.Offset, 0, 0) else UDim2.fromOffset(var37.Offset - var45.Offset, 0),
				tag = if flagsModule.FoundationNumberInputBeta then "row align-y-center auto-y" else "row align-y-center gap-xsmall auto-y",
				layout = if flagsModule.FoundationNumberInputBeta then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var25),
					SortOrder = Enum.SortOrder.LayoutOrder
				} else nil
			}, {
				InputField = createElement,
				Controls = if var50 then var44 else nil
			}) else createElement
		end
	}))
end))