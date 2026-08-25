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
local var4 = urlBuilder.fromString("games:games?universeIds={universeIds}")
local var5 = urlBuilder.new({
	path = "games/{universeId}/media",
	base = urlBase.new("games", 2)
})

function t.findExperienceDetailsByUniverseId(p0, p1)
	-- upvalues: fetch (ref), promiseModule (ref), var4 (ref), response (ref), graphQLError (ref)
	local var6 = p1 or fetch
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: var4 (copy), p0 (ref), var6 (ref), response (copy), graphQLError (copy)
		local var7 = var6(var4({ universeIds = p0 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var7.ok then
			p3(graphQLError.new(string.format("Failed to find experience for universeId: %s.", p0)))
			
			return
		end
		local var8 = var7:json():catch(function()
			return nil
		end):expect()
		
		if var8 then
			p2(var8.data[1])
			
			return
		end
		p3(graphQLError.new(string.format("Failed to decode HTTP response as JSON for experience with universeId: %s.", p0)))
	end)
end

function t.findExperienceMediaByUniverseId(p4, p5)
	-- upvalues: fetch (ref), promiseModule (ref), var5 (ref), response (ref), graphQLError (ref)
	local var9 = p5 or fetch
	
	return promiseModule.new(function(p6, p7)
		-- upvalues: var5 (copy), p4 (ref), var9 (ref), response (copy), graphQLError (copy)
		local var10 = var9(var5({ universeId = p4 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var10.ok then
			p7(graphQLError.new(string.format("Failed to find experience media for universeId: %s.", p4)))
			
			return
		end
		local var11 = var10:json():catch(function()
			return nil
		end):expect()
		
		if var11 then
			p6(var11.data)
			
			return
		end
		p7(graphQLError.new(string.format("Failed to decode HTTP response as JSON for experience media for universeId: %s.", p4)))
	end)
end

return t