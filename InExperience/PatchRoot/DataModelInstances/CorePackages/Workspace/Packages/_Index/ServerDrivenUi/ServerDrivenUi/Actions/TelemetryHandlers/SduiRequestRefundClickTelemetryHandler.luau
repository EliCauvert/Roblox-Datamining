local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local tModule = require(parent.t)
local sendRequestRefundClickEvent = require(parent.DiscoveryAnalytics).Events.sendRequestRefundClickEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local var1 = tModule.strictInterface({
	placeId = tModule.union(tModule.string, tModule.number),
	eventContext = tModule.string
})

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), var1 (ref), sduiErrorType (ref), sendRequestRefundClickEvent (ref)
	local var2 = getActionTelemetryFieldValue(p1, p2, "placeId")
	local var3 = getActionTelemetryFieldValue(p1, p2, "eventContext")
	local var4, var5 = var1({ placeId = var2, eventContext = var3 })
	
	if not var4 then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiRequestRefundClickTelemetryHandler",
			message = var5
		}, p3.appPage)
	end
	sendRequestRefundClickEvent({ placeId = if var2 then tostring(var2) else "" }, if var3 then tostring(var3) else "")
end