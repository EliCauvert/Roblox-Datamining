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

return function(p0)
	-- upvalues: fFlagSduiExperienceDetailsSupport (ref), findAnalyticsFieldInAncestors (ref), setGamePlaySession (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), gamePlayIntent (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	local sduiContext = p0.sduiContext
	local analyticsContext = p0.analyticsContext
	local universeId = p0.universeId
	local placeId = p0.placeId
	local rootPlaceId = p0.rootPlaceId or placeId
	local appliedFilters = p0.appliedFilters
	local var3 = if fFlagSduiExperienceDetailsSupport then p0.launchData else nil
	local eventIngest = sduiContext.dependencies.eventIngest
	local sessionService = sduiContext.dependencies.sessionService
	local collectionPosition = nil
	local collectionId = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var4 = analyticsContext.getCollectionData and analyticsContext.getCollectionData() or nil
	
	if var4 then
		collectionPosition = var4.collectionPosition
		collectionId = var4.collectionId
		itemsPerRow = var4.itemsPerRow
		startRowNumber = var4.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", analyticsContext)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", analyticsContext)
	local var7 = findAnalyticsFieldInAncestors("gameSetTargetId", analyticsContext)
	local var8 = findAnalyticsFieldInAncestors("itemPosition", analyticsContext, -1)
	local var9 = findAnalyticsFieldInAncestors("topicDataPosition", analyticsContext, var8)
	local var10 = findAnalyticsFieldInAncestors("heroUnitId", analyticsContext)
	local var11 = findAnalyticsFieldInAncestors("eventContext", analyticsContext, "ExperienceTile")
	local var12 = findAnalyticsFieldInAncestors("referralSource", analyticsContext)
	local var13 = findAnalyticsFieldInAncestors("gamePlaySessionType", analyticsContext)
	
	if var13 then
		setGamePlaySession(sessionService, var13, true)
	end
	local var14 = findAnalyticsFieldInAncestors("nativeAdData", analyticsContext)
	
	if var14 == nil then
		var14 = findAnalyticsFieldInAncestors("adId", analyticsContext)
	end
	if var14 then
		sponsoredGamesRecordClick(sduiContext.dependencies.networking, tostring(var14))
	end
	local _ = nil
	local var15 = if not fFlagSduiExperienceDetailsSupport then if typeof(var8) == "number" and typeof(itemsPerRow) == "number" and (typeof(startRowNumber) == "number" and var8 ~= -1) and (itemsPerRow ~= -1 and startRowNumber ~= -1) then calculateRowPositionFields(var8, itemsPerRow, startRowNumber) else {} else calculateRowPositionFields(var8, itemsPerRow, startRowNumber)
	local var16 = findAnalyticsFieldInAncestors("tileType", analyticsContext, "GameTile")
	
	if not fFlagSduiExperienceDetailsSupport then
		gamePlayIntent(eventIngest, tostring(var11), {
			placeId = tostring(placeId),
			rootPlaceId = tonumber(rootPlaceId),
			universeId = tostring(universeId),
			sortIndex = tostring(collectionPosition_1),
			sortEntryIndex = if var8 then tostring(var8) else nil,
			referralSource = var12,
			gameSetTypeId = tostring(collectionId_1),
			gameSetTargetId = var7,
			appliedFilters = appliedFilters,
			topicDataPosition = var9,
			nativeAdData = var14,
			pageName = sduiContext.appPage,
			positionInRow = var15.positionInRow,
			rowNumber = var15.rowInSort,
			feedRowNumber = var15.rowOnPage,
			heroUnitId = var10,
			tileType = var16,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p0.actionType else nil
		})
		
		return
	end
	local var9_1
	local var17 = gamePlayIntent
	local var18 = eventIngest
	local var19 = tostring(var11)
	local t = {
		placeId = tostring(placeId or rootPlaceId),
		rootPlaceId = tonumber(rootPlaceId),
		universeId = tostring(universeId),
		sortIndex = if collectionPosition_1 then tostring(collectionPosition_1) else nil,
		sortEntryIndex = if typeof(var8) == "number" and var8 ~= -1 then tostring(var8) else nil,
		referralSource = var12,
		gameSetTypeId = if collectionId_1 then tostring(collectionId_1) else nil,
		gameSetTargetId = var7,
		appliedFilters = appliedFilters
	}
	
	if typeof(var9) == "number" and var9 ~= -1 then
		var9_1 = var9 or nil
	end
	t.topicDataPosition = var9_1
	t.nativeAdData = var14
	t.pageName = sduiContext.appPage
	t.positionInRow = var15.positionInRow
	t.rowNumber = var15.rowInSort
	t.feedRowNumber = var15.rowOnPage
	t.heroUnitId = var10
	t.tileType = var16
	t.launchData = var3
	t.actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p0.actionType else nil
	var17(var18, var19, t)
end