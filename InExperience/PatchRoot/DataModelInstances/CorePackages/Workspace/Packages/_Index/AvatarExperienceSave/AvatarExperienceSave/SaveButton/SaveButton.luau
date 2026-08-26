local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(avatarExperienceSave.SaveButton.useSaveButtonProps)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref)
	return reactModule.createElement(foundationModule.Button, {
		text = p1.text or "Save",
		isDisabled = p1.disabled,
		size = foundationModule.Enums.InputSize.Medium,
		variant = if p1.disabled then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
		onActivated = p1.onActivated,
		width = UDim.new(0, foundationModule.Hooks.useTokens().Size.Size_2300),
		LayoutOrder = p1.LayoutOrder
	})
end