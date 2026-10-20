local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ControlStateModule = require(Foundation.Enums.ControlState)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseLinkVariantsModule = require(script.Parent.useLinkVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local config = {
	[ControlStateModule.Hover] = true,
	[ControlStateModule.Pressed] = true,
	[ControlStateModule.Selected] = true,
	[ControlStateModule.SelectedPressed] = true
}
local config1 = {
	hasUnderline = false,
	testId = "--foundation-link",
	variant = require(Foundation.Enums.LinkVariant).Standard,
	size = require(Foundation.Enums.InputSize).Medium,
	textOverflow = require(Foundation.Enums.TextOverflow).None
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseTokensModule (copy), UseLinkVariantsModule (copy), ReactModule (copy), config (copy), ViewModule (copy), WithCommonPropsModule (copy), StateLayerAffordanceModule (copy), TextModule (copy), EscapeRichTextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseTokensModuleResult = UseTokensModule()
	local UseLinkVariantsModuleResult = UseLinkVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, WithDefaultsModuleResult.variant, WithDefaultsModuleResult.textOverflow)
	local Style = UseLinkVariantsModuleResult.content.style
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local HasUnderline = WithDefaultsModuleResult.hasUnderline or UseStateResult
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseLinkVariantsModuleResult.container.tag,
		cursor = ReactModule.useMemo(function()
			-- upvalues: UseTokensModuleResult (copy)
			return {
				radius = UDim.new(0, UseTokensModuleResult.Radius.XSmall),
				offset = UseTokensModuleResult.Size.Size_50,
				borderWidth = UseTokensModuleResult.Stroke.Standard
			}
		end, { UseTokensModuleResult }),
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		onActivated = WithDefaultsModuleResult.onActivated,
		onStateChanged = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy), config (upval)
			UseStateResult2(config[p2] == true)
		end, {}),
		selection = {
			Selectable = WithDefaultsModuleResult.Selectable,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
			NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
		},
		ref = Ref
	}), {
		Text = ReactModule.createElement(TextModule, {
			LayoutOrder = 1,
			Text = if HasUnderline then `<u>{EscapeRichTextModule(WithDefaultsModuleResult.text)}</u>` else WithDefaultsModuleResult.text,
			RichText = HasUnderline,
			tag = UseLinkVariantsModuleResult.text.tag,
			textStyle = { Color3 = Style.Color3, Transparency = Style.Transparency },
			testId = `{WithDefaultsModuleResult.testId}--text`
		})
	})
end))