local telemetryService = game:GetService("TelemetryService")
local localizationService = game:GetService("LocalizationService")
local sduiErrors = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.SduiCoreSystem).SduiErrors
local sduiPlayerTileImpressionsThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerTileImpressionsThrottlingHundredthsPercent", 10000)

return function(p1, p2, p3, p4, p5)
	-- upvalues: sduiErrors (ref), telemetryService (ref), sduiPlayerTileImpressionsThrottlingHundredthsPercent (ref), localizationService (ref)
	if not p4 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogPlayerTileImpressions, {
			name = "SduiPlayerTileImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	elseif #p2 == 0 or #p3 == 0 then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local itemsPerRow = p4.itemsPerRow
	
	for i, v in p2 do
		local var1 = p3[v]
		local var2 = if var1 then var1.playerId else nil
		
		if var2 ~= nil then
			table.insert(t, v)
			table.insert(t_1, var2)
			table.insert(t_2, var1.playerName or (var1.name or (var1.username or "")))
			
			if typeof(p5) == "number" and typeof(itemsPerRow) == "number" and itemsPerRow > 0 then
				table.insert(t_3, p5 + math.ceil(v / itemsPerRow) - 1)
			end
		end
	end
	if #t_1 == 0 then
		return
	end
	local userSearchSessionId = p4.userSearchSessionId
	telemetryService:LogEvent({
		eventName = "playerTileImpressions",
		description = "Fired when player tiles are visible in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiPlayerTileImpressionsThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = p4.eventContext or "playerSearch",
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			tilePos = table.concat(t, ","),
			playerId = table.concat(t_1, ","),
			playerName = table.concat(t_2, ","),
			userSearchSessionId = if userSearchSessionId ~= nil then nil else tostring(userSearchSessionId),
			sortId = if p4.collectionId ~= nil then nil else tostring(p4.collectionId),
			sortPosition = p4.collectionPosition,
			pageContext = p4.pageContext or p1.appPage,
			rowInSort = if #t_3 > 0 then table.concat(t_3, ",") else nil,
			locale = localizationService.RobloxLocaleId
		}
	})
end