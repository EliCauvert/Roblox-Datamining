local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-1200 row align-y-center gap-medium padding-x-medium"
	}, {
		CloseButton = reactModule.createElement(foundationModule.Image, {
			tag = "size-600 radius-small",
			Image = "icons/navigation/close",
			onActivated = p1.onClose
		}),
		HeaderText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-x text-title-large",
			LayoutOrder = 2,
			Text = useLocalization({
				headerText = "Feature.AvatarSwitcher.Heading.SwitchAvatar"
			}).headerText
		})
	})
end