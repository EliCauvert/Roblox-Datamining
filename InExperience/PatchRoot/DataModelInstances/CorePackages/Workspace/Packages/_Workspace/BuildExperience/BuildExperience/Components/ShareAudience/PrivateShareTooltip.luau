local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local educationalTooltip = foundationModule.EducationalTooltip
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p0) --[[ line: 20 | named "PrivateShareTooltip" ]]
	-- upvalues: reactModule (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref), localizationStringsModule (ref)
	return reactModule.createElement(educationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		testId = "build-private-share-tooltip",
		LayoutOrder = p0.LayoutOrder,
		align = popoverAlign.End,
		anchorRef = p0.anchorRef,
		isOpen = p0.isOpen,
		side = popoverSide.Bottom,
		text = localizationStringsModule.SHARE_AUDIENCE_PRIVATE_DESCRIPTION,
		title = localizationStringsModule.SHARE_AUDIENCE_PRIVATE_TITLE
	}, p0.children)
end