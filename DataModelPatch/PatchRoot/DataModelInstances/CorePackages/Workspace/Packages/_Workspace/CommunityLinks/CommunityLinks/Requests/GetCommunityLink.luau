local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "community-links/v1/universes/{universeId}/community",
	base = require(Parent.Http).Url.APIS_URL
})

return function(Callback, UniverseId)
	-- upvalues: NewResult (copy)
	return Callback(NewResult({ universeId = UniverseId }), "GET")
end