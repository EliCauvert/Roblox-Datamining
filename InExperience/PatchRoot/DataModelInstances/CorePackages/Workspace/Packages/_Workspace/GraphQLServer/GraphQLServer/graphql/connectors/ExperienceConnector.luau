local graphQLServer = script:FindFirstAncestor("GraphQLServer")
local _ = require(graphQLServer.Parent.LuauPolyfill)
local _ = require(graphQLServer.graphql.generatedTypes)
local promiseModule = require(graphQLServer.Parent.Promise)
local graphQLError = require(graphQLServer.Parent.GraphQL).GraphQLError
local fetchModule = require(graphQLServer.Parent.Fetch)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local urlBuilder = require(graphQLServer.Parent.UrlBuilder).UrlBuilder
local urlBase = require(graphQLServer.Parent.UrlBuilder).UrlBase
local t = {}
local var1 = urlBuilder.fromString("games:games?universeIds={universeIds}")
local var2 = urlBuilder.new({
	path = "games/{universeId}/media",
	base = urlBase.new("games", 2)
})

function t.findExperienceDetailsByUniverseId(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), response (ref), graphQLError (ref)
	local var3 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var1 (copy), p1 (ref), var3 (ref), response (copy), graphQLError (copy)
		local var4 = var3(var1({ universeIds = p1 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var4.ok then
			p4(graphQLError.new(string.format("Failed to find experience for universeId: %s.", p1)))
			
			return
		end
		local var5 = var4:json():catch(function()
			return nil
		end):expect()
		
		if var5 then
			p3(var5.data[1])
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for experience with universeId: %s.", p1)))
	end)
end

function t.findExperienceMediaByUniverseId(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), response (ref), graphQLError (ref)
	local var3 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var2 (copy), p1 (ref), var3 (ref), response (copy), graphQLError (copy)
		local var4 = var3(var2({ universeId = p1 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var4.ok then
			p4(graphQLError.new(string.format("Failed to find experience media for universeId: %s.", p1)))
			
			return
		end
		local var5 = var4:json():catch(function()
			return nil
		end):expect()
		
		if var5 then
			p3(var5.data)
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for experience media for universeId: %s.", p1)))
	end)
end

return t