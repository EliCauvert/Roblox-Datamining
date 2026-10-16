local HttpRequestModule = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.HttpRequest)

return HttpRequestModule.config({
	maxRetryCount = 0,
	requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi
})