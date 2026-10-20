local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local CreatorCreditBalanceChipViewModule = require(script.Parent.CreatorCreditBalanceChipView)
local UseCreatorCreditBalanceChipViewModelModule = require(script.Parent.useCreatorCreditBalanceChipViewModel)

return function()
	-- upvalues: UseCreatorCreditBalanceChipViewModelModule (copy), ReactModule (copy), CreatorCreditBalanceChipViewModule (copy)
	return ReactModule.createElement(CreatorCreditBalanceChipViewModule, (UseCreatorCreditBalanceChipViewModelModule()))
end