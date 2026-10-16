local Parent = script.Parent.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local ShareGameNetworking = require(Parent.Lumberyak).Logger.new(nil, "ShareGame"):new("ShareGame Networking")
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 17 ]]
			-- upvalues: ShareGameNetworking (copy), HttpRequest (copy)
			ShareGameNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2) --[[ Line: 21 ]]
			-- upvalues: ShareGameNetworking (copy)
			ShareGameNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ShareGameHttpRetryCount", 3)
	})
})

return {
	ShareLinksRodux = require(Parent.ShareLinksRodux).config({ keyPath = "ShareGame.ShareLinks" }),
	RoduxNetworking = ConfigResult,
	ShareLinksNetworking = require(Parent.ShareLinksNetworking).config({ roduxNetworking = ConfigResult })
}