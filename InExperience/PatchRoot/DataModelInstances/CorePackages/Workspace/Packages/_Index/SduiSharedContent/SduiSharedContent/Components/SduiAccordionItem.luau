local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local Accordion = require(Parent.Foundation).Accordion

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "SduiAccordionItem" ]]
	-- upvalues: ReactModule (copy), Accordion (copy)
	return ReactModule.createElement(Accordion.Item, {
		id = p1.index or (p1.layoutOrder or 1),
		text = p1.text or "",
		description = p1.description,
		icon = ReactModule.useMemo(function() --[[ Line: 26 ]]
			-- upvalues: p1 (copy)
			return if p1.icon and p1.iconVariant then { name = p1.icon, variant = p1.iconVariant } else p1.icon
		end, { p1.icon, p1.iconVariant }),
		hasDivider = p1.hasDivider,
		isExpanded = p1.isExpanded,
		LayoutOrder = p1.layoutOrder
	}, p1.content)
end)