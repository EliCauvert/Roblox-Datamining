local Parent = script:FindFirstAncestor("GameTile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(function(p1) --[[ Line: 20 | Named "InstantPlayButton" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Button (copy), IconName (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local UseLocalizationResult = UseLocalizationFunction({ play = "Feature.ExperienceDetails.PlayButtonText.Play" })
	
	return ReactModule.createElement(Button, {
		icon = if p1.showIcon then IconName.PlayXlarge else nil,
		text = if p1.showText then UseLocalizationResult.play else nil,
		variant = ButtonVariant.SoftEmphasis,
		size = InputSize.Small,
		fillBehavior = FillBehavior.Fill,
		onActivated = p1.onActivated
	})
end)