local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		backgroundStyle = if Frame.isChecked then UseTokensResult.Color.ActionSubEmphasis.Background else UseTokensResult.Color.Shift.Shift_200,
		onActivated = Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder
	}, {
		PillText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-align-x-center text-align-y-center text-no-wrap padding-x-xsmall text-truncate-end",
			Text = Frame.text,
			textStyle = if Frame.isChecked then UseTokensResult.Color.ActionSubEmphasis.Foreground else UseTokensResult.Color.Content.Emphasis,
			fontStyle = UseTokensResult.Typography.CaptionLarge
		})
	})
end