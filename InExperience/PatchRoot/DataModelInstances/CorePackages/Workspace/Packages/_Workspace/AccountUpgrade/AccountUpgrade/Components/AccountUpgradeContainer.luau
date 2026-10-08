local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local reactModule = require(accountUpgrade.Parent.React)
local accountUpgradeViewModule = require(script.Parent.AccountUpgradeView)
local useAccountUpgradeViewModelModule = require(script.Parent.useAccountUpgradeViewModel)
local fFlagEnableDesktopSsoSignupDialogModule = require(accountUpgrade.Flags.FFlagEnableDesktopSsoSignupDialog)

return function(p1)
	-- upvalues: useAccountUpgradeViewModelModule (ref), fFlagEnableDesktopSsoSignupDialogModule (ref), reactModule (ref), accountUpgradeViewModule (ref)
	return if fFlagEnableDesktopSsoSignupDialogModule and p1.isHidden then nil else reactModule.createElement(accountUpgradeViewModule, useAccountUpgradeViewModelModule(p1))
end