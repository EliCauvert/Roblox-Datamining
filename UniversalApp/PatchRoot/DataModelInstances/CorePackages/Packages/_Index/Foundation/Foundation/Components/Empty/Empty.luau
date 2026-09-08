local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local buttonModule = require(foundation.Components.Button)
local iconModule = require(foundation.Components.Icon)
local iconSizeModule = require(foundation.Enums.IconSize)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local translatorModule = require(foundation.Utility.Localization.Translator)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-empty",
	icon = {
		name = "icons/status/oof_xlarge",
		size = iconSizeModule.Large
	},
	text = translatorModule:FormatByKey("CommonUI.Controls.NoResultsFound"),
	button = {
		onActivated = nil,
		icon = icon.TwoArrowsSpinClockwise,
		text = translatorModule:FormatByKey("CommonUI.Controls.Action.Refresh")
	}
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref), buttonModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, {
		tag = "col align-x-center align-y-center gap-small size-full auto-xy",
		ref = p2
	}), {
		Icon = reactModule.createElement(iconModule, {
			LayoutOrder = 1,
			name = var1.icon.name,
			size = var1.icon.size,
			style = useTokensModule().Color.Content.Default
		}),
		Text = reactModule.createElement(textModule, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
			Text = var1.text,
			testId = `{var1.testId}--text`
		}),
		Button = if var1.button and var1.button.onActivated then reactModule.createElement(buttonModule, {
			LayoutOrder = 3,
			text = var1.button.text,
			icon = var1.button.icon,
			onActivated = var1.button.onActivated
		}) else nil
	})
end))