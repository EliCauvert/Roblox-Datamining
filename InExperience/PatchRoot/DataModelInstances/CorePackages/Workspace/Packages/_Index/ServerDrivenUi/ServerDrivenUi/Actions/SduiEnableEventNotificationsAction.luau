local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local virtualEventsModule = require(parent.VirtualEvents)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers

return function(p0, _, p1) --[[ line: 17 | named "SduiEnableEventNotificationsAction" ]]
	-- upvalues: sduiErrorType (ref), virtualEventsModule (ref), sduiParseHelpers (ref), closeCentralOverlay (ref)
	local var2 = if p0 then p0.actionParams else nil
	
	if var2 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "EnableEventNotifications",
			message = "Missing actionParams"
		}, p1.appPage)
		
		return
	end
	assert(var2, "actionParams must exist")
	local eventId = var2.eventId
	local universeId = var2.universeId
	local channel = var2.channel
	local networking = p1.dependencies.networking
	virtualEventsModule.enablePushNotifications(networking):catch(function(p2) --[[ line: 39 ]]
		-- upvalues: p1 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
		p1.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = "EnableEventNotifications",
			message = "enablePushNotifications failed: " .. sduiParseHelpers.stringifyValue(p2)
		}, p1.appPage)
	end)
	virtualEventsModule.neverShowNotificationsModalAgain(networking):catch(function(p3) --[[ line: 46 ]]
		-- upvalues: p1 (ref), sduiErrorType (copy), sduiParseHelpers (copy)
		p1.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = "EnableEventNotifications",
			message = "neverShowNotificationsModalAgain failed: " .. sduiParseHelpers.stringifyValue(p3)
		}, p1.appPage)
	end)
	virtualEventsModule.fireEventNotificationEnabled({
		virtualEventId = if eventId then tostring(eventId) else nil,
		universeId = if universeId then tostring(universeId) else nil,
		channel = if channel then tostring(channel) else nil
	})
	p1.dependencies.dispatch(closeCentralOverlay())
end