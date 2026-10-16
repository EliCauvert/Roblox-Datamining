local Parent = script:FindFirstAncestor("EditProfileBackground").Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local EditProfileBackgroundNetworking = require(Parent.Lumberyak).Logger.new(nil, "EditProfileBackground"):new("EditProfileBackground Networking")

return (LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "EditProfileBackground.networkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 13 ]]
			-- upvalues: EditProfileBackgroundNetworking (copy), HttpRequest (copy)
			EditProfileBackgroundNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2) --[[ Line: 17 ]]
			-- upvalues: EditProfileBackgroundNetworking (copy)
			EditProfileBackgroundNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("EditProfileBackgroundHttpRetryCount", 3)
	})
}))