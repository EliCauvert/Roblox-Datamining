local PromptAssignments = script:FindFirstAncestor("PromptAssignments")
local GetFFlagLuaAppAuthenticatorUpsellPopUpEnabledModule = require(PromptAssignments.Flags.GetFFlagLuaAppAuthenticatorUpsellPopUpEnabled)
local GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabledModule = require(PromptAssignments.Flags.GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabled)
local config = {
	ChangePasswordSuspectedCompromise = "PROMPT_TYPE_CHANGE_PASSWORD__SUSPECTED_COMPROMISE",
	ChangePasswordBreachedCredential = "PROMPT_TYPE_CHANGE_PASSWORD__BREACHED_CREDENTIAL",
	AccountRestoresPolicyUpdate = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE",
	AccountRestoresPolicyUpdateV2 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V2",
	AccountRestoresPolicyUpdateV3 = "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPDATE_V3",
	Email2SVUpsell = "PROMPT_TYPE_EMAIL_2SV_UPSELL",
	PasskeyUpsell = "PROMPT_TYPE_PASSKEY_UPSELL",
	AccountRestoresPolicyUpsell = if require(PromptAssignments.Flags.GetFFlagLuaAppAccountRestoresPolicyUpsellPopUpEnabled)() then "PROMPT_TYPE_ACCOUNT_RESTORES_POLICY_UPSELL" else nil,
	AuthenticatorUpsell = if GetFFlagLuaAppAuthenticatorUpsellPopUpEnabledModule() then "PROMPT_TYPE_AUTHENTICATOR_UPSELL" else nil,
	BroaderAuthenticatorUpsell = if GetFFlagLuaAppBroaderAuthenticatorUpsellPopUpEnabledModule() then "PROMPT_TYPE_BROADER_AUTHENTICATOR_UPSELL" else nil
}
local v1 = require(PromptAssignments.Parent.enumerate)(script.Name, config)
require(script.Parent.addRawValueMethodToEnum)(v1, config)

return v1