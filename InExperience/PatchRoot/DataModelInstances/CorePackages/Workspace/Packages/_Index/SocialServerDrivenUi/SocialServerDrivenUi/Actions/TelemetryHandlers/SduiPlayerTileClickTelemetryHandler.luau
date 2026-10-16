local HttpService = game:GetService("HttpService")
local TelemetryService = game:GetService("TelemetryService")
local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local GetActionTelemetryFieldValueFunction = require(Parent.SduiCoreSystem).getActionTelemetryFieldValue
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local SduiPlayerTileClickThrottlingHundredthsPercent = game:DefineFastInt("SduiPlayerTileClickThrottlingHundredthsPercent", 10000)

return function(p1, p2, p3) --[[ Line: 22 | Named "SduiPlayerTileClickTelemetryHandler" ]]
	-- upvalues: GetActionTelemetryFieldValueFunction (copy), CalculateRowPositionFieldsFunction (copy), TelemetryService (copy), SduiPlayerTileClickThrottlingHundredthsPercent (copy), HttpService (copy), LocalizationService (copy)
	local ProfileType = GetActionTelemetryFieldValueFunction(p1, p2, "profileType")
	
	if ProfileType ~= nil and ProfileType ~= "User" then return end
	local PlayerId = GetActionTelemetryFieldValueFunction(p1, p2, "playerId")
	
	if PlayerId ~= nil then
		local TilePos = GetActionTelemetryFieldValueFunction(p1, p2, "tilePos") or GetActionTelemetryFieldValueFunction(p1, p2, "itemPosition")
		local UserSearchSessionId = GetActionTelemetryFieldValueFunction(p1, p2, "userSearchSessionId")
		local CollectionId = GetActionTelemetryFieldValueFunction(p1, p2, "collectionId")
		local CollectionPosition = GetActionTelemetryFieldValueFunction(p1, p2, "collectionPosition")
		local CollectionData = if p2 and p2.getCollectionData then p2.getCollectionData() else nil
		local RowPositionFields = CalculateRowPositionFieldsFunction(TilePos, if CollectionData then CollectionData.itemsPerRow else nil, if CollectionData then CollectionData.startRowNumber else nil)
		TelemetryService:LogEvent({
			eventName = "playerTileClick",
			description = "Fired when a player tile is clicked in an SDUI collection",
			backends = { "EventIngest" },
			throttlingPercentage = SduiPlayerTileClickThrottlingHundredthsPercent,
			lastUpdated = { 26, 7, 17 }
		}, {
			eventContext = GetActionTelemetryFieldValueFunction(p1, p2, "eventContext") or "playerSearch",
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
			customFields = {
				actionType = "OpenProfile",
				playerId = PlayerId,
				tilePos = TilePos,
				contentType = GetActionTelemetryFieldValueFunction(p1, p2, "contentType") or "User",
				pageContext = GetActionTelemetryFieldValueFunction(p1, p2, "pageContext") or p3.appPage,
				interactionUuid = HttpService:GenerateGUID(false),
				locale = LocalizationService.RobloxLocaleId,
				userSearchSessionId = if UserSearchSessionId == nil then nil else tostring(UserSearchSessionId),
				feedRowNumber = GetActionTelemetryFieldValueFunction(p1, p2, "feedRowNumber") or (if RowPositionFields.rowOnPage == -1 then nil else RowPositionFields.rowOnPage),
				positionInRow = GetActionTelemetryFieldValueFunction(p1, p2, "positionInRow") or (if RowPositionFields.positionInRow == -1 then nil else RowPositionFields.positionInRow),
				rowInSort = GetActionTelemetryFieldValueFunction(p1, p2, "rowInSort") or (if RowPositionFields.rowInSort == -1 then nil else RowPositionFields.rowInSort),
				sortId = if CollectionId == nil then nil else tostring(CollectionId),
				sortPosition = CollectionPosition
			}
		})
		
		return
	end
end