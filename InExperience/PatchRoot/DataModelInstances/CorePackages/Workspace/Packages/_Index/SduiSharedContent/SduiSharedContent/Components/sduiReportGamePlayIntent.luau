local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local setGamePlaySession = require(parent.RobloxAppSessionization).SetGamePlaySession
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local findAnalyticsFieldInAncestors = require(parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry

return function(p1)
	-- upvalues: findAnalyticsFieldInAncestors (ref), setGamePlaySession (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), gamePlayIntent (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	local sduiContext = p1.sduiContext
	local analyticsContext = p1.analyticsContext
	local universeId = p1.universeId
	local placeId = p1.placeId
	local rootPlaceId = p1.rootPlaceId or placeId
	local appliedFilters = p1.appliedFilters
	local launchData = p1.launchData
	local eventIngest = sduiContext.dependencies.eventIngest
	local sessionService = sduiContext.dependencies.sessionService
	local collectionPosition = nil
	local collectionId = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var1 = analyticsContext.getCollectionData and analyticsContext.getCollectionData() or nil
	
	if var1 then
		collectionPosition = var1.collectionPosition
		collectionId = var1.collectionId
		itemsPerRow = var1.itemsPerRow
		startRowNumber = var1.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", analyticsContext)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", analyticsContext)
	local var2 = findAnalyticsFieldInAncestors("gameSetTargetId", analyticsContext)
	local var3 = findAnalyticsFieldInAncestors("itemPosition", analyticsContext, -1)
	local var4 = findAnalyticsFieldInAncestors("topicDataPosition", analyticsContext, var3)
	local var5 = findAnalyticsFieldInAncestors("heroUnitId", analyticsContext)
	local var6 = findAnalyticsFieldInAncestors("eventContext", analyticsContext, "ExperienceTile")
	local var7 = findAnalyticsFieldInAncestors("referralSource", analyticsContext)
	local var8 = findAnalyticsFieldInAncestors("gamePlaySessionType", analyticsContext)
	
	if var8 then
		setGamePlaySession(sessionService, var8, true)
	end
	local var9 = findAnalyticsFieldInAncestors("nativeAdData", analyticsContext)
	
	if var9 == nil then
		var9 = findAnalyticsFieldInAncestors("adId", analyticsContext)
	end
	if var9 then
		sponsoredGamesRecordClick(sduiContext.dependencies.networking, tostring(var9))
	end
	local var10
	local _ = nil
	local var11 = if typeof(var3) == "number" and typeof(itemsPerRow) == "number" and (typeof(startRowNumber) == "number" and var3 ~= -1) and (itemsPerRow ~= -1 and startRowNumber ~= -1) then calculateRowPositionFields(var3, itemsPerRow, startRowNumber) else {}
	local var12 = findAnalyticsFieldInAncestors("tileType", analyticsContext, "GameTile")
	local var13 = tostring(var6)
	local t = {
		placeId = tostring(placeId or rootPlaceId),
		rootPlaceId = tonumber(rootPlaceId),
		universeId = tostring(universeId),
		sortIndex = if collectionPosition_1 then tostring(collectionPosition_1) else nil,
		sortEntryIndex = if typeof(var3) == "number" and var3 ~= -1 then tostring(var3) else nil,
		referralSource = var7,
		gameSetTypeId = if collectionId_1 then tostring(collectionId_1) else nil,
		gameSetTargetId = var2,
		appliedFilters = appliedFilters
	}
	
	if typeof(var4) == "number" and var4 ~= -1 then
		var10 = var4 or nil
	end
	t.topicDataPosition = var10
	t.nativeAdData = var9
	t.pageName = sduiContext.appPage
	t.positionInRow = var11.positionInRow
	t.rowNumber = var11.rowInSort
	t.feedRowNumber = var11.rowOnPage
	t.heroUnitId = var5
	t.tileType = var12
	t.launchData = launchData
	t.actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p1.actionType else nil
	gamePlayIntent(eventIngest, var13, t)
end