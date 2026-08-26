local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local virtualEventsModule = require(parent.VirtualEvents)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), virtualEventsModule (ref), sduiParseHelpers (ref), closeCentralOverlay (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "DismissEventNotificationsModal",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	
	if var1.eventId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "DismissEventNotificationsModal",
			message = "Missing eventId",
			propName = "eventId"
		}, p2.appPage)
	end
	virtualEventsModule.neverShowNotificationsModalAgain(p2.dependencies.networking):catch(function(p3)
		-- upvalues: p2 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
		p2.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = "DismissEventNotificationsModal",
			message = "neverShowNotificationsModalAgain failed: " .. sduiParseHelpers.stringifyValue(p3)
		}, p2.appPage)
	end)
	p2.dependencies.dispatch(closeCentralOverlay())
end