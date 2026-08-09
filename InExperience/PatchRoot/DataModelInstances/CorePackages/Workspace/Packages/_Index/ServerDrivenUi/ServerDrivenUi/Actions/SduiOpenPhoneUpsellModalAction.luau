local sduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local openPhoneUpsellModalModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)

local function noop() --[[ line: 14 ]] end

local sduiActionParams = sduiCoreSystemModule.SduiActionParams
local getStringParam = sduiActionParams.getStringParam
local getBooleanParam = sduiActionParams.getBooleanParam
local getCallbackParam = sduiActionParams.getCallbackParam

return function(p0, _, p1, _) --[[ line: 21 | named "SduiOpenPhoneUpsellModalAction" ]]
	-- upvalues: getBooleanParam (ref), getCallbackParam (ref), noop (ref), getStringParam (ref), openPhoneUpsellModalModule (ref)
	local var3 = if p0 then p0.actionParams else {}
	p1.dependencies.dispatch(openPhoneUpsellModalModule({
		onSuccess = getCallbackParam(var3, "onSuccess", noop),
		onCancelled = getCallbackParam(var3, "onCancelled", noop),
		onFailure = getCallbackParam(var3, "onFailure", noop),
		eventContext = getStringParam(var3, "eventContext", nil),
		origin = getStringParam(var3, "origin", "unknown"),
		shouldAutofillAndroidPhoneNumberAtLaunch = getBooleanParam(var3, "shouldAutofillAndroidPhoneNumberAtLaunch", true),
		addPhoneDescriptionKey = getStringParam(var3, "addPhoneDescriptionKey", nil)
	}, getBooleanParam(var3, "voiceOptIn", false)))
end