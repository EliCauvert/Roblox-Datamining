local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local EducationalTooltip = FoundationModule.EducationalTooltip
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(Frame) --[[ Line: 21 | Named "DisabledPlaytestTooltip" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), EducationalTooltip (copy), PopoverAlign (copy), PopoverSide (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		text = LocalizationStringsModule.PLAYTEST_DISABLED_TOOLTIP,
		title = LocalizationStringsModule.PLAYTEST_TITLE
	})
	
	return ReactModule.createElement(EducationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		testId = "build-disabled-playtest-tooltip",
		LayoutOrder = Frame.LayoutOrder,
		align = PopoverAlign.End,
		isOpen = Frame.isOpen,
		onPressedOutside = Frame.onPressedOutside,
		side = PopoverSide.Bottom,
		text = UseLocalizationResult.text,
		title = UseLocalizationResult.title
	}, Frame.children)
end