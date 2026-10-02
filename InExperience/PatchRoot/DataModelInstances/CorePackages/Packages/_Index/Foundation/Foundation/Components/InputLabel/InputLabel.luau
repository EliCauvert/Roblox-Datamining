local foundation = script:FindFirstAncestor("Foundation")
local textModule = require(foundation.Components.Text)
local reactModule = require(foundation.Parent.React)
local translatorModule = require(foundation.Utility.Localization.Translator)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local controlStateModule = require(foundation.Enums.ControlState)
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)

local function _(p1, p2)
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p2 == nil or p2 == reactModule.None then p1 elseif p2 then p1 .. " *" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p1 })
end

local t = {
	testId = "--foundation-input-label",
	size = inputLabelSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), controlStateModule (ref), textModule (ref), withCommonPropsModule (ref), translatorModule (ref), stateLayerAffordanceModule (ref), inputLabelSizeModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), controlStateModule (copy)
		return if var1.onHover == nil then nil else function(p3)
			-- upvalues: var1 (copy), controlStateModule (copy)
			var1.onHover(p3 == controlStateModule.Hover)
		end
	end, { var1.onHover })
	local createElement = reactModule.createElement
	local t_1 = {}
	local text = var1.Text
	local isRequired = var1.isRequired
	t_1.Text = if isRequired == nil or isRequired == reactModule.None then text elseif isRequired then text .. " *" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t_1.RichText = var1.RichText
	t_1.selection = { Selectable = false }
	t_1.onActivated = if not var1.isDisabled then var1.onActivated else nil
	t_1.onStateChanged = if not var1.isDisabled then var2 else nil
	t_1.stateLayer = { affordance = stateLayerAffordanceModule.None }
	t_1.textStyle = var1.textStyle
	t_1.tag = {
		["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
		["padding-top-xxsmall"] = var1.size ~= inputLabelSizeModule.XSmall,
		["content-muted"] = var1.isDisabled,
		["content-emphasis"] = not var1.isDisabled,
		["text-body-small"] = if var1.size ~= inputLabelSizeModule.Small then var1.size == inputLabelSizeModule.XSmall else true,
		["text-body-medium"] = var1.size == inputLabelSizeModule.Medium,
		["text-body-large"] = var1.size == inputLabelSizeModule.Large
	}
	t_1.ref = p2
	
	return createElement(textModule, withCommonPropsModule(var1, t_1))
end))