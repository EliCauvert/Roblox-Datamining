local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local flagsModule = require(foundation.Utility.Flags)
local useMotion = require(parent.Motion).useMotion
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local components = foundation.Components
local inputLabelModule = require(components.InputLabel)
local _ = require(components.Types)
local viewModule = require(components.View)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local inputHintModule = require(script.Parent.InputHint)
local useInputMotionStatesModule = require(script.Parent.useInputMotionStates)
local useInputVariantsModule = require(script.Parent.useInputVariants)
local getInputTextSizeModule = require(foundation.Utility.getInputTextSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local constantsModule = require(foundation.Constants)
local controlStateModule = require(foundation.Enums.ControlState)
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.CursorType)
local _ = require(foundation.Providers.Style.Tokens)
local t = {
	Selectable = true,
	testId = "--foundation-internal-input",
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 86 | named "InternalInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), useTokensModule (ref), useInputVariantsModule (ref), useInputMotionStatesModule (ref), useMotion (ref), controlStateModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), inputLabelModule (ref), getInputTextSizeModule (ref), inputHintModule (ref)
	local var20
	local var18 = withDefaultsModule(p0, t)
	local text = var18.label.text
	local position = var18.label.position or Enum.HorizontalAlignment.Right
	
	if typeof(text) == "string" then
		var20 = #text > 0
		var20 = nil
	else
		var20 = text ~= nil
	end
	local var21 = nil
	local var22 = nil
	
	if not flagsModule.FoundationInternalInputBeta then
		local var23, var24 = reactModule.useState(false)
		var21 = var23
		var22 = var24
	end
	local var25 = useTokensModule()
	local isChecked = var18.isChecked or var18.isIndeterminate
	local var27 = useInputVariantsModule(var25, var18.size, position)
	local var28 = reactModule.useMemo(function() --[[ line: 103 ]]
		-- upvalues: var18 (ref), var25 (ref)
		return {
			radius = var18.customVariantProps.cursorRadius or UDim.new(0, 0),
			offset = var25.Size.Size_200,
			borderWidth = var25.Stroke.Thicker
		}
	end, { var25, var20, var18.customVariantProps.cursorRadius })
	local var29 = useInputMotionStatesModule(var25, var18.customVariantProps.colors)
	local var30, var31 = useMotion(var29.Default)
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: flagsModule (copy), isChecked (ref), var31 (ref), var29 (ref), var21 (write)
		if flagsModule.FoundationInternalInputBeta then
			if isChecked then
				var31(var29.Checked)
				
				return
			end
			var31(var29.Default)
			
			return
		elseif isChecked then
			var31(var29.Checked)
			
			return
		elseif var21 then
			var31(var29.Hover)
			
			return
		end
		var31(var29.Default)
	end, if flagsModule.FoundationInternalInputBeta then { isChecked, var29 } else { isChecked, var21, var29 })
	local var32 = if flagsModule.FoundationInternalInputBeta then nil else reactModule.useCallback(function(p2) --[[ line: 140 ]]
		-- upvalues: var22 (write), controlStateModule (copy)
		var22(p2 == controlStateModule.Hover)
	end, {})
	local var33 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: var18 (ref)
		if var18.isDisabled then
			return
		end
		var18.onActivated(not var18.isChecked)
	end, { var18.isDisabled, var18.isChecked, var18.onActivated })
	local t_1 = {
		Selectable = if var18.isDisabled then false else var18.Selectable,
		NextSelectionUp = var18.NextSelectionUp,
		NextSelectionDown = var18.NextSelectionDown,
		NextSelectionLeft = var18.NextSelectionLeft,
		NextSelectionRight = var18.NextSelectionRight
	}
	local t_2 = {
		Active = not var18.isDisabled,
		GroupTransparency = if var18.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0,
		onActivated = var33,
		onStateChanged = if flagsModule.FoundationInternalInputBeta then nil else var32,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = if var20 then { Selectable = false } else t_1,
		cursor = if var20 then nil else var28,
		isDisabled = var18.isDisabled,
		ref = p1
	}
	local var36 = if var18.customVariantProps.stroke and var18.customVariantProps.stroke.thickness ~= nil then var18.customVariantProps.stroke.thickness else var27.input.stroke.thickness
	local t_3 = {
		tag = var18.customVariantProps.tag,
		Size = var18.customVariantProps.size - UDim2.fromOffset(var36, var36),
		backgroundStyle = var30.backgroundStyle,
		onActivated = var33,
		stateLayer = if flagsModule.FoundationInternalInputBeta then if flagsModule.FoundationInternalInputBeta then reactModule.useMemo(function() --[[ line: 177 ]]
			-- upvalues: stateLayerAffordanceModule (copy)
			return {
				inset = nil,
				mode = nil,
				affordance = stateLayerAffordanceModule.None
			}
		end, {}) else nil else { affordance = stateLayerAffordanceModule.Background },
		stroke = {
			Color = var30.strokeStyle:map(function(p3) --[[ line: 194 ]]
				return p3.Color3
			end),
			Transparency = var30.strokeStyle:map(function(p4) --[[ line: 197 ]]
				-- upvalues: var18 (ref), var20 (ref), constantsModule (copy)
				return if var18.isDisabled and not var20 then constantsModule.DISABLED_TRANSPARENCY else p4.Transparency
			end),
			Thickness = var36,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		},
		selection = t_1,
		cursor = if var20 then var28 else nil,
		LayoutOrder = if var20 then if position == Enum.HorizontalAlignment.Left then 1 else -1 else nil,
		testId = `{var18.testId}--container`
	}
	
	if not var20 then
		return reactModule.createElement(viewModule, withCommonPropsModule(var18, dashModule.union(t_2, t_3)), var18.children)
	end
	local var38 = if flagsModule.FoundationInternalInputBeta then if typeof(text) == "string" then reactModule.createElement(inputLabelModule, {
		Text = text,
		textStyle = var30.labelStyle,
		size = getInputTextSizeModule(var18.size),
		testId = `{var18.testId}--label`
	}) else text else nil
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var18, dashModule.union({
		tag = var27.container.tag,
		padding = {
			top = var27.container.padding,
			bottom = var27.container.padding,
			left = if position == Enum.HorizontalAlignment.Right then var27.container.padding else nil,
			right = if position == Enum.HorizontalAlignment.Left then var27.container.padding else nil
		}
	}, t_2)), {
		Input = reactModule.createElement(viewModule, t_3, var18.children),
		InputLabel = if not flagsModule.FoundationInternalInputBeta then if var18.label.hint == nil or var18.label.hint == "" then var38 else reactModule.createElement(viewModule, { tag = "col gap-xxsmall auto-xy" }, {
			InputLabel = var38,
			Hint = reactModule.createElement(inputHintModule, {
				LayoutOrder = 2,
				text = var18.label.hint,
				size = getInputTextSizeModule(var18.size),
				testId = `{var18.testId}--hint`
			})
		}) elseif typeof(text) == "string" then reactModule.createElement(inputLabelModule, {
			Text = text,
			textStyle = var30.labelStyle,
			size = getInputTextSizeModule(var18.size),
			testId = `{var18.testId}--label`
		}) else text
	})
end))