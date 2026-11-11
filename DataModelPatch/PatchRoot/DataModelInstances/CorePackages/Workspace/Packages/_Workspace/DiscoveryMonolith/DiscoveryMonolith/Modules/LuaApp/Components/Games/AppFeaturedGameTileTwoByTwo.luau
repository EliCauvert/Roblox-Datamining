local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local RoactServices = require(Parent.RoactServices).RoactServices
local WithNavigationFunction = require(Parent.RoactNavigation).withNavigation
local GameTileModule = require(Parent.GameTile)
local GameTileThumbnailBadges = GameTileModule.GameTileThumbnailBadges
local SponsoredGamesRecordClickFunction = require(Parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local AppExperienceActionRow = GameTileModule.AppExperienceActionRow
local GetTileBadgeByPositionConfigFromEntryFunction = GameTileModule.getTileBadgeByPositionConfigFromEntry
local ApiFetchGameDetails = require(Parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local BigGameIconReducer = require(Parent.GameIconRodux).BigGameIcons.BigGameIconReducer
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local GameCollectionItemTypes = DiscoveryTypesModule.GameCollectionItemTypes
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local Modules = DiscoveryMonolith.Modules
local GetRatingTextModule = require(Modules.LuaApp.getRatingText)
local AppFeaturedTileModule = require(Modules.LuaApp.Components.Games.AppFeaturedTile)
local FeaturedContentPanelModule = require(Modules.LuaApp.Components.Games.FeaturedContentPanel)
local FeaturedStaticPanelModule = require(Modules.LuaApp.Components.Games.FeaturedStaticPanel)
local GetFFlagShowCreatorNameOnEmphasisSearchTileIXPModule = require(Modules.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppUnifyPlayButtonTile = SharedFlagsModule.FFlagLuaAppUnifyPlayButtonTile
local FFlagSduiEdpPrefetchPlayability = SharedFlagsModule.FFlagSduiEdpPrefetchPlayability
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local GAMEGRIDCHILDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING
local ScaledGAMEGRIDCHILDPADDING = DiscoveryTypesModule.Constants.GAME_GRID_CHILD_PADDING * 2
local v1 = if FFlagLuaAppUnifyPlayButtonTile then 6 else nil
local AppFeaturedGameTileTwoByTwo = ReactModule.PureComponent:extend("AppFeaturedGameTileTwoByTwo")
AppFeaturedGameTileTwoByTwo.validateProps = TModule.strictInterface({
	entry = TModule.table,
	index = TModule.optional(TModule.number),
	layoutOrder = TModule.optional(TModule.number),
	reportGameDetailOpened = TModule.optional(TModule.callback),
	reportExperienceLaunched = TModule.optional(TModule.callback),
	size = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.Vector2),
	source = TModule.optional(TModule.string),
	referralSource = TModule.optional(TModule.string),
	hasBackground = TModule.optional(TModule.boolean),
	hasActionRow = TModule.optional(TModule.boolean),
	isDynamic = TModule.optional(TModule.boolean),
	impressionsTag = TModule.optional(TModule.string),
	launchExperienceEventContext = TModule.optional(TModule.string),
	universeId = TModule.optional(TModule.string),
	name = TModule.optional(TModule.string),
	creatorName = TModule.optional(TModule.string),
	placeId = TModule.optional(TModule.string),
	totalUpVotes = TModule.optional(TModule.number),
	totalDownVotes = TModule.optional(TModule.number),
	gameDetail = TModule.optional(TModule.table),
	thumbnail = TModule.optional(TModule.table),
	openGameDetails = TModule.callback,
	fetchGameDetails = TModule.callback,
	navigation = TModule.any,
	networking = TModule.callback,
	shouldShowFeaturedTileCreatorName = TModule.optional(TModule.boolean)
})

function AppFeaturedGameTileTwoByTwo.init(p1)
	-- upvalues: ReactModule (copy), GameCollectionItemTypes (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy), SponsoredGamesRecordClickFunction (copy), AppExperienceActionRow (copy), FFlagLuaAppUnifyPlayButtonTile (copy), v1 (copy), GetRatingTextModule (copy), FeaturedContentPanelModule (copy), FeaturedStaticPanelModule (copy)
	p1.isMounted = false
	p1.gameTileRef = ReactModule.createRef()
	
	function p1.onActivated()
		-- upvalues: p1 (copy), GameCollectionItemTypes (upval), FFlagSduiEdpPrefetchPlayability (upval), FFlagLuaAppSduiEdpEnabled (upval), SponsoredGamesRecordClickFunction (upval)
		if not p1.isMounted then return end
		p1.props.openGameDetails(p1.props.universeId, {
			source = p1.props.source,
			index = p1.props.index,
			onPeekViewClosed = p1.props.onPeekViewClosed,
			experienceJoinData = {
				tileType = p1.props.entry and p1.props.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.EmphasisTile,
				nativeAdData = p1.props.entry and p1.props.entry.adId
			}
		}, p1.props.navigation, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then p1.props.networking else nil)
		local Index = p1.props.index
		local ReportGameDetailOpenedFunction: (any) -> () = p1.props.reportGameDetailOpened
		
		if Index and ReportGameDetailOpenedFunction then
			ReportGameDetailOpenedFunction(Index)
		end
		local Networking = p1.props.networking
		local Entry = p1.props.entry
		
		if Entry.isSponsored then
			SponsoredGamesRecordClickFunction(Networking, Entry.adId)
		end
	end
	
	function p1.renderActionRow()
		-- upvalues: ReactModule (upval), AppExperienceActionRow (upval), p1 (copy), FFlagLuaAppUnifyPlayButtonTile (upval), v1 (upval)
		return ReactModule.createElement(AppExperienceActionRow, {
			launchSource = "FeaturedSearchTile",
			showButtonText = true,
			universeId = p1.props.universeId,
			referralSource = p1.props.referralSource,
			reportExperienceLaunched = p1.props.reportExperienceLaunched,
			openGameDetails = p1.onActivated,
			entry = p1.props.entry,
			launchExperienceEventContext = p1.props.launchExperienceEventContext,
			width = if FFlagLuaAppUnifyPlayButtonTile then UDim.new(1, -2 * v1) else nil,
			horizontalPadding = if FFlagLuaAppUnifyPlayButtonTile then v1 else nil,
			verticalPadding = if FFlagLuaAppUnifyPlayButtonTile then v1 else nil,
			isUnifiedGameTileEnabled = if FFlagLuaAppUnifyPlayButtonTile then true else nil
		})
	end
	
	function p1.renderBottomPanel()
		-- upvalues: p1 (copy), GetRatingTextModule (upval), ReactModule (upval), FeaturedContentPanelModule (upval), FeaturedStaticPanelModule (upval)
		local GameDetail = p1.props.gameDetail
		local ShouldShowFeaturedTileCreatorName = p1.props.shouldShowFeaturedTileCreatorName
		local IsDynamic = p1.props.isDynamic
		local config = {
			padding = 8,
			hasBackground = p1.props.hasBackground,
			title = p1.props.name,
			creatorName = if ShouldShowFeaturedTileCreatorName then p1.props.creatorName else nil,
			creatorVerified = GameDetail and (GameDetail.creator and GameDetail.creator.hasVerifiedBadge),
			creatorId = GameDetail and (GameDetail.creator and GameDetail.creator.id),
			description = GameDetail and GameDetail.description or "",
			licenseDescription = if GameDetail then GameDetail.licenseDescription else nil,
			paidAccessDescription = if GameDetail then GameDetail.localizedFiatPrice else nil,
			footerData = {
				rating = GetRatingTextModule(p1.props.totalUpVotes, p1.props.totalDownVotes),
				playingCount = p1.props.entry.playerCount
			}
		}
		
		return if IsDynamic then ReactModule.createElement(FeaturedContentPanelModule, config) else ReactModule.createElement(FeaturedStaticPanelModule, config)
	end
end

function AppFeaturedGameTileTwoByTwo.didMount(p1)
	-- upvalues: ImpressionsTagUtility (copy)
	p1.isMounted = true
	ImpressionsTagUtility.AddTag(p1.gameTileRef, p1.props.impressionsTag, p1.props.index)
	p1.props.fetchGameDetails(p1.props.networking, p1.props.universeId)
end

function AppFeaturedGameTileTwoByTwo.willUnmount(p1)
	-- upvalues: ImpressionsTagUtility (copy)
	p1.isMounted = false
	ImpressionsTagUtility.RemoveTag(p1.gameTileRef, p1.props.impressionsTag, p1.props.index)
end

function AppFeaturedGameTileTwoByTwo.didUpdate(p1, p2)
	-- upvalues: ImpressionsTagUtility (copy)
	if p2.impressionsTag ~= p1.props.impressionsTag or p2.index ~= p1.props.index then
		ImpressionsTagUtility.RemoveTag(p1.gameTileRef, p2.impressionsTag, p2.index)
		ImpressionsTagUtility.AddTag(p1.gameTileRef, p1.props.impressionsTag, p1.props.index)
	end
end

function AppFeaturedGameTileTwoByTwo.render(p1)
	-- upvalues: GAMEGRIDCHILDPADDING (copy), ScaledGAMEGRIDCHILDPADDING (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), ReactModule (copy), GameTileThumbnailBadges (copy), AppFeaturedTileModule (copy)
	local LayoutOrder = p1.props.layoutOrder
	local Size = p1.props.size
	local Position = p1.props.position
	local Thumbnail = p1.props.thumbnail
	local Url = Thumbnail and Thumbnail.url
	local X = if Size then Size.X else nil
	local Y = if Size then Size.Y else nil
	local NewX = if Size then X * 2 + GAMEGRIDCHILDPADDING else nil
	local NewY = if Size then Y * 2 + ScaledGAMEGRIDCHILDPADDING else nil
	local HasBackground = p1.props.hasBackground
	local HasActionRow = p1.props.hasActionRow
	local Element = nil
	local TileBadgeByPositionConfigFromEntry = GetTileBadgeByPositionConfigFromEntryFunction(p1.props.entry)
	
	if TileBadgeByPositionConfigFromEntry then
		Element = ReactModule.createElement(GameTileThumbnailBadges, {
			tileBadgesByPosition = TileBadgeByPositionConfigFromEntry
		})
	end
	local Element1 = ReactModule.createElement(AppFeaturedTileModule, {
		hasBackground = HasBackground,
		hasOutline = HasBackground,
		thumbnail = Url,
		thumbnailOverlay = Element,
		renderActionRow = if HasActionRow then p1.renderActionRow else nil,
		renderBottomPanel = p1.renderBottomPanel,
		onActivated = p1.onActivated
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = if Size and Position then UDim2.fromOffset(Position.X, Position.Y) else nil,
		Size = if Size then UDim2.new(0, X, 0, Y) else UDim2.new(1, 0, 1, 0),
		LayoutOrder = LayoutOrder,
		ref = p1.gameTileRef
	}, {
		FeaturedTile = if Size then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, NewX, 0, NewY),
			Position = UDim2.new(0, 0, 0, -Y - ScaledGAMEGRIDCHILDPADDING)
		}, { Tile = Element1 }) else Element1
	})
end

return (RoactAppExperimentModule.connectUserLayer({
	GetFFlagShowCreatorNameOnEmphasisSearchTileIXPModule() and AppUserLayers.PlayerAppSearchResultsPageUXLayer or nil
}, function(p1, _)
	-- upvalues: AppUserLayers (copy)
	return {
		shouldShowFeaturedTileCreatorName = (p1[AppUserLayers.PlayerAppSearchResultsPageUXLayer] or {}).ShouldShowFeaturedTileCreatorName == true
	}
end)((RoactServices.connect({ networking = RoactNetworking })((WithNavigationFunction((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: GameInfosReducer (copy), BigGameIconReducer (copy)
	local UniverseId = p2.entry.universeId
	local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][UniverseId]
	
	return {
		universeId = UniverseId,
		name = PersonalizationEntry.name,
		creatorName = PersonalizationEntry.creatorName,
		placeId = PersonalizationEntry.placeId,
		totalUpVotes = PersonalizationEntry.totalUpVotes,
		totalDownVotes = PersonalizationEntry.totalDownVotes,
		gameDetail = p1.GameDetails[UniverseId],
		thumbnail = p1[BigGameIconReducer.key][UniverseId]
	}
end, function(Callback)
	-- upvalues: OpenGameDetailsFunction (copy), FFlagSduiEdpPrefetchPlayability (copy), FFlagLuaAppSduiEdpEnabled (copy), ApiFetchGameDetails (copy)
	return {
		openGameDetails = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), OpenGameDetailsFunction (upval), FFlagSduiEdpPrefetchPlayability (upval), FFlagLuaAppSduiEdpEnabled (upval)
			Callback(OpenGameDetailsFunction(p1, p3, p2, if FFlagSduiEdpPrefetchPlayability and FFlagLuaAppSduiEdpEnabled then p4 else nil))
		end,
		fetchGameDetails = function(p1, p2)
			-- upvalues: Callback (copy), ApiFetchGameDetails (upval)
			Callback(ApiFetchGameDetails.Fetch(p1, { p2 }))
		end
	}
end)(AppFeaturedGameTileTwoByTwo))))))))