local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-empty",
	icon = {
		name = "icons/status/oof_xlarge",
		size = require(Foundation.Enums.IconSize).Large
	},
	text = TranslatorModule:FormatByKey("CommonUI.Controls.NoResultsFound"),
	button = {
		onActivated = nil,
		icon = require(Parent.BuilderIcons).Icon.TwoArrowsSpinClockwise,
		text = TranslatorModule:FormatByKey("CommonUI.Controls.Action.Refresh")
	}
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 49 | Named "Empty" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy), TextModule (copy), ButtonModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "col align-x-center align-y-center gap-small size-full auto-xy",
		ref = Ref
	}), {
		Icon = ReactModule.createElement(IconModule, {
			LayoutOrder = 1,
			name = WithDefaultsModuleResult.icon.name,
			size = WithDefaultsModuleResult.icon.size,
			style = UseTokensModule().Color.Content.Default
		}),
		Text = ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
			Text = WithDefaultsModuleResult.text,
			testId = `{WithDefaultsModuleResult.testId}--text`
		}),
		Button = if WithDefaultsModuleResult.button and WithDefaultsModuleResult.button.onActivated then ReactModule.createElement(ButtonModule, {
			LayoutOrder = 3,
			text = WithDefaultsModuleResult.button.text,
			icon = WithDefaultsModuleResult.button.icon,
			onActivated = WithDefaultsModuleResult.button.onActivated
		}) else nil
	})
end))