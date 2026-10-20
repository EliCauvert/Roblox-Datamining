local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local ReactModule = require(AccountUpgrade.Parent.React)
local AccountUpgradeViewModule = require(script.Parent.AccountUpgradeView)
local UseAccountUpgradeViewModelModule = require(script.Parent.useAccountUpgradeViewModel)
local FFlagEnableDesktopSsoSignupDialogModule = require(AccountUpgrade.Flags.FFlagEnableDesktopSsoSignupDialog)

return function(p1)
	-- upvalues: UseAccountUpgradeViewModelModule (copy), FFlagEnableDesktopSsoSignupDialogModule (copy), ReactModule (copy), AccountUpgradeViewModule (copy)
	local UseAccountUpgradeViewModelModuleResult = UseAccountUpgradeViewModelModule(p1)
	
	return if FFlagEnableDesktopSsoSignupDialogModule and p1.isHidden then nil else ReactModule.createElement(AccountUpgradeViewModule, UseAccountUpgradeViewModelModuleResult)
end