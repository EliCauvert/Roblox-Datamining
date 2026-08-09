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
local calculateNumberInputValueFromPositionsModule = require(script.Parent.calculateNumberInputValueFromPositions)
local _ = require(foundation.Enums.InputFocusBehavior)

local function _(value, p0) --[[ line: 57 | named "round" ]]
	local var30 = 10 ^ (p0 or 0)
	
	return math.floor(value * var30 + 0.5) / var30
end

local t = {
	minimum = -1e999,
	maximum = 1e999,
	step = 1,
	precision = 3,
	value = 0,
	isScrubbable = false,
	testId = "--foundation-number-input",
	variant = inputVariantModule.Standard,
	controlsVariant = numberInputControlsVariantModule.Stacked,
	size = inputSizeModule.Large,
	formatAsString = function(p1) --[[ line: 109 ]]
		return tostring(p1)
	end
}

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 127 | named "NumberInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useTextInputVariantsModule (ref), useNumberInputVariantsModule (ref), reactModule (ref), reactUtilsModule (ref), mapBindableModule (ref), getBindableValueModule (ref), flagsModule (ref), useTextSizeModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), inputSizeModule (ref), getMultiLineTextHeightModule (ref), onChangeCallbackReasonModule (ref), numberInputControlsModule (ref), numberInputControlsVariantModule (ref), calculateNumberInputValueFromPositionsModule (ref), reactIsModule (ref), inputFieldModule (ref), withCommonPropsModule (ref), getInputTextSizeModule (ref), internalTextInputModule (ref), joinBindablesModule (ref), viewModule (ref), iconModule (ref), textModule (ref)
	local var31 = withDefaultsModule(p2, t)
	local var32 = useTokensModule()
	local var33 = useTextInputVariantsModule(var32, var31.size, var31.variant)
	local var34 = useNumberInputVariantsModule(var32, var31.size, var31.controlsVariant)
	local var35 = reactModule.useRef(nil)
	local var36 = reactUtilsModule.useComposedRef(var35, var31.textBoxRef)
	local var37 = reactModule.useRef(nil)
	local var38 = reactModule.useCallback(function() --[[ line: 170 ]]
		-- upvalues: var35 (ref)
		return if var35.current then var35.current.getIsFocused() else false
	end, {})
	local var39, var40 = reactModule.useState(false)
	local hasError = var31.hasError or var39
	local controlsVariant = var31.controlsVariant
	local var42 = reactModule.useCallback(function(p4) --[[ line: 178 ]]
		-- upvalues: var31 (ref)
		return math.clamp(p4, var31.minimum, var31.maximum)
	end, { var31.minimum, var31.maximum })
	local var43 = reactModule.useCallback(function(p5, p6) --[[ line: 182 ]]
		-- upvalues: var31 (ref)
		return p6(p5 / var31.step) * var31.step
	end, { var31.step })
	local var44 = reactModule.useMemo(function() --[[ line: 186 ]]
		-- upvalues: mapBindableModule (copy), var31 (ref), var43 (ref), var42 (ref)
		return mapBindableModule(var31.value, function(p7) --[[ line: 187 ]]
			-- upvalues: var31 (copy), var43 (copy), var42 (copy)
			local var68 = 10 ^ (var31.precision or 0)
			local var69 = math.floor(p7 * var68 + 0.5) / var68
			local var70 = 10 ^ (var31.precision or 0)
			local var71 = math.floor((p7 + var31.step) * var70 + 0.5) / var70
			local var72 = 10 ^ (var31.precision or 0)
			local var73 = math.floor(var43(p7, math.ceil) * var72 + 0.5) / var72
			
			if var69 ~= var73 then
				var71 = var73
			end
			return var42(var71)
		end)
	end, {
		var31.value,
		var31.step,
		var31.precision,
		var42,
		var43
	})
	local var45 = reactModule.useMemo(function() --[[ line: 198 ]]
		-- upvalues: mapBindableModule (copy), var31 (ref), var43 (ref), var42 (ref)
		return mapBindableModule(var31.value, function(p8) --[[ line: 199 ]]
			-- upvalues: var31 (copy), var43 (copy), var42 (copy)
			local var74 = 10 ^ (var31.precision or 0)
			local var75 = math.floor(p8 * var74 + 0.5) / var74
			local var76 = 10 ^ (var31.precision or 0)
			local var77 = math.floor((p8 - var31.step) * var76 + 0.5) / var76
			local var78 = 10 ^ (var31.precision or 0)
			local var79 = math.floor(var43(p8, math.floor) * var78 + 0.5) / var78
			
			if var75 ~= var79 then
				var77 = var79
			end
			return var42(var77)
		end)
	end, {
		var31.value,
		var31.step,
		var31.precision,
		var42,
		var43
	})
	local var46 = reactModule.useMemo(function() --[[ line: 210 ]]
		-- upvalues: mapBindableModule (copy), var31 (ref)
		return mapBindableModule(var31.value, function(p9) --[[ line: 211 ]]
			-- upvalues: var31 (copy)
			return var31.isDisabled or p9 == var31.maximum
		end)
	end, { var31.isDisabled, var31.value, var31.maximum })
	local var47 = reactModule.useMemo(function() --[[ line: 216 ]]
		-- upvalues: mapBindableModule (copy), var31 (ref)
		return mapBindableModule(var31.value, function(p10) --[[ line: 217 ]]
			-- upvalues: var31 (copy)
			return var31.isDisabled or p10 == var31.minimum
		end)
	end, { var31.isDisabled, var31.value, var31.minimum })
	local var48 = reactModule.useCallback(function(p11) --[[ line: 222 ]]
		-- upvalues: var31 (ref)
		local var80 = 10 ^ (var31.precision or 0)
		
		return math.floor(math.clamp(p11, var31.minimum, var31.maximum) * var80 + 0.5) / var80
	end, { var31.minimum, var31.maximum, var31.precision })
	local var49, var50 = reactModule.useBinding(var31.formatAsString(var48(getBindableValueModule(var31.value))))
	local var51 = nil
	local _ = nil
	local var52 = nil
	local var53 = nil
	
	if flagsModule.FoundationSupportPrefixSuffixNumberInput then
		local var54
		local fontStyle = var33.textBox.fontStyle
		local fontSize = fontStyle.FontSize
		
		if var31.prefix then
			var54 = if var31.prefix == "" then var31.suffix and var31.suffix ~= "" else true
		end
		var51 = var54
		var52 = useTextSizeModule(if var31.prefix then var31.prefix .. " " else nil, reactModule.useMemo(function() --[[ line: 243 ]]
			-- upvalues: fontStyle (ref), fontSize (ref)
			return {
				Font = fontStyle.Font,
				FontSize = math.floor(fontSize),
				LineHeight = fontStyle.LineHeight
			}
		end, { fontStyle, fontSize }))
		local var55 = if var31.leadingIcon then useIconSizeModule(var33.icon.size, isBuilderIconModule(var31.leadingIcon)).X.Offset else 0
		local var56 = if var31.leadingIcon then if var31.size == inputSizeModule.XSmall then var32.Gap.Small elseif var31.size == inputSizeModule.Small then var32.Gap.Medium else var32.Gap.Large else 0
		var53 = reactModule.useMemo(function() --[[ line: 263 ]]
			-- upvalues: getMultiLineTextHeightModule (copy), fontSize (ref), fontStyle (ref), var33 (ref), var55 (ref), var56 (ref)
			local var81 = math.round((var33.container.minHeight - 2 - getMultiLineTextHeightModule(fontSize, 1, fontStyle.LineHeight)) * 2) / 2
			
			return {
				left = UDim.new(0, var33.container.horizontalPadding.Offset + var55 + var56),
				right = var33.container.horizontalPadding,
				top = UDim.new(0, math.floor(var81 / 2) + 1),
				bottom = UDim.new(0, math.ceil(var81 / 2) + 1)
			}
		end, {
			var33.container.minHeight, var33.container.horizontalPadding, fontStyle, var55,
			var56, fontSize
		})
	end
	local var57 = if var31.width then var31.width else UDim.new(0, var34.container.width)
	local var58 = reactModule.useCallback(function() --[[ line: 295 ]]
		-- upvalues: var50 (ref), getBindableValueModule (copy), var31 (ref)
		var50(tostring(getBindableValueModule(var31.value)))
		
		if var31.onFocusGained then
			var31.onFocusGained()
		end
	end, { var31.onFocusGained, var31.value })
	local var59 = reactModule.useCallback(function(p12, p13) --[[ line: 303 ]]
		-- upvalues: var48 (ref), var50 (ref), var38 (ref), var31 (ref)
		local var82 = var48(p12)
		var50(if var38() then tostring(var82) else var31.formatAsString(var82))
		var31.onChanged(var82, p13)
	end, { var31.onChanged, var31.formatAsString, var48, var38 })
	local var60 = reactModule.useCallback(function(p14) --[[ line: 309 ]]
		-- upvalues: var40 (ref), var59 (ref), getBindableValueModule (copy), var31 (ref), onChangeCallbackReasonModule (copy)
		var40(false)
		var59(getBindableValueModule(var31.value), onChangeCallbackReasonModule.FocusLost)
		
		if var31.onFocusLost then
			var31.onFocusLost(p14)
		end
	end, { var59, var31.onFocusLost, var31.value, var48 })
	local var61 = reactModule.useCallback(function(p15) --[[ line: 318 ]]
		-- upvalues: var50 (ref), var38 (ref), var40 (ref), var31 (ref), onChangeCallbackReasonModule (copy)
		var50(p15)
		
		if not var38() then return end
		local var83 = tonumber(p15)
		
		if var83 == nil then
			var40(true)
			
			return
		end
		var40(false)
		var31.onChanged(var83, onChangeCallbackReasonModule.Keyboard)
	end, { var38, var31.onChanged })
	local var62 = reactModule.createElement(numberInputControlsModule, {
		variant = var31.variant,
		controlsVariant = controlsVariant,
		size = var31.size,
		increment = {
			isDisabled = var46,
			onClick = reactModule.useCallback(function() --[[ line: 334 ]]
				-- upvalues: getBindableValueModule (copy), var46 (ref), var59 (ref), var44 (ref), onChangeCallbackReasonModule (copy)
				if getBindableValueModule(var46) then
					return
				end
				var59(getBindableValueModule(var44), onChangeCallbackReasonModule.Activate)
			end, { var46, var44, var59 })
		},
		decrement = {
			isDisabled = var47,
			onClick = reactModule.useCallback(function() --[[ line: 341 ]]
				-- upvalues: getBindableValueModule (copy), var47 (ref), var59 (ref), var45 (ref), onChangeCallbackReasonModule (copy)
				if getBindableValueModule(var47) then
					return
				end
				var59(getBindableValueModule(var45), onChangeCallbackReasonModule.Activate)
			end, { var47, var45, var59 })
		},
		testId = var31.testId
	})
	local var63 = reactModule.useMemo(function() --[[ line: 364 ]]
		-- upvalues: controlsVariant (ref), numberInputControlsVariantModule (copy), var34 (ref), var32 (ref)
		return if controlsVariant == numberInputControlsVariantModule.Split then UDim.new(0, 2 * var34.splitButton.size + 2 * var32.Gap.XSmall) else UDim.new()
	end, {
		var32,
		controlsVariant,
		var34.splitButton.size,
		var32.Gap.XSmall
	})
	local var64 = reactModule.useCallback(function(_, p16) --[[ line: 374 ]]
		-- upvalues: var31 (ref), var37 (ref), getBindableValueModule (copy)
		local value = var31.value
		
		if value then
			var37.current = { position = p16.X, value = getBindableValueModule(value) }
		end
	end, { var31.value })
	local var65 = reactModule.useCallback(function(_, p17) --[[ line: 384 ]]
		-- upvalues: var37 (ref), calculateNumberInputValueFromPositionsModule (copy), var31 (ref), var59 (ref), onChangeCallbackReasonModule (copy)
		if var37.current then
			var59(calculateNumberInputValueFromPositionsModule(var37.current.value, var37.current.position, p17.X, var31.step), onChangeCallbackReasonModule.Drag)
		end
	end, { var59, var31.step, var48 })
	local var66 = reactModule.useCallback(function() --[[ line: 396 ]]
		-- upvalues: var37 (ref)
		if var37.current then
			var37.current = nil
		end
	end, {})
	local transparency = var32.Color.Shift.Shift_300.Transparency
	local transparency_1 = var32.Color.Shift.Shift_100.Transparency
	local var67 = reactModule.useMemo(function() --[[ line: 405 ]]
		-- upvalues: mapBindableModule (copy), var31 (ref), var42 (ref), transparency_1 (ref), transparency (ref)
		return mapBindableModule(var31.value, function(p18) --[[ line: 406 ]]
			-- upvalues: var31 (copy), var42 (copy), transparency_1 (copy), transparency (copy)
			local var84 = if p18 and var31.maximum and var31.minimum then if var31.maximum == var31.minimum then 1 else (var42(p18) - var31.minimum) / (var31.maximum - var31.minimum) else 0
			
			if var84 == 0 then
				return NumberSequence.new(transparency_1)
			elseif var84 == 1 then
				return NumberSequence.new(transparency)
			elseif var84 <= 0 and var84 >= 1 then
				return NumberSequence.new(transparency_1)
			end
			local list = {
				NumberSequenceKeypoint.new(0, transparency),
				NumberSequenceKeypoint.new(var84, transparency),
				NumberSequenceKeypoint.new(math.min(var84 + 0.001, 1), transparency_1)
			}
			
			if var84 < 0.999 then
				table.insert(list, NumberSequenceKeypoint.new(1, transparency_1))
			end
			return NumberSequence.new(list)
		end)
	end, {
		transparency, transparency_1, var31.value, var42, var31.maximum, var31.minimum
	})
	reactModule.useEffect(function() --[[ line: 449 ]]
		-- upvalues: var38 (ref), reactIsModule (copy), var31 (ref), var50 (ref), var48 (ref)
		if not var38() and not reactIsModule.isBinding(var31.value) then
			var50(var31.formatAsString(var48(var31.value)))
		end
	end, { var31.value, var31.formatAsString, var48, var38 })
	
	return reactModule.createElement(inputFieldModule, withCommonPropsModule(var31, {
		width = var57,
		ref = p3,
		hasError = hasError,
		label = var31.label,
		size = getInputTextSizeModule(var31.size),
		isRequired = var31.isRequired,
		isDisabled = var31.isDisabled,
		hint = var31.hint,
		textBoxRef = var36,
		input = function(p19) --[[ line: 467 ]]
			-- upvalues: controlsVariant (ref), numberInputControlsVariantModule (copy), reactModule (copy), internalTextInputModule (copy), var31 (ref), joinBindablesModule (copy), var49 (ref), var38 (ref), var48 (ref), hasError (ref), flagsModule (copy), var33 (ref), var52 (write), p2 (ref), var61 (ref), var60 (ref), var58 (ref), var64 (ref), var65 (ref), var66 (ref), var67 (ref), var32 (ref), var62 (ref), viewModule (copy), iconModule (copy), var51 (write), textModule (copy), var53 (write), var57 (ref), var63 (ref)
			local var86 = controlsVariant == numberInputControlsVariantModule.Split
			local createElement = reactModule.createElement
			createElement = createElement(internalTextInputModule, {
				inputRef = var31.inputRef,
				text = joinBindablesModule({ text = var49, value = var31.value }, function(p20) --[[ line: 475 ]]
					-- upvalues: var38 (copy), var31 (copy), var48 (copy)
					return if var38() then p20.text else var31.formatAsString(var48(p20.value))
				end),
				hasError = hasError,
				variant = var31.variant,
				size = var31.size,
				Selectable = if flagsModule.FoundationInputSelectionProps then var31.Selectable else nil,
				NextSelectionUp = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionUp else nil,
				NextSelectionDown = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionDown else nil,
				NextSelectionLeft = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionLeft else nil,
				NextSelectionRight = if flagsModule.FoundationInputSelectionProps then var31.NextSelectionRight else nil,
				horizontalPadding = {
					left = var33.container.horizontalPadding,
					innerLeft = if not flagsModule.FoundationSupportPrefixSuffixNumberInput then if var52 and var52.X > 0 then UDim.new(0, var52.X) else nil else nil
				},
				focusBehavior = p2.focusBehavior,
				onChanged = var61,
				onFocusLost = var60,
				onFocus = var58,
				onDragStarted = if var31.isScrubbable then var64 else nil,
				onDrag = if var31.isScrubbable then var65 else nil,
				onDragEnded = if var31.isScrubbable then var66 else nil,
				onReturnPressed = var31.onReturnPressed,
				ref = p19,
				backgroundGradient = if var31.isScrubbable and var67 then reactModule.createElement("UIGradient", {
					Rotation = 0,
					Color = ColorSequence.new(var32.Color.Shift.Shift_300.Color3),
					Transparency = var67
				}) else nil,
				trailingElement = if controlsVariant == numberInputControlsVariantModule.Stacked then var62 else nil,
				leadingElement = if var31.leadingIcon then reactModule.createElement(viewModule, { tag = "row align-y-center size-0-full auto-x" }, reactModule.createElement(iconModule, {
					name = var31.leadingIcon,
					style = var33.icon.style,
					size = var33.icon.size
				})) else nil,
				isDisabled = var31.isDisabled,
				testId = `{var31.testId}--field`
			})
			local var87 = if flagsModule.FoundationSupportPrefixSuffixNumberInput and var51 then reactModule.createElement(textModule, {
				tag = "size-full text-align-x-left text-align-y-center content-muted",
				RichText = true,
				ClipsDescendants = true,
				fontStyle = var33.textBox.fontStyle,
				Text = var49:map(function(p21) --[[ line: 540 ]]
					-- upvalues: var31 (copy)
					return `{if var31.prefix then var31.prefix .. " " else ""}<font transparency="1">{p21}</font>{if var31.suffix then " " .. var31.suffix else ""}`
				end),
				padding = var53,
				testId = `{var31.testId}--units`
			}) else nil
			
			if flagsModule.FoundationSupportPrefixSuffixNumberInput then
				createElement = reactModule.createElement(viewModule, { tag = "size-full-0 auto-y" }, { Input = createElement, Units = var87 })
			end
			return if var86 then reactModule.createElement(viewModule, {
				tag = "row align-y-center gap-xsmall auto-y",
				Size = UDim2.fromOffset(var57.Offset - var63.Offset, 0)
			}, {
				InputField = createElement,
				Controls = if var86 then var62 else nil
			}) else createElement
		end
	}))
end))