local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local GraphQLError = require(Parent.GraphQL).GraphQLError
local Fetch = require(Parent.Fetch).fetch
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "users/avatar-headshot",
	base = require(Parent.UrlBuilder).UrlBase.new("thumbnails", 1),
	query = {
		userIds = "{userIds}",
		size = "48x48",
		format = "Png",
		isCircular = "true"
	}
})

return {
	findAvatarHeadshotById = function(UserIds, p1)
		-- upvalues: Fetch (copy), PromiseModule (copy), NewResult (copy), GraphQLError (copy)
		local Fetch1 = if p1 then p1 else Fetch
		
		return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
			-- upvalues: NewResult (upval), UserIds (copy), Fetch1 (copy), GraphQLError (upval)
			local v1 = Fetch1(NewResult({ userIds = UserIds }), { method = "GET" }):expect()
			
			if not v1.ok then
				Callback(GraphQLError.new(string.format("Http error occurred while trying to fetch avatarHeadshot for user %s.", UserIds)))
				
				return
			end
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			
			if v2 then
				Callback1(v2.data[1].imageUrl)
				
				return
			else
				Callback(GraphQLError.new(string.format("Failed to parse avatarHeadshot HttpResponse for user %s.", UserIds)))
			end
		end)
	end
}