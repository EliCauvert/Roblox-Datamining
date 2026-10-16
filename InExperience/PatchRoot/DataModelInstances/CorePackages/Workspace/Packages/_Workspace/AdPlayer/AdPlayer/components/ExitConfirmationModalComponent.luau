local Parent = script:FindFirstAncestor("AdPlayer").Parent
local AdsDisplayOrder = require(Parent.AdGuiInteractivity).AdsDisplayOrder
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local config = {
	confirmationText = "CoreScripts.Ads.Label.RewardedVideoExitConfirmation"
}

return function(p1) --[[ Line: 24 | Named "ExitConfirmationModalComponent" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), AdsDisplayOrder (copy), View (copy), StateLayerAffordance (copy), Text (copy), Button (copy), FillBehavior (copy), ButtonVariant (copy)
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = AdsDisplayOrder.Modal,
		Enabled = p1.Enabled
	}, {
		modal = ReactModule.createElement(View, {
			tag = "anchor-center-center position-center-center bg-over-media-0 radius-medium padding-x-xxlarge padding-y-xxlarge",
			Size = UDim2.fromOffset(440, 164),
			onActivated = function() --[[ Line: 35 ]] end,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			ReactModule.createElement(Text, {
				tag = "size-full-1100 position-top-center anchor-top-center text-align-x-left",
				TextScaled = true,
				Text = UseLocalizationFunction(config).confirmationText
			}),
			buttonContainer = ReactModule.createElement(View, {
				tag = "size-full-1200 anchor-bottom-center position-bottom-center row gap-medium flex-fill"
			}, {
				cancelExitButton = ReactModule.createElement(Button, {
					text = "Continue",
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					variant = ButtonVariant.Emphasis,
					onActivated = p1.onCancel
				}),
				confirmExitButton = ReactModule.createElement(Button, {
					text = "Exit",
					LayoutOrder = 2,
					fillBehavior = FillBehavior.Fill,
					width = UDim.new(1, 0),
					variant = ButtonVariant.Standard,
					onActivated = p1.onConfirm
				})
			})
		})
	})
end