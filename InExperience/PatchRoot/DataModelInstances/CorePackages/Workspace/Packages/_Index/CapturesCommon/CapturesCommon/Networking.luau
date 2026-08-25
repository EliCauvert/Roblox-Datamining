local parent = script.Parent.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local contentSharingNetworkingModule = require(parent.ContentSharingNetworking)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var2 = httpRequest.config({
	requestFunction = function(p0, p1, p2)
		-- upvalues: httpRequest (ref)
		return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
	end,
	postRequestFunction = function(_, _) end,
	maxRetryCount = game:DefineFastInt("CapturesCommonMaxHttpRequestRetries", 2),
	maxWaitTime = game:DefineFastInt("CapturesCommonMaxHttpRequestWaitTime", 8)
})

return {
	CapturesCommonNetworkImpl = var2,
	CapturesCommonNetworking = contentSharingNetworkingModule.config({
		roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking.config({ keyPath = "NetworkStatus", networkImpl = var2 })
	})
}