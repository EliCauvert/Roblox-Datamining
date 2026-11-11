local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local VirtualEventsModule = require(Parent.VirtualEvents)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), VirtualEventsModule (copy), SduiParseHelpers (copy), CloseCentralOverlayFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "DismissEventNotificationsModal",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	
	if ActionParams.eventId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "DismissEventNotificationsModal",
			message = "Missing eventId",
			propName = "eventId"
		}, p2.appPage)
	end
	VirtualEventsModule.neverShowNotificationsModalAgain(p2.dependencies.networking):catch(function(Err)
		-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
		p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
			name = "DismissEventNotificationsModal",
			message = "neverShowNotificationsModalAgain failed: " .. SduiParseHelpers.stringifyValue(Err)
		}, p2.appPage)
	end)
	p2.dependencies.dispatch(CloseCentralOverlayFunction())
end