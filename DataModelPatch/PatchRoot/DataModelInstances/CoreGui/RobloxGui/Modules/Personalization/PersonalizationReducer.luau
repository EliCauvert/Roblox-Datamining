local CorePackages = game:GetService("CorePackages")
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local TopicInfosReducer = require(CorePackages.Workspace.Packages.TopicInfosRodux).TopicInfosReducer
local FetchStatusReducer = require(CorePackages.Workspace.Packages.FetchStatusRodux).FetchStatusReducer
local NextDataExpirationTimeReducer = require(CorePackages.Workspace.Packages.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer
local GameFiltersReducer = require(CorePackages.Workspace.Packages.GameFilters).DataStore.GameFiltersReducer
local SongDetailReducer = require(CorePackages.Workspace.Packages.SongDetailRodux).SongDetailReducer
local SongInfosReducer = require(CorePackages.Workspace.Packages.SongInfosRodux).SongInfosReducer
local ArtistSongReducer = require(CorePackages.Workspace.Packages.SongDetailRodux).ArtistSongReducer
local ExperienceSongsReducer = require(CorePackages.Workspace.Packages.ExperienceSongsRodux).ExperienceSongsReducer
local SongExperiencesReducer = require(CorePackages.Workspace.Packages.SongDetailRodux).SongExperiencesReducer
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SduiConfigReducer = require(CorePackages.Workspace.Packages.ServerDrivenUi).SduiConfigReducer
local FFlagEnableTopSongsSort = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableTopSongsSort
local FFlagSongEdpCarouselIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongEdpCarouselIxp

return require(CorePackages.Packages.Rodux).combineReducers({
	OrderedOmniItems = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.OmniFeed.DataStore.OrderedOmniItems),
	[TopicInfosReducer.key] = TopicInfosReducer.reducer,
	[TopicContentsReducer.key] = TopicContentsReducer.reducer,
	PageSessionTimestamp = Modules.Personalization.Sessions.DataStore.PageSessionTimestamp,
	GameGridFlexFeedItemBounds = Modules.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds,
	OmniItemsGlobalLayoutData = Modules.Personalization.OmniFeed.DataStore.OmniItemsGlobalLayoutData,
	DiscoveryNextPageId = Modules.Personalization.Games.Discovery.DiscoveryNextPageId,
	[GameInfosReducer.key] = GameInfosReducer.reducer,
	[FetchStatusReducer.key] = FetchStatusReducer.reducer,
	[NextDataExpirationTimeReducer.key] = NextDataExpirationTimeReducer.reducer,
	[GameFiltersReducer.key] = GameFiltersReducer.reducer,
	[SduiConfigReducer.key] = SduiConfigReducer.reducer,
	[ArtistSongReducer.key] = if FFlagEnableTopSongsSort then ArtistSongReducer.reducer else nil,
	[ExperienceSongsReducer.key] = if FFlagSongEdpCarouselIxp then ExperienceSongsReducer.reducer else nil,
	[SongDetailReducer.key] = if FFlagEnableTopSongsSort then SongDetailReducer.reducer else nil,
	[SongInfosReducer.key] = if FFlagEnableTopSongsSort then SongInfosReducer.reducer else nil,
	[SongExperiencesReducer.key] = if FFlagEnableTopSongsSort then SongExperiencesReducer.reducer else nil
})