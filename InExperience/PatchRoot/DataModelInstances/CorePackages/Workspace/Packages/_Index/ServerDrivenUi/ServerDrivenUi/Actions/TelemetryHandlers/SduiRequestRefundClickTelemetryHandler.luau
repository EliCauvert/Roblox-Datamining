local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local TModule = require(Parent.t)
local SendRequestRefundClickEventFunction = require(Parent.DiscoveryAnalytics).Events.sendRequestRefundClickEvent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GetActionTelemetryFieldValueFunction = SduiCoreSystemModule.getActionTelemetryFieldValue
local StrictInterfaceResult = TModule.strictInterface({
	placeId = TModule.union(TModule.string, TModule.number),
	eventContext = TModule.string
})

return function(p1, p2, p3) --[[ Line: 20 ]]
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), StrictInterfaceResult (copy), SduiErrorType (copy), SendRequestRefundClickEventFunction (copy)
	local PlaceId = GetActionTelemetryFieldValueFunction(p1, p2, "placeId")
	local EventContext = GetActionTelemetryFieldValueFunction(p1, p2, "eventContext")
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult({ placeId = PlaceId, eventContext = EventContext })
	
	if not StrictInterfaceResultResult then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "SduiRequestRefundClickTelemetryHandler",
			message = StrictInterfaceResultResult2
		}, p3.appPage)
	end
	SendRequestRefundClickEventFunction({ placeId = if PlaceId then tostring(PlaceId) else "" }, if EventContext then tostring(EventContext) else "")
end