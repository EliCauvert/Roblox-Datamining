local Array = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Array
local OmniFeedConnectorModule = require(script.Parent.Parent.Parent.connectors.OmniFeed.OmniFeedConnector)
local FindOmniFeedBySessionIdFunction = OmniFeedConnectorModule.findOmniFeedBySessionId
local FetchMoreOmniRecommendationMetadataFunction = OmniFeedConnectorModule.fetchMoreOmniRecommendationMetadata
local _ = require(script.Parent.Parent.Parent.generatedTypes)

return {
	default = {
		OmniFeedItem = {
			experiences = function(p1)
				if not p1.metadata or not p1.metadata.Game or not p1.recommendations then
					return nil
				end
				local Game = p1.metadata.Game
				local List = {}
				
				for _, recommendation in p1.recommendations do
					if recommendation.contentId then
						local GameEntry = Game[tostring(recommendation.contentId)]
						local ContentMetadata = recommendation.contentMetadata
						local EncryptedAdTrackingData = if ContentMetadata and ContentMetadata.EncryptedAdTrackingData then ContentMetadata.EncryptedAdTrackingData else nil
						
						if GameEntry and GameEntry.universeId then
							table.insert(List, {
								placeId = if GameEntry.rootPlaceId then tostring(GameEntry.rootPlaceId) else nil,
								name = GameEntry.name,
								universeId = tostring(GameEntry.universeId),
								totalUpVotes = GameEntry.totalUpVotes,
								totalDownVotes = GameEntry.totalDownVotes,
								playerCount = GameEntry.playerCount,
								under9 = if GameEntry.under9 then GameEntry.under9 else false,
								under13 = if GameEntry.under13 then GameEntry.under13 else false,
								adId = EncryptedAdTrackingData or "",
								isSponsored = EncryptedAdTrackingData ~= nil and EncryptedAdTrackingData ~= ""
							})
						end
					end
				end
				return List
			end
		},
		OmniFeedMetadata = {
			GameJSON = function(p2)
				return p2.Game
			end,
			CatalogAssetJSON = function(p2)
				return p2.CatalogAsset
			end,
			CatalogBundleJSON = function(p2)
				return p2.CatalogBundle
			end,
			RecommendedFriendJSON = function(p2)
				return p2.RecommendedFriend
			end
		},
		OmniFeed = {
			metadata = function(p2)
				return p2.contentMetadata
			end,
			sortsExpirationTime = function(p2)
				return if p2.sortsRefreshInterval then math.floor((tick())) + p2.sortsRefreshInterval else nil
			end,
			recommendationsId = function(p2)
				return p2.requestId
			end,
			globalLayoutData = function(p2)
				return p2.globalLayoutData
			end,
			sorts = function(p2)
				-- upvalues: Array (copy)
				return if p2.sorts then Array.map(p2.sorts, function(p3)
					-- upvalues: p2 (copy)
					return {
						topic = p3.topic,
						topicId = p3.topicId,
						treatmentType = p3.treatmentType,
						recommendations = p3.recommendationList,
						metadata = p2.contentMetadata
					}
				end) else nil
			end
		},
		OmniFeedItemWithMetadata = {
			metadata = function(p2)
				return p2.contentMetadata
			end,
			sort = function(p2)
				return {
					topicId = p2.topicId,
					metadata = p2.contentMetadata,
					recommendations = p2.recommendations
				}
			end
		},
		Query = {
			omniFeed = function(_, p2, p3)
				-- upvalues: FindOmniFeedBySessionIdFunction (copy)
				return FindOmniFeedBySessionIdFunction(p2, p3.fetchImpl)
			end,
			refreshOmniFeedItem = function(_, p2, p3)
				-- upvalues: FetchMoreOmniRecommendationMetadataFunction (copy)
				return FetchMoreOmniRecommendationMetadataFunction(p2, p3.fetchImpl)
			end
		}
	}
}