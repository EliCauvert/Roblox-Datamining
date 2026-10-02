local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local var1, _ = require(appChat.Utils.loadFoundationCloudAsset)("pictograms/alert")

return reactModule.memo(function()
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref), var1 (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col align-x-center size-full-0 auto-xy padding-xxlarge bg-action-subtle",
		testId = "MomentShareCardUnavailable"
	}, {
		UnavailableImage = reactModule.createElement(foundationModule.Image, {
			tag = "size-1600 content-system-contrast",
			testId = "MomentShareCardUnavailableImage",
			LayoutOrder = 1,
			Image = var1,
			ScaleType = Enum.ScaleType.Fit
		}),
		UnavailableText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-body-large text-wrap text-align-x-center content-system-contrast",
			LayoutOrder = 2,
			Text = useLocalization({
				momentUnavailable = "Feature.Moments.Label.MomentUnavailableDefault"
			}).momentUnavailable
		})
	})
end)