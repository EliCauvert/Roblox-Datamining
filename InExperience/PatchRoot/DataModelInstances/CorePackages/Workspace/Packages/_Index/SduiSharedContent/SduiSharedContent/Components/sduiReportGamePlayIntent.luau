local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local setGamePlaySession = require(parent.RobloxAppSessionization).SetGamePlaySession
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local findAnalyticsFieldInAncestors = require(parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry

return function(p1)
	-- upvalues: fFlagSduiExperienceDetailsSupport (ref), findAnalyticsFieldInAncestors (ref), setGamePlaySession (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), gamePlayIntent (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	local sduiContext = p1.sduiContext
	local analyticsContext = p1.analyticsContext
	local universeId = p1.universeId
	local placeId = p1.placeId
	local rootPlaceId = p1.rootPlaceId or placeId
	local appliedFilters = p1.appliedFilters
	local var1 = if fFlagSduiExperienceDetailsSupport then p1.launchData else nil
	local eventIngest = sduiContext.dependencies.eventIngest
	local sessionService = sduiContext.dependencies.sessionService
	local collectionPosition = nil
	local collectionId = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var2 = analyticsContext.getCollectionData and analyticsContext.getCollectionData() or nil
	
	if var2 then
		collectionPosition = var2.collectionPosition
		collectionId = var2.collectionId
		itemsPerRow = var2.itemsPerRow
		startRowNumber = var2.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", analyticsContext)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", analyticsContext)
	local var3 = findAnalyticsFieldInAncestors("gameSetTargetId", analyticsContext)
	local var4 = findAnalyticsFieldInAncestors("itemPosition", analyticsContext, -1)
	local var5 = findAnalyticsFieldInAncestors("topicDataPosition", analyticsContext, var4)
	local var6 = findAnalyticsFieldInAncestors("heroUnitId", analyticsContext)
	local var7 = findAnalyticsFieldInAncestors("eventContext", analyticsContext, "ExperienceTile")
	local var8 = findAnalyticsFieldInAncestors("referralSource", analyticsContext)
	local var9 = findAnalyticsFieldInAncestors("gamePlaySessionType", analyticsContext)
	
	if var9 then
		setGamePlaySession(sessionService, var9, true)
	end
	local var10 = findAnalyticsFieldInAncestors("nativeAdData", analyticsContext)
	
	if var10 == nil then
		var10 = findAnalyticsFieldInAncestors("adId", analyticsContext)
	end
	if var10 then
		sponsoredGamesRecordClick(sduiContext.dependencies.networking, tostring(var10))
	end
	local _ = nil
	local var11 = if not fFlagSduiExperienceDetailsSupport then if typeof(var4) == "number" and typeof(itemsPerRow) == "number" and (typeof(startRowNumber) == "number" and var4 ~= -1) and (itemsPerRow ~= -1 and startRowNumber ~= -1) then calculateRowPositionFields(var4, itemsPerRow, startRowNumber) else {} else calculateRowPositionFields(var4, itemsPerRow, startRowNumber)
	local var12 = findAnalyticsFieldInAncestors("tileType", analyticsContext, "GameTile")
	
	if not fFlagSduiExperienceDetailsSupport then
		gamePlayIntent(eventIngest, tostring(var7), {
			placeId = tostring(placeId),
			rootPlaceId = tonumber(rootPlaceId),
			universeId = tostring(universeId),
			sortIndex = tostring(collectionPosition_1),
			sortEntryIndex = if var4 then tostring(var4) else nil,
			referralSource = var8,
			gameSetTypeId = tostring(collectionId_1),
			gameSetTargetId = var3,
			appliedFilters = appliedFilters,
			topicDataPosition = var5,
			nativeAdData = var10,
			pageName = sduiContext.appPage,
			positionInRow = var11.positionInRow,
			rowNumber = var11.rowInSort,
			feedRowNumber = var11.rowOnPage,
			heroUnitId = var6,
			tileType = var12,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p1.actionType else nil
		})
		
		return
	end
	local var13
	local var14 = gamePlayIntent
	local var15 = eventIngest
	local var16 = tostring(var7)
	local t = {
		placeId = tostring(placeId or rootPlaceId),
		rootPlaceId = tonumber(rootPlaceId),
		universeId = tostring(universeId),
		sortIndex = if collectionPosition_1 then tostring(collectionPosition_1) else nil,
		sortEntryIndex = if typeof(var4) == "number" and var4 ~= -1 then tostring(var4) else nil,
		referralSource = var8,
		gameSetTypeId = if collectionId_1 then tostring(collectionId_1) else nil,
		gameSetTargetId = var3,
		appliedFilters = appliedFilters
	}
	
	if typeof(var5) == "number" and var5 ~= -1 then
		var13 = var5 or nil
	end
	t.topicDataPosition = var13
	t.nativeAdData = var10
	t.pageName = sduiContext.appPage
	t.positionInRow = var11.positionInRow
	t.rowNumber = var11.rowInSort
	t.feedRowNumber = var11.rowOnPage
	t.heroUnitId = var6
	t.tileType = var12
	t.launchData = var1
	t.actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p1.actionType else nil
	var14(var15, var16, t)
end