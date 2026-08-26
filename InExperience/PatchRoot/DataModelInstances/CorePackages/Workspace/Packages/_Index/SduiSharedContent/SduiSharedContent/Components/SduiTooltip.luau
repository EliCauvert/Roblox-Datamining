local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local tooltip = foundationModule.Tooltip
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local t = {
	Top = popoverSide.Top,
	Bottom = popoverSide.Bottom,
	Left = popoverSide.Left,
	Right = popoverSide.Right
}
local t_1 = {
	Start = popoverAlign.Start,
	Center = popoverAlign.Center,
	End = popoverAlign.End
}

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), tooltip (ref), t (ref), t_1 (ref)
	return if p1.anchor == nil then nil else reactModule.createElement(tooltip, {
		title = p1.title or "",
		text = p1.text,
		shortcut = if p1.shortcut and #p1.shortcut > 0 then p1.shortcut else nil,
		side = t[p1.side or ""],
		align = t_1[p1.align or ""],
		LayoutOrder = p1.layoutOrder
	}, p1.anchor)
end)