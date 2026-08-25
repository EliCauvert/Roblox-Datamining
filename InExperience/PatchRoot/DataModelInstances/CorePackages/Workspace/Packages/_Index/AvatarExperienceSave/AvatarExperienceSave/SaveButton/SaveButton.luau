local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(avatarExperienceSave.SaveButton.useSaveButtonProps)

return function(p0)
	-- upvalues: foundationModule (ref), reactModule (ref)
	return reactModule.createElement(foundationModule.Button, {
		text = p0.text or "Save",
		isDisabled = p0.disabled,
		size = foundationModule.Enums.InputSize.Medium,
		variant = if p0.disabled then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
		onActivated = p0.onActivated,
		width = UDim.new(0, foundationModule.Hooks.useTokens().Size.Size_2300),
		LayoutOrder = p0.LayoutOrder
	})
end