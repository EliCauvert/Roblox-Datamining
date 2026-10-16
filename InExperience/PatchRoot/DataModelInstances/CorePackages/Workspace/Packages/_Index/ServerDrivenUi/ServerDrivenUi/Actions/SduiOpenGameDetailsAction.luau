local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local CryoModule = require(Parent.Cryo)
local GetInputModeStoreFunction = require(Parent.Responsive).GetInputModeStore
local AppPage = require(Parent.RobloxAppEnums).AppPage
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local IntervalPerformanceTracker = require(Parent.IntervalPerformanceTracker).IntervalPerformanceTracker
local SponsoredGamesRecordClickFunction = require(Parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local FindAnalyticsFieldInAncestorsFunction = SduiCoreSystemModule.findAnalyticsFieldInAncestors
local SduiParsers = SduiCoreSystemModule.SduiParsers
local SduiErrors = SduiCoreSystemModule.SduiErrors
local FilterAndStringifyAnalyticsDataModule = require(ServerDrivenUi.Analytics.filterAndStringifyAnalyticsData)
local FFlagEnableExperienceDetailsBottomSheet = require(Parent.SharedFlags).FFlagEnableExperienceDetailsBottomSheet
local FFlagLuaAppEdpBottomSheetPeekViewEvents = require(Parent.SharedFlags).FFlagLuaAppEdpBottomSheetPeekViewEvents
local FFlagLuaAppSduiEdpEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEdpEnabled
local FFlagLuaAppSduiPassSortSubId = require(Parent.SharedFlags).FFlagLuaAppSduiPassSortSubId
local FFlagSduiFixSearchTelemetry = require(Parent.SharedFlags).FFlagSduiFixSearchTelemetry
local FFlagLuaAppSduiSponsoredTwoByOneTile = require(Parent.SharedFlags).FFlagLuaAppSduiSponsoredTwoByOneTile
local FFlagSduiForwardAnalyticsDataToGameClick = require(Parent.SharedFlags).FFlagSduiForwardAnalyticsDataToGameClick
local t = {}

return function(p1, p2, p3) --[[ Line: 35 ]]
	-- upvalues: SduiErrors (copy), GetInputModeStoreFunction (copy), t (copy), FindAnalyticsFieldInAncestorsFunction (copy), IntervalPerformanceTracker (copy), FFlagSduiFixSearchTelemetry (copy), SduiParsers (copy), FFlagLuaAppSduiSponsoredTwoByOneTile (copy), CryoModule (copy), SponsoredGamesRecordClickFunction (copy), CalculateRowPositionFieldsFunction (copy), FFlagLuaAppSduiPassSortSubId (copy), FFlagSduiForwardAnalyticsDataToGameClick (copy), FilterAndStringifyAnalyticsDataModule (copy), OpenGameDetailsFunction (copy), FFlagLuaAppEdpBottomSheetPeekViewEvents (copy), FFlagEnableExperienceDetailsBottomSheet (copy), AppPage (copy), FFlagLuaAppSduiEdpEnabled (copy)
	p3.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.OpenGameDetailsAction, {
		name = GetInputModeStoreFunction(false).getLastInputType(false)
	}, true)
	local ActionParams = p1 and p1.actionParams or t
	local ItemComponentType = FindAnalyticsFieldInAncestorsFunction("itemComponentType", p2)
	
	if ItemComponentType == "Tile" or ItemComponentType == "GameTile" then
		IntervalPerformanceTracker:startTracking("AppGameTile_to_GameDetail", 2)
	end
	local PlaceId = ActionParams.placeId or FindAnalyticsFieldInAncestorsFunction("placeId", p2)
	local UniverseId = ActionParams.universeId or FindAnalyticsFieldInAncestorsFunction("universeId", p2)
	local ItemPosition = FindAnalyticsFieldInAncestorsFunction("itemPosition", p2)
	local TopicDataPosition = if FFlagSduiFixSearchTelemetry then FindAnalyticsFieldInAncestorsFunction("topicDataPosition", p2, ItemPosition) else ItemPosition
	local SafeParseBooleanResult = SduiParsers.safeParseBoolean(FindAnalyticsFieldInAncestorsFunction("adFlag", p2, false), p3, p2)
	local NativeAdData = FindAnalyticsFieldInAncestorsFunction("nativeAdData", p2)
	
	if NativeAdData == nil then
		NativeAdData = FindAnalyticsFieldInAncestorsFunction("adId", p2)
	end
	local PlaceIdOverride = nil
	local JoinResult = nil
	local TileType = nil
	
	if FFlagLuaAppSduiSponsoredTwoByOneTile then
		PlaceIdOverride = ActionParams.placeIdOverride
		TileType = FindAnalyticsFieldInAncestorsFunction("tileType", p2)
		JoinResult = CryoModule.Dictionary.join(ActionParams.experienceJoinData or t, { nativeAdData = NativeAdData, tileType = TileType })
	end
	local NavigationUniverseId = FindAnalyticsFieldInAncestorsFunction("navigationUniverseId", p2, UniverseId)
	local CollectionPosition = nil
	local CollectionId = nil
	local TotalNumberOfItems = nil
	local ItemsPerRow = nil
	local StartRowNumber = nil
	local CollectionData = p2.getCollectionData and p2.getCollectionData() or nil
	
	if CollectionData then
		CollectionPosition = CollectionData.collectionPosition
		CollectionId = CollectionData.collectionId
		TotalNumberOfItems = CollectionData.totalNumberOfItems
		ItemsPerRow = CollectionData.itemsPerRow
		StartRowNumber = CollectionData.startRowNumber
	end
	local CollectionPosition1 = CollectionPosition or FindAnalyticsFieldInAncestorsFunction("collectionIndex", p2)
	local CollectionId1 = CollectionId or FindAnalyticsFieldInAncestorsFunction("collectionId", p2)
	local TotalNumberOfItems1 = TotalNumberOfItems or FindAnalyticsFieldInAncestorsFunction("totalNumberOfItems", p2)
	local GameSetTargetId = FindAnalyticsFieldInAncestorsFunction("gameSetTargetId", p2)
	local HeroUnitId = FindAnalyticsFieldInAncestorsFunction("heroUnitId", p2)
	local Number: number = tonumber(FindAnalyticsFieldInAncestorsFunction("seeAllFlag", p2)) or 0
	local Dependencies = p3.dependencies
	
	if SafeParseBooleanResult and NativeAdData then
		SponsoredGamesRecordClickFunction(Dependencies.networking, (tostring(NativeAdData)))
	end
	local RowPositionFields = CalculateRowPositionFieldsFunction(ItemPosition, ItemsPerRow, StartRowNumber)
	local AppliedFilters = FindAnalyticsFieldInAncestorsFunction("appliedFilters", p2)
	local SortSubId = if FFlagLuaAppSduiPassSortSubId then FindAnalyticsFieldInAncestorsFunction("sortSubId", p2) else nil
	local FilterAndStringifyAnalyticsDataModuleResult = if FFlagSduiForwardAnalyticsDataToGameClick then FilterAndStringifyAnalyticsDataModule(CryoModule.Dictionary.join(CollectionData or t, p2.ancestorAnalyticsData or t, p2.analyticsData or t)) else nil
	
	if ActionParams.inheritReferralSession == true then
		Dependencies.gameAnalytics.reportOpenGameDetailFromGameDetail(if FFlagLuaAppSduiSponsoredTwoByOneTile and PlaceIdOverride then PlaceIdOverride else PlaceId, ItemPosition, TotalNumberOfItems1, SafeParseBooleanResult, NativeAdData, tostring(UniverseId), p3.appPage, (FindAnalyticsFieldInAncestorsFunction("hostUniverseId", p2)))
	else
		Dependencies.gameAnalytics.reportOpenGameDetailWithId(if FFlagLuaAppSduiSponsoredTwoByOneTile and PlaceIdOverride then PlaceIdOverride else PlaceId, tostring(CollectionId1), GameSetTargetId, CollectionPosition1, ItemPosition, TotalNumberOfItems1, SafeParseBooleanResult, NativeAdData, tostring(UniverseId), p3.appPage, tostring(NavigationUniverseId), AppliedFilters, TopicDataPosition, true, RowPositionFields.positionInRow, RowPositionFields.rowInSort, RowPositionFields.rowOnPage, HeroUnitId, nil, if FFlagLuaAppSduiSponsoredTwoByOneTile and TileType then TileType else nil, if FFlagLuaAppSduiPassSortSubId and SortSubId then tostring(SortSubId) else nil, if FFlagSduiForwardAnalyticsDataToGameClick then FilterAndStringifyAnalyticsDataModuleResult else nil, Number)
	end
	Dependencies.dispatch(OpenGameDetailsFunction(tostring(NavigationUniverseId), Dependencies.getNavigation(), {
		index = ItemPosition,
		placeIdOverride = if FFlagLuaAppSduiSponsoredTwoByOneTile and PlaceIdOverride then PlaceIdOverride else nil,
		experienceJoinData = if FFlagLuaAppSduiSponsoredTwoByOneTile and JoinResult then JoinResult else nil,
		mountAsFullView = if FFlagLuaAppEdpBottomSheetPeekViewEvents then nil elseif FFlagEnableExperienceDetailsBottomSheet then p3.appPage == AppPage.GameDetail else nil
	}, if FFlagLuaAppSduiEdpEnabled then Dependencies.networking else nil))
	p3.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.OpenGameDetailsActionFinish, {
		name = GetInputModeStoreFunction(false).getLastInputType(false)
	}, true)
end