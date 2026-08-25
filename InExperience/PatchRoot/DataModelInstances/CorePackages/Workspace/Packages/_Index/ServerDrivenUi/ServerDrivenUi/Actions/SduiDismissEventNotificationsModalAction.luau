local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local virtualEventsModule = require(parent.VirtualEvents)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers

return function(p0, _, p1)
	-- upvalues: sduiErrorType (ref), virtualEventsModule (ref), sduiParseHelpers (ref), closeCentralOverlay (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "DismissEventNotificationsModal",
			message = "Missing actionParams"
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	
	if var2.eventId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "DismissEventNotificationsModal",
			message = "Missing eventId",
			propName = "eventId"
		}, p1.appPage)
	end
	virtualEventsModule.neverShowNotificationsModalAgain(p1.dependencies.networking):catch(function(p2)
		-- upvalues: p1 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
		p1.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = "DismissEventNotificationsModal",
			message = "neverShowNotificationsModalAgain failed: " .. sduiParseHelpers.stringifyValue(p2)
		}, p1.appPage)
	end)
	p1.dependencies.dispatch(closeCentralOverlay())
end