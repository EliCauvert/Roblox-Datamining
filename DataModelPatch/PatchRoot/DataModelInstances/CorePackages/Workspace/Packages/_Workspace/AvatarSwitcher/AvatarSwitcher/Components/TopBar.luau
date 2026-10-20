local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy)
	return (ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-1200 row align-y-center gap-medium padding-x-medium"
	}, {
		CloseButton = ReactModule.createElement(FoundationModule.Image, {
			tag = "size-600 radius-small",
			Image = "icons/navigation/close",
			onActivated = p1.onClose
		}),
		HeaderText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-x text-title-large",
			LayoutOrder = 2,
			Text = UseLocalizationFunction({
				headerText = "Feature.AvatarSwitcher.Heading.SwitchAvatar"
			}).headerText
		})
	}))
end