local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local Parent = ProfileShareLinks.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local RoduxNetworking = LuaSocialLibrariesDepsModule.RoduxNetworking
local RODUXKEY = require(ProfileShareLinks.Common.Constants).RODUX_KEY
local ProfileShareLinksNetworking = require(Parent.Lumberyak).Logger.new(nil, "ProfileShareLinks"):new("ProfileShareLinks Networking")

return (RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: ProfileShareLinksNetworking (copy), HttpRequest (copy)
			ProfileShareLinksNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: ProfileShareLinksNetworking (copy)
			ProfileShareLinksNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ProfileShareLinksHttpRetryCount", 3)
	})
}))