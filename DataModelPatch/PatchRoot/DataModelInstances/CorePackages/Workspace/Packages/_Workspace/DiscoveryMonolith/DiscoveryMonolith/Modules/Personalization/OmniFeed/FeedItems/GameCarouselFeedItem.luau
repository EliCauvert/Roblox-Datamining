local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local _ = require(Parent.GameTile)
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameSortGroups = DiscoveryTypesModule.GameSortGroups
local OmniFeedConstants = DiscoveryTypesModule.OmniFeedConstants
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local AppPage = require(Parent.RobloxAppEnums).AppPage
local MutedErrorFunction = require(Parent.Loggers).mutedError
local ParseBooleanStringFunction = require(Parent.DiscoveryUtils).parseBooleanString
local Modules = DiscoveryMonolith.Modules
local GameCollectionCarouselModule = require(Modules.Personalization.Games.GameCollectionCarousel)
local OmniFeedPropsModule = require(Modules.Personalization.OmniFeed.OmniFeedProps)
local FFlagLuaAppHeaderButtonText = require(Parent.SharedFlags).FFlagLuaAppHeaderButtonText
local FFlagLuaAppGameCarouselAmpUpsellAction = require(Parent.SharedFlags).FFlagLuaAppGameCarouselAmpUpsellAction
local FFlagSearchOmniAutocompletePage = require(Parent.SharedFlags).FFlagSearchOmniAutocompletePage
local FIntLuaAppDelayImpressionsMaxUpdates = require(Parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local LuaAppForceLowResMural = game:DefineFastFlag("LuaAppForceLowResMural", false)
local FIntSearchLandingPageSideMarginModule = require(Modules.Personalization.Search.FIntSearchLandingPageSideMargin)
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppUsePrevalidatedVideoGamePlayability = require(Parent.SharedFlags).FFlagLuaAppUsePrevalidatedVideoGamePlayability
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING
local GameCarouselFeedItem = RoactModule.PureComponent:extend("GameCarouselFeedItem")
GameCarouselFeedItem.validateProps = TModule.strictInterface({
	[OmniFeedPropsModule.key] = OmniFeedPropsModule.interface,
	sortIndex = TModule.number,
	isOmni = TModule.boolean,
	topicLayoutData = TModule.optional(TModule.table),
	formFactor = TModule.string,
	sortName = TModule.string
})

function GameCarouselFeedItem.render(p1)
	-- upvalues: OmniFeedPropsModule (copy), OmniFeedConstants (copy), FFlagLuaAppGameCarouselAmpUpsellAction (copy), MutedErrorFunction (copy), LuaAppForceLowResMural (copy), FFlagLuaAppHeaderButtonText (copy), ParseBooleanStringFunction (copy), FFlagLuaAppUsePrevalidatedVideoGamePlayability (copy), FFlagLuaAppCompositionAlways (copy), AppPage (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), RoactModule (copy), GameCollectionCarouselModule (copy), FFlagSearchOmniAutocompletePage (copy), FIntSearchLandingPageSideMarginModule (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy), FFlagLuaAppHomeTouchAutoplay (copy)
	local SortIndex = p1.props.sortIndex
	local SortName = p1.props.sortName
	local FormFactor1 = p1.props.formFactor
	local ScrollViewPositionChangedSignal = p1.props[OmniFeedPropsModule.key].scrollViewPositionChangedSignal
	local AppPage1 = p1.props[OmniFeedPropsModule.key].appPage
	local FeedItemStartRow = p1.props[OmniFeedPropsModule.key].feedItemStartRow
	local IsWide: boolean? = nil
	local TopicLayout = nil
	local TopicLayout1 = nil
	local TopicLayout2 = nil
	local TopicLayout3 = nil
	local TopicLayout4 = nil
	local TopicLayout5 = nil
	local TopicLayout6 = nil
	local GameTileLayoutType = "Narrow"
	
	if p1.props.topicLayoutData then
		TopicLayout1 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
		
		if TopicLayout1 then
			if TopicLayout1 == OmniFeedConstants.ComponentTypeDataKeys.EventTile then
				GameTileLayoutType = "Event"
			elseif TopicLayout1 == OmniFeedConstants.ComponentTypeDataKeys.GridTile then
				GameTileLayoutType = "Wide"
			end
			IsWide = GameTileLayoutType == "Wide" or GameTileLayoutType == "Event"
		end
		TopicLayout2 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.LinkPath]
		TopicLayout3 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.SubtitleLinkPath]
		
		if FFlagLuaAppGameCarouselAmpUpsellAction then
			TopicLayout4 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.AmpUpsellFeatureName]
			TopicLayout5 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.AmpUpsellNamespace]
		end
		TopicLayout = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PlayerCountStyle]
		TopicLayout6 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.PlayButtonStyle]
	end
	local IsTrue: boolean? = nil
	
	if p1.props.topicLayoutData then
		local TopicLayout7 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.IsSponsoredFooterAllowed]
		IsTrue = TopicLayout7 ~= nil and TopicLayout7 == "true"
	end
	local IsTrue1: boolean? = nil
	
	if p1.props.topicLayoutData then
		local TopicLayout8 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideSeeAll]
		IsTrue1 = TopicLayout8 ~= nil and TopicLayout8 == "true"
	end
	local TopicLayout9 = if p1.props.topicLayoutData then p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.InfoText] else nil
	local Number: number? = nil
	
	if p1.props.topicLayoutData then
		local TopicLayout10 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EndTimestamp]
		
		if TopicLayout10 then
			Number = tonumber(TopicLayout10)
			
			if Number == nil then
				MutedErrorFunction(string.format("Unable to convert `endTimestamp` to number with value: %s", TopicLayout10))
			end
		end
	end
	local TopicLayout11 = nil
	
	if p1.props.topicLayoutData then
		TopicLayout11 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.CountdownString]
		
		if TopicLayout11 ~= nil and TopicLayout11 ~= "" and (not TopicLayout11:find("{hours}") or not TopicLayout11:find("{minutes}")) then
			MutedErrorFunction(string.format("Invalid `countdownString` missing placeholder strings {hours} or {minutes}: %s", TopicLayout11))
			TopicLayout11 = nil
		end
	end
	local RbxthumbName: string? = nil
	
	if p1.props.topicLayoutData then
		local TopicLayout12 = p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.BackgroundImageAssetId]
		
		if TopicLayout12 and TopicLayout12 ~= "" then
			RbxthumbName = if LuaAppForceLowResMural then `rbxthumb://type=Asset&id={TopicLayout12}&w=384&h=216` else `rbxthumb://type=Asset&id={TopicLayout12}&w=768&h=432`
		end
	end
	local TopicLayout13 = if FFlagLuaAppHeaderButtonText and p1.props.topicLayoutData then p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HeaderButtonText] else nil
	local ShouldHideTileMetadata = nil
	local ShouldHideTileTitle = nil
	local ContainedTile = nil
	local v1 = nil
	
	if p1.props.topicLayoutData then
		ShouldHideTileMetadata = ParseBooleanStringFunction(p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideTileMetadata])
		ShouldHideTileTitle = ParseBooleanStringFunction(p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HideTileTitle])
		ContainedTile = ParseBooleanStringFunction(p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ContainedTile])
		
		if FFlagLuaAppUsePrevalidatedVideoGamePlayability then
			v1 = ParseBooleanStringFunction(p1.props.topicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.HasPrevalidatedVideoGamePlayability])
		end
	end
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1.props[OmniFeedPropsModule.key].appCompositionEnabled
	local IsAppPageMatch: boolean = AppPage1 == AppPage.Games or AppPage1 == AppPage.Home
	local GAMECAROUSELSIDECOMPACTPADDING1 = if FormFactor1 == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING
	
	return RoactModule.createElement(GameCollectionCarouselModule, {
		gameSortId = SortName,
		sortIndex = SortIndex,
		pageContext = AppPage1,
		scrollViewPositionChangedSignal = ScrollViewPositionChangedSignal,
		friendFooterEnabled = true,
		isHoverSupportEnabled = IsAppPageMatch or AppPage1 == AppPage.Games and IsWide,
		gridSupportAllowed = IsAppPageMatch,
		useGridTiles = IsWide,
		playerCountStyle = TopicLayout,
		isSponsoredFooterAllowed = IsTrue,
		componentType = TopicLayout1,
		linkPath = TopicLayout2,
		subtitleLinkPath = TopicLayout3,
		ampUpsellFeatureName = if FFlagLuaAppGameCarouselAmpUpsellAction then TopicLayout4 else nil,
		ampUpsellNamespace = if FFlagLuaAppGameCarouselAmpUpsellAction then TopicLayout5 else nil,
		refreshFeed = if FFlagLuaAppGameCarouselAmpUpsellAction then p1.props[OmniFeedPropsModule.key].refreshFeed else nil,
		hideSeeAll = IsTrue1,
		gameTileLayoutType = GameTileLayoutType,
		infoText = TopicLayout9,
		endTimestamp = Number,
		countdownString = TopicLayout11,
		startRow = FeedItemStartRow,
		playButtonStyle = TopicLayout6,
		sideMargin = if AppCompositionEnabled then nil else GAMECAROUSELSIDECOMPACTPADDING1,
		appCompositionEnabled = AppCompositionEnabled,
		backgroundMuralUrl = RbxthumbName,
		headerButtonText = if FFlagLuaAppHeaderButtonText then TopicLayout13 else nil,
		shouldHideTileMetadata = ShouldHideTileMetadata,
		shouldHideTileTitle = ShouldHideTileTitle,
		containedTile = ContainedTile,
		shouldUseFrameBoundsForImpressions = if FFlagSearchOmniAutocompletePage then AppPage1 == AppPage.SearchLandingPage else nil,
		layoutOverrides = if AppCompositionEnabled then nil elseif FFlagSearchOmniAutocompletePage and AppPage1 == AppPage.SearchLandingPage then {
			sideMargin = if FormFactor1 == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else FIntSearchLandingPageSideMarginModule
		} else nil,
		numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
		selectionOrderBase = p1.props[OmniFeedPropsModule.key].selectionOrderBase,
		defaultContainerSize = p1.props[OmniFeedPropsModule.key].defaultContainerSize,
		onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.props[OmniFeedPropsModule.key].onTileImageLoaded else nil,
		hasPrevalidatedVideoGamePlayability = if FFlagLuaAppUsePrevalidatedVideoGamePlayability then v1 else nil,
		videoPlaybackContext = if FFlagLuaAppHomeTouchAutoplay then p1.props[OmniFeedPropsModule.key].videoPlaybackContext else nil
	})
end

return (RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: OmniFeedPropsModule (copy), AppPage (copy), GameSortGroups (copy), FFlagSearchOmniAutocompletePage (copy), MutedErrorFunction (copy)
	local AppPage1 = p2[OmniFeedPropsModule.key].appPage
	local Sort = nil
	
	if p2.isOmni then
		assert(AppPage1 == AppPage.Home, "Omni only on Home Page")
		local OmniRecommendation = p1.OmniRecommendations[AppPage1]
		local Sort1 = (OmniRecommendation and OmniRecommendation.sorts or {})[p2.sortIndex]
		
		if Sort1 and Sort1.topicId then
			Sort = tostring(Sort1.topicId)
		end
	else
		local Games = nil
		
		if AppPage1 == AppPage.Home then
			Games = GameSortGroups.HomeGames
		elseif AppPage1 == AppPage.Games then
			Games = GameSortGroups.Games
		elseif FFlagSearchOmniAutocompletePage and AppPage1 == AppPage.SearchLandingPage then
			Games = GameSortGroups.SearchLandingPage
		else
			MutedErrorFunction("Unsupported page for GameCarouselFeedItem data: " .. tostring(AppPage1))
		end
		Sort = p1.GameSortGroups[Games].sorts[p2.sortIndex]
	end
	return { sortName = Sort, formFactor = p1.FormFactor }
end)(GameCarouselFeedItem))