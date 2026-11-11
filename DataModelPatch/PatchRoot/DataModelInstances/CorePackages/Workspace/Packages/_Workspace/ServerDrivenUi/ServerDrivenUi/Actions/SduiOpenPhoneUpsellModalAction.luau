local OpenPhoneUpsellModalModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)

local function noop() end

local SduiActionParams = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem).SduiActionParams
local GetStringParamFunction = SduiActionParams.getStringParam
local GetBooleanParamFunction = SduiActionParams.getBooleanParam
local GetCallbackParamFunction = SduiActionParams.getCallbackParam

return function(p1, _, p2, _)
	-- upvalues: GetBooleanParamFunction (copy), GetCallbackParamFunction (copy), noop (copy), GetStringParamFunction (copy), OpenPhoneUpsellModalModule (copy)
	local ActionParams = p1 and p1.actionParams or {}
	p2.dependencies.dispatch(OpenPhoneUpsellModalModule({
		onSuccess = GetCallbackParamFunction(ActionParams, "onSuccess", noop),
		onCancelled = GetCallbackParamFunction(ActionParams, "onCancelled", noop),
		onFailure = GetCallbackParamFunction(ActionParams, "onFailure", noop),
		eventContext = GetStringParamFunction(ActionParams, "eventContext", nil),
		origin = GetStringParamFunction(ActionParams, "origin", "unknown"),
		shouldAutofillAndroidPhoneNumberAtLaunch = GetBooleanParamFunction(ActionParams, "shouldAutofillAndroidPhoneNumberAtLaunch", true),
		addPhoneDescriptionKey = GetStringParamFunction(ActionParams, "addPhoneDescriptionKey", nil)
	}, (GetBooleanParamFunction(ActionParams, "voiceOptIn", false))))
end