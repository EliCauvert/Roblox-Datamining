local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local virtualEventsModule = require(parent.VirtualEvents)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrors = sduiCoreSystemModule.SduiErrors
local sduiLogger = sduiCoreSystemModule.SduiLogger
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local t = {}

return function(p0, p1, p2, p3, _)
	-- upvalues: t (ref), sduiLogger (ref), sduiErrors (ref), findAnalyticsFieldInAncestors (ref), virtualEventsModule (ref)
	if #p1 == 0 or #(p2 or t) == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogVirtualEventImpressions, {
			name = "SduiVirtualEventImpressionsHandler",
			message = `No entries to log: impressionIndexes={#p1}, itemAnalyticsDatas={#(p2 or t)}`
		}, p0.appPage)
		
		return
	end
	local var3 = tostring(findAnalyticsFieldInAncestors("channel", { analyticsData = p3 }, p0.appPage))
	local var4 = 0
	
	for i, v in p1 do
		local var5 = p2[v]
		
		if var5 ~= nil then
			local eventId = var5.eventId
			
			if eventId ~= nil and eventId ~= "" then
				virtualEventsModule.fireVirtualEventImpression({
					virtualEventId = tostring(eventId),
					universeId = tostring(var5.universeId or ""),
					channel = var3
				})
				var4 += 1
			end
		end
	end
	if var4 == 0 then
		sduiLogger.reportError(sduiErrors.SduiErrorType.FailedToLogVirtualEventImpressions, {
			name = "SduiVirtualEventImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p0.appPage)
	end
end