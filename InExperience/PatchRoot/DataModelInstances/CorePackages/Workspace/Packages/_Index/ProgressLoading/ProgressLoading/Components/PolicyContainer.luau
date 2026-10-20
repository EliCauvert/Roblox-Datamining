local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-system-contrast",
		Position = p1.position,
		Text = UseLocalizationFunction({
			antiAddictionText = "Authentication.Login.WeChat.AntiAddictionText"
		}).antiAddictionText
	})
end