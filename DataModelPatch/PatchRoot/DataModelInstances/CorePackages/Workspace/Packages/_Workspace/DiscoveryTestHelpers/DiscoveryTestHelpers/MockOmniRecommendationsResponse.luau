local DiscoveryTypesModule = require(script:FindFirstAncestor("DiscoveryTestHelpers").Parent.DiscoveryTypes)
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local OmniFeedTypes = DiscoveryTypesModule.OmniFeedTypes

function mockEndpointResponse(p1)
	-- upvalues: OmniRecommendationsContentType (copy), OmniFeedTypes (copy)
	local config = {
		rootPlaceId = "10395446",
		universeId = "149757",
		name = "test",
		totalUpVotes = 10970,
		totalDownVotes = 2564,
		playerCount = 5,
		under9 = true,
		under13 = false,
		friendActivityTitle = "Friend Activity",
		minimumAge = 0,
		ageRecommendationDisplayName = "All Ages"
	}
	
	return {
		pageType = "Home",
		requestId = "123avcd3-1431-35bd-24db-452abcde65abf35",
		nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=",
		isSessionExpired = false,
		contentMetadata = {
			[OmniRecommendationsContentType.Game] = { [config.universeId] = config },
			[OmniRecommendationsContentType.CatalogAsset] = {},
			[OmniRecommendationsContentType.CatalogBundle] = {},
			[OmniRecommendationsContentType.RecommendedFriend] = {}
		},
		sorts = {
			{
				topicId = 100000003,
				topic = p1 or "topic123",
				recommendationList = {
					{
						contentType = OmniRecommendationsContentType.Game,
						contentId = config.universeId,
						contentMetadata = { Score = "10" }
					}
				},
				treatmentType = OmniFeedTypes.Carousel
			}
		}
	}
end

return mockEndpointResponse