local _ = require(script.RoduxTypes)
local _ = require(script.EnumGameDetailErrorTypes)

return {
	OmniFeedPropsKey = require(script.Parent.AppCommonLib).Symbol.named("OmniFeedProps"),
	Constants = {
		SORT_INDEX_SELECTION_ORDER_MULTIPLIER = 100,
		SORT_SELECTION_ORDER_BASE = -1000,
		DEFAULT_GAME_FETCH_COUNT = 40,
		GAME_CAROUSEL_CHILD_PADDING = 12,
		GAME_CAROUSEL_PADDING = 15,
		GAME_CAROUSEL_SIDE_COMPACT_PADDING = 24,
		GAME_CAROUSEL_SIDE_WIDE_PADDING = 48,
		GAME_GRID_CHILD_PADDING = 12,
		GAME_GRID_PADDING = 15,
		GAME_GRID_TILE_FOOTER_HEIGHT = 70,
		GAME_DETAILS_ACTION_BAR_HEIGHT = if require(script.Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonMobileEdp or require(script.Parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton() then 50 else 48,
		MAX_RECOMMENDED_GAMES_FETCH_COUNT = require(script.Flags.GetFIntLuaAppRecommendedGamesCount)()
	},
	DataSourceType = {
		DiscoveryApi = "DiscoveryApi",
		ExploreApi = "ExploreApi",
		GamesApi = "GamesApi",
		Local = "Local",
		SearchApi = "SearchApi",
		Unknown = "Unknown",
		OmniAutocompleteApi = if require(script.Parent.SharedFlags).FFlagSearchOmniAutocompletePage then "OmniAutocompleteApi" else nil
	},
	ExperienceDetailsNoticeType = { InExperiencePurchase = "InExperiencePurchase" },
	ExploreContentType = require(script.ExploreContentType),
	GameBasicStatsLayoutType = require(script.GameBasicStatsLayoutType),
	GameCardLayoutType = require(script.GameCardLayoutType),
	EnumGameDetailErrorTypes = require(script.EnumGameDetailErrorTypes),
	EnumIgrsRating = require(script.EnumIgrsRating),
	GameMediaImageType = require(script.GameMediaImageType),
	GameSortGroups = require(script.GameSortGroups),
	GameTopicIds = require(script.GameTopicIds),
	OmniRecommendationsContentType = require(script.OmniRecommendationsContentType),
	OmniFeedTypes = require(script.OmniFeedTypes),
	OmniFeedConstants = require(script.OmniFeedConstants),
	PlayabilityStatusEnum = require(script.PlayabilityStatusEnum),
	PlayableUxTreatmentEnum = require(script.PlayableUxTreatmentEnum),
	SearchSourceEvent = require(script.SearchSourceEvent),
	SearchTextTopicIds = require(script.SearchTextTopicIds),
	SearchLandingPageSurface = require(script.SearchLandingPageSurface),
	SortContentType = if require(script.Parent.SharedFlags).FFlagEnableTopSongsSort then require(script.SortContentType) else nil,
	GameCollectionItemTypes = require(script.GameCollectionItemTypes),
	["jest.config"] = script["jest.config"]
}