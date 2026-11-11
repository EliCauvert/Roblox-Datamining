local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Tooltip = FoundationModule.Tooltip
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local config = {
	Top = PopoverSide.Top,
	Bottom = PopoverSide.Bottom,
	Left = PopoverSide.Left,
	Right = PopoverSide.Right
}
local config1 = {
	Start = PopoverAlign.Start,
	Center = PopoverAlign.Center,
	End = PopoverAlign.End
}

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Tooltip (copy), config (copy), config1 (copy)
	return if p1.anchor == nil then nil else ReactModule.createElement(Tooltip, {
		title = p1.title or "",
		text = p1.text,
		shortcut = if p1.shortcut and #p1.shortcut > 0 then p1.shortcut else nil,
		side = config[p1.side or ""],
		align = config1[p1.align or ""],
		LayoutOrder = p1.layoutOrder
	}, p1.anchor)
end)