local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local educationalTooltip = foundationModule.EducationalTooltip
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), educationalTooltip (ref), popoverAlign (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref), popoverSide (ref)
	local SHARE_AUDIENCE_PRIVATE_DESCRIPTION, SHARE_AUDIENCE_PRIVATE_TITLE
	local var1 = if fFlagBuildLocalization then useLocalization({
		description = localizationStringsModule.SHARE_AUDIENCE_PRIVATE_DESCRIPTION,
		title = localizationStringsModule.SHARE_AUDIENCE_PRIVATE_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		SHARE_AUDIENCE_PRIVATE_DESCRIPTION = var1.description
		SHARE_AUDIENCE_PRIVATE_TITLE = var1.title
	else
		SHARE_AUDIENCE_PRIVATE_DESCRIPTION = localizationStringsModule.SHARE_AUDIENCE_PRIVATE_DESCRIPTION
		SHARE_AUDIENCE_PRIVATE_TITLE = localizationStringsModule.SHARE_AUDIENCE_PRIVATE_TITLE
	end
	return reactModule.createElement(educationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		testId = "build-private-share-tooltip",
		LayoutOrder = p1.LayoutOrder,
		align = popoverAlign.End,
		anchorRef = p1.anchorRef,
		isOpen = p1.isOpen,
		onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then p1.onPressedOutside else nil,
		side = popoverSide.Bottom,
		text = SHARE_AUDIENCE_PRIVATE_DESCRIPTION,
		title = SHARE_AUDIENCE_PRIVATE_TITLE
	}, p1.children)
end