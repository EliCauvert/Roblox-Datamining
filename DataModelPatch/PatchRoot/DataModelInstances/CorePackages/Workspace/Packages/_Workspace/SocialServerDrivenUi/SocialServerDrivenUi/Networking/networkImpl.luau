local HttpRequestModule = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.HttpRequest)

return HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = game:DefineFastInt("SocialServerDrivenUiHttpRetryCount", 3)
})