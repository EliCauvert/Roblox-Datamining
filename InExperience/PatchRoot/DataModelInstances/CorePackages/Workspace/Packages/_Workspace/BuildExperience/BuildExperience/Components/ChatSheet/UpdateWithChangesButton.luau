local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(Button, {
		text = UseLocalizationFunction({
			updateWithChanges = LocalizationStringsModule.CHAT_UPDATE_WITH_CHANGES
		}).updateWithChanges,
		size = InputSize.Medium,
		variant = ButtonVariant.Emphasis,
		width = UDim.new(1, 0),
		onActivated = Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder
	})
end