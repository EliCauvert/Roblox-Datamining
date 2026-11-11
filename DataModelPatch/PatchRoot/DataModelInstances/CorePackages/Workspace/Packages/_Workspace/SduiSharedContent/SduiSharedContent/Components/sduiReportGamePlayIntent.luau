local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local SetGamePlaySessionFunction = require(Parent.RobloxAppSessionization).SetGamePlaySession
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local SponsoredGamesRecordClickFunction = DiscoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local FindAnalyticsFieldInAncestorsFunction = require(Parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return function(p1)
	-- upvalues: FFlagSduiExperienceDetailsSupport (copy), FindAnalyticsFieldInAncestorsFunction (copy), SetGamePlaySessionFunction (copy), SponsoredGamesRecordClickFunction (copy), CalculateRowPositionFieldsFunction (copy), GamePlayIntentFunction (copy)
	local SduiContext = p1.sduiContext
	local AnalyticsContext = p1.analyticsContext
	local UniverseId = p1.universeId
	local PlaceId = p1.placeId
	local RootPlaceId = p1.rootPlaceId or PlaceId
	local AppliedFilters = p1.appliedFilters
	local LaunchData = if FFlagSduiExperienceDetailsSupport then p1.launchData else nil
	local EventIngest = SduiContext.dependencies.eventIngest
	local SessionService = SduiContext.dependencies.sessionService
	local CollectionPosition = nil
	local CollectionId = nil
	local ItemsPerRow = nil
	local StartRowNumber = nil
	local CollectionData = AnalyticsContext.getCollectionData and AnalyticsContext.getCollectionData() or nil
	
	if CollectionData then
		CollectionPosition = CollectionData.collectionPosition
		CollectionId = CollectionData.collectionId
		ItemsPerRow = CollectionData.itemsPerRow
		StartRowNumber = CollectionData.startRowNumber
	end
	local CollectionPosition1 = CollectionPosition or FindAnalyticsFieldInAncestorsFunction("collectionIndex", AnalyticsContext)
	local CollectionId1 = CollectionId or FindAnalyticsFieldInAncestorsFunction("collectionId", AnalyticsContext)
	local GameSetTargetId = FindAnalyticsFieldInAncestorsFunction("gameSetTargetId", AnalyticsContext)
	local ItemPosition = FindAnalyticsFieldInAncestorsFunction("itemPosition", AnalyticsContext, -1)
	local TopicDataPosition = FindAnalyticsFieldInAncestorsFunction("topicDataPosition", AnalyticsContext, ItemPosition)
	local HeroUnitId = FindAnalyticsFieldInAncestorsFunction("heroUnitId", AnalyticsContext)
	local EventContext = FindAnalyticsFieldInAncestorsFunction("eventContext", AnalyticsContext, "ExperienceTile")
	local ReferralSource = FindAnalyticsFieldInAncestorsFunction("referralSource", AnalyticsContext)
	local GamePlaySessionType = FindAnalyticsFieldInAncestorsFunction("gamePlaySessionType", AnalyticsContext)
	
	if GamePlaySessionType then
		SetGamePlaySessionFunction(SessionService, GamePlaySessionType, true)
	end
	local NativeAdData = FindAnalyticsFieldInAncestorsFunction("nativeAdData", AnalyticsContext)
	
	if NativeAdData == nil then
		NativeAdData = FindAnalyticsFieldInAncestorsFunction("adId", AnalyticsContext)
	end
	if NativeAdData then
		SponsoredGamesRecordClickFunction(SduiContext.dependencies.networking, (tostring(NativeAdData)))
	end
	local RowPositionFields = if FFlagSduiExperienceDetailsSupport then if typeof(ItemPosition) == "number" and typeof(ItemsPerRow) == "number" and typeof(StartRowNumber) == "number" and ItemPosition ~= -1 and ItemsPerRow ~= -1 and StartRowNumber ~= -1 then CalculateRowPositionFieldsFunction(ItemPosition, ItemsPerRow, StartRowNumber) else {} else CalculateRowPositionFieldsFunction(ItemPosition, ItemsPerRow, StartRowNumber)
	local TileType = FindAnalyticsFieldInAncestorsFunction("tileType", AnalyticsContext, "GameTile")
	
	if FFlagSduiExperienceDetailsSupport then
		GamePlayIntentFunction(EventIngest, tostring(EventContext), {
			placeId = tostring(PlaceId or RootPlaceId),
			rootPlaceId = tonumber(RootPlaceId),
			universeId = tostring(UniverseId),
			sortIndex = if CollectionPosition1 then tostring(CollectionPosition1) else nil,
			sortEntryIndex = if typeof(ItemPosition) == "number" and ItemPosition ~= -1 then tostring(ItemPosition) else nil,
			referralSource = ReferralSource,
			gameSetTypeId = if CollectionId1 then tostring(CollectionId1) else nil,
			gameSetTargetId = GameSetTargetId,
			appliedFilters = AppliedFilters,
			topicDataPosition = typeof(TopicDataPosition) == "number" and TopicDataPosition ~= -1 and TopicDataPosition or nil,
			nativeAdData = NativeAdData,
			pageName = SduiContext.appPage,
			positionInRow = RowPositionFields.positionInRow,
			rowNumber = RowPositionFields.rowInSort,
			feedRowNumber = RowPositionFields.rowOnPage,
			heroUnitId = HeroUnitId,
			tileType = TileType,
			launchData = LaunchData
		})
		
		return
	else
		GamePlayIntentFunction(EventIngest, tostring(EventContext), {
			placeId = tostring(PlaceId),
			rootPlaceId = tonumber(RootPlaceId),
			universeId = tostring(UniverseId),
			sortIndex = tostring(CollectionPosition1),
			sortEntryIndex = if ItemPosition then tostring(ItemPosition) else nil,
			referralSource = ReferralSource,
			gameSetTypeId = tostring(CollectionId1),
			gameSetTargetId = GameSetTargetId,
			appliedFilters = AppliedFilters,
			topicDataPosition = TopicDataPosition,
			nativeAdData = NativeAdData,
			pageName = SduiContext.appPage,
			positionInRow = RowPositionFields.positionInRow,
			rowNumber = RowPositionFields.rowInSort,
			feedRowNumber = RowPositionFields.rowOnPage,
			heroUnitId = HeroUnitId,
			tileType = TileType
		})
	end
end