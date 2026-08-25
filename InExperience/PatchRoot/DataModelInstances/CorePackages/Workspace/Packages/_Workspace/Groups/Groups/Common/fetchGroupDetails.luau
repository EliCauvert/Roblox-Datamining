local httpService = game:GetService("HttpService")
local urlBuilder = require(script:FindFirstAncestor("Groups").Parent.UrlBuilder).UrlBuilder

return function(p0, p1)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p0(urlBuilder.fromString("apis:profile-platform-api/v1/profiles/get")(), "POST", {
		postBody = httpService:JSONEncode({
			profileType = "Community",
			profileId = p1,
			components = {
				{ component = "CommunityProfileHeader" },
				{ component = "Actions" },
				{ component = "CommunityLocked" }
			}
		})
	}):andThen(function(p2)
		return p2.responseBody
	end)
end