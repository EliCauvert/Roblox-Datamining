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

local function _(p0, p1) --[[ line: 43 | named "labelText" ]]
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p1 == nil or p1 == reactModule.None then p0 elseif p1 then p0 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p0 })
end

local t = {
	testId = "--foundation-input-label",
	size = inputLabelSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 58 | named "InputLabel" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), controlStateModule (ref), textModule (ref), withCommonPropsModule (ref), translatorModule (ref), stateLayerAffordanceModule (ref), inputLabelSizeModule (ref)
	local var10 = withDefaultsModule(p2, t)
	local var11 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: var10 (ref), controlStateModule (copy)
		return if var10.onHover == nil then nil else function(p4) --[[ line: 62 ]]
			-- upvalues: var10 (copy), controlStateModule (copy)
			var10.onHover(p4 == controlStateModule.Hover)
		end
	end, { var10.onHover })
	local createElement = reactModule.createElement
	local t_1 = {}
	local text = var10.Text
	local isRequired = var10.isRequired
	t_1.Text = if isRequired == nil or isRequired == reactModule.None then text elseif isRequired then text .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t_1.RichText = var10.RichText
	t_1.selection = { Selectable = false }
	t_1.onActivated = if not var10.isDisabled then var10.onActivated else nil
	t_1.onStateChanged = if not var10.isDisabled then var11 else nil
	t_1.stateLayer = { affordance = stateLayerAffordanceModule.None }
	t_1.textStyle = var10.textStyle
	t_1.tag = {
		["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
		["content-muted"] = var10.isDisabled,
		["content-default"] = not var10.isDisabled,
		["text-title-small"] = var10.size == inputLabelSizeModule.Small,
		["text-title-medium"] = var10.size == inputLabelSizeModule.Medium,
		["text-title-large"] = var10.size == inputLabelSizeModule.Large
	}
	t_1.ref = p3
	
	return createElement(textModule, withCommonPropsModule(var10, t_1))
end))