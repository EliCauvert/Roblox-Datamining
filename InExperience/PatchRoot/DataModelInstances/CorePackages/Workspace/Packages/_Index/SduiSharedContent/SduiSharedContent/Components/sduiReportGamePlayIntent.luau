local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local setGamePlaySession = require(parent.RobloxAppSessionization).SetGamePlaySession
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local gamePlayIntent = discoveryAnalyticsModule.Events.gamePlayIntent
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local findAnalyticsFieldInAncestors = require(parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return function(p0) --[[ line: 31 | named "sduiReportGamePlayIntent" ]]
	-- upvalues: fFlagSduiExperienceDetailsSupport (ref), findAnalyticsFieldInAncestors (ref), setGamePlaySession (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), gamePlayIntent (ref)
	local sduiContext = p0.sduiContext
	local analyticsContext = p0.analyticsContext
	local universeId = p0.universeId
	local placeId = p0.placeId
	local rootPlaceId = p0.rootPlaceId or placeId
	local appliedFilters = p0.appliedFilters
	local var2 = if fFlagSduiExperienceDetailsSupport then p0.launchData else nil
	local eventIngest = sduiContext.dependencies.eventIngest
	local sessionService = sduiContext.dependencies.sessionService
	local collectionPosition = nil
	local collectionId = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var3 = analyticsContext.getCollectionData and analyticsContext.getCollectionData() or nil
	
	if var3 then
		collectionPosition = var3.collectionPosition
		collectionId = var3.collectionId
		itemsPerRow = var3.itemsPerRow
		startRowNumber = var3.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", analyticsContext)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", analyticsContext)
	local var6 = findAnalyticsFieldInAncestors("gameSetTargetId", analyticsContext)
	local var7 = findAnalyticsFieldInAncestors("itemPosition", analyticsContext, -1)
	local var8 = findAnalyticsFieldInAncestors("topicDataPosition", analyticsContext, var7)
	local var9 = findAnalyticsFieldInAncestors("heroUnitId", analyticsContext)
	local var10 = findAnalyticsFieldInAncestors("eventContext", analyticsContext, "ExperienceTile")
	local var11 = findAnalyticsFieldInAncestors("referralSource", analyticsContext)
	local var12 = findAnalyticsFieldInAncestors("gamePlaySessionType", analyticsContext)
	
	if var12 then
		setGamePlaySession(sessionService, var12, true)
	end
	local var13 = findAnalyticsFieldInAncestors("nativeAdData", analyticsContext)
	
	if var13 == nil then
		var13 = findAnalyticsFieldInAncestors("adId", analyticsContext)
	end
	if var13 then
		sponsoredGamesRecordClick(sduiContext.dependencies.networking, tostring(var13))
	end
	local _ = nil
	local var14 = if not fFlagSduiExperienceDetailsSupport then if typeof(var7) == "number" and typeof(itemsPerRow) == "number" and (typeof(startRowNumber) == "number" and var7 ~= -1) and (itemsPerRow ~= -1 and startRowNumber ~= -1) then calculateRowPositionFields(var7, itemsPerRow, startRowNumber) else {} else calculateRowPositionFields(var7, itemsPerRow, startRowNumber)
	local var15 = findAnalyticsFieldInAncestors("tileType", analyticsContext, "GameTile")
	
	if not fFlagSduiExperienceDetailsSupport then
		gamePlayIntent(eventIngest, tostring(var10), {
			placeId = tostring(placeId),
			rootPlaceId = tonumber(rootPlaceId),
			universeId = tostring(universeId),
			sortIndex = tostring(collectionPosition_1),
			sortEntryIndex = if var7 then tostring(var7) else nil,
			referralSource = var11,
			gameSetTypeId = tostring(collectionId_1),
			gameSetTargetId = var6,
			appliedFilters = appliedFilters,
			topicDataPosition = var8,
			nativeAdData = var13,
			pageName = sduiContext.appPage,
			positionInRow = var14.positionInRow,
			rowNumber = var14.rowInSort,
			feedRowNumber = var14.rowOnPage,
			heroUnitId = var9,
			tileType = var15
		})
		
		return
	end
	local var8_1
	local var16 = gamePlayIntent
	local var17 = eventIngest
	local var18 = tostring(var10)
	local t = {
		placeId = tostring(placeId or rootPlaceId),
		rootPlaceId = tonumber(rootPlaceId),
		universeId = tostring(universeId),
		sortIndex = if collectionPosition_1 then tostring(collectionPosition_1) else nil,
		sortEntryIndex = if typeof(var7) == "number" and var7 ~= -1 then tostring(var7) else nil,
		referralSource = var11,
		gameSetTypeId = if collectionId_1 then tostring(collectionId_1) else nil,
		gameSetTargetId = var6,
		appliedFilters = appliedFilters
	}
	
	if typeof(var8) == "number" and var8 ~= -1 then
		var8_1 = var8 or nil
	end
	t.topicDataPosition = var8_1
	t.nativeAdData = var13
	t.pageName = sduiContext.appPage
	t.positionInRow = var14.positionInRow
	t.rowNumber = var14.rowInSort
	t.feedRowNumber = var14.rowOnPage
	t.heroUnitId = var9
	t.tileType = var15
	t.launchData = var2
	var16(var17, var18, t)
end