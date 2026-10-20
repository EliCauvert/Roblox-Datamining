local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return {
	buildJoinCommunityUrl = function(CommunityId)
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({
			path = "v1/groups/{communityId}/users",
			base = Url.GROUPS_URL
		})({ communityId = CommunityId })
	end
}