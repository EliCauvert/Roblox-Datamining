local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local t = { readOnly = "Feature.Moments.Label.CommentsReadOnly" }

return function()
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		tag = "auto-xy text-body-small content-muted",
		testId = "moments-comments-read-only",
		Text = useLocalization(t).readOnly
	})
end