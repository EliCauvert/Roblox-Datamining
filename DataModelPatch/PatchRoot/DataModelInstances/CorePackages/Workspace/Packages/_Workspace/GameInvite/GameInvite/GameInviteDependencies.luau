local HttpRequestModule = require(script.Parent.Parent.HttpRequest)

return {
	networkImpl = HttpRequestModule.config({
		requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
		maxRetryCount = game:DefineFastInt("GameInviteHttpRetryCount", 0)
	})
}