local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local AccountUpgradeFieldModule = require(AccountUpgrade.AccountUpgradeField)
local AccountUpgradeFlowModule = require(AccountUpgrade.AccountUpgradeFlow)
local config = {
	[AccountUpgradeFlowModule.Pioneer] = {
		canDismiss = true,
		signsOutOnDismiss = false,
		upgradeType = "Pioneer",
		titleTextKey = "Authentication.SignUp.Header.SetUpYourRobloxAccount",
		subtitleTextKey = "Authentication.SignUp.Subtitle.YourProgressCarriesOver",
		submitTextKey = "Authentication.Login.Action.Save",
		requiredFields = {
			AccountUpgradeFieldModule.Birthday,
			AccountUpgradeFieldModule.Username,
			AccountUpgradeFieldModule.Password
		},
		optionalFields = {
			AccountUpgradeFieldModule.Email,
			AccountUpgradeFieldModule.Gender
		}
	},
	[AccountUpgradeFlowModule.PioneerU13] = {
		canDismiss = false,
		signsOutOnDismiss = false,
		upgradeType = "PioneerU13",
		titleTextKey = "Authentication.SignUp.Header.SetUpYourRobloxAccount",
		subtitleTextKey = "Authentication.SignUp.Subtitle.YourProgressCarriesOver",
		submitTextKey = "Authentication.Login.Action.Save",
		requiredFields = {
			AccountUpgradeFieldModule.Username,
			AccountUpgradeFieldModule.Password
		},
		optionalFields = { AccountUpgradeFieldModule.Gender }
	},
	[AccountUpgradeFlowModule.OAuth] = {
		canDismiss = true,
		signsOutOnDismiss = true,
		upgradeType = "OAuth",
		titleTextKey = "Authentication.SignUp.Header.OneLastThing",
		subtitleTextKey = "Authentication.SignUp.Subtitle.AddYourBirthday",
		submitTextKey = "Authentication.SignUp.Action.CreateAccountSentenceCase",
		legalTextKey = "Authentication.SignUp.Description.SignUpAgreement.CreateAnAccount",
		fitsDialogToContent = true,
		requiredFields = {
			AccountUpgradeFieldModule.Birthday,
			AccountUpgradeFieldModule.Username
		},
		optionalFields = { AccountUpgradeFieldModule.Gender }
	},
	[AccountUpgradeFlowModule.Signup] = {
		canDismiss = true,
		signsOutOnDismiss = false,
		upgradeType = "Signup",
		titleTextKey = "Authentication.SignUp.Action.CreateAccountSentenceCase",
		subtitleTextKey = nil,
		submitTextKey = "Authentication.SignUp.Action.Create",
		legalTextKey = "Authentication.SignUp.Description.SignUpAgreement.CreateAnAccount",
		linkedAccountLegalTextKey = "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName",
		boldFieldLabels = true,
		capturesAuditContent = true,
		hostReportsSubmit = true,
		requiredFields = {
			AccountUpgradeFieldModule.Birthday,
			AccountUpgradeFieldModule.Username,
			AccountUpgradeFieldModule.Password
		},
		optionalFields = { AccountUpgradeFieldModule.Gender }
	}
}

return function(p1) --[[ Line: 117 | Named "getFlowSpec" ]]
	-- upvalues: config (copy)
	return config[p1]
end