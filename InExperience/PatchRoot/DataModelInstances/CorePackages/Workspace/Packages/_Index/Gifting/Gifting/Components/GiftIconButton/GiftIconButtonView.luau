local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return ReactModule.memo(function(Frame) --[[ Line: 19 | Named "GiftIconButtonView" ]]
	-- upvalues: ReactModule (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(IconButton, {
		testId = "gift-icon-button",
		icon = IconName.GiftBox,
		onActivated = Frame.onActivated,
		isCircular = Frame.isCircular == true,
		isDisabled = Frame.isDisabled,
		LayoutOrder = Frame.LayoutOrder,
		size = InputSize.Medium,
		variant = ButtonVariant.Standard
	})
end)