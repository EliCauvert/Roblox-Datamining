local reactModule = require(script:FindFirstAncestor("AccountUpgrade").Parent.React)
local accountUpgradeViewModule = require(script.Parent.AccountUpgradeView)
local useAccountUpgradeViewModelModule = require(script.Parent.useAccountUpgradeViewModel)

return function(p1)
	-- upvalues: useAccountUpgradeViewModelModule (ref), reactModule (ref), accountUpgradeViewModule (ref)
	return reactModule.createElement(accountUpgradeViewModule, useAccountUpgradeViewModelModule(p1))
end