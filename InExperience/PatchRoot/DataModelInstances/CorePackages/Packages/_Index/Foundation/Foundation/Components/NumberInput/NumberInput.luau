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

local function _(value, p0)
	local var33 = 10 ^ (p0 or 0)
	
	return math.floor(value * var33 + 0.5) / var33
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

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useTextInputVariantsModule (ref), useNumberInputVariantsModule (ref), flagsModule (ref), reactModule (ref), reactUtilsModule (ref), scrubBehaviorModule (ref), t (ref), mapBindableModule (ref), getBindableValueModule (ref), inputSizeModule (ref), useTextSizeModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), getMultiLineTextHeightModule (ref), constantsModule (ref), onChangeCallbackReasonModule (ref), numberInputControlsVariantModule (ref), numberInputControlsModule (ref), calculateNumberInputValueFromPositionsModule (ref), reactIsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), joinBindablesModule (ref), viewModule (ref), iconModule (ref), textModule (ref)
	local var34 = withDefaultsModule(p2, t_1)
	local var35 = useTokensModule()
	local var36 = useTextInputVariantsModule(var35, var34.size, var34.variant)
	local var37 = useNumberInputVariantsModule(var35, var34.size, if flagsModule.FoundationNumberInputBeta then nil else var34.controlsVariant)
	local var38 = if flagsModule.FoundationNumberInputBeta then var37.controls else nil
	local var39 = reactModule.useRef(nil)
	local var40 = reactUtilsModule.useComposedRef(var39, var34.textBoxRef)
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useRef(false)
	local var43 = reactModule.useCallback(function()
		-- upvalues: var39 (ref)
		return if var39.current then var39.current.getIsFocused() else false
	end, {})
	local var44, var45 = reactModule.useState(false)
	local hasError = var34.hasError or var44
	local controlsVariant = var34.controlsVariant
	local var47 = if var34.isScrubbable then scrubBehaviorModule.On else var34.scrubBehavior
	local var48 = var47 and var47 ~= scrubBehaviorModule.Off
	local var49 = if flagsModule.FoundationNumberInputBeta then t[var47] else nil
	local var50 = reactModule.useCallback(function(p4)
		-- upvalues: var34 (ref)
		return math.clamp(p4, var34.minimum, var34.maximum)
	end, { var34.minimum, var34.maximum })
	local var51 = reactModule.useCallback(function(p5, p6)
		-- upvalues: var34 (ref)
		return p6(p5 / var34.step) * var34.step
	end, { var34.step })
	local var52 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var34 (ref), var51 (ref), var50 (ref)
		return mapBindableModule(var34.value, function(p7)
			-- upvalues: var34 (copy), var51 (copy), var50 (copy)
			local var84 = 10 ^ (var34.precision or 0)
			local var85 = math.floor(p7 * var84 + 0.5) / var84
			local var86 = 10 ^ (var34.precision or 0)
			local var87 = math.floor((p7 + var34.step) * var86 + 0.5) / var86
			local var88 = 10 ^ (var34.precision or 0)
			local var89 = math.floor(var51(p7, math.ceil) * var88 + 0.5) / var88
			
			if var85 ~= var89 then
				var87 = var89
			end
			return var50(var87)
		end)
	end, {
		var34.value,
		var34.step,
		var34.precision,
		var50,
		var51
	})
	local var53 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var34 (ref), var51 (ref), var50 (ref)
		return mapBindableModule(var34.value, function(p8)
			-- upvalues: var34 (copy), var51 (copy), var50 (copy)
			local var90 = 10 ^ (var34.precision or 0)
			local var91 = math.floor(p8 * var90 + 0.5) / var90
			local var92 = 10 ^ (var34.precision or 0)
			local var93 = math.floor((p8 - var34.step) * var92 + 0.5) / var92
			local var94 = 10 ^ (var34.precision or 0)
			local var95 = math.floor(var51(p8, math.floor) * var94 + 0.5) / var94
			
			if var91 ~= var95 then
				var93 = var95
			end
			return var50(var93)
		end)
	end, {
		var34.value,
		var34.step,
		var34.precision,
		var50,
		var51
	})
	local var54 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var34 (ref)
		return mapBindableModule(var34.value, function(p9)
			-- upvalues: var34 (copy)
			return var34.isDisabled or p9 == var34.maximum
		end)
	end, { var34.isDisabled, var34.value, var34.maximum })
	local var55 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var34 (ref)
		return mapBindableModule(var34.value, function(p10)
			-- upvalues: var34 (copy)
			return var34.isDisabled or p10 == var34.minimum
		end)
	end, { var34.isDisabled, var34.value, var34.minimum })
	local var56 = reactModule.useCallback(function(p11)
		-- upvalues: var34 (ref)
		local var96 = 10 ^ (var34.precision or 0)
		
		return math.floor(math.clamp(p11, var34.minimum, var34.maximum) * var96 + 0.5) / var96
	end, { var34.minimum, var34.maximum, var34.precision })
	local var57, var58 = reactModule.useBinding(var34.formatAsString(var56(getBindableValueModule(var34.value))))
	local var59 = if flagsModule.FoundationNumberInputBeta then if var34.size == inputSizeModule.XSmall then var35.Gap.Small - var35.Gap.XSmall / 2 else var35.Gap.Small else nil
	local var60 = nil
	local _ = nil
	local var61 = nil
	local var62 = nil
	local var63 = nil
	
	if flagsModule.FoundationNumberInputBeta then
		local var64
		local fontStyle = var36.textBox.fontStyle
		local fontSize = fontStyle.FontSize
		
		if var34.prefix then
			var64 = if var34.prefix == "" then var34.suffix and var34.suffix ~= "" else true
		end
		var60 = var64
		var61 = useTextSizeModule(if var34.prefix then var34.prefix .. " " else nil, reactModule.useMemo(function()
			-- upvalues: fontStyle (ref), fontSize (ref)
			return {
				Font = fontStyle.Font,
				FontSize = math.floor(fontSize),
				LineHeight = fontStyle.LineHeight
			}
		end, { fontStyle, fontSize }))
		local var65 = if var34.leadingIcon then useIconSizeModule(var36.icon.size, isBuilderIconModule(var34.leadingIcon)).X.Offset else 0
		local var66 = if flagsModule.FoundationNumberInputBeta and var34.trailingIcon then useIconSizeModule(var36.icon.size, isBuilderIconModule(var34.trailingIcon)).X.Offset else 0
		local var67 = if var34.size == inputSizeModule.XSmall then var35.Gap.Small elseif var34.size == inputSizeModule.Small then var35.Gap.Medium else var35.Gap.Large
		local var68 = if var34.leadingIcon then var67 else 0
		local var69 = if flagsModule.FoundationNumberInputBeta and var34.trailingIcon then var67 else 0
		var63 = reactModule.useMemo(function()
			-- upvalues: var36 (ref), var65 (ref), var68 (ref), var66 (ref), var69 (ref)
			return {
				left = UDim.new(0, var36.container.horizontalPadding.Offset + var65 + var68),
				right = UDim.new(0, var36.container.horizontalPadding.Offset + var66 + var69)
			}
		end, {
			var36.container.horizontalPadding,
			var68,
			var69,
			var65,
			var66
		})
		var62 = reactModule.useMemo(function()
			-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), fontStyle (ref), var36 (ref)
			local var97 = math.round((var36.container.minHeight - 2 - getMultiLineTextHeightModule(fontSize, 1, fontStyle.LineHeight)) * 2) / 2
			
			return {
				top = UDim.new(0, math.floor(var97 / 2) + 1),
				bottom = UDim.new(0, math.ceil(var97 / 2) + 1),
				left = UDim.new(),
				right = UDim.new()
			}
		end, { var36.container.minHeight, fontStyle, fontSize })
	end
	local var77
	local var70 = if var34.width then var34.width elseif flagsModule.FoundationNumberInputBeta then UDim.new(0, constantsModule.DEFAULT_NUMBER_INPUT_WIDTH) else UDim.new(0, var37.container.width)
	local var71 = reactModule.useCallback(function()
		-- upvalues: var58 (ref), getBindableValueModule (copy), var34 (ref)
		var58(tostring(getBindableValueModule(var34.value)))
		
		if var34.onFocusGained then
			var34.onFocusGained()
		end
	end, { var34.onFocusGained, var34.value })
	local var72 = reactModule.useCallback(function(p12, p13)
		-- upvalues: var56 (ref), var58 (ref), var43 (ref), var34 (ref)
		local var98 = var56(p12)
		var58(if var43() then tostring(var98) else var34.formatAsString(var98))
		var34.onChanged(var98, p13)
	end, { var34.onChanged, var34.formatAsString, var56, var43 })
	local var73 = reactModule.useCallback(function(p14)
		-- upvalues: var45 (ref), var72 (ref), getBindableValueModule (copy), var34 (ref), onChangeCallbackReasonModule (copy)
		var45(false)
		var72(getBindableValueModule(var34.value), onChangeCallbackReasonModule.FocusLost)
		
		if var34.onFocusLost then
			var34.onFocusLost(p14)
		end
	end, { var72, var34.onFocusLost, var34.value, var56 })
	local var74 = reactModule.useCallback(function(p15)
		-- upvalues: var58 (ref), var43 (ref), flagsModule (copy), var34 (ref), var45 (ref), onChangeCallbackReasonModule (copy)
		var58(p15)
		
		if not var43() then return end
		if flagsModule.FoundationNumberInputOnTextChanged then
			local var99 = tonumber(p15)
			
			if var34.onTextChanged == nil then
				if var99 == nil then
					var45(true)
					
					return
				elseif var99 == nil then
					return
				else
					var45(false)
					var34.onChanged(var99, onChangeCallbackReasonModule.Keyboard)
					
					return
				end
			else
				var34.onTextChanged(p15)
			end
		else
			local var100 = tonumber(p15)
			
			if var100 == nil then
				var45(true)
				
				return
			end
			var45(false)
			var34.onChanged(var100, onChangeCallbackReasonModule.Keyboard)
		end
	end, {
		var43,
		var34.onChanged,
		if flagsModule.FoundationNumberInputOnTextChanged then var34.onTextChanged else nil
	})
	local var75 = reactModule.useCallback(function()
		-- upvalues: getBindableValueModule (copy), var54 (ref), var72 (ref), var52 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var54) then
			return
		end
		var72(getBindableValueModule(var52), onChangeCallbackReasonModule.Activate)
	end, { var54, var52, var72 })
	local var76 = reactModule.useCallback(function()
		-- upvalues: getBindableValueModule (copy), var55 (ref), var72 (ref), var53 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var55) then
			return
		end
		var72(getBindableValueModule(var53), onChangeCallbackReasonModule.Activate)
	end, { var55, var53, var72 })
	
	if flagsModule.FoundationNumberInputBeta then
		var77 = var34.hasControls
		
		if var77 then
			var77 = false
			
			if controlsVariant ~= numberInputControlsVariantModule.None then
				var77 = controlsVariant ~= numberInputControlsVariantModule.Stacked
				var77 = nil
			end
		end
	else
		var77 = nil
	end
	local var78 = if flagsModule.FoundationNumberInputBeta and var77 or not flagsModule.FoundationNumberInputBeta then reactModule.createElement(numberInputControlsModule, {
		variant = var34.variant,
		controlsVariant = if flagsModule.FoundationNumberInputBeta then nil else controlsVariant,
		size = var34.size,
		increment = { isDisabled = var54, onClick = var75 },
		decrement = { isDisabled = var55, onClick = var76 },
		testId = var34.testId
	}) else nil
	local var79 = reactModule.useMemo(function()
		-- upvalues: flagsModule (copy), var77 (ref), var38 (ref), var59 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), var37 (ref), var35 (ref)
		if flagsModule.FoundationNumberInputBeta then
			if var77 then
				return UDim.new(0, var38.width + var59)
			end
		else
			return if controlsVariant == numberInputControlsVariantModule.Split then UDim.new(0, 2 * var37.splitButton.size + 2 * var35.Gap.XSmall) else UDim.new()
		end
	end, {
		var35, controlsVariant,
		if flagsModule.FoundationNumberInputBeta then nil else var37.splitButton.size,
		var35.Gap.XSmall, if flagsModule.FoundationNumberInputBeta then var38 else nil,
		if flagsModule.FoundationNumberInputBeta then var59 else nil,
		if flagsModule.FoundationNumberInputBeta then var77 else nil
	})
	local var80 = reactModule.useCallback(function(_, p16)
		-- upvalues: var34 (ref), var42 (ref), var41 (ref), getBindableValueModule (copy)
		local value = var34.value
		var42.current = false
		
		if value then
			var41.current = { position = p16.X, value = getBindableValueModule(value) }
		end
	end, { var34.value })
	local var81 = reactModule.useCallback(function(_, p17)
		-- upvalues: var41 (ref), calculateNumberInputValueFromPositionsModule (copy), var34 (ref), flagsModule (copy), var49 (ref), var72 (ref), onChangeCallbackReasonModule (copy), var42 (ref)
		if var41.current then
			var72(calculateNumberInputValueFromPositionsModule(var41.current.value, var41.current.position, p17.X, var34.step, if flagsModule.FoundationNumberInputBeta then var49 else nil), onChangeCallbackReasonModule.Drag)
			
			if flagsModule.FoundationNumberInputScrubCallbackProps and var34.onScrubStarted and not var42.current then
				var34.onScrubStarted()
				var42.current = true
			end
		end
	end, {
		var72,
		var34.step,
		var56,
		if flagsModule.FoundationNumberInputScrubCallbackProps then var34.onScrubStarted else nil,
		if flagsModule.FoundationNumberInputBeta then var49 else nil
	})
	local var82 = reactModule.useCallback(function()
		-- upvalues: var41 (ref), flagsModule (copy), var34 (ref), var42 (ref)
		if var41.current then
			var41.current = nil
			
			if flagsModule.FoundationNumberInputScrubCallbackProps and var34.onScrubEnded and var42.current then
				var34.onScrubEnded()
			end
		end
		var42.current = false
	end, {
		if flagsModule.FoundationNumberInputScrubCallbackProps then var34.onScrubEnded else nil
	})
	local transparency = var35.Color.Shift.Shift_300.Transparency
	local transparency_1 = var35.Color.Shift.Shift_100.Transparency
	local var83 = reactModule.useMemo(function()
		-- upvalues: mapBindableModule (copy), var34 (ref), var50 (ref), transparency_1 (ref), transparency (ref)
		return mapBindableModule(var34.value, function(p18)
			-- upvalues: var34 (copy), var50 (copy), transparency_1 (copy), transparency (copy)
			local var101 = if p18 and var34.maximum and var34.minimum then if var34.maximum == var34.minimum then 1 else (var50(p18) - var34.minimum) / (var34.maximum - var34.minimum) else 0
			
			if var101 == 0 then
				return NumberSequence.new(transparency_1)
			elseif var101 == 1 then
				return NumberSequence.new(transparency)
			elseif var101 <= 0 and var101 >= 1 then
				return NumberSequence.new(transparency_1)
			end
			local list = {
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(var101, transparency),
				NumberSequenceKeypoint.new(math.min(var101 + 0.001, 1), transparency_1)
			}
			
			if var101 < 0.999 then
				table.insert(list, NumberSequenceKeypoint.new(1, transparency_1))
			end
			return NumberSequence.new(list)
		end)
	end, {
		transparency, transparency_1, var34.value, var50, var34.maximum, var34.minimum
	})
	reactModule.useEffect(function()
		-- upvalues: var43 (ref), reactIsModule (copy), var34 (ref), var58 (ref), var56 (ref)
		if not var43() and not reactIsModule.isBinding(var34.value) then
			var58(var34.formatAsString(var56(var34.value)))
		end
	end, { var34.value, var34.formatAsString, var56, var43 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var34, {
		width = var70,
		ref = p3,
		hasError = hasError,
		label = var34.label,
		size = getInputTextSizeModule(var34.size),
		isRequired = var34.isRequired,
		isDisabled = var34.isDisabled,
		hint = var34.hint,
		textBoxRef = var40,
		input = function(p19)
			-- upvalues: flagsModule (copy), var77 (ref), var78 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), reactModule (copy), internalTextInputModule (copy), var34 (ref), joinBindablesModule (copy), var57 (ref), var43 (ref), var56 (ref), hasError (ref), var36 (ref), var61 (write), p2 (ref), var74 (ref), var73 (ref), var71 (ref), var48 (ref), var80 (ref), var81 (ref), var82 (ref), var83 (ref), var35 (ref), viewModule (copy), iconModule (copy), var60 (write), textModule (copy), var63 (write), var62 (write), var70 (ref), var79 (ref), var59 (ref)
			local var103 = if flagsModule.FoundationNumberInputBeta then var77 and var78 else controlsVariant == numberInputControlsVariantModule.Split
			local createElement = reactModule.createElement
			createElement = createElement(internalTextInputModule, {
				inputRef = var34.inputRef,
				text = joinBindablesModule({ text = var57, value = var34.value }, function(p20)
					-- upvalues: var43 (copy), var34 (copy), var56 (copy)
					return if var43() then p20.text else var34.formatAsString(var56(p20.value))
				end),
				hasError = hasError,
				variant = var34.variant,
				size = var34.size,
				Selectable = var34.Selectable,
				NextSelectionUp = var34.NextSelectionUp,
				NextSelectionDown = var34.NextSelectionDown,
				NextSelectionLeft = var34.NextSelectionLeft,
				NextSelectionRight = var34.NextSelectionRight,
				horizontalPadding = {
					left = var36.container.horizontalPadding,
					right = if flagsModule.FoundationNumberInputBeta then var36.container.horizontalPadding else nil,
					innerLeft = if not flagsModule.FoundationNumberInputBeta then if var61 and var61.X > 0 then UDim.new(0, var61.X) else nil else nil
				},
				focusBehavior = p2.focusBehavior,
				onChanged = var74,
				onFocusLost = var73,
				onFocus = var71,
				onDragStarted = if var48 then var80 else nil,
				onDrag = if var48 then var81 else nil,
				onDragEnded = if var48 then var82 else nil,
				onReturnPressed = var34.onReturnPressed,
				ref = p19,
				backgroundGradient = if var48 and var83 then reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = ColorSequence.new(var35.Color.Shift.Shift_300.Color3),
					Transparency = var83
				}) else nil,
				trailingElement = if flagsModule.FoundationNumberInputBeta then if var34.trailingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var34.trailingIcon,
					style = var36.icon.style,
					size = var36.icon.size
				})) else nil elseif controlsVariant == numberInputControlsVariantModule.Stacked then var78 else nil,
				leadingElement = if var34.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var34.leadingIcon,
					style = var36.icon.style,
					size = var36.icon.size
				})) else nil,
				isDisabled = var34.isDisabled,
				LayoutOrder = if var103 and flagsModule.FoundationNumberInputBeta then 0 else nil,
				testId = `{var34.testId}--field`
			})
			local var104 = if flagsModule.FoundationNumberInputBeta and var60 then reactModule.createElement(textModule, {
				tag = "text-align-x-left text-align-y-center content-muted",
				RichText = true,
				ClipsDescendants = true,
				fontStyle = var36.textBox.fontStyle,
				Size = UDim2.new(1, -(var63.left.Offset + var63.right.Offset), 1, 0),
				Position = UDim2.fromOffset(var63.left.Offset, 0),
				Text = var57:map(function(p21)
					-- upvalues: var34 (copy)
					return `{if var34.prefix then var34.prefix .. " " else ""}<font transparency="1">{p21}</font>{if var34.suffix then " " .. var34.suffix else ""}`
				end),
				padding = var62,
				testId = `{var34.testId}--units`
			}) else nil
			
			if flagsModule.FoundationNumberInputBeta then
				createElement = reactModule.createElement(viewModule, { tag = "size-full-0 auto-y" }, { Input = createElement, Units = var104 })
			end
			return if var103 or flagsModule.FoundationNumberInputBeta then reactModule.createElement(viewModule, {
				Size = if flagsModule.FoundationNumberInputBeta then UDim2.new(var70.Scale - var79.Scale, var70.Offset - var79.Offset, 0, 0) else UDim2.fromOffset(var70.Offset - var79.Offset, 0),
				tag = if flagsModule.FoundationNumberInputBeta then "row align-y-center auto-y" else "row align-y-center gap-xsmall auto-y",
				layout = if flagsModule.FoundationNumberInputBeta then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var59),
					SortOrder = Enum.SortOrder.LayoutOrder
				} else nil
			}, {
				InputField = createElement,
				Controls = if var103 then var78 else nil
			}) else createElement
		end
	}))
end))