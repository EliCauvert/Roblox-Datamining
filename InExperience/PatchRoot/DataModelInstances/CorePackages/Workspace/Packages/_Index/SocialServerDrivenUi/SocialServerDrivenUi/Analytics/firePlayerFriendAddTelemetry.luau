local httpService = game:GetService("HttpService")
local telemetryService = game:GetService("TelemetryService")
local localizationService = game:GetService("LocalizationService")
local getActionTelemetryFieldValue = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.SduiCoreSystem).getActionTelemetryFieldValue
local sduiPlayerFriendAddThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerFriendAddThrottlingHundredthsPercent", 10000)

return function(p1, p2, p3)
	-- upvalues: getActionTelemetryFieldValue (ref), telemetryService (ref), sduiPlayerFriendAddThrottlingHundredthsPercent (ref), httpService (ref), localizationService (ref)
	local var1 = getActionTelemetryFieldValue(nil, p2, "tilePos") or getActionTelemetryFieldValue(nil, p2, "itemPosition")
	local var2 = getActionTelemetryFieldValue(nil, p2, "pageContext") or (if p3 then p3.appPage else nil)
	local var3 = getActionTelemetryFieldValue(nil, p2, "eventContext") or "playerSearch"
	local var4 = getActionTelemetryFieldValue(nil, p2, "contentType") or "User"
	local var5 = getActionTelemetryFieldValue(nil, p2, "userSearchSessionId")
	local var6 = if var5 ~= nil then nil else tostring(var5)
	local var7 = getActionTelemetryFieldValue(nil, p2, "collectionId")
	local var8 = getActionTelemetryFieldValue(nil, p2, "collectionPosition")
	local var9 = if p2 and p2.getCollectionData then p2.getCollectionData() else nil
	local var10 = if var9 then var9.itemsPerRow else nil
	local var11 = if var9 then var9.startRowNumber else nil
	local var12 = nil
	local var13 = nil
	local ceiled = nil
	
	if typeof(var1) == "number" and var1 > 0 and (typeof(var10) == "number" and var10 > 0) then
		ceiled = math.ceil(var1 / var10)
		var13 = (var1 - 1) % var10 + 1
		
		if typeof(var11) == "number" then
			var12 = var11 + ceiled - 1
		end
	end
	telemetryService:LogEvent({
		eventName = "playerFriendAdd",
		description = "Fired when a player tile friend request is sent in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = sduiPlayerFriendAddThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = var3,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			actionType = "RequestFriendship",
			playerId = p1,
			contentType = var4,
			interactionUuid = httpService:GenerateGUID(false),
			tilePos = var1,
			pageContext = var2,
			userSearchSessionId = var6,
			feedRowNumber = getActionTelemetryFieldValue(nil, p2, "feedRowNumber") or var12,
			positionInRow = getActionTelemetryFieldValue(nil, p2, "positionInRow") or var13,
			rowInSort = getActionTelemetryFieldValue(nil, p2, "rowInSort") or ceiled,
			sortId = if var7 ~= nil then nil else tostring(var7),
			sortPosition = var8,
			locale = localizationService.RobloxLocaleId
		}
	})
end