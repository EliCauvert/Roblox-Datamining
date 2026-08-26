local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local parent = profileShareLinks.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = require(parent.Lumberyak).Logger.new(nil, "ProfileShareLinks"):new("ProfileShareLinks Networking")

return luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = require(profileShareLinks.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ProfileShareLinksHttpRetryCount", 3)
	})
})