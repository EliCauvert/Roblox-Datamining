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
			name = "EnableEventNotifications",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	else
		assert(ActionParams, "actionParams must exist")
		local EventId = ActionParams.eventId
		local UniverseId = ActionParams.universeId
		local Channel = ActionParams.channel
		local Networking = p2.dependencies.networking
		VirtualEventsModule.enablePushNotifications(Networking):catch(function(Err)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
			p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = "EnableEventNotifications",
				message = "enablePushNotifications failed: " .. SduiParseHelpers.stringifyValue(Err)
			}, p2.appPage)
		end)
		VirtualEventsModule.neverShowNotificationsModalAgain(Networking):catch(function(Err)
			-- upvalues: p2 (copy), SduiErrorType (upval), SduiParseHelpers (upval)
			p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
				name = "EnableEventNotifications",
				message = "neverShowNotificationsModalAgain failed: " .. SduiParseHelpers.stringifyValue(Err)
			}, p2.appPage)
		end)
		VirtualEventsModule.fireEventNotificationEnabled({
			virtualEventId = if EventId then tostring(EventId) else nil,
			universeId = if UniverseId then tostring(UniverseId) else nil,
			channel = if Channel then tostring(Channel) else nil
		})
		p2.dependencies.dispatch(CloseCentralOverlayFunction())
	end
end