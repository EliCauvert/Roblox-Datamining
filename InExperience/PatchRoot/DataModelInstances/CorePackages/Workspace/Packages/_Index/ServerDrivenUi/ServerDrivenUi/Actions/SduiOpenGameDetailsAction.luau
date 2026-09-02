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
local t = {}

return function(p1, p2, p3)
	-- upvalues: sduiErrors (ref), getInputModeStore (ref), t (ref), findAnalyticsFieldInAncestors (ref), intervalPerformanceTracker (ref), sduiParsers (ref), fFlagLuaAppAddSeeAllFlagToGameDetailReferral (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), fFlagSduiEdpInheritGameDetailSourceSession (ref), openGameDetails (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), fFlagEnableExperienceDetailsBottomSheet (ref), appPage (ref), fFlagSduiEdpPrefetchPlayability (ref), fFlagLuaAppSduiEdpEnabled (ref)
	p3.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsAction, { name = getInputModeStore(false).getLastInputType(false) }, true)
	local var1 = if p1 then p1.actionParams else t
	local var2 = findAnalyticsFieldInAncestors("itemComponentType", p2)
	
	if var2 == "Tile" or var2 == "GameTile" then
		intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
	end
	local placeId = var1.placeId or findAnalyticsFieldInAncestors("placeId", p2)
	local universeId = var1.universeId or findAnalyticsFieldInAncestors("universeId", p2)
	local var3 = findAnalyticsFieldInAncestors("itemPosition", p2)
	local var4 = sduiParsers.safeParseBoolean(findAnalyticsFieldInAncestors("adFlag", p2, false), p3, p2)
	local var5 = findAnalyticsFieldInAncestors("nativeAdData", p2)
	
	if var5 == nil then
		var5 = findAnalyticsFieldInAncestors("adId", p2)
	end
	local var6 = findAnalyticsFieldInAncestors("navigationUniverseId", p2, universeId)
	local collectionPosition = nil
	local collectionId = nil
	local totalNumberOfItems = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var7 = p2.getCollectionData and p2.getCollectionData() or nil
	
	if var7 then
		collectionPosition = var7.collectionPosition
		collectionId = var7.collectionId
		totalNumberOfItems = var7.totalNumberOfItems
		itemsPerRow = var7.itemsPerRow
		startRowNumber = var7.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", p2)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", p2)
	local totalNumberOfItems_1 = totalNumberOfItems or findAnalyticsFieldInAncestors("totalNumberOfItems", p2)
	local var8 = findAnalyticsFieldInAncestors("gameSetTargetId", p2)
	local var9 = findAnalyticsFieldInAncestors("heroUnitId", p2)
	local var10 = if fFlagLuaAppAddSeeAllFlagToGameDetailReferral then tonumber(findAnalyticsFieldInAncestors("seeAllFlag", p2)) or 0 else nil
	local dependencies = p3.dependencies
	
	if var4 and var5 then
		sponsoredGamesRecordClick(dependencies.networking, tostring(var5))
	end
	local var11 = calculateRowPositionFields(var3, itemsPerRow, startRowNumber)
	local var12 = findAnalyticsFieldInAncestors("appliedFilters", p2)
	
	if fFlagSduiEdpInheritGameDetailSourceSession and var1.inheritReferralSession == true then
		dependencies.gameAnalytics.reportOpenGameDetailFromGameDetail(placeId, var3, totalNumberOfItems_1, var4, var5, tostring(universeId), p3.appPage, findAnalyticsFieldInAncestors("hostUniverseId", p2))
	else
		dependencies.gameAnalytics.reportOpenGameDetailWithId(placeId, tostring(collectionId_1), var8, collectionPosition_1, var3, totalNumberOfItems_1, var4, var5, tostring(universeId), p3.appPage, tostring(var6), var12, var3, true, var11.positionInRow, var11.rowInSort, var11.rowOnPage, var9, nil, nil, nil, nil, if fFlagLuaAppAddSeeAllFlagToGameDetailReferral then var10 else nil)
	end
	local var13
	local navigation = dependencies.getNavigation()
	local dispatch = dependencies.dispatch
	local var14 = tostring(var6)
	local t_1 = { index = var3 }
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents then
		var13 = nil
	elseif fFlagEnableExperienceDetailsBottomSheet then
		var13 = p3.appPage == appPage.GameDetail
		var13 = nil
	else
		var13 = nil
	end
	t_1.mountAsFullView = var13
	dispatch(openGameDetails(var14, navigation, t_1, if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then dependencies.networking else nil))
	p3.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsActionFinish, { name = getInputModeStore(false).getLastInputType(false) }, true)
end