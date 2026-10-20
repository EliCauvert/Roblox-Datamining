local Foundation = script:FindFirstAncestor("Foundation")
local TextModule = require(Foundation.Components.Text)
local ReactModule = require(Foundation.Parent.React)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local ControlStateModule = require(Foundation.Enums.ControlState)
local InputLabelSizeModule = require(Foundation.Enums.InputLabelSize)

local function _(InputLabel, None)
	-- upvalues: ReactModule (copy), TranslatorModule (copy)
	return if None == nil or None == ReactModule.None then InputLabel elseif None then InputLabel .. "*" else TranslatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = InputLabel })
end

local config = {
	testId = "--foundation-input-label",
	size = InputLabelSizeModule.Medium
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), ControlStateModule (copy), TextModule (copy), WithCommonPropsModule (copy), TranslatorModule (copy), StateLayerAffordanceModule (copy), InputLabelSizeModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), ControlStateModule (upval)
		return if WithDefaultsModuleResult.onHover == nil then nil else function(Hover)
			-- upvalues: WithDefaultsModuleResult (upval), ControlStateModule (upval)
			WithDefaultsModuleResult.onHover(Hover == ControlStateModule.Hover)
		end
	end, { WithDefaultsModuleResult.onHover })
	local Text = WithDefaultsModuleResult.Text
	local IsRequired = WithDefaultsModuleResult.isRequired
	
	return ReactModule.createElement(TextModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		Text = if IsRequired == nil or IsRequired == ReactModule.None then Text elseif IsRequired then Text .. "*" else TranslatorModule:FormatByKey("CommonUI.Controls.Input.Optional", { inputLabel = Text }),
		RichText = WithDefaultsModuleResult.RichText,
		selection = { Selectable = false },
		onActivated = if WithDefaultsModuleResult.isDisabled then nil else WithDefaultsModuleResult.onActivated,
		onStateChanged = if WithDefaultsModuleResult.isDisabled then nil else UseMemoResult,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		textStyle = WithDefaultsModuleResult.textStyle,
		tag = {
			["size-0 auto-xy text-wrap text-align-x-left text-align-y-top"] = true,
			["content-muted"] = WithDefaultsModuleResult.isDisabled,
			["content-default"] = not WithDefaultsModuleResult.isDisabled,
			["text-title-small"] = WithDefaultsModuleResult.size == InputLabelSizeModule.Small,
			["text-title-medium"] = WithDefaultsModuleResult.size == InputLabelSizeModule.Medium,
			["text-title-large"] = WithDefaultsModuleResult.size == InputLabelSizeModule.Large
		},
		ref = Ref
	}))
end))