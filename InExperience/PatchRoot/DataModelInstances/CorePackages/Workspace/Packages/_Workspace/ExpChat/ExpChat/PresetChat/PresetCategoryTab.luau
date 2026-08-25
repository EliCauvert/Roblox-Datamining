local parent = script:FindFirstAncestor("ExpChat").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)

return reactModule.memo(function(value)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.Chip, {
		LayoutOrder = value.layoutOrder or 0,
		text = value.name,
		isChecked = value.isSelected,
		onActivated = value.onActivated,
		size = foundationModule.Enums.ChipSize.Small
	})
end)