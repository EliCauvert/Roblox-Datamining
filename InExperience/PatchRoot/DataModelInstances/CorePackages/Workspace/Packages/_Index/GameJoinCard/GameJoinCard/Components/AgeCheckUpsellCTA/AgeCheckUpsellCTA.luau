local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local Divider = FoundationModule.Divider
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DividerVariant = FoundationModule.Enums.DividerVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagDesktopGameJoinCardGamepadSupport = SharedFlagsModule.FFlagDesktopGameJoinCardGamepadSupport
local FFlagMobileGameJoinCardGamepadSupport = SharedFlagsModule.FFlagMobileGameJoinCardGamepadSupport or FFlagDesktopGameJoinCardGamepadSupport

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Divider (copy), DividerVariant (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy), Text (copy), Button (copy), FFlagMobileGameJoinCardGamepadSupport (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		bodyText = "Feature.FAE.CheckIfYouCanJoinGame"
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Banner = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
			TopDivider = ReactModule.createElement(Divider, { LayoutOrder = 1, variant = DividerVariant.Default }),
			BannerContent = ReactModule.createElement(View, {
				tag = "row align-x-left align-y-center gap-medium size-full-0 auto-y padding-y-medium",
				LayoutOrder = 2
			}, {
				BannerIcon = ReactModule.createElement(Icon, {
					tag = "content-emphasis",
					name = IconName.LockClosed,
					size = IconSize.Large,
					variant = IconVariant.Regular
				}),
				BannerText = ReactModule.createElement(Text, {
					tag = "shrink auto-xy text-wrap text-align-x-left text-body-medium content-emphasis",
					Text = UseLocalizationResult.bodyText
				})
			})
		}),
		UnlockButton = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			ref = if FFlagMobileGameJoinCardGamepadSupport then Frame.focusRef else nil,
			text = UseLocalizationResult.unlock,
			onActivated = Frame.onUnlockPressed,
			variant = ButtonVariant.Emphasis,
			inputSize = InputSize.Medium,
			width = UDim.new(1, 0)
		})
	})
end