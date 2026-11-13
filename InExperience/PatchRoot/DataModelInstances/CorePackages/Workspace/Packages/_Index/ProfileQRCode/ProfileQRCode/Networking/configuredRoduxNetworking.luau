local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local Parent = ProfileQRCode.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local RODUXKEY = require(ProfileQRCode.Common.Constants).RODUX_KEY
local ProfileQRCodeNetworking = require(Parent.Lumberyak).Logger.new(nil, "ProfileQRCode"):new("ProfileQRCode Networking")

return (LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: ProfileQRCodeNetworking (copy), HttpRequest (copy)
			ProfileQRCodeNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: ProfileQRCodeNetworking (copy)
			ProfileQRCodeNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ProfileQRCodeHttpRetryCount", 3)
	})
}))