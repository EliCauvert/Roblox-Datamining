local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chip = foundationModule.Chip
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local iconName = foundationModule.Enums.IconName

return function(p1)
	-- upvalues: reactModule (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref)
	return if p1.balanceText == nil then nil else reactModule.createElement(chip, {
		testId = "creator-credit-balance-chip",
		text = p1.balanceText,
		leading = iconName.Robux,
		variant = chipVariant.Standard,
		size = chipSize.Medium,
		onActivated = p1.onActivated
	})
end