local HttpRequestModule = require(script:FindFirstAncestor("SocialTabsPage").Parent.HttpRequest)

return HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = game:DefineFastInt("SocialTabsPageHttpRetryCount", 3)
})