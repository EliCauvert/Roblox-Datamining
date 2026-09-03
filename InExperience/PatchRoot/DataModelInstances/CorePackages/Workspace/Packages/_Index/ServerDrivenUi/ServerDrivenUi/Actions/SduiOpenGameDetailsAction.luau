local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local getInputModeStore = require(parent.Responsive).GetInputModeStore
local appPage = require(parent.RobloxAppEnums).AppPage
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local intervalPerformanceTracker = require(parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local sponsoredGamesRecordClick = require(parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local findAnalyticsFieldInAncestors = sduiCoreSystemModule.findAnalyticsFieldInAncestors
local sduiParsers = sduiCoreSystemModule.SduiParsers
local sduiErrors = sduiCoreSystemModule.SduiErrors
local fFlagEnableExperienceDetailsBottomSheet = require(parent.SharedFlags).FFlagEnableExperienceDetailsBottomSheet
local fFlagLuaAppEdpBottomSheetPeekViewEvents = require(parent.SharedFlags).FFlagLuaAppEdpBottomSheetPeekViewEvents
local fFlagSduiEdpPrefetchPlayability = require(parent.SharedFlags).FFlagSduiEdpPrefetchPlayability
local fFlagLuaAppSduiEdpEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEdpEnabled
local fFlagSduiEdpInheritGameDetailSourceSession = require(parent.SharedFlags).FFlagSduiEdpInheritGameDetailSourceSession
local fFlagLuaAppAddSeeAllFlagToGameDetailReferral = require(parent.SharedFlags).FFlagLuaAppAddSeeAllFlagToGameDetailReferral
local fFlagSduiFixSearchTelemetry = require(parent.SharedFlags).FFlagSduiFixSearchTelemetry
local t = {}

return function(p1, p2, p3)
	-- upvalues: sduiErrors (ref), getInputModeStore (ref), t (ref), findAnalyticsFieldInAncestors (ref), intervalPerformanceTracker (ref), fFlagSduiFixSearchTelemetry (ref), sduiParsers (ref), fFlagLuaAppAddSeeAllFlagToGameDetailReferral (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), fFlagSduiEdpInheritGameDetailSourceSession (ref), openGameDetails (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), fFlagEnableExperienceDetailsBottomSheet (ref), appPage (ref), fFlagSduiEdpPrefetchPlayability (ref), fFlagLuaAppSduiEdpEnabled (ref)
	p3.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsAction, { name = getInputModeStore(false).getLastInputType(false) }, true)
	local var1 = if p1 then p1.actionParams else t
	local var2 = findAnalyticsFieldInAncestors("itemComponentType", p2)
	
	if var2 == "Tile" or var2 == "GameTile" then
		intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
	end
	local placeId = var1.placeId or findAnalyticsFieldInAncestors("placeId", p2)
	local universeId = var1.universeId or findAnalyticsFieldInAncestors("universeId", p2)
	local var3 = findAnalyticsFieldInAncestors("itemPosition", p2)
	local var4 = if fFlagSduiFixSearchTelemetry then findAnalyticsFieldInAncestors("topicDataPosition", p2, var3) else var3
	local var5 = sduiParsers.safeParseBoolean(findAnalyticsFieldInAncestors("adFlag", p2, false), p3, p2)
	local var6 = findAnalyticsFieldInAncestors("nativeAdData", p2)
	
	if var6 == nil then
		var6 = findAnalyticsFieldInAncestors("adId", p2)
	end
	local var7 = findAnalyticsFieldInAncestors("navigationUniverseId", p2, universeId)
	local collectionPosition = nil
	local collectionId = nil
	local totalNumberOfItems = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var8 = p2.getCollectionData and p2.getCollectionData() or nil
	
	if var8 then
		collectionPosition = var8.collectionPosition
		collectionId = var8.collectionId
		totalNumberOfItems = var8.totalNumberOfItems
		itemsPerRow = var8.itemsPerRow
		startRowNumber = var8.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", p2)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", p2)
	local totalNumberOfItems_1 = totalNumberOfItems or findAnalyticsFieldInAncestors("totalNumberOfItems", p2)
	local var9 = findAnalyticsFieldInAncestors("gameSetTargetId", p2)
	local var10 = findAnalyticsFieldInAncestors("heroUnitId", p2)
	local var11 = if fFlagLuaAppAddSeeAllFlagToGameDetailReferral then tonumber(findAnalyticsFieldInAncestors("seeAllFlag", p2)) or 0 else nil
	local dependencies = p3.dependencies
	
	if var5 and var6 then
		sponsoredGamesRecordClick(dependencies.networking, tostring(var6))
	end
	local var12 = calculateRowPositionFields(var3, itemsPerRow, startRowNumber)
	local var13 = findAnalyticsFieldInAncestors("appliedFilters", p2)
	
	if fFlagSduiEdpInheritGameDetailSourceSession and var1.inheritReferralSession == true then
		dependencies.gameAnalytics.reportOpenGameDetailFromGameDetail(placeId, var3, totalNumberOfItems_1, var5, var6, tostring(universeId), p3.appPage, findAnalyticsFieldInAncestors("hostUniverseId", p2))
	else
		dependencies.gameAnalytics.reportOpenGameDetailWithId(placeId, tostring(collectionId_1), var9, collectionPosition_1, var3, totalNumberOfItems_1, var5, var6, tostring(universeId), p3.appPage, tostring(var7), var13, var4, true, var12.positionInRow, var12.rowInSort, var12.rowOnPage, var10, nil, nil, nil, nil, if fFlagLuaAppAddSeeAllFlagToGameDetailReferral then var11 else nil)
	end
	local var14
	local navigation = dependencies.getNavigation()
	local dispatch = dependencies.dispatch
	local var15 = tostring(var7)
	local t_1 = { index = var3 }
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents then
		var14 = nil
	elseif fFlagEnableExperienceDetailsBottomSheet then
		var14 = p3.appPage == appPage.GameDetail
		var14 = nil
	else
		var14 = nil
	end
	t_1.mountAsFullView = var14
	dispatch(openGameDetails(var15, navigation, t_1, if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then dependencies.networking else nil))
	p3.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsActionFinish, { name = getInputModeStore(false).getLastInputType(false) }, true)
end