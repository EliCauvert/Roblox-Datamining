local telemetryService = game:GetService("TelemetryService")
local sduiErrors = require(script:FindFirstAncestor("ServerDrivenUi").Parent.SduiCoreSystem).SduiErrors
local sduiQueryImpressionsThrottlingHundredthsPercent = game:DefineFastInt("SduiQueryImpressionsThrottlingHundredthsPercent", 10000)

return function(p0, p1, p2, p3, _) --[[ line: 26 | named "SduiQueryImpressionsHandler" ]]
	-- upvalues: sduiErrors (ref), sduiQueryImpressionsThrottlingHundredthsPercent (ref), telemetryService (ref)
	if not p3 then
		p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogQueryImpressions, {
			name = "SduiQueryImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p0.appPage)
		
		return
	elseif #p1 == 0 or #p2 == 0 then return end
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local var4 = p2[v]
		
		if var4 then
			table.insert(t, v)
			table.insert(t_1, var4.queryText or "")
		else
			p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogQueryImpressions, {
				name = "SduiQueryImpressionsHandler",
				message = `Missing itemData at index {v}`
			}, p0.appPage)
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
		eventContext = p0.appPage,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			absPositions = table.concat(t, ","),
			queryTexts = table.concat(t_1, ","),
			sortPos = p3.collectionPosition,
			sortId = tostring(p3.collectionId),
			componentType = p3.collectionComponentType or "Pill"
		}
	})
end