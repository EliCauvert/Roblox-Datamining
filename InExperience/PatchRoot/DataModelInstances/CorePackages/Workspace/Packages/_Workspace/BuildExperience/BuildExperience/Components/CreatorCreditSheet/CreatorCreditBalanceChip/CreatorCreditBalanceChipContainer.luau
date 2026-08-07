local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local creatorCreditBalanceChipViewModule = require(script.Parent.CreatorCreditBalanceChipView)
local useCreatorCreditBalanceChipViewModelModule = require(script.Parent.useCreatorCreditBalanceChipViewModel)

return function() --[[ line: 9 | named "CreatorCreditBalanceChipContainer" ]]
	-- upvalues: useCreatorCreditBalanceChipViewModelModule (ref), reactModule (ref), creatorCreditBalanceChipViewModule (ref)
	return reactModule.createElement(creatorCreditBalanceChipViewModule, useCreatorCreditBalanceChipViewModelModule())
end