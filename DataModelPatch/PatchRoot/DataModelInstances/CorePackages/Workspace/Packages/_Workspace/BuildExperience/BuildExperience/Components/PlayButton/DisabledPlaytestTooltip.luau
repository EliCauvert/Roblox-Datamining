local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local EducationalTooltip = FoundationModule.EducationalTooltip
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(Frame)
	-- upvalues: ReactModule (copy), EducationalTooltip (copy), PopoverAlign (copy), PopoverSide (copy)
	return ReactModule.createElement(EducationalTooltip, {
		hasActions = false,
		hasSecondaryButtons = false,
		showSteps = false,
		text = "Once you have your first build ready, tap here to begin playtesting",
		title = "Playtest",
		LayoutOrder = Frame.LayoutOrder,
		align = PopoverAlign.End,
		isOpen = Frame.isOpen,
		side = PopoverSide.Bottom
	}, Frame.children)
end