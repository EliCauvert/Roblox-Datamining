local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local graphQLError = require(parent.GraphQL).GraphQLError
local fetch = require(parent.Fetch).fetch
local t = {}
local var2 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "users/avatar-headshot",
	base = require(parent.UrlBuilder).UrlBase.new("thumbnails", 1),
	query = {
		userIds = "{userIds}",
		size = "48x48",
		format = "Png",
		isCircular = "true"
	}
})

function t.findAvatarHeadshotById(p0, p1) --[[ line: 25 ]]
	-- upvalues: fetch (ref), promiseModule (ref), var2 (ref), graphQLError (ref)
	local var3 = p1 or fetch
	
	return promiseModule.new(function(p2, p3) --[[ line: 28 ]]
		-- upvalues: var2 (copy), p0 (ref), var3 (ref), graphQLError (copy)
		local var4 = var3(var2({ userIds = p0 }), { method = "GET" }):expect()
		
		if not var4.ok then
			p3(graphQLError.new(string.format("Http error occurred while trying to fetch avatarHeadshot for user %s.", p0)))
			
			return
		end
		local var5 = var4:json():catch(function() --[[ line: 48 ]]
			return nil
		end):expect()
		
		if var5 then
			p2(var5.data[1].imageUrl)
			
			return
		end
		p3(graphQLError.new(string.format("Failed to parse avatarHeadshot HttpResponse for user %s.", p0)))
	end)
end

return t