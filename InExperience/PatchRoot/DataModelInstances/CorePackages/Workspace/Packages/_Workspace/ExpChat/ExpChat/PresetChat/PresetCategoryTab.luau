local Parent = script:FindFirstAncestor("ExpChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)

return ReactModule.memo(function(p1) --[[ Line: 13 | Named "PresetCategoryTab" ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.Chip, {
		LayoutOrder = p1.layoutOrder or 0,
		text = p1.name,
		isChecked = p1.isSelected,
		onActivated = p1.onActivated,
		size = FoundationModule.Enums.ChipSize.Small
	})
end)