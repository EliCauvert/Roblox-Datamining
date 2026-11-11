local HttpService = game:GetService("HttpService")
local UsernameRecommendationDisplayNameMaxRetryCount = game:DefineFastInt("UsernameRecommendationDisplayNameMaxRetryCount", 0)
local RecommendedUsernameFromDisplayName = require(game:GetService("CorePackages").Packages.UrlBuilder).UrlBuilder.fromString("auth:v1/validators/recommendedUsernameFromDisplayName")

return function(Callback, DisplayName, Birthday)
	-- upvalues: HttpService (copy), RecommendedUsernameFromDisplayName (copy), UsernameRecommendationDisplayNameMaxRetryCount (copy)
	return Callback(RecommendedUsernameFromDisplayName(), "POST", {
		maxRetryCount = UsernameRecommendationDisplayNameMaxRetryCount,
		postBody = HttpService:JSONEncode({ displayName = DisplayName, birthday = Birthday })
	})
end