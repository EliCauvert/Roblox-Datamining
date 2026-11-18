local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAlignSideSheetWindowCloseRight = require(Parent.SharedFlags).FFlagAlignSideSheetWindowCloseRight

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagAlignSideSheetWindowCloseRight (copy), ReactModule (copy), FoundationModule (copy)
	local NoOnBack: boolean = FFlagAlignSideSheetWindowCloseRight and p1.onBack == nil
	
	return (ReactModule.createElement(FoundationModule.View, {
		tag = if NoOnBack then "row align-y-center gap-medium size-full-1200 padding-x-medium flex-between" else "row align-y-center gap-medium size-full-1200 padding-x-medium"
	}, {
		BackButton = if p1.onBack then ReactModule.createElement(FoundationModule.Image, {
			tag = "size-600 radius-small",
			Image = "icons/navigation/pushBack",
			testId = "avatar-workshop-back-button",
			LayoutOrder = 1,
			onActivated = p1.onBack
		}) else nil,
		CloseButton = if p1.onBack or FFlagAlignSideSheetWindowCloseRight and p1.hideClose then nil else ReactModule.createElement(FoundationModule.Image, {
			tag = "size-600 radius-small",
			Image = "icons/navigation/close",
			testId = "avatar-workshop-close-button",
			onActivated = p1.onClose,
			LayoutOrder = if NoOnBack then 2 else 1
		}),
		HeaderText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-x text-title-large",
			Text = UseLocalizationFunction({ headerText = p1.titleKey }).headerText,
			LayoutOrder = if NoOnBack then 1 else 2
		})
	}))
end