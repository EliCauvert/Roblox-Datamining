local parent = script.Parent.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local contentSharingNetworkingModule = require(parent.ContentSharingNetworking)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = httpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: httpRequest (ref)
		return httpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	postRequestFunction = function(_, _) end,
	maxRetryCount = game:DefineFastInt("CapturesCommonMaxHttpRequestRetries", 2),
	maxWaitTime = game:DefineFastInt("CapturesCommonMaxHttpRequestWaitTime", 8)
})

return {
	CapturesCommonNetworkImpl = var1,
	CapturesCommonNetworking = contentSharingNetworkingModule.config({
		roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking.config({ keyPath = "NetworkStatus", networkImpl = var1 })
	})
}