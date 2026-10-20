local Modules = script.Modules
local _ = require(Modules.LuaApp.Thunks.Search.HandleGameSearchResults)

return {
	Modules = {
		LuaApp = {
			Actions = {
				Games = {
					AddContentMetadata = require(Modules.LuaApp.Actions.Games.AddContentMetadata),
					AddOmniRecommendations = require(Modules.LuaApp.Actions.Games.AddOmniRecommendations),
					AppendGameSortsInGroup = require(Modules.LuaApp.Actions.Games.AppendGameSortsInGroup),
					SetGameSortsInGroup = require(Modules.LuaApp.Actions.Games.SetGameSortsInGroup),
					SetOmniAutocompleteSorts = require(Modules.LuaApp.Actions.Games.SetOmniAutocompleteSorts),
					SetOmniRecommendationsMetadataRequestStatus = require(Modules.LuaApp.Actions.Games.SetOmniRecommendationsMetadataRequestStatus),
					SetOmniRecommendationsRefreshTime = require(Modules.LuaApp.Actions.Games.SetOmniRecommendationsRefreshTime),
					UpdateGameMedia = require(Modules.LuaApp.Actions.Games.UpdateGameMedia)
				},
				AppendSearchInGames = require(Modules.LuaApp.Actions.AppendSearchInGames),
				SetHomePageUpsellCardVariation = require(Modules.LuaApp.Actions.SetHomePageUpsellCardVariation),
				SetSearchInGames = require(Modules.LuaApp.Actions.SetSearchInGames),
				SetSearchInGamesStatus = require(Modules.LuaApp.Actions.SetSearchInGamesStatus),
				AddTextSearchResults = require(Modules.LuaApp.Actions.AddTextSearchResults),
				RemoveTextSearchResults = require(Modules.LuaApp.Actions.RemoveTextSearchResults)
			},
			Analytics = {
				Events = {
					Games = {
						GameDetailsEvents = require(Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents)
					}
				},
				Sessions = {
					OmniSearchSessionUtil = require(Modules.LuaApp.Analytics.Sessions.OmniSearchSessionUtil)
				}
			},
			Common = {
				Experience = {
					getPlayButtonProps = require(Modules.LuaApp.Common.Experience.getPlayButtonProps)
				}
			},
			Components = {
				EventReceivers = {
					OnGameLeaveReceiver = require(Modules.LuaApp.Components.EventReceivers.OnGameLeaveReceiver)
				},
				ExperienceDetails = {
					ExperienceRatings = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceRatings)
				},
				Games = {
					AppFeaturedGameTileTwoByTwo = require(Modules.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo),
					GameGridSelector = require(Modules.LuaApp.Components.Games.GameGridSelector),
					GameGridTable = require(Modules.LuaApp.Components.Games.GameGridTable),
					OmniFeedAutoRefresher = require(Modules.LuaApp.Components.Games.OmniFeedAutoRefresher)
				},
				Generic = {
					GridView = require(Modules.LuaApp.Components.Generic.GridView)
				},
				Search = {
					SearchTypeSelection = {
						Context = require(Modules.LuaApp.Components.Search.SearchTypeSelection.Context),
						SearchSelectionTypeHeader = require(Modules.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader)
					}
				}
			},
			DesignTokenMappers = {
				experienceDetailsTokenMapper = require(Modules.LuaApp.DesignTokenMappers.experienceDetailsTokenMapper)
			},
			Enum = {
				SearchRetrievalStatus = require(Modules.LuaApp.Enum.SearchRetrievalStatus),
				PaginationMethod = require(Modules.LuaApp.Enum.PaginationMethod)
			},
			Flags = {
				GetFFlagEnableHomePageUpsellCard = require(Modules.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard),
				GetFFlagFixFetchNextOmniWithoutPageToken = require(Modules.LuaApp.Flags.GetFFlagFixFetchNextOmniWithoutPageToken),
				GetFFlagLuaAppUpdateGameSortGridRowHeight10ft = require(Modules.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft),
				GetFFlagShowCreatorNameOnEmphasisSearchTileIXP = require(Modules.LuaApp.Flags.GetFFlagShowCreatorNameOnEmphasisSearchTileIXP)
			},
			Http = {
				Requests = {
					DiscoveryApi = {
						OmniGetRecommendationsMetadata = require(Modules.LuaApp.Http.Requests.DiscoveryApi.OmniGetRecommendationsMetadata)
					},
					GamesApi = {
						GetSearchLandingPageSuggestion = require(Modules.LuaApp.Http.Requests.GamesApi.GetSearchLandingPageSuggestion)
					},
					SearchGetOmniSearch = require(Modules.LuaApp.Http.Requests.SearchGetOmniSearch)
				}
			},
			Models = {
				DiscoveryApi = {
					OmniRecommendations = require(Modules.LuaApp.Models.DiscoveryApi.OmniRecommendations),
					getFormattedTextSearchEntry = require(Modules.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry)
				},
				GamesApi = {
					GameMediaEntry = require(Modules.LuaApp.Models.GamesApi.GameMediaEntry),
					GameSearchEntry = require(Modules.LuaApp.Models.GamesApi.GameSearchEntry)
				},
				GameSortGroup = require(Modules.LuaApp.Models.GameSortGroup),
				SearchInGames = require(Modules.LuaApp.Models.SearchInGames)
			},
			Reducers = {
				Games = {
					GameMedia = require(Modules.LuaApp.Reducers.Games.GameMedia),
					GameSortGroups = require(Modules.LuaApp.Reducers.Games.GameSortGroups),
					OmniRecommendations = require(Modules.LuaApp.Reducers.Games.OmniRecommendations),
					OmniRecommendationsRefreshTime = require(Modules.LuaApp.Reducers.Games.OmniRecommendationsRefreshTime)
				},
				FetchHomePageDataStatusAll = require(Modules.LuaApp.Reducers.FetchHomePageDataStatusAll),
				GamesPageDataStatus = require(Modules.LuaApp.Reducers.GamesPageDataStatus),
				HomePageDataStatus = require(Modules.LuaApp.Reducers.HomePageDataStatus),
				HomePageUpsellCardVariation = require(Modules.LuaApp.Reducers.HomePageUpsellCardVariation),
				OmniRecommendationsMetadataRetrievalStatus = require(Modules.LuaApp.Reducers.OmniRecommendationsMetadataRetrievalStatus),
				RequestsStatus = require(Modules.LuaApp.Reducers.RequestsStatus)
			},
			Thunks = {
				Games = {
					ApiFetchGameMedia = require(Modules.LuaApp.Thunks.Games.ApiFetchGameMedia),
					ApiFetchGamesData = require(Modules.LuaApp.Thunks.Games.ApiFetchGamesData),
					ApiFetchGamesInSort = require(Modules.LuaApp.Thunks.Games.ApiFetchGamesInSort),
					RefreshExpiringSortTokens = require(Modules.LuaApp.Thunks.Games.RefreshExpiringSortTokens),
					updateGamesSortData = require(Modules.LuaApp.Thunks.Games.updateGamesSortData)
				},
				Omni = {
					ApiFetchOmniRecommendations = require(Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendations),
					ApiFetchOmniRecommendationsMetadata = require(Modules.LuaApp.Thunks.Omni.ApiFetchOmniRecommendationsMetadata),
					parseAndAddContentMetadata = require(Modules.LuaApp.Thunks.Omni.parseAndAddContentMetadata)
				},
				Search = {
					ApiFetchGameSearchResults = require(Modules.LuaApp.Thunks.Search.ApiFetchGameSearchResults),
					ApiFetchSearchLandingPage = require(Modules.LuaApp.Thunks.Search.ApiFetchSearchLandingPage),
					HandleGameSearchResults = require(Modules.LuaApp.Thunks.Search.HandleGameSearchResults)
				},
				FetchAdditionalFriendsInfo = require(Modules.LuaApp.Thunks.FetchAdditionalFriendsInfo),
				FetchDataWithErrorToasts = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts),
				FetchGamesPageData = require(Modules.LuaApp.Thunks.FetchGamesPageData),
				FetchHomePageData = require(Modules.LuaApp.Thunks.FetchHomePageData),
				FetchHomePageContactMethodModuleVariation = require(Modules.LuaApp.Thunks.FetchHomePageContactMethodModuleVariation),
				PostHomePageContactMethodModuleVariationDismiss = require(Modules.LuaApp.Thunks.PostHomePageContactMethodModuleVariationDismiss),
				FetchUserDataForHomePage = require(Modules.LuaApp.Thunks.FetchUserDataForHomePage),
				LegacyUpdateUsers = require(Modules.LuaApp.Thunks.LegacyUpdateUsers),
				RefreshGameSorts = require(Modules.LuaApp.Thunks.RefreshGameSorts)
			},
			Util = {
				Omni = { OmniUtils = require(Modules.LuaApp.Util.Omni.OmniUtils) }
			}
		},
		Personalization = {
			Analytics = {
				queryImpressionsEvent = require(Modules.Personalization.Analytics.queryImpressionsEvent),
				querySuggestionClicked = require(Modules.Personalization.Analytics.querySuggestionClicked)
			},
			Games = {
				DataStore = {
					GenerateTopicContents = require(Modules.Personalization.Games.DataStore.GenerateTopicContents)
				},
				Discovery = {
					DiscoveryNextPageId = require(Modules.Personalization.Games.Discovery.DiscoveryNextPageId)
				},
				GameCollectionCarousel = require(Modules.Personalization.Games.GameCollectionCarousel),
				useLoadGamesForSortFromGamesApi = require(Modules.Personalization.Games.useLoadGamesForSortFromGamesApi),
				useLoadMoreGames = require(Modules.Personalization.Games.useLoadMoreGames)
			},
			OmniFeed = {
				DataStore = {
					AddExploreOmniItems = require(Modules.Personalization.OmniFeed.DataStore.AddExploreOmniItems),
					AddSearchResultsOmniFeed = require(Modules.Personalization.OmniFeed.DataStore.AddSearchResultsOmniFeed),
					ClearFeedItemRenderedRows = require(Modules.Personalization.OmniFeed.DataStore.ClearFeedItemRenderedRows),
					ClearGameGridFlexFeedItemBounds = require(Modules.Personalization.OmniFeed.DataStore.ClearGameGridFlexFeedItemBounds),
					FeedItemModel = require(Modules.Personalization.OmniFeed.DataStore.FeedItemModel),
					GameGridFlexFeedItemBounds = require(Modules.Personalization.OmniFeed.DataStore.GameGridFlexFeedItemBounds),
					OmniItemsGlobalLayoutData = require(Modules.Personalization.OmniFeed.DataStore.OmniItemsGlobalLayoutData),
					SetGameGridFlexFeedItemInput = require(Modules.Personalization.OmniFeed.DataStore.SetGameGridFlexFeedItemInput),
					SetFeedItemRenderedRows = require(Modules.Personalization.OmniFeed.DataStore.SetFeedItemRenderedRows),
					useUpdateFeedItemRenderedRows = require(Modules.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows)
				},
				FeedItems = {
					GameCarouselFeedItem = require(Modules.Personalization.OmniFeed.FeedItems.GameCarouselFeedItem),
					GameFiltersFeedItem = require(Modules.Personalization.OmniFeed.FeedItems.GameFiltersFeedItem),
					HomeGameGridFlexFeedItem = require(Modules.Personalization.OmniFeed.FeedItems.HomeGameGridFlexFeedItem),
					SearchGameGridFeedItem = require(Modules.Personalization.OmniFeed.FeedItems.SearchGameGridFeedItem),
					SearchTextFeedItem = require(Modules.Personalization.OmniFeed.FeedItems.SearchTextFeedItem),
					SongCarouselFeedItem = require(Modules.Personalization.OmniFeed.FeedItems.SongCarouselFeedItem)
				},
				OmniFeedImpressionsDetector = require(Modules.Personalization.OmniFeed.OmniFeedImpressionsDetector),
				OmniFeedProps = require(Modules.Personalization.OmniFeed.OmniFeedProps),
				useGridFlexFeedItemBounds = require(Modules.Personalization.OmniFeed.useGridFlexFeedItemBounds)
			},
			Search = {
				FIntSearchLandingPageSideMargin = require(Modules.Personalization.Search.FIntSearchLandingPageSideMargin),
				mapContentTypeToTreatmentType = require(Modules.Personalization.Search.mapContentTypeToTreatmentType),
				SearchConstants = require(Modules.Personalization.Search.SearchConstants),
				SearchPill = require(Modules.Personalization.Search.SearchPill),
				SearchTextBanner = require(Modules.Personalization.Search.SearchTextBanner)
			},
			Sessions = {
				DataStore = {
					PageSessionTimestamp = require(Modules.Personalization.Sessions.DataStore.PageSessionTimestamp),
					SetPageSessionTimestamp = require(Modules.Personalization.Sessions.DataStore.SetPageSessionTimestamp)
				},
				DiscoverPageSession = require(Modules.Personalization.Sessions.DiscoverPageSession),
				SearchLandingPageSession = require(Modules.Personalization.Sessions.SearchLandingPageSession)
			}
		}
	},
	["jest.config"] = script["jest.config"]
}