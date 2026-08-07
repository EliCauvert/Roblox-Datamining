-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 83 | named "InternalInput" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useTokensModule (ref), useInputVariantsModule (ref), useInputMotionStatesModule (ref), flagsModule (ref), useMotion (ref), controlStateModule (ref), constantsModule (ref), stateLayerAffordanceModule (ref), viewModule (ref), withCommonPropsModule (ref), dashModule (ref), inputLabelModule (ref), getInputTextSizeModule (ref)
	local var19
	local var17 = withDefaultsModule(p0, t)
	local text = var17.label.text
	local position = var17.label.position or Enum.HorizontalAlignment.Right
	
	if typeof(text) == "string" then
		var19 = #text > 0
		var19 = nil
	else
		var19 = text ~= nil
	end
	local var20, var21 = reactModule.useState(false)
	local var22 = useTokensModule()
	local isChecked = var17.isChecked or var17.isIndeterminate
	local var24 = useInputVariantsModule(var22, var17.size, position)
	local var25 = reactModule.useMemo(function() --[[ line: 96 ]]
		-- upvalues: var17 (ref), var22 (ref)
		return {
			radius = var17.customVariantProps.cursorRadius or UDim.new(0, 0),
			offset = var22.Size.Size_200,
			borderWidth = var22.Stroke.Thicker
		}
	end, { var22, var19, var17.customVariantProps.cursorRadius })
	local var26 = useInputMotionStatesModule(var22, if flagsModule.FoundationToggleVisualUpdate then var17.customVariantProps.colors else var17.customVariantProps.checkedStyle)
	local var27, var28 = useMotion(var26.Default)
	reactModule.useEffect(function() --[[ line: 113 ]]
		-- upvalues: isChecked (ref), var28 (ref), var26 (ref), var20 (ref)
		if isChecked then
			var28(var26.Checked)
			
			return
		elseif var20 then
			var28(var26.Hover)
			
			return
		end
		var28(var26.Default)
	end, { isChecked, var20, var26 })
	local var29 = reactModule.useCallback(function(p2) --[[ line: 123 ]]
		-- upvalues: var21 (ref), controlStateModule (copy)
		var21(p2 == controlStateModule.Hover)
	end, {})
	local var30 = reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var17 (ref)
		if var17.isDisabled then
			return
		end
		var17.onActivated(not var17.isChecked)
	end, { var17.isDisabled, var17.isChecked, var17.onActivated })
	local t_1 = {
		Selectable = if var17.isDisabled then false else var17.Selectable,
		NextSelectionUp = var17.NextSelectionUp,
		NextSelectionDown = var17.NextSelectionDown,
		NextSelectionLeft = var17.NextSelectionLeft,
		NextSelectionRight = var17.NextSelectionRight
	}
	local t_2 = {
		Active = not var17.isDisabled,
		GroupTransparency = if var17.isDisabled then constantsModule.DISABLED_TRANSPARENCY else 0,
		onActivated = var30,
		onStateChanged = var29,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		selection = if var19 then { Selectable = false } else t_1,
		cursor = if var19 then nil else var25,
		isDisabled = var17.isDisabled,
		ref = p1
	}
	local var33 = if flagsModule.FoundationToggleVisualUpdate and var17.customVariantProps.stroke and var17.customVariantProps.stroke.thickness ~= nil then var17.customVariantProps.stroke.thickness else var24.input.stroke.thickness
	local t_3 = {
		tag = var17.customVariantProps.tag,
		Size = var17.customVariantProps.size - UDim2.fromOffset(var33, var33),
		backgroundStyle = var27.backgroundStyle,
		onActivated = var30,
		stateLayer = { affordance = stateLayerAffordanceModule.Background },
		stroke = {
			Color = var27.strokeStyle:map(function(p3) --[[ line: 168 ]]
				return p3.Color3
			end),
			Transparency = var27.strokeStyle:map(function(p4) --[[ line: 171 ]]
				-- upvalues: var17 (ref), var19 (ref), constantsModule (copy)
				return if var17.isDisabled and not var19 then constantsModule.DISABLED_TRANSPARENCY else p4.Transparency
			end),
			Thickness = var33,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner
		},
		selection = t_1,
		cursor = if var19 then var25 else nil,
		LayoutOrder = if var19 then if position == Enum.HorizontalAlignment.Left then 1 else -1 else nil,
		testId = `{var17.testId}--container`
	}
	
	return if var19 then reactModule.createElement(viewModule, withCommonPropsModule(var17, dashModule.union({
		tag = var24.container.tag,
		padding = {
			top = var24.container.padding,
			bottom = var24.container.padding,
			left = if position == Enum.HorizontalAlignment.Right then var24.container.padding else nil,
			right = if position == Enum.HorizontalAlignment.Left then var24.container.padding else nil
		}
	}, t_2)), {
		Input = reactModule.createElement(viewModule, t_3, var17.children),
		InputLabel = if typeof(text) == "string" then reactModule.createElement(inputLabelModule, {
			Text = text,
			textStyle = var27.labelStyle,
			size = getInputTextSizeModule(var17.size),
			testId = `{var17.testId}--label`
		}) else text
	}) else reactModule.createElement(viewModule, withCommonPropsModule(var17, dashModule.union(t_2, t_3)), var17.children)
end))