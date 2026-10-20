local Parent = script:FindFirstAncestor("SduiLandingPage").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local NewUrlBuilder = UrlBuilder.new({
	path = "landing-page-api/spotlight-collection",
	base = require(Parent.Http).Url.APIS_URL
})

return function(SpotlightCollectionId, SessionId)
	-- upvalues: UrlBuilder (copy), NewUrlBuilder (copy)
	return UrlBuilder.addQueryString(NewUrlBuilder(), {
		spotlightCollectionId = SpotlightCollectionId,
		sessionId = SessionId
	})
end