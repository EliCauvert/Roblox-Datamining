local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(Parent.LuauPolyfill)
local _ = require(script.Parent.Parent.generatedTypes)
local PromiseModule = require(Parent.Promise)
local GraphQLError = require(Parent.GraphQL).GraphQLError
local Fetch = require(Parent.Fetch).fetch
local Response = require(Parent.Fetch).Response
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "users/{id}",
	base = require(Parent.UrlBuilder).UrlBase.new("users", 1)
})

local function findUserById(Id, p1)
	-- upvalues: Fetch (copy), PromiseModule (copy), NewResult (copy), Response (copy), GraphQLError (copy)
	local Fetch1 = if p1 then p1 else Fetch
	
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
		-- upvalues: NewResult (upval), Id (copy), Fetch1 (copy), Response (upval), GraphQLError (upval)
		local v1 = Fetch1(NewResult({ id = Id }), { method = "GET" }):catch(function()
			-- upvalues: Response (upval)
			return Response.error()
		end):expect()
		
		if not v1.ok then
			Callback(GraphQLError.new(string.format("Failed to find user matching id: %s.", Id)))
			
			return
		end
		local v2 = v1:json():catch(function()
			return nil
		end):expect()
		
		if v2 then
			Callback1({ id = tostring(v2.id), displayName = v2.displayName })
			
			return
		else
			Callback(GraphQLError.new(string.format("Failed to decode HTTP response as JSON for user matching id: %s.", Id)))
		end
	end)
end

return {
	findUserById = findUserById,
	findMe = function(p1, p2)
		-- upvalues: Players (copy), PromiseModule (copy), GraphQLError (copy), findUserById (copy)
		local LocalPlayer = if p2 then p2 else Players.LocalPlayer
		
		return if LocalPlayer then findUserById(tostring(LocalPlayer.UserId), p1) else PromiseModule.reject(GraphQLError.new("LocalPlayer not found"))
	end
}