local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local chip = require(parent.Foundation).Chip
local fFlagSduiChipAccessoryProps = require(parent.SharedFlags).FFlagSduiChipAccessoryProps
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p1)
	-- upvalues: fFlagSduiChipAccessoryProps (ref), reactModule (ref), chip (ref), fFlagSduiExperienceDetailsSupport (ref)
	local layoutOrder = p1.layoutOrder
	local anchorPoint = p1.anchorPoint
	local position = p1.position
	local var1 = nil
	
	if fFlagSduiChipAccessoryProps and p1.leading then
		var1 = p1.leading
	elseif p1.leadingIconName then
		var1 = if p1.leadingIconVariant or p1.leadingIsCircular or p1.leadingOnActivated then {
			iconName = p1.leadingIconName,
			iconVariant = p1.leadingIconVariant,
			isCircular = p1.leadingIsCircular,
			onActivated = p1.leadingOnActivated
		} else p1.leadingIconName
	end
	local var2 = nil
	
	if fFlagSduiChipAccessoryProps and p1.trailing then
		var2 = p1.trailing
	elseif p1.trailingIconName then
		var2 = if p1.trailingIconVariant or p1.trailingIsCircular or p1.trailingOnActivated then {
			iconName = p1.trailingIconName,
			iconVariant = p1.trailingIconVariant,
			isCircular = p1.trailingIsCircular,
			onActivated = p1.trailingOnActivated
		} else p1.trailingIconName
	end
	return reactModule.createElement(chip, {
		text = p1.text,
		leading = var1,
		trailing = var2,
		onActivated = p1.onActivated,
		isChecked = p1.isChecked,
		Selectable = if fFlagSduiExperienceDetailsSupport then p1.selectable else nil,
		size = p1.size,
		LayoutOrder = layoutOrder,
		AnchorPoint = anchorPoint,
		Position = position
	})
end)