local TelemetryService = game:GetService("TelemetryService")
local SduiErrors = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem).SduiErrors
local SduiQueryImpressionsThrottlingHundredthsPercent = game:DefineFastInt("SduiQueryImpressionsThrottlingHundredthsPercent", 10000)

return function(p1, List, p2, p3, _)
	-- upvalues: SduiErrors (copy), SduiQueryImpressionsThrottlingHundredthsPercent (copy), TelemetryService (copy)
	if not p3 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogQueryImpressions, {
			name = "SduiQueryImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	if #List == 0 or #p2 == 0 then return end
	local List1 = {}
	local List2 = {}
	
	for _, value in List do
		local v1 = p2[value]
		
		if v1 then
			table.insert(List1, value)
			table.insert(List2, v1.queryText or "")
		else
			p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogQueryImpressions, {
				name = "SduiQueryImpressionsHandler",
				message = `Missing itemData at index {value}`
			}, p1.appPage)
		end
	end
	if #List2 ~= 0 then
		TelemetryService:LogEvent({
			eventName = "queryImpressions",
			description = "Fired when query suggestion items are visible in an SDUI collection",
			backends = { "EventIngest" },
			throttlingPercentage = SduiQueryImpressionsThrottlingHundredthsPercent,
			lastUpdated = { 26, 6, 24 }
		}, {
			eventContext = p1.appPage,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = {
				absPositions = table.concat(List1, ","),
				queryTexts = table.concat(List2, ","),
				sortPos = p3.collectionPosition,
				sortId = tostring(p3.collectionId),
				componentType = p3.collectionComponentType or "Pill"
			}
		})
		
		return
	end
end