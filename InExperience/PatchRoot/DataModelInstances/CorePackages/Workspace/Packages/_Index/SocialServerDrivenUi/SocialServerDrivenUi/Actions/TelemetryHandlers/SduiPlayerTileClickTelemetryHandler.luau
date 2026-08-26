local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local sduiPlayerTileClickThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerTileClickThrottlingHundredthsPercent", 10000)

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), calculateRowPositionFields (ref), telemetryService (ref), sduiPlayerTileClickThrottlingHundredthsPercent (ref), httpService (ref), localizationService (ref)
	local var1 = getActionTelemetryFieldValue(p1, p2, "profileType")
	
	if var1 ~= nil and var1 ~= "User" then return end
	local var2 = getActionTelemetryFieldValue(p1, p2, "playerId")
	
	if var2 == nil then return end
	local var3 = getActionTelemetryFieldValue(p1, p2, "tilePos") or getActionTelemetryFieldValue(p1, p2, "itemPosition")
	local var4 = getActionTelemetryFieldValue(p1, p2, "userSearchSessionId")
	local var5 = if var4 ~= nil then nil else tostring(var4)
	local var6 = getActionTelemetryFieldValue(p1, p2, "collectionId")
	local var7 = getActionTelemetryFieldValue(p1, p2, "collectionPosition")
	local var8 = if p2 and p2.getCollectionData then p2.getCollectionData() else nil
	local var9 = calculateRowPositionFields(var3, if var8 then var8.itemsPerRow else nil, if var8 then var8.startRowNumber else nil)
	telemetryService:LogEvent({
		eventName = "playerTileClick",
		description = "Fired when a player tile is clicked in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiPlayerTileClickThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = getActionTelemetryFieldValue(p1, p2, "eventContext") or "playerSearch",
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			actionType = "OpenProfile",
			playerId = var2,
			tilePos = var3,
			contentType = getActionTelemetryFieldValue(p1, p2, "contentType") or "User",
			pageContext = getActionTelemetryFieldValue(p1, p2, "pageContext") or p3.appPage,
			interactionUuid = httpService:GenerateGUID(false),
			locale = localizationService.RobloxLocaleId,
			userSearchSessionId = var5,
			feedRowNumber = getActionTelemetryFieldValue(p1, p2, "feedRowNumber") or (if var9.rowOnPage ~= -1 then nil else var9.rowOnPage),
			positionInRow = getActionTelemetryFieldValue(p1, p2, "positionInRow") or (if var9.positionInRow ~= -1 then nil else var9.positionInRow),
			rowInSort = getActionTelemetryFieldValue(p1, p2, "rowInSort") or (if var9.rowInSort ~= -1 then nil else var9.rowInSort),
			sortId = if var6 ~= nil then nil else tostring(var6),
			sortPosition = var7
		}
	})
end