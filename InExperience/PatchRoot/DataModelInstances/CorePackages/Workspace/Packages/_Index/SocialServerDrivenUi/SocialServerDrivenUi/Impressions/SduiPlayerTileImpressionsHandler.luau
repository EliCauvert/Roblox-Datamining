local telemetryService = game:GetService("TelemetryService")
local localizationService = game:GetService("LocalizationService")
local sduiErrors = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.SduiCoreSystem).SduiErrors
local sduiPlayerTileImpressionsThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerTileImpressionsThrottlingHundredthsPercent", 10000)

return function(p0, p1, p2, p3, p4) --[[ line: 18 | named "SduiPlayerTileImpressionsHandler" ]]
	-- upvalues: sduiErrors (ref), telemetryService (ref), sduiPlayerTileImpressionsThrottlingHundredthsPercent (ref), localizationService (ref)
	if not p3 then
		p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogPlayerTileImpressions, {
			name = "SduiPlayerTileImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p0.appPage)
		
		return
	elseif #p1 == 0 or #p2 == 0 then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local itemsPerRow = p3.itemsPerRow
	
	for i, v in p1 do
		local var7 = p2[v]
		local var8 = if var7 then var7.playerId else nil
		
		if var8 ~= nil then
			table.insert(t, v)
			table.insert(t_1, var8)
			table.insert(t_2, var7.playerName or (var7.name or (var7.username or "")))
			
			if typeof(p4) == "number" and typeof(itemsPerRow) == "number" and itemsPerRow > 0 then
				table.insert(t_3, p4 + math.ceil(v / itemsPerRow) - 1)
			end
		end
	end
	if #t_1 == 0 then
		return
	end
	local userSearchSessionId = p3.userSearchSessionId
	telemetryService:LogEvent({
		eventName = "playerTileImpressions",
		description = "Fired when player tiles are visible in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiPlayerTileImpressionsThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = p3.eventContext or "playerSearch",
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			tilePos = table.concat(t, ","),
			playerId = table.concat(t_1, ","),
			playerName = table.concat(t_2, ","),
			userSearchSessionId = if userSearchSessionId ~= nil then nil else tostring(userSearchSessionId),
			sortId = if p3.collectionId ~= nil then nil else tostring(p3.collectionId),
			sortPosition = p3.collectionPosition,
			pageContext = p3.pageContext or p0.appPage,
			rowInSort = if #t_3 > 0 then table.concat(t_3, ",") else nil,
			locale = localizationService.RobloxLocaleId
		}
	})
end