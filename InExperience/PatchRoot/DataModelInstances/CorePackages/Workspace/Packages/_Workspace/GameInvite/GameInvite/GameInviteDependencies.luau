local httpRequestModule = require(script.Parent.Parent.HttpRequest)

return {
	networkImpl = httpRequestModule.config({
		requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
		maxRetryCount = game:DefineFastInt("GameInviteHttpRetryCount", 0)
	})
}