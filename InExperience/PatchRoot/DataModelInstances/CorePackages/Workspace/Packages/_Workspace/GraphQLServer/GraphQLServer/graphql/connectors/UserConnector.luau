local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.LuauPolyfill)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.Parent.generatedTypes)
local promiseModule = require(parent.Promise)
local graphQLError = require(parent.GraphQL).GraphQLError
local fetch = require(parent.Fetch).fetch
local response = require(parent.Fetch).Response
local t = {}
local var3 = urlBuilder.new({ path = "users/{id}", base = urlBase.new("users", 1) })

local function findUserById(p0, p1)
	-- upvalues: fetch (ref), promiseModule (ref), var3 (ref), response (ref), graphQLError (ref)
	local var5 = p1 or fetch
	
	return promiseModule.new(function(p2, p3)
		-- upvalues: var3 (copy), p0 (ref), var5 (ref), response (copy), graphQLError (copy)
		local var6 = var5(var3({ id = p0 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var6.ok then
			p3(graphQLError.new(string.format("Failed to find user matching id: %s.", p0)))
			
			return
		end
		local var7 = var6:json():catch(function()
			return nil
		end):expect()
		
		if var7 then
			p2({ id = tostring(var7.id), displayName = var7.displayName })
			
			return
		end
		p3(graphQLError.new(string.format("Failed to decode HTTP response as JSON for user matching id: %s.", p0)))
	end)
end

t.findUserById = findUserById

function t.findMe(p4, p5)
	-- upvalues: playersService (ref), promiseModule (ref), graphQLError (ref), findUserById (ref)
	local var8 = p5 or playersService.LocalPlayer
	
	return if var8 then findUserById(tostring(var8.UserId), p4) else promiseModule.reject(graphQLError.new("LocalPlayer not found"))
end

return t