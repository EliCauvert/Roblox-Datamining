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

local function labelText(p0, p1)
	-- upvalues: reactModule (ref), flagsModule (ref), translatorModule (ref)
	return if p1 == nil or p1 == reactModule.None then p0 elseif p1 then if flagsModule.FoundationIncludeSpaceRequiredLabel then p0 .. " *" else p0 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p0 })
end

local t = {
	testId = "--foundation-input-label",
	size = inputLabelSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), controlStateModule (ref), textModule (ref), withCommonPropsModule (ref), labelText (ref), stateLayerAffordanceModule (ref), flagsModule (ref), inputLabelSizeModule (ref)
	local var12 = withDefaultsModule(p2, t)
	
	return reactModule.createElement(textModule, withCommonPropsModule(var12, {
		Text = labelText(var12.Text, var12.isRequired),
		RichText = var12.RichText,
		selection = { Selectable = false },
		onActivated = if not var12.isDisabled then var12.onActivated else nil,
		onStateChanged = if not var12.isDisabled then reactModule.useMemo(function()
			-- upvalues: var12 (ref), controlStateModule (copy)
			return if var12.onHover == nil then nil else function(p4)
				-- upvalues: var12 (copy), controlStateModule (copy)
				var12.onHover(p4 == controlStateModule.Hover)
			end
		end, { var12.onHover }) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		textStyle = var12.textStyle,
		tag = if flagsModule.FoundationInternalInputBeta then {
			["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
			["padding-top-xxsmall"] = var12.size ~= inputLabelSizeModule.XSmall,
			["content-muted"] = var12.isDisabled,
			["content-emphasis"] = not var12.isDisabled,
			["text-body-small"] = if var12.size ~= inputLabelSizeModule.Small then var12.size == inputLabelSizeModule.XSmall else true,
			["text-body-medium"] = var12.size == inputLabelSizeModule.Medium,
			["text-body-large"] = var12.size == inputLabelSizeModule.Large
		} else {
			["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
			["content-muted"] = var12.isDisabled,
			["content-default"] = not var12.isDisabled,
			["text-title-small"] = if var12.size ~= inputLabelSizeModule.Small then var12.size == inputLabelSizeModule.XSmall else true,
			["text-title-medium"] = var12.size == inputLabelSizeModule.Medium,
			["text-title-large"] = var12.size == inputLabelSizeModule.Large
		},
		ref = p3
	}))
end))