local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 22 | named "UpdateWithChangesButton" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), button (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(button, {
		text = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
			updateWithChanges = localizationStringsModule.CHAT_UPDATE_WITH_CHANGES
		}) else nil).updateWithChanges else localizationStringsModule.CHAT_UPDATE_WITH_CHANGES,
		size = inputSize.Medium,
		variant = buttonVariant.Emphasis,
		width = UDim.new(1, 0),
		onActivated = p0.onActivated,
		LayoutOrder = p0.LayoutOrder
	})
end