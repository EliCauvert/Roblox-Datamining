local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local accordion = require(parent.Foundation).Accordion

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), accordion (ref)
	return reactModule.createElement(accordion.Item, {
		id = p1.index or (p1.layoutOrder or 1),
		text = p1.text or "",
		description = p1.description,
		icon = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return if p1.icon and p1.iconVariant then { name = p1.icon, variant = p1.iconVariant } else p1.icon
		end, { p1.icon, p1.iconVariant }),
		hasDivider = p1.hasDivider,
		isExpanded = p1.isExpanded,
		LayoutOrder = p1.layoutOrder
	}, p1.content)
end)