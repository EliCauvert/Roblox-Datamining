local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local localizationService = game:GetService("LocalizationService")
local getActionTelemetryFieldValue = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.SduiCoreSystem).getActionTelemetryFieldValue
local sduiPlayerFriendAddThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerFriendAddThrottlingHundredthsPercent", 10000)

return function(p0, p1, p2)
	-- upvalues: getActionTelemetryFieldValue (ref), telemetryService (ref), sduiPlayerFriendAddThrottlingHundredthsPercent (ref), httpService (ref), localizationService (ref)
	local var4 = getActionTelemetryFieldValue(nil, p1, "tilePos") or getActionTelemetryFieldValue(nil, p1, "itemPosition")
	local var5 = getActionTelemetryFieldValue(nil, p1, "pageContext") or (if p2 then p2.appPage else nil)
	local var6 = getActionTelemetryFieldValue(nil, p1, "eventContext") or "playerSearch"
	local var7 = getActionTelemetryFieldValue(nil, p1, "contentType") or "User"
	local var8 = getActionTelemetryFieldValue(nil, p1, "userSearchSessionId")
	local var9 = if var8 ~= nil then nil else tostring(var8)
	local var10 = getActionTelemetryFieldValue(nil, p1, "collectionId")
	local var11 = getActionTelemetryFieldValue(nil, p1, "collectionPosition")
	local var12 = if p1 and p1.getCollectionData then p1.getCollectionData() else nil
	local var13 = if var12 then var12.itemsPerRow else nil
	local var14 = if var12 then var12.startRowNumber else nil
	local var15 = nil
	local var16 = nil
	local ceiled = nil
	
	if typeof(var4) == "number" and var4 > 0 and (typeof(var13) == "number" and var13 > 0) then
		ceiled = math.ceil(var4 / var13)
		var16 = (var4 - 1) % var13 + 1
		
		if typeof(var14) == "number" then
			var15 = var14 + ceiled - 1
		end
	end
	telemetryService:LogEvent({
		eventName = "playerFriendAdd",
		description = "Fired when a player tile friend request is sent in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiPlayerFriendAddThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = var6,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			actionType = "RequestFriendship",
			playerId = p0,
			contentType = var7,
			interactionUuid = httpService:GenerateGUID(false),
			tilePos = var4,
			pageContext = var5,
			userSearchSessionId = var9,
			feedRowNumber = getActionTelemetryFieldValue(nil, p1, "feedRowNumber") or var15,
			positionInRow = getActionTelemetryFieldValue(nil, p1, "positionInRow") or var16,
			rowInSort = getActionTelemetryFieldValue(nil, p1, "rowInSort") or ceiled,
			sortId = if var10 ~= nil then nil else tostring(var10),
			sortPosition = var11,
			locale = localizationService.RobloxLocaleId
		}
	})
end