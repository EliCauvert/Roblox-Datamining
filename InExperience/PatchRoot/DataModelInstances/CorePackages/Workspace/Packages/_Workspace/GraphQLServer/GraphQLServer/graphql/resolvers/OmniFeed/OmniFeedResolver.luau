local array = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Array
local t = {}
local omniFeedConnectorModule = require(script.Parent.Parent.Parent.connectors.OmniFeed.OmniFeedConnector)
local findOmniFeedBySessionId = omniFeedConnectorModule.findOmniFeedBySessionId
local fetchMoreOmniRecommendationMetadata = omniFeedConnectorModule.fetchMoreOmniRecommendationMetadata
local _ = require(script.Parent.Parent.Parent.generatedTypes)
t.default = {
	OmniFeedItem = {
		experiences = function(p1)
			if not p1.metadata or not p1.metadata.Game or not p1.recommendations then
				return nil
			end
			local game = p1.metadata.Game
			local t = {}
			
			for i, v in p1.recommendations do
				if v.contentId then
					local contentId = game[tostring(v.contentId)]
					local contentMetadata = v.contentMetadata
					local var1 = if contentMetadata and contentMetadata.EncryptedAdTrackingData then contentMetadata.EncryptedAdTrackingData else nil
					
					if contentId and contentId.universeId then
						table.insert(t, {
							placeId = if contentId.rootPlaceId then tostring(contentId.rootPlaceId) else nil,
							name = contentId.name,
							universeId = tostring(contentId.universeId),
							totalUpVotes = contentId.totalUpVotes,
							totalDownVotes = contentId.totalDownVotes,
							playerCount = contentId.playerCount,
							under9 = if contentId.under9 then contentId.under9 else false,
							under13 = if contentId.under13 then contentId.under13 else false,
							adId = var1 or "",
							isSponsored = var1 ~= nil and var1 ~= ""
						})
					end
				end
			end
			return t
		end
	},
	OmniFeedMetadata = {
		GameJSON = function(p2)
			return p2.Game
		end,
		CatalogAssetJSON = function(value)
			return value.CatalogAsset
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
			return if p2.sortsRefreshInterval then math.floor(tick()) + p2.sortsRefreshInterval else nil
		end,
		recommendationsId = function(p2)
			return p2.requestId
		end,
		globalLayoutData = function(p2)
			return p2.globalLayoutData
		end,
		sorts = function(p2)
			-- upvalues: array (ref)
			return if p2.sorts then array.map(p2.sorts, function(p3)
				-- upvalues: p2 (ref)
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
			-- upvalues: findOmniFeedBySessionId (ref)
			return findOmniFeedBySessionId(p2, p3.fetchImpl)
		end,
		refreshOmniFeedItem = function(_, p2, p3)
			-- upvalues: fetchMoreOmniRecommendationMetadata (ref)
			return fetchMoreOmniRecommendationMetadata(p2, p3.fetchImpl)
		end
	}
}

return t