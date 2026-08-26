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

local function labelText(p1, p2)
	-- upvalues: reactModule (ref), flagsModule (ref), translatorModule (ref)
	return if p2 == nil or p2 == reactModule.None then p1 elseif p2 then if flagsModule.FoundationIncludeSpaceRequiredLabel then p1 .. " *" else p1 .. "*" else translatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = p1 })
end

local t = {
	testId = "--foundation-input-label",
	size = inputLabelSizeModule.Medium
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), controlStateModule (ref), textModule (ref), withCommonPropsModule (ref), labelText (ref), stateLayerAffordanceModule (ref), flagsModule (ref), inputLabelSizeModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(textModule, withCommonPropsModule(var1, {
		Text = labelText(var1.Text, var1.isRequired),
		RichText = var1.RichText,
		selection = { Selectable = false },
		onActivated = if not var1.isDisabled then var1.onActivated else nil,
		onStateChanged = if not var1.isDisabled then reactModule.useMemo(function()
			-- upvalues: var1 (ref), controlStateModule (copy)
			return if var1.onHover == nil then nil else function(p3)
				-- upvalues: var1 (copy), controlStateModule (copy)
				var1.onHover(p3 == controlStateModule.Hover)
			end
		end, { var1.onHover }) else nil,
		stateLayer = { affordance = stateLayerAffordanceModule.None },
		textStyle = var1.textStyle,
		tag = if flagsModule.FoundationInternalInputBeta then {
			["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
			["padding-top-xxsmall"] = var1.size ~= inputLabelSizeModule.XSmall,
			["content-muted"] = var1.isDisabled,
			["content-emphasis"] = not var1.isDisabled,
			["text-body-small"] = if var1.size ~= inputLabelSizeModule.Small then var1.size == inputLabelSizeModule.XSmall else true,
			["text-body-medium"] = var1.size == inputLabelSizeModule.Medium,
			["text-body-large"] = var1.size == inputLabelSizeModule.Large
		} else {
			["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
			["content-muted"] = var1.isDisabled,
			["content-default"] = not var1.isDisabled,
			["text-title-small"] = if var1.size ~= inputLabelSizeModule.Small then var1.size == inputLabelSizeModule.XSmall else true,
			["text-title-medium"] = var1.size == inputLabelSizeModule.Medium,
			["text-title-large"] = var1.size == inputLabelSizeModule.Large
		},
		ref = p2
	}))
end))