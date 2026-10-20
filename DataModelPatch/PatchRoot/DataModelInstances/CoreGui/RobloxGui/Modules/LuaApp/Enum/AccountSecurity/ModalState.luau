local config = {
	ChangePasswordIntro = "CHANGE_PASSWORD_INTRO",
	ChangePasswordForm = "CHANGE_PASSWORD_FORM",
	ChangePasswordConfirmation = "CHANGE_PASSWORD_CONFIRMATION",
	ChangePasswordDismissConfirmation = "CHANGE_PASSWORD_DISMISS_CONFIRMATION",
	AccountPinForm = "ACCOUNT_PIN_FORM",
	AccountPinFormExpired = "ACCOUNT_PIN_FORM_EXPIRED",
	AuthenticatorUpsellIntro = "AUTHENTICATOR_UPSELL",
	AuthenticatorUpsellInstallApps = "AUTHENTICATOR_INSTALL_APPS",
	AccountRestoresPolicyUpsell = "ACCOUNT_RESTORES_POLICY_UPSELL",
	Email2SVUpsell = "EMAIL_2SV_UPSELL"
}
local v1 = require(game:GetService("CorePackages").Packages.enumerate)(script.Name, config)
require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.AccountSecurity.addRawValueMethodToEnum)(v1, config)

return v1