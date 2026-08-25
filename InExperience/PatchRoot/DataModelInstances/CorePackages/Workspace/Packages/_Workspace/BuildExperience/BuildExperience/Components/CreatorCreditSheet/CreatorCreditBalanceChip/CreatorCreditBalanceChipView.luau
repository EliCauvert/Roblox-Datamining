local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local chip = foundationModule.Chip
local chipSize = foundationModule.Enums.ChipSize
local chipVariant = foundationModule.Enums.ChipVariant
local iconName = foundationModule.Enums.IconName

return function(p0)
	-- upvalues: reactModule (ref), chip (ref), iconName (ref), chipVariant (ref), chipSize (ref)
	return if p0.balanceText == nil then nil else reactModule.createElement(chip, {
		testId = "creator-credit-balance-chip",
		text = p0.balanceText,
		leading = iconName.Robux,
		variant = chipVariant.Standard,
		size = chipSize.Medium,
		onActivated = p0.onActivated
	})
end