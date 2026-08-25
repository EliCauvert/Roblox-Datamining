local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local _ = require(parent.SduiCompat)
local chip = require(parent.Foundation).Chip
local fFlagSduiChipAccessoryProps = require(parent.SharedFlags).FFlagSduiChipAccessoryProps
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p0)
	-- upvalues: fFlagSduiChipAccessoryProps (ref), reactModule (ref), chip (ref), fFlagSduiExperienceDetailsSupport (ref)
	local layoutOrder = p0.layoutOrder
	local anchorPoint = p0.anchorPoint
	local position = p0.position
	local var1 = nil
	
	if fFlagSduiChipAccessoryProps and p0.leading then
		var1 = p0.leading
	elseif p0.leadingIconName then
		var1 = if p0.leadingIconVariant or p0.leadingIsCircular or p0.leadingOnActivated then {
			iconName = p0.leadingIconName,
			iconVariant = p0.leadingIconVariant,
			isCircular = p0.leadingIsCircular,
			onActivated = p0.leadingOnActivated
		} else p0.leadingIconName
	end
	local var2 = nil
	
	if fFlagSduiChipAccessoryProps and p0.trailing then
		var2 = p0.trailing
	elseif p0.trailingIconName then
		var2 = if p0.trailingIconVariant or p0.trailingIsCircular or p0.trailingOnActivated then {
			iconName = p0.trailingIconName,
			iconVariant = p0.trailingIconVariant,
			isCircular = p0.trailingIsCircular,
			onActivated = p0.trailingOnActivated
		} else p0.trailingIconName
	end
	return reactModule.createElement(chip, {
		text = p0.text,
		leading = var1,
		trailing = var2,
		onActivated = p0.onActivated,
		isChecked = p0.isChecked,
		Selectable = if fFlagSduiExperienceDetailsSupport then p0.selectable else nil,
		size = p0.size,
		LayoutOrder = layoutOrder,
		AnchorPoint = anchorPoint,
		Position = position
	})
end)