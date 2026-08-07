local array = require(script:FindFirstAncestor("GraphQLServer").Parent.LuauPolyfill).Array
local t = {}
local omniFeedConnectorModule = require(script.Parent.Parent.Parent.connectors.OmniFeed.OmniFeedConnector)
local findOmniFeedBySessionId = omniFeedConnectorModule.findOmniFeedBySessionId
local fetchMoreOmniRecommendationMetadata = omniFeedConnectorModule.fetchMoreOmniRecommendationMetadata
local _ = require(script.Parent.Parent.Parent.generatedTypes)
t.default = {
	OmniFeedItem = {
		experiences = function(p0) --[[ line: 35 ]]
			if not p0.metadata or not p0.metadata.Game or not p0.recommendations then
				return nil
			end
			local game = p0.metadata.Game
			local t = {}
			
			for i, v in p0.recommendations do
				if v.contentId then
					local contentId = game[tostring(v.contentId)]
					local contentMetadata = v.contentMetadata
					local var3 = if contentMetadata and contentMetadata.EncryptedAdTrackingData then contentMetadata.EncryptedAdTrackingData else nil
					
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
							adId = var3 or "",
							isSponsored = var3 ~= nil and var3 ~= ""
						})
					end
				end
			end
			return t
		end
	},
	OmniFeedMetadata = {
		GameJSON = function(p1) --[[ line: 73 ]]
			return p1.Game
		end,
		CatalogAssetJSON = function(value) --[[ line: 76 ]]
			return value.CatalogAsset
		end,
		CatalogBundleJSON = function(p2) --[[ line: 79 ]]
			return p2.CatalogBundle
		end,
		RecommendedFriendJSON = function(p3) --[[ line: 82 ]]
			return p3.RecommendedFriend
		end
	},
	OmniFeed = {
		metadata = function(p4) --[[ line: 87 ]]
			return p4.contentMetadata
		end,
		sortsExpirationTime = function(p5) --[[ line: 90 ]]
			return if p5.sortsRefreshInterval then math.floor(tick()) + p5.sortsRefreshInterval else nil
		end,
		recommendationsId = function(p6) --[[ line: 96 ]]
			return p6.requestId
		end,
		globalLayoutData = function(p7) --[[ line: 99 ]]
			return p7.globalLayoutData
		end,
		sorts = function(p8) --[[ line: 102 ]]
			-- upvalues: array (ref)
			return if p8.sorts then array.map(p8.sorts, function(p9) --[[ line: 107 ]]
				-- upvalues: p8 (ref)
				return {
					topic = p9.topic,
					topicId = p9.topicId,
					treatmentType = p9.treatmentType,
					recommendations = p9.recommendationList,
					metadata = p8.contentMetadata
				}
			end) else nil
		end
	},
	OmniFeedItemWithMetadata = {
		metadata = function(p10) --[[ line: 121 ]]
			return p10.contentMetadata
		end,
		sort = function(p11) --[[ line: 124 ]]
			return {
				topicId = p11.topicId,
				metadata = p11.contentMetadata,
				recommendations = p11.recommendations
			}
		end
	},
	Query = {
		omniFeed = function(_, p12, p13) --[[ line: 135 ]]
			-- upvalues: findOmniFeedBySessionId (ref)
			return findOmniFeedBySessionId(p12, p13.fetchImpl)
		end,
		refreshOmniFeedItem = function(_, p14, p15) --[[ line: 138 ]]
			-- upvalues: fetchMoreOmniRecommendationMetadata (ref)
			return fetchMoreOmniRecommendationMetadata(p14, p15.fetchImpl)
		end
	}
}

return t