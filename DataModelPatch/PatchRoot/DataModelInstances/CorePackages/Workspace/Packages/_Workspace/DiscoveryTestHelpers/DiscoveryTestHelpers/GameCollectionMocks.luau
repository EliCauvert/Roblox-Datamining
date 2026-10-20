local Parent = script:FindFirstAncestor("DiscoveryTestHelpers").Parent
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local TopicInfosReducer = TopicInfosRoduxModule.TopicInfosReducer
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace

local function mockEntry(PlayerCount)
	return {
		ageRecommendationDisplayName = "",
		contentType = "Game",
		friendVisitedString = "",
		isSponsored = false,
		minimumAge = 0,
		under13 = false,
		under9 = false,
		contentId = `{PlayerCount}`,
		friendVisits = {},
		name = `name {PlayerCount}`,
		placeId = `{PlayerCount}00`,
		playerCount = PlayerCount,
		totalDownVotes = PlayerCount,
		totalUpVotes = PlayerCount,
		universeId = `{PlayerCount}`,
		adId = `adId{PlayerCount}`
	}
end

local function _(p1, DisplayName, TreatmentType)
	-- upvalues: TopicInfoModel (copy)
	local MockFromOmniApiResult = TopicInfoModel.mockFromOmniApi(p1)
	MockFromOmniApiResult.displayName = DisplayName
	MockFromOmniApiResult.treatmentType = TreatmentType
	
	return MockFromOmniApiResult
end

local function mockTopicContents(_, p1)
	-- upvalues: mockEntry (copy)
	local Entries = {}
	
	for i = 1, p1 do
		table.insert(Entries, (mockEntry(i)))
	end
	return {
		hasMoreRows = false,
		nextPageExclusiveStartId = 0,
		nextPageToken = "",
		rowsRequested = 0,
		updatedTimestamp = 1718290975.274871110916,
		entries = Entries
	}
end

return {
	mockEntry = mockEntry,
	mockTopicContents = mockTopicContents,
	mockGameSortForExploreApi = function(p2, GameSetTypeId, GameSetTargetId)
		-- upvalues: TopicInfoModel (copy)
		local MockFromExploreJsonDataResult = TopicInfoModel.mockFromExploreJsonData(p2, "")
		MockFromExploreJsonDataResult.displayIcon = "test-display-icon"
		MockFromExploreJsonDataResult.displayName = "test-display-name"
		MockFromExploreJsonDataResult.gameSetTypeId = GameSetTypeId
		MockFromExploreJsonDataResult.gameSetTargetId = GameSetTargetId
		
		return MockFromExploreJsonDataResult
	end,
	mockStoreStateForOmniApi = function(TopicId, PageType, _, p2, p3)
		-- upvalues: mockEntry (copy), GameInfosReducer (copy), TopicContentsReducer (copy), mockTopicContents (copy), TopicInfosReducer (copy), TopicInfoModel (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy)
		local Recommendations = {}
		local Games = {}
		local t = {}
		local PlayabilityStatus = {}
		local AgeRecommendations = {}
		
		for i = 1, p2 do
			table.insert(Recommendations, { contentType = "Game", contentId = i })
			table.insert(Games, (mockEntry(i)))
			t[`{i}`] = mockEntry(i)
			PlayabilityStatus[`{i}`] = { PlayabilityStatus = "Playable" }
			AgeRecommendations[`{i}`] = {
				summary = {
					ageRecommendation = { { ageRecommendationDisplayName = "", minimumAge = 0 } }
				}
			}
		end
		local MockFromOmniApiResult = TopicInfoModel.mockFromOmniApi(TopicId)
		MockFromOmniApiResult.displayName = "Continue"
		MockFromOmniApiResult.treatmentType = "Carousel"
		
		return {
			LocalUserId = 2,
			AgeRecommendations = AgeRecommendations,
			GameIconsKey = {},
			GamesProductInfoKey = {},
			GameDetails = {},
			GameDetailsPeekView = {},
			PlayabilityStatus = PlayabilityStatus,
			Users = {},
			InGameUsersByGame = {},
			UserGameVotes = {},
			ShowAgeVerificationOverlay = {},
			GameSorts = {},
			OmniRecommendations = {
				[PageType] = {
					pageType = PageType,
					metadata = { Games = Games },
					sorts = {
						{
							numberOfRows = 1,
							topic = "Friends",
							topicId = "600000000",
							treatmentType = "FriendCarousel",
							recommendations = {},
							topicLayoutData = {}
						},
						{
							numberOfRows = 1,
							topic = "Continue",
							treatmentType = "Carousel",
							recommendations = Recommendations,
							topicId = TopicId,
							topicLayoutData = {}
						}
					}
				}
			},
			Personalization = {
				[GameInfosReducer.key] = t,
				[TopicContentsReducer.key] = { [TopicId] = mockTopicContents(TopicId, p2) },
				[TopicInfosReducer.key] = { [TopicId] = MockFromOmniApiResult },
				[FetchStatusReducer.key] = {
					[FetchStatusNamespace.GameSorts] = { [TopicId] = p3 },
					[FetchStatusNamespace.OmniRecommendations] = { [PageType] = p3 }
				},
				[NextDataExpirationTimeReducer.key] = { [ExpirationTimeNamespace.GameDetailPlayability] = {} }
			},
			BatchFetchingStatus = {},
			FetchingStatus = {},
			ScreenSize = Vector2.new(100, 100),
			TopBar = { topBarHeight = 10 },
			GlobalGuiInset = { bottom = 10, top = 10, left = 0, right = 0 },
			Navigation = {},
			CentralOverlay = { OverlayType = nil }
		}
	end,
	mockStoreStateForExploreApi = function(p4, p5, p6, GameSetTypeId, GameSetTargetId)
		-- upvalues: mockEntry (copy), GameInfosReducer (copy), TopicContentsReducer (copy), mockTopicContents (copy), TopicInfosReducer (copy), TopicInfoModel (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), NextDataExpirationTimeReducer (copy), ExpirationTimeNamespace (copy)
		local t = {}
		local PlayabilityStatus = {}
		local AgeRecommendations = {}
		
		for i = 1, p5 do
			t[`{i}`] = mockEntry(i)
			PlayabilityStatus[`{i}`] = { PlayabilityStatus = "Playable" }
			AgeRecommendations[`{i}`] = {
				summary = {
					ageRecommendation = { { ageRecommendationDisplayName = "", minimumAge = 0 } }
				}
			}
		end
		local MockFromExploreJsonDataResult = TopicInfoModel.mockFromExploreJsonData(p4, "")
		MockFromExploreJsonDataResult.displayIcon = "test-display-icon"
		MockFromExploreJsonDataResult.displayName = "test-display-name"
		MockFromExploreJsonDataResult.gameSetTypeId = GameSetTypeId
		MockFromExploreJsonDataResult.gameSetTargetId = GameSetTargetId
		
		return {
			LocalUserId = 2,
			AgeRecommendations = AgeRecommendations,
			GameIconsKey = {},
			GamesProductInfoKey = {},
			GameDetails = {},
			GameDetailsPeekView = {},
			PlayabilityStatus = PlayabilityStatus,
			Users = {},
			InGameUsersByGame = {},
			UserGameVotes = {},
			ShowAgeVerificationOverlay = {},
			GameSortGroups = { HomeGames = { pageId = "" } },
			Personalization = {
				[GameInfosReducer.key] = t,
				[TopicContentsReducer.key] = { [p4] = mockTopicContents(p4, p5) },
				[TopicInfosReducer.key] = { [p4] = MockFromExploreJsonDataResult },
				[FetchStatusReducer.key] = { [FetchStatusNamespace.GameSorts] = { [p4] = p6 } },
				[NextDataExpirationTimeReducer.key] = { [ExpirationTimeNamespace.GameDetailPlayability] = {} }
			},
			BatchFetchingStatus = {},
			FetchingStatus = {},
			ScreenSize = Vector2.new(100, 100),
			TopBar = { topBarHeight = 10 },
			GlobalGuiInset = { bottom = 10, top = 10, left = 0, right = 0 },
			Navigation = {},
			CentralOverlay = { OverlayType = nil }
		}
	end
}