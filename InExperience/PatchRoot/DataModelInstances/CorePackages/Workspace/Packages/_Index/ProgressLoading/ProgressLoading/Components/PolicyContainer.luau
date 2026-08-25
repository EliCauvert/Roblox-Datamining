local parent = script:FindFirstAncestor("ProgressLoading").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Text, {
		tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-center content-system-contrast",
		Position = p0.position,
		Text = useLocalization({
			antiAddictionText = "Authentication.Login.WeChat.AntiAddictionText"
		}).antiAddictionText
	})
end