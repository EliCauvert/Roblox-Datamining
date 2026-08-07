local httpRequestModule = require(script:FindFirstAncestor("SocialServerDrivenUi").Parent.HttpRequest)

return httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.RequestInternal,
	maxRetryCount = game:DefineFastInt("SocialServerDrivenUiHttpRetryCount", 3)
})