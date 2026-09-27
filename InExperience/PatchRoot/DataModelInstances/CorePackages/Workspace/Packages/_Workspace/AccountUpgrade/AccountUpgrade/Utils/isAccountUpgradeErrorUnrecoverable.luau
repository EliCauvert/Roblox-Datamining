local accountUpgradeErrorModule = require(script:FindFirstAncestor("AccountUpgrade").AccountUpgradeError)
local t = {
	[accountUpgradeErrorModule.AccountUpgradeDisabled] = true,
	[accountUpgradeErrorModule.NotEligible] = true,
	[accountUpgradeErrorModule.InvalidUpgradeType] = true,
	[accountUpgradeErrorModule.FieldNotAllowedForUpgradeType] = true,
	[accountUpgradeErrorModule.BirthdayRequired] = true,
	[accountUpgradeErrorModule.AccountAlreadyUpgraded] = true
}

return function(p1)
	-- upvalues: t (ref)
	return p1 ~= nil and t[p1] == true
end