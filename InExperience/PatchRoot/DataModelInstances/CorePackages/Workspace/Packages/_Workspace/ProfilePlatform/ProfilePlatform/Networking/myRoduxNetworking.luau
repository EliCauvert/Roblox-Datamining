local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local RODUX_KEY = require(profilePlatform.Common.Constants).RODUX_KEY
local var1 = require(parent.Lumberyak).Logger.new(nil, RODUX_KEY):new(RODUX_KEY .. " Networking")
local var2 = if require(profilePlatform.Flags.FFlagProfilePlatformUseRoduxNetworkingRefactor) then require(profilePlatform.Networking.myRoduxNetworkingImpl) else httpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: var1 (ref), httpRequest (ref)
		var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return httpRequest.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2)
		-- upvalues: var1 (ref)
		var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
	end,
	maxRetryCount = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3)
})

return luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = game:DefineFastFlag("EnableProfilePlatformChallengeInterceptor", false) and require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(var2) or var2
})