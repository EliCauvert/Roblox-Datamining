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
			name = "EnableEventNotifications",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local eventId = var1.eventId
	local universeId = var1.universeId
	local channel = var1.channel
	local networking = p2.dependencies.networking
	virtualEventsModule.enablePushNotifications(networking):catch(function(p3)
		-- upvalues: p2 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
		p2.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = "EnableEventNotifications",
			message = "enablePushNotifications failed: " .. sduiParseHelpers.stringifyValue(p3)
		}, p2.appPage)
	end)
	virtualEventsModule.neverShowNotificationsModalAgain(networking):catch(function(p3)
		-- upvalues: p2 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
		p2.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = "EnableEventNotifications",
			message = "neverShowNotificationsModalAgain failed: " .. sduiParseHelpers.stringifyValue(p3)
		}, p2.appPage)
	end)
	virtualEventsModule.fireEventNotificationEnabled({
		virtualEventId = if eventId then tostring(eventId) else nil,
		universeId = if universeId then tostring(universeId) else nil,
		channel = if channel then tostring(channel) else nil
	})
	p2.dependencies.dispatch(closeCentralOverlay())
end