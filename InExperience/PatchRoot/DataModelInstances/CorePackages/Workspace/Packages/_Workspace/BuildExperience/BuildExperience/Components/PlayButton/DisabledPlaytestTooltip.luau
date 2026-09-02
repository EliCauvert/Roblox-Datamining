local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local educationalTooltip = foundationModule.EducationalTooltip
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), educationalTooltip (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), popoverSide (ref)
	local PLAYTEST_DISABLED_TOOLTIP, PLAYTEST_TITLE
	local var1 = if fFlagBuildLocalization then useLocalization({
		text = localizationStringsModule.PLAYTEST_DISABLED_TOOLTIP,
		title = localizationStringsModule.PLAYTEST_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		PLAYTEST_DISABLED_TOOLTIP = var1.text
		PLAYTEST_TITLE = var1.title
	else
		PLAYTEST_DISABLED_TOOLTIP = localizationStringsModule.PLAYTEST_DISABLED_TOOLTIP
		PLAYTEST_TITLE = localizationStringsModule.PLAYTEST_TITLE
	end
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
		text = PLAYTEST_DISABLED_TOOLTIP,
		title = PLAYTEST_TITLE
	}, p1.children)
end