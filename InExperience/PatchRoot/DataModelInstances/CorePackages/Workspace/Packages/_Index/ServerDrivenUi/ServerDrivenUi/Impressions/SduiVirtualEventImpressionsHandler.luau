local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local virtualEventsModule = require(parent.VirtualEvents)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local t = {}

return function(p1, p2, p3, p4, _)
	-- upvalues: t (ref), sduiLogger (ref), sduiErrors (ref), findAnalyticsFieldInAncestors (ref), virtualEventsModule (ref)
	if #p2 == 0 or #(p3 or t) == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogVirtualEventImpressions, {
			name = "SduiVirtualEventImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p2}, itemAnalyticsDatas={#(p3 or t)}`
		}, p1.appPage)
		
		return
	end
	local var1 = tostring(findAnalyticsFieldInAncestors("channel", { analyticsData = p4 }, p1.appPage))
	local var2 = 0
	
	for i, v in p2 do
		local var3 = p3[v]
		
		if var3 ~= nil then
			local eventId = var3.eventId
			
			if eventId ~= nil and eventId ~= "" then
				virtualEventsModule.fireVirtualEventImpression({
					virtualEventId = tostring(eventId),
					universeId = tostring(var3.universeId or ""),
					channel = var1
				})
				var2 += 1
			end
		end
	end
	if var2 == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogVirtualEventImpressions, {
			name = "SduiVirtualEventImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p1.appPage)
	end
end