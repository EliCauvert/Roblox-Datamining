local Parent = script:FindFirstAncestor("IAPExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: BuilderIconsModule (copy), ReactModule (copy), Menu (copy), PopoverAlign (copy), PopoverSide (copy), InputSize (copy), IconButton (copy), ButtonVariant (copy)
	return ReactModule.createElement(Menu, {
		testId = "ManageRecommendationsMenuView",
		align = PopoverAlign.End,
		items = {
			{
				id = "manage-recommendations",
				icon = BuilderIconsModule.Icon.Gear,
				text = p1.label,
				onActivated = p1.onItemActivated
			}
		},
		isOpen = p1.isOpen,
		onPressedOutside = p1.onDismiss,
		side = PopoverSide.Bottom,
		size = InputSize.Medium
	}, {
		Anchor = ReactModule.createElement(IconButton, {
			testId = "ManageRecommendationsMenuView-trigger",
			icon = BuilderIconsModule.Icon.ThreeDotsHorizontal,
			size = InputSize.Small,
			variant = ButtonVariant.Utility,
			onActivated = p1.onTriggerActivated,
			ref = p1.triggerRef
		})
	})
end