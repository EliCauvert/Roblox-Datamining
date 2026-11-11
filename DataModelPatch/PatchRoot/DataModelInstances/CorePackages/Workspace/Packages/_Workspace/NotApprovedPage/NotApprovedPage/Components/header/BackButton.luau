local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local UsePageNavigationFunction = require(NotApprovedPage.Contexts.PageNavigationContext).usePageNavigation

return ReactModule.memo(function()
	-- upvalues: UsePageNavigationFunction (copy), ReactModule (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), ButtonSize (copy)
	return ReactModule.createElement(IconButton, {
		testId = "back-button",
		icon = IconName.ChevronLargeLeft,
		variant = ButtonVariant.Utility,
		onActivated = UsePageNavigationFunction().goToPreviousPage,
		size = ButtonSize.Medium
	})
end)