local GraphQLServer = script:FindFirstAncestor("GraphQLServer")
local _ = require(GraphQLServer.Parent.LuauPolyfill)
local _ = require(GraphQLServer.graphql.generatedTypes)
local PromiseModule = require(GraphQLServer.Parent.Promise)
local GraphQLError = require(GraphQLServer.Parent.GraphQL).GraphQLError
local FetchModule = require(GraphQLServer.Parent.Fetch)
local Fetch = FetchModule.fetch
local Response = FetchModule.Response
local UrlBuilder = require(GraphQLServer.Parent.UrlBuilder).UrlBuilder
local GamesGamesUniverseIdsUniverseIds = UrlBuilder.fromString("games:games?universeIds={universeIds}")
local NewUrlBuilder = UrlBuilder.new({
	path = "games/{universeId}/media",
	base = require(GraphQLServer.Parent.UrlBuilder).UrlBase.new("games", 2)
})

return {
	findExperienceDetailsByUniverseId = function(UniverseIds, p1) --[[ Line: 27 ]]
		-- upvalues: Fetch (copy), PromiseModule (copy), GamesGamesUniverseIdsUniverseIds (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 30 ]]
			-- upvalues: GamesGamesUniverseIdsUniverseIds (upval), UniverseIds (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(GamesGamesUniverseIdsUniverseIds({ universeIds = UniverseIds }), { method = "GET" }):catch(function() --[[ Line: 33 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to find experience for universeId: %s.", UniverseIds)))
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 44 ]]
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.data[1])
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for experience with universeId: %s.", UniverseIds)))
			end
		end)
	end,
	findExperienceMediaByUniverseId = function(UniverseId, p1) --[[ Line: 67 ]]
		-- upvalues: Fetch (copy), PromiseModule (copy), NewUrlBuilder (copy), Response (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ()) --[[ Line: 70 ]]
			-- upvalues: NewUrlBuilder (upval), UniverseId (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
			local v1 = Fetch1(NewUrlBuilder({ universeId = UniverseId }), { method = "GET" }):catch(function() --[[ Line: 73 ]]
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Failed to find experience media for universeId: %s.", UniverseId)))
				
				return
			end
			local v2 = v1:json():catch(function() --[[ Line: 84 ]]
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.data)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for experience media for universeId: %s.", UniverseId)))
			end
		end)
	end
}