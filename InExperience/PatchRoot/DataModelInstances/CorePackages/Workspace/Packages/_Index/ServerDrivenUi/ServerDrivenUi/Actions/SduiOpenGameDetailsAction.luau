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
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiEdpPrefetchPlayability = require(parent.SharedFlags).FFlagSduiEdpPrefetchPlayability
local fFlagLuaAppSduiEdpEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEdpEnabled
local fFlagSduiEdpInheritGameDetailSourceSession = require(parent.SharedFlags).FFlagSduiEdpInheritGameDetailSourceSession
local t = {}

return function(p0, p1, p2) --[[ line: 32 ]]
	-- upvalues: sduiErrors (ref), getInputModeStore (ref), t (ref), findAnalyticsFieldInAncestors (ref), intervalPerformanceTracker (ref), sduiParsers (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), fFlagSduiChartsSupport (ref), fFlagSduiEdpInheritGameDetailSourceSession (ref), openGameDetails (ref), fFlagEnableExperienceDetailsBottomSheet (ref), appPage (ref), fFlagSduiEdpPrefetchPlayability (ref), fFlagLuaAppSduiEdpEnabled (ref)
	p2.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsAction, { name = getInputModeStore(false).getLastInputType(false) }, true)
	local var2 = if p0 then p0.actionParams else t
	local var3 = findAnalyticsFieldInAncestors("itemComponentType", p1)
	
	if var3 == "Tile" or var3 == "GameTile" then
		intervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
	end
	local placeId = var2.placeId or findAnalyticsFieldInAncestors("placeId", p1)
	local universeId = var2.universeId or findAnalyticsFieldInAncestors("universeId", p1)
	local var6 = findAnalyticsFieldInAncestors("itemPosition", p1)
	local var7 = sduiParsers.safeParseBoolean(findAnalyticsFieldInAncestors("adFlag", p1, false), p2, p1)
	local var8 = findAnalyticsFieldInAncestors("nativeAdData", p1)
	
	if var8 == nil then
		var8 = findAnalyticsFieldInAncestors("adId", p1)
	end
	local var9 = findAnalyticsFieldInAncestors("navigationUniverseId", p1, universeId)
	local collectionPosition = nil
	local collectionId = nil
	local totalNumberOfItems = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var10 = p1.getCollectionData and p1.getCollectionData() or nil
	
	if var10 then
		collectionPosition = var10.collectionPosition
		collectionId = var10.collectionId
		totalNumberOfItems = var10.totalNumberOfItems
		itemsPerRow = var10.itemsPerRow
		startRowNumber = var10.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", p1)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", p1)
	local totalNumberOfItems_1 = totalNumberOfItems or findAnalyticsFieldInAncestors("totalNumberOfItems", p1)
	local var14 = findAnalyticsFieldInAncestors("gameSetTargetId", p1)
	local var15 = findAnalyticsFieldInAncestors("heroUnitId", p1)
	local dependencies = p2.dependencies
	
	if var7 and var8 then
		sponsoredGamesRecordClick(dependencies.networking, tostring(var8))
	end
	local var16 = calculateRowPositionFields(var6, itemsPerRow, startRowNumber)
	local var17 = if fFlagSduiChartsSupport then findAnalyticsFieldInAncestors("appliedFilters", p1) else nil
	
	if fFlagSduiEdpInheritGameDetailSourceSession and var2.inheritReferralSession == true then
		dependencies.gameAnalytics.reportOpenGameDetailFromGameDetail(placeId, var6, totalNumberOfItems_1, var7, var8, tostring(universeId), p2.appPage, findAnalyticsFieldInAncestors("hostUniverseId", p1))
	else
		dependencies.gameAnalytics.reportOpenGameDetailWithId(placeId, tostring(collectionId_1), var14, collectionPosition_1, var6, totalNumberOfItems_1, var7, var8, tostring(universeId), p2.appPage, tostring(var9), var17, var6, true, var16.positionInRow, var16.rowInSort, var16.rowOnPage, var15)
	end
	local var21
	local navigation = dependencies.getNavigation()
	local dispatch = dependencies.dispatch
	local var19 = tostring(var9)
	local t_1 = { index = var6 }
	
	if fFlagEnableExperienceDetailsBottomSheet then
		var21 = p2.appPage == appPage.GameDetail
		var21 = nil
	else
		var21 = nil
	end
	t_1.mountAsFullView = var21
	dispatch(openGameDetails(var19, navigation, t_1, if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then dependencies.networking else nil))
	p2.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsActionFinish, { name = getInputModeStore(false).getLastInputType(false) }, true)
end