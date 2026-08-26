local telemetryService = game:GetService("TelemetryService")
local sduiErrors = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem).SduiErrors
local sduiQueryImpressionsThrottlingHundredthsPercent = game:DefineFastInt("SduiQueryImpressionsThrottlingHundredthsPercent", 10000)

return function(p1, p2, p3, p4, _)
	-- upvalues: sduiErrors (ref), sduiQueryImpressionsThrottlingHundredthsPercent (ref), telemetryService (ref)
	if not p4 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogQueryImpressions, {
			name = "SduiQueryImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	elseif #p2 == 0 or #p3 == 0 then return end
	local t = {}
	local t_1 = {}
	
	for i, v in p2 do
		local var1 = p3[v]
		
		if var1 then
			table.insert(t, v)
			table.insert(t_1, var1.queryText or "")
		else
			p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogQueryImpressions, {
				name = "SduiQueryImpressionsHandler",
				message = `Missing itemData at index {v}`
			}, p1.appPage)
		end
	end
	if #t_1 == 0 then
		return
	end
	telemetryService:LogEvent({
		eventName = "queryImpressions",
		description = "Fired when query suggestion items are visible in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiQueryImpressionsThrottlingHundredthsPercent,
		lastUpdated = { 26, 6, 24 }
	}, {
		eventContext = p1.appPage,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			absPositions = table.concat(t, ","),
			queryTexts = table.concat(t_1, ","),
			sortPos = p4.collectionPosition,
			sortId = tostring(p4.collectionId),
			componentType = p4.collectionComponentType or "Pill"
		}
	})
end