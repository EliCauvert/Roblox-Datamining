local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local accountUpgradeFieldModule = require(accountUpgrade.AccountUpgradeField)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local t = {
	[accountUpgradeFlowModule.Pioneer] = {
		canDismiss = true,
		signsOutOnDismiss = false,
		upgradeType = "Pioneer",
		titleTextKey = "Authentication.SignUp.Header.SetUpYourRobloxAccount",
		subtitleTextKey = "Authentication.SignUp.Subtitle.YourProgressCarriesOver",
		submitTextKey = "Authentication.Login.Action.Save",
		requiredFields = {
			accountUpgradeFieldModule.Birthday,
			accountUpgradeFieldModule.Username,
			accountUpgradeFieldModule.Password
		},
		optionalFields = {
			accountUpgradeFieldModule.Email,
			accountUpgradeFieldModule.Gender
		}
	},
	[accountUpgradeFlowModule.PioneerU13] = {
		canDismiss = false,
		signsOutOnDismiss = false,
		upgradeType = "PioneerU13",
		titleTextKey = "Authentication.SignUp.Header.SetUpYourRobloxAccount",
		subtitleTextKey = "Authentication.SignUp.Subtitle.YourProgressCarriesOver",
		submitTextKey = "Authentication.Login.Action.Save",
		requiredFields = {
			accountUpgradeFieldModule.Username,
			accountUpgradeFieldModule.Password
		},
		optionalFields = { accountUpgradeFieldModule.Gender }
	},
	[accountUpgradeFlowModule.OAuth] = {
		canDismiss = true,
		signsOutOnDismiss = true,
		upgradeType = "OAuth",
		titleTextKey = "Authentication.SignUp.Header.OneLastThing",
		subtitleTextKey = "Authentication.SignUp.Subtitle.AddYourBirthday",
		submitTextKey = "Authentication.SignUp.Action.StartPlay",
		requiredFields = {
			accountUpgradeFieldModule.Birthday,
			accountUpgradeFieldModule.Username
		},
		optionalFields = { accountUpgradeFieldModule.Gender }
	}
}

return function(p1)
	-- upvalues: t (ref)
	return t[p1]
end