local parent = script:FindFirstAncestor("GameTile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useLocalization = require(parent.Localization).Hooks.useLocalization

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), reactModule (ref), button (ref), iconName (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref)
	return reactModule.createElement(button, {
		icon = if p1.showIcon then iconName.PlayXlarge else nil,
		text = if p1.showText then useLocalization({ play = "Feature.ExperienceDetails.PlayButtonText.Play" }).play else nil,
		variant = buttonVariant.SoftEmphasis,
		size = inputSize.Small,
		fillBehavior = fillBehavior.Fill,
		onActivated = p1.onActivated
	})
end)