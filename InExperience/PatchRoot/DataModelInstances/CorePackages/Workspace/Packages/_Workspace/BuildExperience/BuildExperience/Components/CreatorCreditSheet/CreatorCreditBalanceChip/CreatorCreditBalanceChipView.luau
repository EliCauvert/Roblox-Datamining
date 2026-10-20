local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Chip = FoundationModule.Chip
local ChipSize = FoundationModule.Enums.ChipSize
local ChipVariant = FoundationModule.Enums.ChipVariant
local IconName = FoundationModule.Enums.IconName

return function(p1)
	-- upvalues: ReactModule (copy), Chip (copy), IconName (copy), ChipVariant (copy), ChipSize (copy)
	return if p1.balanceText == nil then nil else ReactModule.createElement(Chip, {
		testId = "creator-credit-balance-chip",
		text = p1.balanceText,
		leading = IconName.Robux,
		variant = ChipVariant.Standard,
		size = ChipSize.Medium,
		onActivated = p1.onActivated
	})
end