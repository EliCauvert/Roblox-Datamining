local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local ReactModule = require(CorePackages.Packages.React)
local CollectionViewsModule = require(CorePackages.Workspace.Packages.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local GameCollectionsModule = require(CorePackages.Workspace.Packages.GameCollections)
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local UseRenderGameCollectionItemFunction = GameCollectionsModule.useRenderGameCollectionItem
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseTextSizeOffsetFunction = UIBloxModule.Core.Style.useTextSizeOffset
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local GameTileConstants = require(CorePackages.Workspace.Packages.GameTile).GameTileConstants
local GameCollectionItemTypes = require(CorePackages.Workspace.Packages.GameCollections).GameCollectionItemTypes
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local SendGameImpressions = require(CorePackages.Workspace.Packages.GameCollections).SendGameImpressions
local FrameBoundsImpressionsTracker = require(CorePackages.Workspace.Packages.Impressions).FrameBoundsImpressionsTracker
local DiscoveryAnalyticsModule = require(CorePackages.Workspace.Packages.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local Context = DiscoveryAnalyticsModule.Constants.Context
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local UseRecommendedGamesModule = require(script.Parent.Hooks.useRecommendedGames)
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local LuaAppFixEmptyRecommendedGames = game:DefineFastFlag("LuaAppFixEmptyRecommendedGames", false)
local LuaAppChangeRecommendedGamesTitle = game:DefineFastFlag("LuaAppChangeRecommendedGamesTitle", false)
local LuaAppChangeRecommendedGamesTitleLogExposure = game:DefineFastFlag("LuaAppChangeRecommendedGamesTitleLogExposure", false)

return (ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseGameCollectionLayoutParamsFunction (copy), UseRecommendedGamesModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), UseTextSizeOffsetFunction (copy), UseGetGameTileHeightFunction (copy), GameTileConstants (copy), UseLocalizationFunction (copy), LuaAppChangeRecommendedGamesTitle (copy), LuaAppChangeRecommendedGamesTitleLogExposure (copy), IXPServiceWrapper (copy), AppUserLayers (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), RoactAnalyticsCommonGameEvents (copy), HttpService (copy), GamePlayIntentFunction (copy), Context (copy), GameCollectionItemTypes (copy), SendGameImpressions (copy), UseCollectionImpressionsSignalFunction (copy), UseRenderGameCollectionItemFunction (copy), LuaAppFixEmptyRecommendedGames (copy), CollectionCarousel (copy), FrameBoundsImpressionsTracker (copy), AppPage (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Narrow = UseGameCollectionLayoutParamsFunction("Narrow", UseStateResult, false, { sideMargin = 0 })
	local UseRecommendedGamesModuleResult = UseRecommendedGamesModule(p1.universeId, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.shouldHydrateLegacyIxp else nil)
	local RecommendedGames = UseRecommendedGamesModuleResult.recommendedGames
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local Narrow1 = UseGetGameTileHeightFunction(true, "Narrow", nil, false, false, 0, 0, GameTileConstants.TileTextLines.Narrow.titleTextLines)
	local UseLocalizationResult = UseLocalizationFunction({
		title = if LuaAppChangeRecommendedGamesTitle then "Common.GameSorts.Label.BlendedSerpPeopleAlsoJoin" else "Feature.GameDetails.Heading.Recommended"
	})
	
	if LuaAppChangeRecommendedGamesTitleLogExposure then
		ReactModule.useEffect(function()
			-- upvalues: IXPServiceWrapper (upval), AppUserLayers (upval)
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.ExperienceDetailsPageExposureLayer)
		end, {})
	end
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local Text = "GameDetails_" .. tostring(p1.universeId) .. tostring(ReactModule.useRef(HttpService:GenerateGUID()).current)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: RecommendedGames (copy), p1 (copy), UseRoactServiceResult2 (copy)
		if #RecommendedGames == 0 then return end
		local RecommendedGame = RecommendedGames[p2]
		
		if RecommendedGame then
			UseRoactServiceResult2.reportOpenGameDetailFromGameDetail(RecommendedGame.placeId, p2, #RecommendedGames, RecommendedGame.isSponsored, RecommendedGame.adId, RecommendedGame.universeId, p1.pageContext, p1.universeId)
			
			return
		end
	end, {
		UseRoactServiceResult2,
		RecommendedGames,
		p1.universeId,
		p1.pageContext
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: GamePlayIntentFunction (upval), UseRoactServiceResult (copy), Context (upval), p1 (copy), GameCollectionItemTypes (upval)
		if p2 then
			GamePlayIntentFunction(UseRoactServiceResult, Context.ExperienceTile, {
				placeId = p2.placeId,
				rootPlaceId = tonumber(p2.placeId),
				universeId = p2.universeId,
				sortIndex = tostring(0),
				sortEntryIndex = tostring(p2.index),
				pageName = p1.pageContext,
				tileType = GameCollectionItemTypes.GameCollectionItemType.GameTile
			})
			
			return
		end
	end, { UseRoactServiceResult, p1.pageContext })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: RecommendedGames (copy), SendGameImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), p1 (copy)
		if #RecommendedGames ~= 0 then
			SendGameImpressions.sendFromGameDetails(UseRoactServiceResult, UseRoactServiceResult1, p2, RecommendedGames, p1.universeId)
			
			return
		end
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		RecommendedGames,
		p1.universeId
	})
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction()
	local Narrow2 = UseRenderGameCollectionItemFunction(GameTileConstants.PlayerCountStyleValues.Footer, false, "Narrow", true, false, Text, true, UseResult, UseResult1, nil, nil, nil, nil, nil, nil, false, nil, nil, false, false, nil, nil, nil, UseTextSizeOffsetResult, GameTileConstants.TileTextLines.Narrow.titleTextLines, nil, nil, nil, p1.onPeekViewClosed, nil)
	
	return ReactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(UseRecommendedGamesModuleResult.fetchStatus),
		renderOnFailed = function()
			return nil
		end,
		renderOnLoaded = ReactModule.useCallback(function()
			-- upvalues: LuaAppFixEmptyRecommendedGames (upval), RecommendedGames (copy), ReactModule (upval), UseStateResult2 (copy), p1 (copy), CollectionCarousel (upval), UseRefResult (copy), Narrow (copy), Narrow1 (copy), UseCollectionImpressionsSignalResult2 (copy), Narrow2 (copy), UseLocalizationResult (copy), FrameBoundsImpressionsTracker (upval), AppPage (upval), Text (copy), UseCollectionImpressionsSignalResult (copy), UseResult2 (copy)
			return if LuaAppFixEmptyRecommendedGames and #RecommendedGames == 0 then nil else ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0),
				ref = UseStateResult2
			}, {
				UIPadding = p1.padding and ReactModule.createElement("UIPadding", p1.padding),
				GameCarousel = ReactModule.createElement(CollectionCarousel, {
					scrollingFrameRef = UseRefResult,
					columnGap = Narrow.columnGap,
					fractionalItemAmount = Narrow.fractionalItemAmount,
					getItemHeight = Narrow1,
					items = RecommendedGames,
					maxItemsToShow = Narrow.maxTilesToShow,
					onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
					onChangeCanvasPosition = UseCollectionImpressionsSignalResult2,
					numColumns = Narrow.numColumns,
					renderItem = Narrow2,
					sideMargin = Narrow.sideMargin,
					title = UseLocalizationResult.title,
					scrollingEnabledOverride = p1.scrollingEnabled or false
				}),
				GameSortImpressionsDetector = ReactModule.createElement(FrameBoundsImpressionsTracker, {
					parentRef = UseRefResult,
					pageContext = { AppPage.GameDetail, AppPage.ExperienceDetail },
					impressionsTag = Text,
					scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
					sendImpressions = UseResult2
				})
			})
		end, {
			UseStateResult2, Narrow.columnGap, Narrow.fractionalItemAmount,
			Narrow.maxTilesToShow, Narrow.numColumns, Narrow.sideMargin, Narrow1,
			RecommendedGames, UseCollectionImpressionsSignalResult2, Narrow2, UseRefResult,
			UseLocalizationResult.title, Text, UseCollectionImpressionsSignalResult,
			UseResult2, p1.scrollingEnabled, p1.padding
		})
	})
end))