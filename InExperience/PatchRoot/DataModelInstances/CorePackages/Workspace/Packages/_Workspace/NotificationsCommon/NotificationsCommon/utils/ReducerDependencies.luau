local parent = script.Parent.Parent.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local lumberyakModule = require(parent.Lumberyak)
local shareLinksNetworkingModule = require(parent.ShareLinksNetworking)
local shareLinksRoduxModule = require(parent.ShareLinksRodux)
local roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = lumberyakModule.Logger.new(nil, "ShareGame"):new("ShareGame Networking")
local var2 = roduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ShareGameHttpRetryCount", 3)
	})
})

return {
	ShareLinksRodux = shareLinksRoduxModule.config({ keyPath = "ShareGame.ShareLinks" }),
	RoduxNetworking = var2,
	ShareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = var2 })
}