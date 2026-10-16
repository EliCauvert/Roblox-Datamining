local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local VirtualEventsModule = require(Parent.VirtualEvents)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrors = SduiCoreSystemModule.SduiErrors
local SduiLogger = SduiCoreSystemModule.SduiLogger
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local t = {}

return function(p1, List, p2, AnalyticsData, _) --[[ Line: 23 | Named "SduiVirtualEventImpressionsHandler" ]]
	-- upvalues: t (copy), SduiLogger (copy), SduiErrors (copy), FindAnalyticsFieldInAncestorsFunction (copy), VirtualEventsModule (copy)
	if #List == 0 or #(p2 or t) == 0 then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogVirtualEventImpressions, {
			name = "SduiVirtualEventImpressionsHandler",
			message = `No entries to log: impressionIndexes={#List}, itemAnalyticsDatas={#(p2 or t)}`
		}, p1.appPage)
		
		return
	end
	local Text = tostring(FindAnalyticsFieldInAncestorsFunction("channel", { analyticsData = AnalyticsData }, p1.appPage))
	local Count = 0
	
	for _, value in List do
		local v1 = p2[value]
		local v2 = v1 == nil
		local EventId = nil
		
		if not v2 then
			EventId = v1.eventId
			v2 = EventId == nil or EventId == ""
		end
		if not v2 then
			VirtualEventsModule.fireVirtualEventImpression({
				virtualEventId = tostring(EventId),
				universeId = tostring(v1.universeId or ""),
				channel = Text
			})
			Count += 1
		end
	end
	if Count == 0 then
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToLogVirtualEventImpressions, {
			name = "SduiVirtualEventImpressionsHandler",
			message = "No valid items found for impression indexes"
		}, p1.appPage)
	end
end