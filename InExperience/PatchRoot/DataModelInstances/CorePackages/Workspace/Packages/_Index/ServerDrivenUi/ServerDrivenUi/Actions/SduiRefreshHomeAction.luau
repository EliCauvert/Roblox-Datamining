local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local refreshHomePage = require(parent.Home).refreshHomePage
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

local function _(p1, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref)
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		name = sduiActionType.RefreshHome,
		message = p2,
		propName = p3
	}, p1.appPage)
end

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), refreshHomePage (ref)
	local var1 = if p1 then p1.actionParams else nil
	local var2 = if var1 then var1.requestIntent else nil
	
	if var2 ~= nil and (typeof(var2) ~= "string" or var2 == "") then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "requestIntent",
			name = sduiActionType.RefreshHome,
			message = `Invalid requestIntent: {tostring(var2)}`
		}, p2.appPage)
		var2 = nil
	end
	return refreshHomePage(var2)
end