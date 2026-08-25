local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local feedbackAlert = foundationModule.FeedbackAlert
local alertSeverity = foundationModule.Enums.AlertSeverity
local t = { message = "Feature.InExperienceShop.Label.PreviewBanner" }

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), feedbackAlert (ref), alertSeverity (ref)
	return reactModule.createElement(feedbackAlert, {
		testId = "CreatorEarlyAccessBanner",
		severity = alertSeverity.Info,
		title = useLocalization(t).message,
		LayoutOrder = p0.LayoutOrder
	})
end