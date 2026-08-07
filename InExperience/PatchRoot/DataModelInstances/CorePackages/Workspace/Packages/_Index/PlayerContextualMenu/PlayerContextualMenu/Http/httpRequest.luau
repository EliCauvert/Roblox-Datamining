local httpRequestModule = require(script:FindFirstAncestor("PlayerContextualMenu").Parent.HttpRequest)

return httpRequestModule.config({
	maxRetryCount = 0,
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi
})