local sduiCoreSystemModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem)
local openEmailUpsellModalModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Verification.OpenEmailUpsellModal)

local function noop() --[[ line: 14 ]] end

local sduiActionParams = sduiCoreSystemModule.SduiActionParams
local getStringParam = sduiActionParams.getStringParam
local getBooleanParam = sduiActionParams.getBooleanParam
local getCallbackParam = sduiActionParams.getCallbackParam

return function(p0, _, p1, _) --[[ line: 21 | named "SduiOpenEmailUpsellModalAction" ]]
	-- upvalues: getCallbackParam (ref), noop (ref), getStringParam (ref), getBooleanParam (ref), openEmailUpsellModalModule (ref)
	local var3 = if p0 then p0.actionParams else {}
	p1.dependencies.dispatch(openEmailUpsellModalModule({
		successCallback = getCallbackParam(var3, "onSuccess", noop),
		failureCallback = getCallbackParam(var3, "onFailure", noop),
		addEmailOver13TextKey = getStringParam(var3, "addEmailOver13TextKey", nil),
		addEmailTitleKey = getStringParam(var3, "addEmailTitleKey", nil),
		isEmailModalCalledFromHomePage = getBooleanParam(var3, "isEmailModalCalledFromHomePage", false),
		eventContext = getStringParam(var3, "eventContext", nil),
		origin = getStringParam(var3, "origin", "unknown"),
		section = getStringParam(var3, "section", nil)
	}))
end