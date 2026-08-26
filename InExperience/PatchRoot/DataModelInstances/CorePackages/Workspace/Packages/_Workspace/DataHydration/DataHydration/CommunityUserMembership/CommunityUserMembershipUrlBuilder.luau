local parent = script:FindFirstAncestor("DataHydration").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return {
	buildJoinCommunityUrl = function(p1)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/groups/{communityId}/users",
			base = url.GROUPS_URL
		})({ communityId = p1 })
	end
}