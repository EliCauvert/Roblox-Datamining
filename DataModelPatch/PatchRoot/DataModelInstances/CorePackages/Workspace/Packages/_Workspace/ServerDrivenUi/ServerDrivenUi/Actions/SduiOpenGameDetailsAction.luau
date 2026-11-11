local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
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
local FFlagEnableExperienceDetailsBottomSheet = require(Parent.SharedFlags).FFlagEnableExperienceDetailsBottomSheet
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiEdpPrefetchPlayability = require(Parent.SharedFlags).FFlagSduiEdpPrefetchPlayability
local FFlagLuaAppSduiEdpEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEdpEnabled
local FFlagSduiEdpInheritGameDetailSourceSession = require(Parent.SharedFlags).FFlagSduiEdpInheritGameDetailSourceSession
local t = {}

return function(p1, p2, p3)
	-- upvalues: SduiErrors (copy), GetInputModeStoreFunction (copy), t (copy), FindAnalyticsFieldInAncestorsFunction (copy), IntervalPerformanceTracker (copy), SduiParsers (copy), SponsoredGamesRecordClickFunction (copy), CalculateRowPositionFieldsFunction (copy), FFlagSduiChartsSupport (copy), FFlagSduiEdpInheritGameDetailSourceSession (copy), OpenGameDetailsFunction (copy), FFlagEnableExperienceDetailsBottomSheet (copy), AppPage (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy)
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
	local SafeParseBooleanResult = SduiParsers.safeParseBoolean(FindAnalyticsFieldInAncestorsFunction("adFlag", p2, false), p3, p2)
	local NativeAdData = FindAnalyticsFieldInAncestorsFunction("nativeAdData", p2)
	
	if NativeAdData == nil then
		NativeAdData = FindAnalyticsFieldInAncestorsFunction("adId", p2)
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
	local Dependencies = p3.dependencies
	
	if SafeParseBooleanResult and NativeAdData then
		SponsoredGamesRecordClickFunction(Dependencies.networking, (tostring(NativeAdData)))
	end
	local RowPositionFields = CalculateRowPositionFieldsFunction(ItemPosition, ItemsPerRow, StartRowNumber)
	local AppliedFilters = if FFlagSduiChartsSupport then FindAnalyticsFieldInAncestorsFunction("appliedFilters", p2) else nil
	
	if FFlagSduiEdpInheritGameDetailSourceSession and ActionParams.inheritReferralSession == true then
		Dependencies.gameAnalytics.reportOpenGameDetailFromGameDetail(PlaceId, ItemPosition, TotalNumberOfItems1, SafeParseBooleanResult, NativeAdData, tostring(UniverseId), p3.appPage, (FindAnalyticsFieldInAncestorsFunction("hostUniverseId", p2)))
	else
		Dependencies.gameAnalytics.reportOpenGameDetailWithId(PlaceId, tostring(CollectionId1), GameSetTargetId, CollectionPosition1, ItemPosition, TotalNumberOfItems1, SafeParseBooleanResult, NativeAdData, tostring(UniverseId), p3.appPage, tostring(NavigationUniverseId), AppliedFilters, ItemPosition, true, RowPositionFields.positionInRow, RowPositionFields.rowInSort, RowPositionFields.rowOnPage, HeroUnitId)
	end
	Dependencies.dispatch(OpenGameDetailsFunction(tostring(NavigationUniverseId), Dependencies.getNavigation(), {
		index = ItemPosition,
		mountAsFullView = if FFlagEnableExperienceDetailsBottomSheet then p3.appPage == AppPage.GameDetail else nil
	}, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then Dependencies.networking else nil))
	p3.dependencies.logger.reportCounter(SduiErrors.SduiCounterName.OpenGameDetailsActionFinish, {
		name = GetInputModeStoreFunction(false).getLastInputType(false)
	}, true)
end