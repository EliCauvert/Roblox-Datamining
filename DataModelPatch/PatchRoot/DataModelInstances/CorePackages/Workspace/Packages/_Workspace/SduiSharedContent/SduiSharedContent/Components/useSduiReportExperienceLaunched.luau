local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local SetGamePlaySessionFunction = require(Parent.RobloxAppSessionization).SetGamePlaySession
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local SponsoredGamesRecordClickFunction = DiscoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local FindAnalyticsFieldInAncestorsFunction = require(Parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local SduiReportGamePlayIntentModule = require(script.Parent.sduiReportGamePlayIntent)
local FFlagSduiLaunchExperienceAction = require(Parent.SharedFlags).FFlagSduiLaunchExperienceAction
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return function(SduiContext, AnalyticsContext, UniverseId, PlaceId, RootPlaceId, AppliedFilters, p1)
	-- upvalues: ReactModule (copy), FFlagSduiLaunchExperienceAction (copy), SduiReportGamePlayIntentModule (copy), FFlagSduiExperienceDetailsSupport (copy), FindAnalyticsFieldInAncestorsFunction (copy), SetGamePlaySessionFunction (copy), SponsoredGamesRecordClickFunction (copy), CalculateRowPositionFieldsFunction (copy), GamePlayIntentFunction (copy)
	local EventIngest = SduiContext.dependencies.eventIngest
	local SessionService = SduiContext.dependencies.sessionService
	
	return ReactModule.useCallback(function()
		-- upvalues: FFlagSduiLaunchExperienceAction (upval), SduiReportGamePlayIntentModule (upval), SduiContext (copy), AnalyticsContext (copy), UniverseId (copy), PlaceId (copy), RootPlaceId (ref), AppliedFilters (copy), FFlagSduiExperienceDetailsSupport (upval), p1 (copy), FindAnalyticsFieldInAncestorsFunction (upval), SetGamePlaySessionFunction (upval), SessionService (copy), SponsoredGamesRecordClickFunction (upval), CalculateRowPositionFieldsFunction (upval), GamePlayIntentFunction (upval), EventIngest (copy)
		if FFlagSduiLaunchExperienceAction then
			SduiReportGamePlayIntentModule({
				sduiContext = SduiContext,
				analyticsContext = AnalyticsContext,
				universeId = UniverseId,
				placeId = PlaceId,
				rootPlaceId = RootPlaceId,
				appliedFilters = AppliedFilters,
				launchData = if FFlagSduiExperienceDetailsSupport then p1 else nil
			})
			
			return
		end
		RootPlaceId = RootPlaceId or PlaceId
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
		local RowPositionFields = CalculateRowPositionFieldsFunction(ItemPosition, ItemsPerRow, StartRowNumber)
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
			tileType = FindAnalyticsFieldInAncestorsFunction("tileType", AnalyticsContext, "GameTile"),
			launchData = if FFlagSduiExperienceDetailsSupport then p1 else nil
		})
	end, {
		EventIngest, AnalyticsContext, UniverseId, PlaceId, RootPlaceId,
		AppliedFilters, if FFlagSduiExperienceDetailsSupport then p1 else nil,
		SessionService, SduiContext
	})
end