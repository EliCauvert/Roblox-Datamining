local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "community-links/v1/guilded/{communityId}/join",
	base = require(Parent.Http).Url.APIS_URL,
	query = { a = "red", skipRedirect = "true" }
})

return function(Callback, CommunityId)
	-- upvalues: NewResult (copy)
	return Callback(NewResult({ communityId = CommunityId }), "GET")
end