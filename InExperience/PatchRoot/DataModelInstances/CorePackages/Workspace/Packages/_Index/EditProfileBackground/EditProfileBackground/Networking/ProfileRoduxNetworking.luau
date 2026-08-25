local parent = script:FindFirstAncestor("EditProfileBackground").Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = require(parent.Lumberyak).Logger.new(nil, "EditProfileBackground"):new("EditProfileBackground Networking")

return roduxNetworking.config({
	keyPath = "EditProfileBackground.networkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4)
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("EditProfileBackgroundHttpRetryCount", 3)
	})
})