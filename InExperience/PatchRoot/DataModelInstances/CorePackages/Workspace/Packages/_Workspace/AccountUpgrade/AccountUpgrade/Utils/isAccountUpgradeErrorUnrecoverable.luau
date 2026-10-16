local AccountUpgradeErrorModule = require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeError)
local config = {
	[AccountUpgradeErrorModule.AccountUpgradeDisabled] = true,
	[AccountUpgradeErrorModule.NotEligible] = true,
	[AccountUpgradeErrorModule.InvalidUpgradeType] = true,
	[AccountUpgradeErrorModule.FieldNotAllowedForUpgradeType] = true,
	[AccountUpgradeErrorModule.BirthdayRequired] = true,
	[AccountUpgradeErrorModule.AccountAlreadyUpgraded] = true
}

return function(p1): boolean --[[ Line: 16 | Named "isAccountUpgradeErrorUnrecoverable" ]]
	-- upvalues: config (copy)
	return p1 ~= nil and config[p1] == true
end