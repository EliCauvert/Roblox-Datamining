local parent = script:FindFirstAncestor("AdPlayer").Parent
local adsDisplayOrder = require(parent.AdGuiInteractivity).AdsDisplayOrder
local useLocalization = require(parent.Localization).Hooks.useLocalization
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local t = {
	confirmationText = "CoreScripts.Ads.Label.RewardedVideoExitConfirmation"
}

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), adsDisplayOrder (ref), view (ref), stateLayerAffordance (ref), text (ref), button (ref), fillBehavior (ref), buttonVariant (ref)
	return reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = adsDisplayOrder.Modal,
		Enabled = p0.Enabled
	}, {
		modal = reactModule.createElement(view, {
			tag = "anchor-center-center position-center-center bg-over-media-0 radius-medium padding-x-xxlarge padding-y-xxlarge",
			Size = UDim2.fromOffset(440, 164),
			onActivated = function() end,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			reactModule.createElement(text, {
				tag = "size-full-1100 position-top-center anchor-top-center text-align-x-left",
				TextScaled = true,
				Text = useLocalization(t).confirmationText
			}),
			buttonContainer = reactModule.createElement(view, {
				tag = "size-full-1200 anchor-bottom-center position-bottom-center row gap-medium flex-fill"
			}, {
				cancelExitButton = reactModule.createElement(button, {
					text = "Continue",
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					variant = buttonVariant.Emphasis,
					onActivated = p0.onCancel
				}),
				confirmExitButton = reactModule.createElement(button, {
					text = "Exit",
					LayoutOrder = 2,
					fillBehavior = fillBehavior.Fill,
					width = UDim.new(1, 0),
					variant = buttonVariant.Standard,
					onActivated = p0.onConfirm
				})
			})
		})
	})
end