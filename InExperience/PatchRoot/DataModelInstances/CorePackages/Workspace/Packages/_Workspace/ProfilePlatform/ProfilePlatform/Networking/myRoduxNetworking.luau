local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local RODUX_KEY = require(profilePlatform.Common.Constants).RODUX_KEY
local var2 = require(parent.Lumberyak).Logger.new(nil, RODUX_KEY):new(RODUX_KEY .. " Networking")
local var3 = if require(profilePlatform.Flags.FFlagProfilePlatformUseRoduxNetworkingRefactor) then require(profilePlatform.Networking.myRoduxNetworkingImpl) else httpRequest.config({
	requestFunction = function(p0, p1, p2) --[[ line: 22 ]]
		-- upvalues: var2 (ref), httpRequest (ref)
		var2:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
		
		return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
	end,
	postRequestFunction = function(p3, p4) --[[ line: 26 ]]
		-- upvalues: var2 (ref)
		var2:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
	end,
	maxRetryCount = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3)
})

return luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = game:DefineFastFlag("EnableProfilePlatformChallengeInterceptor", false) and require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(var3) or var3
})