local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FeedbackAlert = FoundationModule.FeedbackAlert
local AlertSeverity = FoundationModule.Enums.AlertSeverity
local config = { message = "Feature.InExperienceShop.Label.PreviewBanner" }

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FeedbackAlert (copy), AlertSeverity (copy)
	return ReactModule.createElement(FeedbackAlert, {
		testId = "CreatorEarlyAccessBanner",
		severity = AlertSeverity.Info,
		title = UseLocalizationFunction(config).message,
		LayoutOrder = Frame.LayoutOrder
	})
end