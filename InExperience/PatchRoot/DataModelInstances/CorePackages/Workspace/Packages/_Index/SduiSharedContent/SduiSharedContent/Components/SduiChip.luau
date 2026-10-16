local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.SduiCompat)
local Chip = require(Parent.Foundation).Chip
local FFlagSduiChipAccessoryProps = require(Parent.SharedFlags).FFlagSduiChipAccessoryProps
local FFlagSduiChipSizeAndVariant = require(Parent.SharedFlags).FFlagSduiChipSizeAndVariant

return ReactModule.memo(function(p1) --[[ Line: 66 | Named "SduiChip" ]]
	-- upvalues: FFlagSduiChipAccessoryProps (copy), ReactModule (copy), Chip (copy), FFlagSduiChipSizeAndVariant (copy)
	return ReactModule.createElement(Chip, {
		text = p1.text,
		leading = if FFlagSduiChipAccessoryProps and p1.leading then p1.leading elseif p1.leadingIconName then if p1.leadingIconVariant or p1.leadingIsCircular or p1.leadingOnActivated then {
			iconName = p1.leadingIconName,
			iconVariant = p1.leadingIconVariant,
			isCircular = p1.leadingIsCircular,
			onActivated = p1.leadingOnActivated
		} else p1.leadingIconName else nil,
		trailing = if FFlagSduiChipAccessoryProps and p1.trailing then p1.trailing elseif p1.trailingIconName then if p1.trailingIconVariant or p1.trailingIsCircular or p1.trailingOnActivated then {
			iconName = p1.trailingIconName,
			iconVariant = p1.trailingIconVariant,
			isCircular = p1.trailingIsCircular,
			onActivated = p1.trailingOnActivated
		} else p1.trailingIconName else nil,
		onActivated = p1.onActivated,
		isChecked = p1.isChecked,
		Selectable = p1.selectable,
		size = if FFlagSduiChipSizeAndVariant then p1.chipSize else p1.size,
		variant = if FFlagSduiChipSizeAndVariant then p1.variant else nil,
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = p1.anchorPoint,
		Position = p1.position
	})
end)