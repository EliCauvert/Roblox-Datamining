local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Chip = FoundationModule.Chip
local ChipSize = FoundationModule.Enums.ChipSize

return ReactModule.forwardRef(function(Frame, p1)
	-- upvalues: ReactModule (copy), Chip (copy), ChipSize (copy)
	return ReactModule.createElement(Chip, {
		text = Frame.text,
		leading = Frame.icon,
		size = ChipSize.Small,
		onActivated = Frame.onActivated,
		isDisabled = Frame.isInvalid,
		LayoutOrder = Frame.LayoutOrder,
		testId = if Frame.isInvalid then "--item-description-link-chip-invalid" else "--item-description-link-chip",
		ref = if Frame.isInvalid then nil else p1
	})
end)