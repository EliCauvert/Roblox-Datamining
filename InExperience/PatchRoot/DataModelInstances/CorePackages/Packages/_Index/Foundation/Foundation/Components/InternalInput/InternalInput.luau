local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
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
local inputSizeModule = require(foundation.Enums.InputSize)
local _ = require(foundation.Enums.CursorType)
local _ = require(foundation.Providers.Style.Tokens)
local t = {
	Selectable = true,
	testId = "--foundation-internal-input",
	size = inputSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useInputVariantsModule (ref), reactModule (ref), useInputMotionStatesModule (ref), useMotion (ref), constantsModule (ref), stateLayerAffordanceModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), inputLabelModule (ref), getInputTextSizeModule (ref), inputHintModule (ref)
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
	local var3 = useTokensModule()
	local isChecked = var2.isChecked or var2.isIndeterminate
	local var4 = useInputVariantsModule(var3, var2.size, position)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref)
		return {
			radius = var2.customVariantProps.cursorRadius or UDim.new(0, 0),
			offset = var3.Size.Size_200,
			borderWidth = var3.Stroke.Thicker
		}
	end, { var3, var1, var2.customVariantProps.cursorRadius })
	local var6 = useInputMotionStatesModule(var3, var2.customVariantProps.colors)
	local var7, var8 = useMotion(var6.Default)
	reactModule.useEffect(function()
		-- upvalues: isChecked (ref), var8 (ref), var6 (ref)
		if isChecked then
			var8(var6.Checked)
			
			return
		end
		var8(var6.Default)
	end, { isChecked, var6 })
	local var9 = reactModule.useCallback(function()
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
		onActivated = var9,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = if var1 then { Selectable = false } else t_1,
		cursor = if var1 then nil else var5,
		isDisabled = var2.isDisabled,
		ref = p2
	}
	local var10 = if var2.customVariantProps.stroke and var2.customVariantProps.stroke.thickness ~= nil then var2.customVariantProps.stroke.thickness else var4.input.stroke.thickness
	local t_3 = {
		tag = var2.customVariantProps.tag,
		Size = var2.customVariantProps.size - UDim2.fromOffset(var10, var10),
		backgroundStyle = var7.backgroundStyle,
		onActivated = var9,
		stateLayer = reactModule.useMemo(function()
			-- upvalues: stateLayerAffordanceModule (copy)
			return {
				inset = nil,
				mode = nil,
				affordance = stateLayerAffordanceModule.None
			}
		end, {}),
		stroke = {
			Color = var7.strokeStyle:map(function(p3)
				return p3.Color3
			end),
			Transparency = var7.strokeStyle:map(function(p3)
				-- upvalues: var2 (ref), var1 (ref), constantsModule (copy)
				return if var2.isDisabled and not var1 then constantsModule.DISABLED_TRANSPARENCY else p3.Transparency
			end),
			Thickness = var10,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		},
		selection = t_1,
		cursor = if var1 then var5 else nil,
		LayoutOrder = if var1 then if position == Enum.HorizontalAlignment.Left then 1 else -1 else nil,
		testId = `{var2.testId}--container`
	}
	
	if not var1 then
		return reactModule.createElement(viewModule, withCommonPropsModule(var2, dashModule.union(t_2, t_3)), var2.children)
	end
	local var11 = if typeof(text) == "string" then reactModule.createElement(inputLabelModule, {
		Text = text,
		textStyle = var7.labelStyle,
		size = getInputTextSizeModule(var2.size),
		testId = `{var2.testId}--label`
	}) else text
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var2, dashModule.union({
		tag = var4.container.tag,
		padding = {
			top = var4.container.padding,
			bottom = var4.container.padding,
			left = if position == Enum.HorizontalAlignment.Right then var4.container.padding else nil,
			right = if position == Enum.HorizontalAlignment.Left then var4.container.padding else nil
		}
	}, t_2)), {
		Input = reactModule.createElement(viewModule, t_3, var2.children),
		InputLabel = if var2.label.hint == nil or var2.label.hint == "" then var11 else reactModule.createElement(viewModule, { tag = "col gap-xxsmall auto-xy" }, {
			InputLabel = var11,
			Hint = reactModule.createElement(inputHintModule, {
				LayoutOrder = 2,
				text = var2.label.hint,
				size = getInputTextSizeModule(var2.size),
				testId = `{var2.testId}--hint`
			})
		})
	})
end))