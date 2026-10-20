local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(AvatarExperienceSave.SaveButton.useSaveButtonProps)

return function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	return ReactModule.createElement(FoundationModule.Button, {
		text = Frame.text or "Save",
		isDisabled = Frame.disabled,
		size = FoundationModule.Enums.InputSize.Medium,
		variant = if Frame.disabled then FoundationModule.Enums.ButtonVariant.Standard else FoundationModule.Enums.ButtonVariant.Emphasis,
		onActivated = Frame.onActivated,
		width = UDim.new(0, FoundationModule.Hooks.useTokens().Size.Size_2300),
		LayoutOrder = Frame.LayoutOrder
	})
end