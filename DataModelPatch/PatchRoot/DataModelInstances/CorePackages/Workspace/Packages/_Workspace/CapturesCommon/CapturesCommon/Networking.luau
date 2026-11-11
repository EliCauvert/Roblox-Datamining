local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local ConfigResult = HttpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequest (copy)
		return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	postRequestFunction = function(_, _) end,
	maxRetryCount = game:DefineFastInt("CapturesCommonMaxHttpRequestRetries", 2),
	maxWaitTime = game:DefineFastInt("CapturesCommonMaxHttpRequestWaitTime", 8)
})

return {
	CapturesCommonNetworkImpl = ConfigResult,
	CapturesCommonNetworking = require(Parent.ContentSharingNetworking).config({
		roduxNetworking = LuaSocialLibrariesDepsModule.RoduxNetworking.config({ keyPath = "NetworkStatus", networkImpl = ConfigResult })
	})
}