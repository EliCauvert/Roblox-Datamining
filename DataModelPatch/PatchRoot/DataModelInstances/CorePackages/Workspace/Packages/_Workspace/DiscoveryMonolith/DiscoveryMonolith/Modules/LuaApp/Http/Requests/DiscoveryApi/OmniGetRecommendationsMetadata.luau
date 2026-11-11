local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local CryoModule = require(Parent.Cryo)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "discovery-api/omni-recommendation-metadata",
	base = require(Parent.Http).Url.APIS_URL
})

return function(Callback, p1)
	-- upvalues: CryoModule (copy), NewResult (copy), HttpService (copy)
	return Callback(NewResult(), "POST", {
		postBody = HttpService:JSONEncode({
			sessionId = "sessionId",
			contents = CryoModule.List.map(p1, function(p2)
				return { contentType = p2.contentType, contentId = p2.contentId }
			end)
		})
	})
end