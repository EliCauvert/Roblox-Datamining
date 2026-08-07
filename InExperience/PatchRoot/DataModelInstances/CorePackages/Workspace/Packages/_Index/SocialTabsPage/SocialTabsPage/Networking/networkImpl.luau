local httpRequestModule = require(script:FindFirstAncestor("SocialTabsPage").Parent.HttpRequest)

return httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = game:DefineFastInt("SocialTabsPageHttpRetryCount", 3)
})