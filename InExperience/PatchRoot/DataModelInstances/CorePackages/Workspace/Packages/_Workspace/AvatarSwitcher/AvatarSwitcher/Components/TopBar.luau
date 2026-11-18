local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAlignSideSheetWindowCloseRight = require(Parent.SharedFlags).FFlagAlignSideSheetWindowCloseRight

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAlignSideSheetWindowCloseRight (copy)
	return (ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAlignSideSheetWindowCloseRight then "size-full-1200 row align-y-center gap-medium padding-x-medium flex-between" else "size-full-1200 row align-y-center gap-medium padding-x-medium"
	}, {
		CloseButton = if FFlagAlignSideSheetWindowCloseRight and p1.hideClose then nil else ReactModule.createElement(FoundationModule.Image, {
			tag = "size-600 radius-small",
			Image = "icons/navigation/close",
			onActivated = p1.onClose,
			LayoutOrder = if FFlagAlignSideSheetWindowCloseRight then 2 else nil
		}),
		HeaderText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-x text-title-large",
			Text = UseLocalizationFunction({
				headerText = "Feature.AvatarSwitcher.Heading.SwitchAvatar"
			}).headerText,
			LayoutOrder = if FFlagAlignSideSheetWindowCloseRight then 1 else 2
		})
	}))
end