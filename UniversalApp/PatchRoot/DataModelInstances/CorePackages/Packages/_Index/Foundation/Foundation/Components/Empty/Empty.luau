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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), iconModule (ref), textModule (ref), buttonModule (ref)
	local var12 = withDefaultsModule(p0, t)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var12, {
		tag = "col align-x-center align-y-center gap-small size-full auto-xy",
		ref = p1
	}), {
		Icon = reactModule.createElement(iconModule, {
			LayoutOrder = 1,
			name = var12.icon.name,
			size = var12.icon.size,
			style = useTokensModule().Color.Content.Default
		}),
		Text = reactModule.createElement(textModule, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-large text-wrap text-align-x-center content-default",
			Text = var12.text,
			testId = `{var12.testId}--text`
		}),
		Button = if var12.button and var12.button.onActivated then reactModule.createElement(buttonModule, {
			LayoutOrder = 3,
			text = var12.button.text,
			icon = var12.button.icon,
			onActivated = var12.button.onActivated
		}) else nil
	})
end))