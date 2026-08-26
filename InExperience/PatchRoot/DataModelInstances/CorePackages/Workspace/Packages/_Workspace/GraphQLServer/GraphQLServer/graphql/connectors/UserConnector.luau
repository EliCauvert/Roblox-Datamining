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
local var1 = urlBuilder.new({ path = "users/{id}", base = urlBase.new("users", 1) })

local function findUserById(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), response (ref), graphQLError (ref)
	local var2 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var1 (copy), p1 (ref), var2 (ref), response (copy), graphQLError (copy)
		local var3 = var2(var1({ id = p1 }), { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if not var3.ok then
			p4(graphQLError.new(string.format("Failed to find user matching id: %s.", p1)))
			
			return
		end
		local var4 = var3:json():catch(function()
			return nil
		end):expect()
		
		if var4 then
			p3({ id = tostring(var4.id), displayName = var4.displayName })
			
			return
		end
		p4(graphQLError.new(string.format("Failed to decode HTTP response as JSON for user matching id: %s.", p1)))
	end)
end

t.findUserById = findUserById

function t.findMe(p1, p2)
	-- upvalues: playersService (ref), promiseModule (ref), graphQLError (ref), findUserById (ref)
	local var2 = p2 or playersService.LocalPlayer
	
	return if var2 then findUserById(tostring(var2.UserId), p1) else promiseModule.reject(graphQLError.new("LocalPlayer not found"))
end

return t