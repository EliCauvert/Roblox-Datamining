local parent = script.Parent.Parent.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local lumberyakModule = require(parent.Lumberyak)
local shareLinksNetworkingModule = require(parent.ShareLinksNetworking)
local shareLinksRoduxModule = require(parent.ShareLinksRodux)
local roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var4 = lumberyakModule.Logger.new(nil, "ShareGame"):new("ShareGame Networking")
local var5 = roduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2) --[[ line: 17 ]]
			-- upvalues: var4 (ref), httpRequest (ref)
			var4:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 21 ]]
			-- upvalues: var4 (ref)
			var4:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("ShareGameHttpRetryCount", 3)
	})
})

return {
	ShareLinksRodux = shareLinksRoduxModule.config({ keyPath = "ShareGame.ShareLinks" }),
	RoduxNetworking = var5,
	ShareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = var5 })
}