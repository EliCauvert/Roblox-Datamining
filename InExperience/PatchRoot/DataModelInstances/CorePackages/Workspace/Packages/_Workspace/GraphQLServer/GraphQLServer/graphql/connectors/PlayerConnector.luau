local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local graphQLError = require(parent.GraphQL).GraphQLError
local fetch = require(parent.Fetch).fetch
local t = {}
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "users/avatar-headshot",
	base = require(parent.UrlBuilder).UrlBase.new("thumbnails", 1),
	query = {
		userIds = "{userIds}",
		size = "48x48",
		format = "Png",
		isCircular = "true"
	}
})

function t.findAvatarHeadshotById(p1, p2)
	-- upvalues: fetch (ref), promiseModule (ref), var1 (ref), graphQLError (ref)
	local var2 = p2 or fetch
	
	return promiseModule.new(function(p3, p4)
		-- upvalues: var1 (copy), p1 (ref), var2 (ref), graphQLError (copy)
		local var3 = var2(var1({ userIds = p1 }), { method = "GET" }):expect()
		
		if not var3.ok then
			p4(graphQLError.new(string.format("Http error occurred while trying to fetch avatarHeadshot for user %s.", p1)))
			
			return
		end
		local var4 = var3:json():catch(function()
			return nil
		end):expect()
		
		if var4 then
			p3(var4.data[1].imageUrl)
			
			return
		end
		p4(graphQLError.new(string.format("Failed to parse avatarHeadshot HttpResponse for user %s.", p1)))
	end)
end

return t