local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("Groups").Parent.UrlBuilder).UrlBuilder

return function(p1, p2)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p1(urlBuilder.fromString("apis:profile-platform-api/v1/profiles/get")(), "POST", {
		postBody = httpService:JSONEncode({
			profileType = "Community",
			profileId = p2,
			components = { { component = "Actions" } }
		})
	}):andThen(function(p3)
		return p3.responseBody
	end)
end