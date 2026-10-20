local OpenEmailUpsellModalModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Verification.OpenEmailUpsellModal)

local function noop() end

local SduiActionParams = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem).SduiActionParams
local GetStringParamFunction = SduiActionParams.getStringParam
local GetBooleanParamFunction = SduiActionParams.getBooleanParam
local GetCallbackParamFunction = SduiActionParams.getCallbackParam

return function(p1, _, p2, _)
	-- upvalues: GetCallbackParamFunction (copy), noop (copy), GetStringParamFunction (copy), GetBooleanParamFunction (copy), OpenEmailUpsellModalModule (copy)
	local ActionParams = p1 and p1.actionParams or {}
	p2.dependencies.dispatch(OpenEmailUpsellModalModule({
		successCallback = GetCallbackParamFunction(ActionParams, "onSuccess", noop),
		failureCallback = GetCallbackParamFunction(ActionParams, "onFailure", noop),
		addEmailOver13TextKey = GetStringParamFunction(ActionParams, "addEmailOver13TextKey", nil),
		addEmailTitleKey = GetStringParamFunction(ActionParams, "addEmailTitleKey", nil),
		isEmailModalCalledFromHomePage = GetBooleanParamFunction(ActionParams, "isEmailModalCalledFromHomePage", false),
		eventContext = GetStringParamFunction(ActionParams, "eventContext", nil),
		origin = GetStringParamFunction(ActionParams, "origin", "unknown"),
		section = GetStringParamFunction(ActionParams, "section", nil)
	}))
end