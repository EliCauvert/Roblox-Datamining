local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local ContentSharingNetworkingModule = require(Parent.ContentSharingNetworking)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local RoduxNetworking = LuaSocialLibrariesDepsModule.RoduxNetworking
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
	CapturesCommonNetworking = ContentSharingNetworkingModule.config({
		roduxNetworking = RoduxNetworking.config({ keyPath = "NetworkStatus", networkImpl = ConfigResult })
	})
}