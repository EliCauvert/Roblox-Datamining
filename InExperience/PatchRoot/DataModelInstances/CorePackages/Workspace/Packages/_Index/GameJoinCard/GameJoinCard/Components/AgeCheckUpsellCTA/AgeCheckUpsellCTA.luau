local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local button = foundationModule.Button
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local dividerVariant = foundationModule.Enums.DividerVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local inputSize = foundationModule.Enums.InputSize
local useLocalization = localizationModule.Hooks.useLocalization

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), divider (ref), dividerVariant (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var3 = useLocalization({
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		bodyText = "Feature.FAE.CheckIfYouCanJoinGame"
	})
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Banner = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
			TopDivider = reactModule.createElement(divider, { LayoutOrder = 1, variant = dividerVariant.Default }),
			BannerContent = reactModule.createElement(view, {
				tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y padding-y-medium",
				LayoutOrder = 2
			}, {
				BannerIcon = reactModule.createElement(icon, {
					tag = "content-emphasis",
					name = iconName.LockClosed,
					size = iconSize.Large,
					variant = iconVariant.Regular
				}),
				BannerText = reactModule.createElement(text, {
					tag = "shrink auto-xy text-wrap text-align-x-left text-body-medium content-emphasis",
					Text = var3.bodyText
				})
			})
		}),
		UnlockButton = reactModule.createElement(button, {
			LayoutOrder = 2,
			text = var3.unlock,
			onActivated = p0.onUnlockPressed,
			variant = buttonVariant.Emphasis,
			inputSize = inputSize.Medium,
			width = UDim.new(1, 0)
		})
	})
end