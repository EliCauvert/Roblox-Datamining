local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local LocalizationService = game:GetService("LocalizationService")
local GetActionTelemetryFieldValueFunction = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.SduiCoreSystem).getActionTelemetryFieldValue
local SduiPlayerFriendAddThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerFriendAddThrottlingHundredthsPercent", 10000)

return function(PlayerId, p1, p2)
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), TelemetryService (copy), SduiPlayerFriendAddThrottlingHundredthsPercent (copy), HttpService (copy), LocalizationService (copy)
	local TilePos = GetActionTelemetryFieldValueFunction(nil, p1, "tilePos") or GetActionTelemetryFieldValueFunction(nil, p1, "itemPosition")
	local PageContext = GetActionTelemetryFieldValueFunction(nil, p1, "pageContext") or (if p2 then p2.appPage else nil)
	local EventContext = GetActionTelemetryFieldValueFunction(nil, p1, "eventContext") or "playerSearch"
	local ContentType = GetActionTelemetryFieldValueFunction(nil, p1, "contentType") or "User"
	local UserSearchSessionId = GetActionTelemetryFieldValueFunction(nil, p1, "userSearchSessionId")
	local Text = if UserSearchSessionId == nil then nil else tostring(UserSearchSessionId)
	local CollectionId = GetActionTelemetryFieldValueFunction(nil, p1, "collectionId")
	local CollectionPosition = GetActionTelemetryFieldValueFunction(nil, p1, "collectionPosition")
	local CollectionData = if p1 and p1.getCollectionData then p1.getCollectionData() else nil
	local ItemsPerRow = if CollectionData then CollectionData.itemsPerRow else nil
	local StartRowNumber = if CollectionData then CollectionData.startRowNumber else nil
	local v1: number? = nil
	local v2: number? = nil
	local Ceiled: number? = nil
	
	if typeof(TilePos) == "number" and TilePos > 0 and typeof(ItemsPerRow) == "number" and ItemsPerRow > 0 then
		Ceiled = math.ceil(TilePos / ItemsPerRow)
		v2 = (TilePos - 1) % ItemsPerRow + 1
		
		if typeof(StartRowNumber) == "number" then
			v1 = StartRowNumber + Ceiled - 1
		end
	end
	TelemetryService:LogEvent({
		eventName = "playerFriendAdd",
		description = "Fired when a player tile friend request is sent in an SDUI collection",
		backends = { "EventIngest" },
		throttlingPercentage = SduiPlayerFriendAddThrottlingHundredthsPercent,
		lastUpdated = { 26, 7, 17 }
	}, {
		eventContext = EventContext,
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = {
			actionType = "RequestFriendship",
			playerId = PlayerId,
			contentType = ContentType,
			interactionUuid = HttpService:GenerateGUID(false),
			tilePos = TilePos,
			pageContext = PageContext,
			userSearchSessionId = Text,
			feedRowNumber = GetActionTelemetryFieldValueFunction(nil, p1, "feedRowNumber") or v1,
			positionInRow = GetActionTelemetryFieldValueFunction(nil, p1, "positionInRow") or v2,
			rowInSort = GetActionTelemetryFieldValueFunction(nil, p1, "rowInSort") or Ceiled,
			sortId = if CollectionId == nil then nil else tostring(CollectionId),
			sortPosition = CollectionPosition,
			locale = LocalizationService.RobloxLocaleId
		}
	})
end