local TelemetryService = game:GetService("TelemetryService")
local LocalizationService = game:GetService("LocalizationService")
local SduiErrors = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.SduiCoreSystem).SduiErrors
local SduiPlayerTileImpressionsThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerTileImpressionsThrottlingHundredthsPercent", 10000)

return function(p1, List, p2, p3, p4) --[[ Line: 18 | Named "SduiPlayerTileImpressionsHandler" ]]
	-- upvalues: SduiErrors (copy), TelemetryService (copy), SduiPlayerTileImpressionsThrottlingHundredthsPercent (copy), LocalizationService (copy)
	if not p3 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogPlayerTileImpressions, {
			name = "SduiPlayerTileImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	if #List == 0 or #p2 == 0 then return end
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local List4 = {}
	local ItemsPerRow: number = p3.itemsPerRow
	
	for _, value in List do
		local v1 = p2[value]
		local PlayerId = if v1 then v1.playerId else nil
		
		if PlayerId ~= nil then
			table.insert(List1, value)
			table.insert(List2, PlayerId)
			table.insert(List3, v1.playerName or (v1.name or (v1.username or "")))
			
			if typeof(p4) == "number" and typeof(ItemsPerRow) == "number" and ItemsPerRow > 0 then
				table.insert(List4, p4 + math.ceil(value / ItemsPerRow) - 1)
			end
		end
	end
	if #List2 ~= 0 then
		local UserSearchSessionId = p3.userSearchSessionId
		TelemetryService:LogEvent({
			eventName = "playerTileImpressions",
			description = "Fired when player tiles are visible in an SDUI collection",
			backends = { "EventIngest" },
			throttlingPercentage = SduiPlayerTileImpressionsThrottlingHundredthsPercent,
			lastUpdated = { 26, 7, 17 }
		}, {
			eventContext = p3.eventContext or "playerSearch",
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = {
				tilePos = table.concat(List1, ","),
				playerId = table.concat(List2, ","),
				playerName = table.concat(List3, ","),
				userSearchSessionId = if UserSearchSessionId == nil then nil else tostring(UserSearchSessionId),
				sortId = if p3.collectionId == nil then nil else tostring(p3.collectionId),
				sortPosition = p3.collectionPosition,
				pageContext = p3.pageContext or p1.appPage,
				rowInSort = if #List4 > 0 then table.concat(List4, ",") else nil,
				locale = LocalizationService.RobloxLocaleId
			}
		})
		
		return
	end
end