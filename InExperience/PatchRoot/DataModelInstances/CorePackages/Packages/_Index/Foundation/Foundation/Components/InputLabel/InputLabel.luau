local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local textModule = require(foundation.Components.Text)
local flagsModule = require(foundation.Utility.Flags)
local reactModule = require(parent.React)
local translatorModule = require(foundation.Utility.Localization.Translator)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local controlStateModule = require(foundation.Enums.ControlState)
local inputLabelSizeModule = require(foundation.Enums.InputLabelSize)

local function _(p0, p1) --[[ line: 44 | named "labelText" ]]
	-- upvalues: reactModule (ref), translatorModule (ref)
	return if p1 == nil or p1 == reactModule.None then p0 elseif p1 then p0 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p0 })
end

local t = {
	testId = "--foundation-input-label",
	size = inputLabelSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 59 | named "InputLabel" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), controlStateModule (ref), textModule (ref), withCommonPropsModule (ref), translatorModule (ref), stateLayerAffordanceModule (ref), flagsModule (ref), inputLabelSizeModule (ref)
	local var11 = withDefaultsModule(p2, t)
	local var12 = reactModule.useMemo(function() --[[ line: 61 ]]
		-- upvalues: var11 (ref), controlStateModule (copy)
		return if var11.onHover == nil then nil else function(p4) --[[ line: 63 ]]
			-- upvalues: var11 (copy), controlStateModule (copy)
			var11.onHover(p4 == controlStateModule.Hover)
		end
	end, { var11.onHover })
	local createElement = reactModule.createElement
	local t_1 = {}
	local text = var11.Text
	local isRequired = var11.isRequired
	t_1.Text = if isRequired == nil or isRequired == reactModule.None then text elseif isRequired then text .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = text })
	t_1.RichText = var11.RichText
	t_1.selection = { Selectable = false }
	t_1.onActivated = if not var11.isDisabled then var11.onActivated else nil
	t_1.onStateChanged = if not var11.isDisabled then var12 else nil
	t_1.stateLayer = { affordance = stateLayerAffordanceModule.None }
	t_1.textStyle = var11.textStyle
	t_1.tag = if flagsModule.FoundationInternalInputBeta then {
		["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
		["padding-top-xxsmall"] = var11.size ~= inputLabelSizeModule.XSmall,
		["content-muted"] = var11.isDisabled,
		["content-emphasis"] = not var11.isDisabled,
		["text-body-small"] = if var11.size ~= inputLabelSizeModule.Small then var11.size == inputLabelSizeModule.XSmall else true,
		["text-body-medium"] = var11.size == inputLabelSizeModule.Medium,
		["text-body-large"] = var11.size == inputLabelSizeModule.Large
	} else {
		["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
		["content-muted"] = var11.isDisabled,
		["content-default"] = not var11.isDisabled,
		["text-title-small"] = if var11.size ~= inputLabelSizeModule.Small then var11.size == inputLabelSizeModule.XSmall else true,
		["text-title-medium"] = var11.size == inputLabelSizeModule.Medium,
		["text-title-large"] = var11.size == inputLabelSizeModule.Large
	}
	t_1.ref = p3
	
	return createElement(textModule, withCommonPropsModule(var11, t_1))
end))