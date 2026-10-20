local HttpService = game:GetService("HttpService")
local UrlBuilder = require(script:FindFirstAncestor("Groups").Parent.UrlBuilder).UrlBuilder

return function(Callback, ProfileId)
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("apis:profile-platform-api/v1/profiles/get")(), "POST", {
		postBody = HttpService:JSONEncode({
			profileType = "Community",
			profileId = ProfileId,
			components = { { component = "Actions" } }
		})
	}):andThen(function(Result)
		return Result.responseBody
	end)
end