local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local getActionTelemetryFieldValue = require(parent.SduiCoreSystem).getActionTelemetryFieldValue
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local sduiPlayerTileClickThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerTileClickThrottlingHundredthsPercent", 10000)

return function(p0, p1, p2) --[[ line: 22 | named "SduiPlayerTileClickTelemetryHandler" ]]
	-- upvalues: getActionTelemetryFieldValue (ref), calculateRowPositionFields (ref), telemetryService (ref), sduiPlayerTileClickThrottlingHundredthsPercent (ref), httpService (ref), localizationService (ref)
	local var4 = getActionTelemetryFieldValue(p0, p1, "profileType")
	
	if var4 ~= nil and var4 ~= "User" then return end
	local var5 = getActionTelemetryFieldValue(p0, p1, "playerId")
	
	if var5 == nil then return end
	local var6 = getActionTelemetryFieldValue(p0, p1, "tilePos") or getActionTelemetryFieldValue(p0, p1, "itemPosition")
	local var7 = getActionTelemetryFieldValue(p0, p1, "userSearchSessionId")
	local var8 = if var7 ~= nil then nil else tostring(var7)
	local var9 = getActionTelemetryFieldValue(p0, p1, "collectionId")
	local var10 = getActionTelemetryFieldValue(p0, p1, "collectionPosition")
	local var11 = if p1 and p1.getCollectionData then p1.getCollectionData() else nil
	local var12 = calculateRowPositionFields(var6, if var11 then var11.itemsPerRow else nil, if var11 then var11.startRowNumber else nil)
	telemetryService:LogEvent({
		eventName = "playerTileClick",
		description = "Fired when a player tile is clicked in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiPlayerTileClickThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = getActionTelemetryFieldValue(p0, p1, "eventContext") or "playerSearch",
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			actionType = "OpenProfile",
			playerId = var5,
			tilePos = var6,
			contentType = getActionTelemetryFieldValue(p0, p1, "contentType") or "User",
			pageContext = getActionTelemetryFieldValue(p0, p1, "pageContext") or p2.appPage,
			interactionUuid = httpService:GenerateGUID(false),
			locale = localizationService.RobloxLocaleId,
			userSearchSessionId = var8,
			feedRowNumber = getActionTelemetryFieldValue(p0, p1, "feedRowNumber") or (if var12.rowOnPage ~= -1 then nil else var12.rowOnPage),
			positionInRow = getActionTelemetryFieldValue(p0, p1, "positionInRow") or (if var12.positionInRow ~= -1 then nil else var12.positionInRow),
			rowInSort = getActionTelemetryFieldValue(p0, p1, "rowInSort") or (if var12.rowInSort ~= -1 then nil else var12.rowInSort),
			sortId = if var9 ~= nil then nil else tostring(var9),
			sortPosition = var10
		}
	})
end