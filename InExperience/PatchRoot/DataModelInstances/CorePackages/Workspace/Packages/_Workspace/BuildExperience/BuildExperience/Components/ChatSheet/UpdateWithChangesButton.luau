local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = useLocalization({
			updateWithChanges = localizationStringsModule.CHAT_UPDATE_WITH_CHANGES
		}).updateWithChanges,
		size = inputSize.Medium,
		variant = buttonVariant.Emphasis,
		width = UDim.new(1, 0),
		onActivated = p1.onActivated,
		LayoutOrder = p1.LayoutOrder
	})
end