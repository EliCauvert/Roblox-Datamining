local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local tModule = require(parent.t)
local sendRequestRefundClickEvent = require(parent.DiscoveryAnalytics).Events.sendRequestRefundClickEvent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local getActionTelemetryFieldValue = sduiCoreSystemModule.getActionTelemetryFieldValue
local var2 = tModule.strictInterface({
	placeId = tModule.union(tModule.string, tModule.number),
	eventContext = tModule.string
})

return function(p0, p1, p2)
	-- upvalues: getActionTelemetryFieldValue (ref), var2 (ref), sduiErrorType (ref), sendRequestRefundClickEvent (ref)
	local var3 = getActionTelemetryFieldValue(p0, p1, "placeId")
	local var4 = getActionTelemetryFieldValue(p0, p1, "eventContext")
	local var5, var6 = var2({ placeId = var3, eventContext = var4 })
	
	if not var5 then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "SduiRequestRefundClickTelemetryHandler",
			message = var6
		}, p2.appPage)
	end
	sendRequestRefundClickEvent({ placeId = if var3 then tostring(var3) else "" }, if var4 then tostring(var4) else "")
end