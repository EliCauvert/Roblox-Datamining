local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Alert, _ = require(AppChat.Utils.loadFoundationCloudAsset)("pictograms/alert")

return ReactModule.memo(function()
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), Alert (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col align-x-center size-full-0 auto-xy padding-xxlarge bg-action-subtle",
		testId = "MomentShareCardUnavailable"
	}, {
		UnavailableImage = ReactModule.createElement(FoundationModule.Image, {
			tag = "size-1600 content-system-contrast",
			testId = "MomentShareCardUnavailableImage",
			LayoutOrder = 1,
			Image = Alert,
			ScaleType = Enum.ScaleType.Fit
		}),
		UnavailableText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-body-large text-wrap text-align-x-center content-system-contrast",
			LayoutOrder = 2,
			Text = UseLocalizationFunction({
				momentUnavailable = "Feature.Moments.Label.MomentUnavailableDefault"
			}).momentUnavailable
		})
	})
end)