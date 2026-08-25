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

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), tooltip (ref), t (ref), t_1 (ref)
	return if p0.anchor == nil then nil else reactModule.createElement(tooltip, {
		title = p0.title or "",
		text = p0.text,
		shortcut = if p0.shortcut and #p0.shortcut > 0 then p0.shortcut else nil,
		side = t[p0.side or ""],
		align = t_1[p0.align or ""],
		LayoutOrder = p0.layoutOrder
	}, p0.anchor)
end)