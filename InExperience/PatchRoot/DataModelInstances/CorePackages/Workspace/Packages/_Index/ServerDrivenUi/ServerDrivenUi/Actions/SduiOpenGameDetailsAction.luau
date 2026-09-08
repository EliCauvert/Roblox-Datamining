local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local cryoModule = require(parent.Cryo)
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
local fFlagLuaAppSduiSponsoredTwoByOneTile = require(parent.SharedFlags).FFlagLuaAppSduiSponsoredTwoByOneTile
local t = {}

return function(p1, p2, p3)
	-- upvalues: sduiErrors (ref), getInputModeStore (ref), t (ref), findAnalyticsFieldInAncestors (ref), intervalPerformanceTracker (ref), fFlagSduiFixSearchTelemetry (ref), sduiParsers (ref), fFlagLuaAppSduiSponsoredTwoByOneTile (ref), cryoModule (ref), fFlagLuaAppAddSeeAllFlagToGameDetailReferral (ref), sponsoredGamesRecordClick (ref), calculateRowPositionFields (ref), fFlagSduiEdpInheritGameDetailSourceSession (ref), openGameDetails (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), fFlagEnableExperienceDetailsBottomSheet (ref), appPage (ref), fFlagSduiEdpPrefetchPlayability (ref), fFlagLuaAppSduiEdpEnabled (ref)
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
	local placeIdOverride = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagLuaAppSduiSponsoredTwoByOneTile then
		placeIdOverride = var1.placeIdOverride
		var8 = findAnalyticsFieldInAncestors("tileType", p2)
		var7 = cryoModule.Dictionary.join(var1.experienceJoinData or t, { nativeAdData = var6, tileType = var8 })
	end
	local var9 = findAnalyticsFieldInAncestors("navigationUniverseId", p2, universeId)
	local collectionPosition = nil
	local collectionId = nil
	local totalNumberOfItems = nil
	local itemsPerRow = nil
	local startRowNumber = nil
	local var10 = p2.getCollectionData and p2.getCollectionData() or nil
	
	if var10 then
		collectionPosition = var10.collectionPosition
		collectionId = var10.collectionId
		totalNumberOfItems = var10.totalNumberOfItems
		itemsPerRow = var10.itemsPerRow
		startRowNumber = var10.startRowNumber
	end
	local collectionPosition_1 = collectionPosition or findAnalyticsFieldInAncestors("collectionIndex", p2)
	local collectionId_1 = collectionId or findAnalyticsFieldInAncestors("collectionId", p2)
	local totalNumberOfItems_1 = totalNumberOfItems or findAnalyticsFieldInAncestors("totalNumberOfItems", p2)
	local var11 = findAnalyticsFieldInAncestors("gameSetTargetId", p2)
	local var12 = findAnalyticsFieldInAncestors("heroUnitId", p2)
	local var13 = if fFlagLuaAppAddSeeAllFlagToGameDetailReferral then tonumber(findAnalyticsFieldInAncestors("seeAllFlag", p2)) or 0 else nil
	local dependencies = p3.dependencies
	
	if var5 and var6 then
		sponsoredGamesRecordClick(dependencies.networking, tostring(var6))
	end
	local var14 = calculateRowPositionFields(var3, itemsPerRow, startRowNumber)
	local var15 = findAnalyticsFieldInAncestors("appliedFilters", p2)
	
	if fFlagSduiEdpInheritGameDetailSourceSession and var1.inheritReferralSession == true then
		dependencies.gameAnalytics.reportOpenGameDetailFromGameDetail(if fFlagLuaAppSduiSponsoredTwoByOneTile and placeIdOverride then placeIdOverride else placeId, var3, totalNumberOfItems_1, var5, var6, tostring(universeId), p3.appPage, findAnalyticsFieldInAncestors("hostUniverseId", p2))
	else
		dependencies.gameAnalytics.reportOpenGameDetailWithId(if fFlagLuaAppSduiSponsoredTwoByOneTile and placeIdOverride then placeIdOverride else placeId, tostring(collectionId_1), var11, collectionPosition_1, var3, totalNumberOfItems_1, var5, var6, tostring(universeId), p3.appPage, tostring(var9), var15, var4, true, var14.positionInRow, var14.rowInSort, var14.rowOnPage, var12, nil, if fFlagLuaAppSduiSponsoredTwoByOneTile and var8 then var8 else nil, nil, nil, if fFlagLuaAppAddSeeAllFlagToGameDetailReferral then var13 else nil)
	end
	local var16
	local navigation = dependencies.getNavigation()
	local dispatch = dependencies.dispatch
	local var17 = tostring(var9)
	local t_1 = {
		index = var3,
		placeIdOverride = if fFlagLuaAppSduiSponsoredTwoByOneTile and placeIdOverride then placeIdOverride else nil,
		experienceJoinData = if fFlagLuaAppSduiSponsoredTwoByOneTile and var7 then var7 else nil
	}
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents then
		var16 = nil
	elseif fFlagEnableExperienceDetailsBottomSheet then
		var16 = p3.appPage == appPage.GameDetail
		var16 = nil
	else
		var16 = nil
	end
	t_1.mountAsFullView = var16
	dispatch(openGameDetails(var17, navigation, t_1, if fFlagSduiEdpPrefetchPlayability and fFlagLuaAppSduiEdpEnabled then dependencies.networking else nil))
	p3.dependencies.logger.reportCounter(sduiErrors.SduiCounterName.OpenGameDetailsActionFinish, { name = getInputModeStore(false).getLastInputType(false) }, true)
end