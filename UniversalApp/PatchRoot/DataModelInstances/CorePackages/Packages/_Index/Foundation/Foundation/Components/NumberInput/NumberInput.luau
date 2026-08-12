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

local function _(value, p0) --[[ line: 61 | named "round" ]]
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
	formatAsString = function(p1) --[[ line: 129 ]]
		return tostring(p1)
	end,
	scrubBehavior = scrubBehaviorModule.Off
}

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 150 | named "NumberInput" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useTokensModule (ref), useTextInputVariantsModule (ref), useNumberInputVariantsModule (ref), flagsModule (ref), reactModule (ref), reactUtilsModule (ref), scrubBehaviorModule (ref), t (ref), mapBindableModule (ref), getBindableValueModule (ref), inputSizeModule (ref), useTextSizeModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), getMultiLineTextHeightModule (ref), constantsModule (ref), onChangeCallbackReasonModule (ref), numberInputControlsVariantModule (ref), numberInputControlsModule (ref), calculateNumberInputValueFromPositionsModule (ref), reactIsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), joinBindablesModule (ref), viewModule (ref), iconModule (ref), textModule (ref)
	local var34 = withDefaultsModule(p2, t_1)
	local var35 = useTokensModule()
	local var36 = useTextInputVariantsModule(var35, var34.size, var34.variant)
	local var37 = useNumberInputVariantsModule(var35, var34.size, if flagsModule.FoundationNumberInputBeta then nil else var34.controlsVariant)
	local var38 = if flagsModule.FoundationNumberInputBeta then var37.controls else nil
	local var39 = reactModule.useRef(nil)
	local var40 = reactUtilsModule.useComposedRef(var39, var34.textBoxRef)
	local var41 = reactModule.useRef(nil)
	local var42 = reactModule.useCallback(function() --[[ line: 205 ]]
		-- upvalues: var39 (ref)
		return if var39.current then var39.current.getIsFocused() else false
	end, {})
	local var43, var44 = reactModule.useState(false)
	local hasError = var34.hasError or var43
	local controlsVariant = var34.controlsVariant
	local var46 = if var34.isScrubbable then scrubBehaviorModule.On else var34.scrubBehavior
	local var47 = var46 and var46 ~= scrubBehaviorModule.Off
	local var48 = if flagsModule.FoundationNumberInputBeta then t[var46] else nil
	local var49 = reactModule.useCallback(function(p4) --[[ line: 217 ]]
		-- upvalues: var34 (ref)
		return math.clamp(p4, var34.minimum, var34.maximum)
	end, { var34.minimum, var34.maximum })
	local var50 = reactModule.useCallback(function(p5, p6) --[[ line: 221 ]]
		-- upvalues: var34 (ref)
		return p6(p5 / var34.step) * var34.step
	end, { var34.step })
	local var51 = reactModule.useMemo(function() --[[ line: 225 ]]
		-- upvalues: mapBindableModule (copy), var34 (ref), var50 (ref), var49 (ref)
		return mapBindableModule(var34.value, function(p7) --[[ line: 226 ]]
			-- upvalues: var34 (copy), var50 (copy), var49 (copy)
			local var83 = 10 ^ (var34.precision or 0)
			local var84 = math.floor(p7 * var83 + 0.5) / var83
			local var85 = 10 ^ (var34.precision or 0)
			local var86 = math.floor((p7 + var34.step) * var85 + 0.5) / var85
			local var87 = 10 ^ (var34.precision or 0)
			local var88 = math.floor(var50(p7, math.ceil) * var87 + 0.5) / var87
			
			if var84 ~= var88 then
				var86 = var88
			end
			return var49(var86)
		end)
	end, {
		var34.value,
		var34.step,
		var34.precision,
		var49,
		var50
	})
	local var52 = reactModule.useMemo(function() --[[ line: 237 ]]
		-- upvalues: mapBindableModule (copy), var34 (ref), var50 (ref), var49 (ref)
		return mapBindableModule(var34.value, function(p8) --[[ line: 238 ]]
			-- upvalues: var34 (copy), var50 (copy), var49 (copy)
			local var89 = 10 ^ (var34.precision or 0)
			local var90 = math.floor(p8 * var89 + 0.5) / var89
			local var91 = 10 ^ (var34.precision or 0)
			local var92 = math.floor((p8 - var34.step) * var91 + 0.5) / var91
			local var93 = 10 ^ (var34.precision or 0)
			local var94 = math.floor(var50(p8, math.floor) * var93 + 0.5) / var93
			
			if var90 ~= var94 then
				var92 = var94
			end
			return var49(var92)
		end)
	end, {
		var34.value,
		var34.step,
		var34.precision,
		var49,
		var50
	})
	local var53 = reactModule.useMemo(function() --[[ line: 249 ]]
		-- upvalues: mapBindableModule (copy), var34 (ref)
		return mapBindableModule(var34.value, function(p9) --[[ line: 250 ]]
			-- upvalues: var34 (copy)
			return var34.isDisabled or p9 == var34.maximum
		end)
	end, { var34.isDisabled, var34.value, var34.maximum })
	local var54 = reactModule.useMemo(function() --[[ line: 255 ]]
		-- upvalues: mapBindableModule (copy), var34 (ref)
		return mapBindableModule(var34.value, function(p10) --[[ line: 256 ]]
			-- upvalues: var34 (copy)
			return var34.isDisabled or p10 == var34.minimum
		end)
	end, { var34.isDisabled, var34.value, var34.minimum })
	local var55 = reactModule.useCallback(function(p11) --[[ line: 261 ]]
		-- upvalues: var34 (ref)
		local var95 = 10 ^ (var34.precision or 0)
		
		return math.floor(math.clamp(p11, var34.minimum, var34.maximum) * var95 + 0.5) / var95
	end, { var34.minimum, var34.maximum, var34.precision })
	local var56, var57 = reactModule.useBinding(var34.formatAsString(var55(getBindableValueModule(var34.value))))
	local var58 = if flagsModule.FoundationNumberInputBeta then if var34.size == inputSizeModule.XSmall then var35.Gap.Small - var35.Gap.XSmall / 2 else var35.Gap.Small else nil
	local var59 = nil
	local _ = nil
	local var60 = nil
	local var61 = nil
	local var62 = nil
	
	if flagsModule.FoundationNumberInputBeta then
		local var63
		local fontStyle = var36.textBox.fontStyle
		local fontSize = fontStyle.FontSize
		
		if var34.prefix then
			var63 = if var34.prefix == "" then var34.suffix and var34.suffix ~= "" else true
		end
		var59 = var63
		var60 = useTextSizeModule(if var34.prefix then var34.prefix .. " " else nil, reactModule.useMemo(function() --[[ line: 287 ]]
			-- upvalues: fontStyle (ref), fontSize (ref)
			return {
				Font = fontStyle.Font,
				FontSize = math.floor(fontSize),
				LineHeight = fontStyle.LineHeight
			}
		end, { fontStyle, fontSize }))
		local var64 = if var34.leadingIcon then useIconSizeModule(var36.icon.size, isBuilderIconModule(var34.leadingIcon)).X.Offset else 0
		local var65 = if flagsModule.FoundationNumberInputBeta and var34.trailingIcon then useIconSizeModule(var36.icon.size, isBuilderIconModule(var34.trailingIcon)).X.Offset else 0
		local var66 = if var34.size == inputSizeModule.XSmall then var35.Gap.Small elseif var34.size == inputSizeModule.Small then var35.Gap.Medium else var35.Gap.Large
		local var67 = if var34.leadingIcon then var66 else 0
		local var68 = if flagsModule.FoundationNumberInputBeta and var34.trailingIcon then var66 else 0
		var62 = reactModule.useMemo(function() --[[ line: 310 ]]
			-- upvalues: var36 (ref), var64 (ref), var67 (ref), var65 (ref), var68 (ref)
			return {
				left = UDim.new(0, var36.container.horizontalPadding.Offset + var64 + var67),
				right = UDim.new(0, var36.container.horizontalPadding.Offset + var65 + var68)
			}
		end, {
			var36.container.horizontalPadding,
			var67,
			var68,
			var64,
			var65
		})
		var61 = reactModule.useMemo(function() --[[ line: 334 ]]
			-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), fontStyle (ref), var36 (ref)
			local var96 = math.round((var36.container.minHeight - 2 - getMultiLineTextHeightModule(fontSize, 1, fontStyle.LineHeight)) * 2) / 2
			
			return {
				top = UDim.new(0, math.floor(var96 / 2) + 1),
				bottom = UDim.new(0, math.ceil(var96 / 2) + 1),
				left = UDim.new(),
				right = UDim.new()
			}
		end, { var36.container.minHeight, fontStyle, fontSize })
	end
	local var76
	local var69 = if var34.width then var34.width elseif flagsModule.FoundationNumberInputBeta then UDim.new(0, constantsModule.DEFAULT_NUMBER_INPUT_WIDTH) else UDim.new(0, var37.container.width)
	local var70 = reactModule.useCallback(function() --[[ line: 361 ]]
		-- upvalues: var57 (ref), getBindableValueModule (copy), var34 (ref)
		var57(tostring(getBindableValueModule(var34.value)))
		
		if var34.onFocusGained then
			var34.onFocusGained()
		end
	end, { var34.onFocusGained, var34.value })
	local var71 = reactModule.useCallback(function(p12, p13) --[[ line: 369 ]]
		-- upvalues: var55 (ref), var57 (ref), var42 (ref), var34 (ref)
		local var97 = var55(p12)
		var57(if var42() then tostring(var97) else var34.formatAsString(var97))
		var34.onChanged(var97, p13)
	end, { var34.onChanged, var34.formatAsString, var55, var42 })
	local var72 = reactModule.useCallback(function(p14) --[[ line: 375 ]]
		-- upvalues: var44 (ref), var71 (ref), getBindableValueModule (copy), var34 (ref), onChangeCallbackReasonModule (copy)
		var44(false)
		var71(getBindableValueModule(var34.value), onChangeCallbackReasonModule.FocusLost)
		
		if var34.onFocusLost then
			var34.onFocusLost(p14)
		end
	end, { var71, var34.onFocusLost, var34.value, var55 })
	local var73 = reactModule.useCallback(function(p15) --[[ line: 385 ]]
		-- upvalues: var57 (ref), var42 (ref), flagsModule (copy), var34 (ref), var44 (ref), onChangeCallbackReasonModule (copy)
		var57(p15)
		
		if not var42() then return end
		if flagsModule.FoundationNumberInputOnTextChanged then
			local var98 = tonumber(p15)
			
			if var34.onTextChanged == nil then
				if var98 == nil then
					var44(true)
					
					return
				elseif var98 == nil then
					return
				else
					var44(false)
					var34.onChanged(var98, onChangeCallbackReasonModule.Keyboard)
					
					return
				end
			else
				var34.onTextChanged(p15)
			end
		else
			local var99 = tonumber(p15)
			
			if var99 == nil then
				var44(true)
				
				return
			end
			var44(false)
			var34.onChanged(var99, onChangeCallbackReasonModule.Keyboard)
		end
	end, {
		var42,
		var34.onChanged,
		if flagsModule.FoundationNumberInputOnTextChanged then var34.onTextChanged else nil
	})
	local var74 = reactModule.useCallback(function() --[[ line: 419 ]]
		-- upvalues: getBindableValueModule (copy), var53 (ref), var71 (ref), var51 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var53) then
			return
		end
		var71(getBindableValueModule(var51), onChangeCallbackReasonModule.Activate)
	end, { var53, var51, var71 })
	local var75 = reactModule.useCallback(function() --[[ line: 426 ]]
		-- upvalues: getBindableValueModule (copy), var54 (ref), var71 (ref), var52 (ref), onChangeCallbackReasonModule (copy)
		if getBindableValueModule(var54) then
			return
		end
		var71(getBindableValueModule(var52), onChangeCallbackReasonModule.Activate)
	end, { var54, var52, var71 })
	
	if flagsModule.FoundationNumberInputBeta then
		var76 = var34.hasControls
		
		if var76 then
			var76 = false
			
			if controlsVariant ~= numberInputControlsVariantModule.None then
				var76 = controlsVariant ~= numberInputControlsVariantModule.Stacked
				var76 = nil
			end
		end
	else
		var76 = nil
	end
	local var77 = if flagsModule.FoundationNumberInputBeta and var76 or not flagsModule.FoundationNumberInputBeta then reactModule.createElement(numberInputControlsModule, {
		variant = var34.variant,
		controlsVariant = if flagsModule.FoundationNumberInputBeta then nil else controlsVariant,
		size = var34.size,
		increment = { isDisabled = var53, onClick = var74 },
		decrement = { isDisabled = var54, onClick = var75 },
		testId = var34.testId
	}) else nil
	local var78 = reactModule.useMemo(function() --[[ line: 459 ]]
		-- upvalues: flagsModule (copy), var76 (ref), var38 (ref), var58 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), var37 (ref), var35 (ref)
		if flagsModule.FoundationNumberInputBeta then
			if var76 then
				return UDim.new(0, var38.width + var58)
			end
		else
			return if controlsVariant == numberInputControlsVariantModule.Split then UDim.new(0, 2 * var37.splitButton.size + 2 * var35.Gap.XSmall) else UDim.new()
		end
	end, {
		var35, controlsVariant,
		if flagsModule.FoundationNumberInputBeta then nil else var37.splitButton.size,
		var35.Gap.XSmall, if flagsModule.FoundationNumberInputBeta then var38 else nil,
		if flagsModule.FoundationNumberInputBeta then var58 else nil,
		if flagsModule.FoundationNumberInputBeta then var76 else nil
	})
	local var79 = reactModule.useCallback(function(_, p16) --[[ line: 481 ]]
		-- upvalues: var34 (ref), var41 (ref), getBindableValueModule (copy)
		local value = var34.value
		
		if value then
			var41.current = { position = p16.X, value = getBindableValueModule(value) }
		end
	end, { var34.value })
	local var80 = reactModule.useCallback(function(_, p17) --[[ line: 492 ]]
		-- upvalues: var41 (ref), calculateNumberInputValueFromPositionsModule (copy), var34 (ref), flagsModule (copy), var48 (ref), var71 (ref), onChangeCallbackReasonModule (copy)
		if var41.current then
			var71(calculateNumberInputValueFromPositionsModule(var41.current.value, var41.current.position, p17.X, var34.step, if flagsModule.FoundationNumberInputBeta then var48 else nil), onChangeCallbackReasonModule.Drag)
		end
	end, {
		var71,
		var34.step,
		var55,
		if flagsModule.FoundationNumberInputBeta then var48 else nil
	})
	local var81 = reactModule.useCallback(function() --[[ line: 512 ]]
		-- upvalues: var41 (ref)
		if var41.current then
			var41.current = nil
		end
	end, {})
	local transparency = var35.Color.Shift.Shift_300.Transparency
	local transparency_1 = var35.Color.Shift.Shift_100.Transparency
	local var82 = reactModule.useMemo(function() --[[ line: 521 ]]
		-- upvalues: mapBindableModule (copy), var34 (ref), var49 (ref), transparency_1 (ref), transparency (ref)
		return mapBindableModule(var34.value, function(p18) --[[ line: 522 ]]
			-- upvalues: var34 (copy), var49 (copy), transparency_1 (copy), transparency (copy)
			local var100 = if p18 and var34.maximum and var34.minimum then if var34.maximum == var34.minimum then 1 else (var49(p18) - var34.minimum) / (var34.maximum - var34.minimum) else 0
			
			if var100 == 0 then
				return NumberSequence.new(transparency_1)
			elseif var100 == 1 then
				return NumberSequence.new(transparency)
			elseif var100 <= 0 and var100 >= 1 then
				return NumberSequence.new(transparency_1)
			end
			local list = {
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(var100, transparency),
				NumberSequenceKeypoint.new(math.min(var100 + 0.001, 1), transparency_1)
			}
			
			if var100 < 0.999 then
				table.insert(list, NumberSequenceKeypoint.new(1, transparency_1))
			end
			return NumberSequence.new(list)
		end)
	end, {
		transparency, transparency_1, var34.value, var49, var34.maximum, var34.minimum
	})
	reactModule.useEffect(function() --[[ line: 565 ]]
		-- upvalues: var42 (ref), reactIsModule (copy), var34 (ref), var57 (ref), var55 (ref)
		if not var42() and not reactIsModule.isBinding(var34.value) then
			var57(var34.formatAsString(var55(var34.value)))
		end
	end, { var34.value, var34.formatAsString, var55, var42 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var34, {
		width = var69,
		ref = p3,
		hasError = hasError,
		label = var34.label,
		size = getInputTextSizeModule(var34.size),
		isRequired = var34.isRequired,
		isDisabled = var34.isDisabled,
		hint = var34.hint,
		textBoxRef = var40,
		input = function(p19) --[[ line: 584 ]]
			-- upvalues: flagsModule (copy), var76 (ref), var77 (ref), controlsVariant (ref), numberInputControlsVariantModule (copy), reactModule (copy), internalTextInputModule (copy), var34 (ref), joinBindablesModule (copy), var56 (ref), var42 (ref), var55 (ref), hasError (ref), var36 (ref), var60 (write), p2 (ref), var73 (ref), var72 (ref), var70 (ref), var47 (ref), var79 (ref), var80 (ref), var81 (ref), var82 (ref), var35 (ref), viewModule (copy), iconModule (copy), var59 (write), textModule (copy), var62 (write), var61 (write), var69 (ref), var78 (ref), var58 (ref)
			local var102 = if flagsModule.FoundationNumberInputBeta then var76 and var77 else controlsVariant == numberInputControlsVariantModule.Split
			local createElement = reactModule.createElement
			createElement = createElement(internalTextInputModule, {
				inputRef = var34.inputRef,
				text = joinBindablesModule({ text = var56, value = var34.value }, function(p20) --[[ line: 594 ]]
					-- upvalues: var42 (copy), var34 (copy), var55 (copy)
					return if var42() then p20.text else var34.formatAsString(var55(p20.value))
				end),
				hasError = hasError,
				variant = var34.variant,
				size = var34.size,
				Selectable = if flagsModule.FoundationInputSelectionProps then var34.Selectable else nil,
				NextSelectionUp = if flagsModule.FoundationInputSelectionProps then var34.NextSelectionUp else nil,
				NextSelectionDown = if flagsModule.FoundationInputSelectionProps then var34.NextSelectionDown else nil,
				NextSelectionLeft = if flagsModule.FoundationInputSelectionProps then var34.NextSelectionLeft else nil,
				NextSelectionRight = if flagsModule.FoundationInputSelectionProps then var34.NextSelectionRight else nil,
				horizontalPadding = {
					left = var36.container.horizontalPadding,
					right = if flagsModule.FoundationNumberInputBeta then var36.container.horizontalPadding else nil,
					innerLeft = if not flagsModule.FoundationNumberInputBeta then if var60 and var60.X > 0 then UDim.new(0, var60.X) else nil else nil
				},
				focusBehavior = p2.focusBehavior,
				onChanged = var73,
				onFocusLost = var72,
				onFocus = var70,
				onDragStarted = if var47 then var79 else nil,
				onDrag = if var47 then var80 else nil,
				onDragEnded = if var47 then var81 else nil,
				onReturnPressed = var34.onReturnPressed,
				ref = p19,
				backgroundGradient = if var47 and var82 then reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = ColorSequence.new(var35.Color.Shift.Shift_300.Color3),
					Transparency = var82
				}) else nil,
				trailingElement = if flagsModule.FoundationNumberInputBeta then if var34.trailingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var34.trailingIcon,
					style = var36.icon.style,
					size = var36.icon.size
				})) else nil elseif controlsVariant == numberInputControlsVariantModule.Stacked then var77 else nil,
				leadingElement = if var34.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var34.leadingIcon,
					style = var36.icon.style,
					size = var36.icon.size
				})) else nil,
				isDisabled = var34.isDisabled,
				LayoutOrder = if var102 and flagsModule.FoundationNumberInputBeta then 0 else nil,
				testId = `{var34.testId}--field`
			})
			local var103 = if flagsModule.FoundationNumberInputBeta and var59 then reactModule.createElement(textModule, {
				tag = "text-align-x-left text-align-y-center content-muted",
				RichText = true,
				ClipsDescendants = true,
				fontStyle = var36.textBox.fontStyle,
				Size = UDim2.new(1, -(var62.left.Offset + var62.right.Offset), 1, 0),
				Position = UDim2.fromOffset(var62.left.Offset, 0),
				Text = var56:map(function(p21) --[[ line: 678 ]]
					-- upvalues: var34 (copy)
					return `{if var34.prefix then var34.prefix .. " " else ""}<font transparency="1">{p21}</font>{if var34.suffix then " " .. var34.suffix else ""}`
				end),
				padding = var61,
				testId = `{var34.testId}--units`
			}) else nil
			
			if flagsModule.FoundationNumberInputBeta then
				createElement = reactModule.createElement(viewModule, { tag = "size-full-0 auto-y" }, { Input = createElement, Units = var103 })
			end
			return if var102 or flagsModule.FoundationNumberInputBeta then reactModule.createElement(viewModule, {
				Size = if flagsModule.FoundationNumberInputBeta then UDim2.new(var69.Scale - var78.Scale, var69.Offset - var78.Offset, 0, 0) else UDim2.fromOffset(var69.Offset - var78.Offset, 0),
				tag = if flagsModule.FoundationNumberInputBeta then "row align-y-center auto-y" else "row align-y-center gap-xsmall auto-y",
				layout = if flagsModule.FoundationNumberInputBeta then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, var58),
					SortOrder = Enum.SortOrder.LayoutOrder
				} else nil
			}, {
				InputField = createElement,
				Controls = if var102 then var77 else nil
			}) else createElement
		end
	}))
end))