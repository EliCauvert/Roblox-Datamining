local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local educationalTooltip = foundationModule.EducationalTooltip
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), educationalTooltip (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), popoverSide (ref)
	local var1 = useLocalization({
		text = localizationStringsModule.PLAYTEST_DISABLED_TOOLTIP,
		title = localizationStringsModule.PLAYTEST_TITLE
	})
	
	return reactModule.createElement(educationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		testId = "build-disabled-playtest-tooltip",
		LayoutOrder = p1.LayoutOrder,
		align = popoverAlign.End,
		isOpen = p1.isOpen,
		onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then p1.onPressedOutside else nil,
		side = popoverSide.Bottom,
		text = var1.text,
		title = var1.title
	}, p1.children)
end