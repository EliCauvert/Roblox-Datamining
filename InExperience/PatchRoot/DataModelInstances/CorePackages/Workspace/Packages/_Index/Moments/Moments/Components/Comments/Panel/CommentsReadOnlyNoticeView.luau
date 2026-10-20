local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = { readOnly = "Feature.Moments.Label.CommentsReadOnly" }

return function()
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Text, {
		tag = "auto-xy text-body-small content-muted",
		testId = "moments-comments-read-only",
		Text = UseLocalizationFunction(config).readOnly
	})
end