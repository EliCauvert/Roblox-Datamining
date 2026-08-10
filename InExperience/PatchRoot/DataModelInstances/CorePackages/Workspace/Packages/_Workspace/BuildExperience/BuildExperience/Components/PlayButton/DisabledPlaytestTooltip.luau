local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local educationalTooltip = foundationModule.EducationalTooltip
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p0) --[[ line: 19 | named "DisabledPlaytestTooltip" ]]
	-- upvalues: reactModule (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref), localizationStringsModule (ref)
	return reactModule.createElement(educationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		testId = "build-disabled-playtest-tooltip",
		LayoutOrder = p0.LayoutOrder,
		align = popoverAlign.End,
		isOpen = p0.isOpen,
		side = popoverSide.Bottom,
		text = localizationStringsModule.PLAYTEST_DISABLED_TOOLTIP,
		title = localizationStringsModule.PLAYTEST_TITLE
	}, p0.children)
end