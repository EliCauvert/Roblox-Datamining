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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), reactModule (ref), useTokensModule (ref), useInputVariantsModule (ref), useInputMotionStatesModule (ref), useMotion (ref), controlStateModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), inputLabelModule (ref), getInputTextSizeModule (ref), inputHintModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local text = var2.label.text
	local position = var2.label.position or Enum.HorizontalAlignment.Right
	
	if typeof(text) == "string" then
		var1 = #text > 0
		var1 = nil
	else
		var1 = text ~= nil
	end
	local var3 = nil
	local var4 = nil
	
	if not flagsModule.FoundationInternalInputBeta then
		local var5, var6 = reactModule.useState(false)
		var3 = var5
		var4 = var6
	end
	local var7 = useTokensModule()
	local isChecked = var2.isChecked or var2.isIndeterminate
	local var8 = useInputVariantsModule(var7, var2.size, position)
	local var9 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var7 (ref)
		return {
			radius = var2.customVariantProps.cursorRadius or UDim.new(0, 0),
			offset = var7.Size.Size_200,
			borderWidth = var7.Stroke.Thicker
		}
	end, { var7, var1, var2.customVariantProps.cursorRadius })
	local var10 = useInputMotionStatesModule(var7, var2.customVariantProps.colors)
	local var11, var12 = useMotion(var10.Default)
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), isChecked (ref), var12 (ref), var10 (ref), var3 (write)
		if flagsModule.FoundationInternalInputBeta then
			if isChecked then
				var12(var10.Checked)
				
				return
			end
			var12(var10.Default)
			
			return
		elseif isChecked then
			var12(var10.Checked)
			
			return
		elseif var3 then
			var12(var10.Hover)
			
			return
		end
		var12(var10.Default)
	end, if flagsModule.FoundationInternalInputBeta then { isChecked, var10 } else { isChecked, var3, var10 })
	local var13 = if flagsModule.FoundationInternalInputBeta then nil else reactModule.useCallback(function(p3)
		-- upvalues: var4 (write), controlStateModule (copy)
		var4(p3 == controlStateModule.Hover)
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		if var2.isDisabled then
			return
		end
		var2.onActivated(not var2.isChecked)
	end, { var2.isDisabled, var2.isChecked, var2.onActivated })
	local t_1 = {
		Selectable = if var2.isDisabled then false else var2.Selectable,
		NextSelectionUp = var2.NextSelectionUp,
		NextSelectionDown = var2.NextSelectionDown,
		NextSelectionLeft = var2.NextSelectionLeft,
		NextSelectionRight = var2.NextSelectionRight
	}
	local t_2 = {
		Active = not var2.isDisabled,
		GroupTransparency = if var2.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0,
		onActivated = var14,
		onStateChanged = if flagsModule.FoundationInternalInputBeta then nil else var13,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = if var1 then { Selectable = false } else t_1,
		cursor = if var1 then nil else var9,
		isDisabled = var2.isDisabled,
		ref = p2
	}
	local var15 = if var2.customVariantProps.stroke and var2.customVariantProps.stroke.thickness ~= nil then var2.customVariantProps.stroke.thickness else var8.input.stroke.thickness
	local t_3 = {
		tag = var2.customVariantProps.tag,
		Size = var2.customVariantProps.size - UDim2.fromOffset(var15, var15),
		backgroundStyle = var11.backgroundStyle,
		onActivated = var14,
		stateLayer = if flagsModule.FoundationInternalInputBeta then if flagsModule.FoundationInternalInputBeta then reactModule.useMemo(function()
			-- upvalues: stateLayerAffordanceModule (copy)
			return {
				inset = nil,
				mode = nil,
				affordance = stateLayerAffordanceModule.None
			}
		end, {}) else nil else { affordance = stateLayerAffordanceModule.Background },
		stroke = {
			Color = var11.strokeStyle:map(function(p3)
				return p3.Color3
			end),
			Transparency = var11.strokeStyle:map(function(p3)
				-- upvalues: var2 (ref), var1 (ref), constantsModule (copy)
				return if var2.isDisabled and not var1 then constantsModule.DISABLED_TRANSPARENCY else p3.Transparency
			end),
			Thickness = var15,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		},
		selection = t_1,
		cursor = if var1 then var9 else nil,
		LayoutOrder = if var1 then if position == Enum.HorizontalAlignment.Left then 1 else -1 else nil,
		testId = `{var2.testId}--container`
	}
	
	if not var1 then
		return reactModule.createElement(viewModule, withCommonPropsModule(var2, dashModule.union(t_2, t_3)), var2.children)
	end
	local var1 = if flagsModule.FoundationInternalInputBeta then if typeof(text) == "string" then reactModule.createElement(inputLabelModule, {
		Text = text,
		textStyle = var11.labelStyle,
		size = getInputTextSizeModule(var2.size),
		testId = `{var2.testId}--label`
	}) else text else nil
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, dashModule.union({
		tag = var8.container.tag,
		padding = {
			top = var8.container.padding,
			bottom = var8.container.padding,
			left = if position == Enum.HorizontalAlignment.Right then var8.container.padding else nil,
			right = if position == Enum.HorizontalAlignment.Left then var8.container.padding else nil
		}
	}, t_2)), {
		Input = reactModule.createElement(viewModule, t_3, var2.children),
		InputLabel = if not flagsModule.FoundationInternalInputBeta then if var2.label.hint == nil or var2.label.hint == "" then var1 else reactModule.createElement(viewModule, { tag = "col gap-xxsmall auto-xy" }, {
			InputLabel = var1,
			Hint = reactModule.createElement(inputHintModule, {
				LayoutOrder = 2,
				text = var2.label.hint,
				size = getInputTextSizeModule(var2.size),
				testId = `{var2.testId}--hint`
			})
		}) elseif typeof(text) == "string" then reactModule.createElement(inputLabelModule, {
			Text = text,
			textStyle = var11.labelStyle,
			size = getInputTextSizeModule(var2.size),
			testId = `{var2.testId}--label`
		}) else text
	})
end))