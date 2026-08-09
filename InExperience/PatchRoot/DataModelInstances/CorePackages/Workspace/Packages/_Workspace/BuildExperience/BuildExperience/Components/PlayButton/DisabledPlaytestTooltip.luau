local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local educationalTooltip = foundationModule.EducationalTooltip
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p0) --[[ line: 21 | named "DisabledPlaytestTooltip" ]]
	-- upvalues: reactModule (ref), educationalTooltip (ref), popoverAlign (ref), popoverSide (ref)
	return reactModule.createElement(educationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		text = "Once you have your first build ready, tap here to begin playtesting",
		title = "Playtest",
		LayoutOrder = p0.LayoutOrder,
		align = popoverAlign.End,
		isOpen = p0.isOpen,
		side = popoverSide.Bottom
	}, p0.children)
end