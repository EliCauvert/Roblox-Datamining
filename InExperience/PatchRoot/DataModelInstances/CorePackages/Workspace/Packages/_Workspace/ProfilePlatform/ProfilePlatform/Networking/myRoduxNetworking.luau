local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local RODUXKEY = require(ProfilePlatform.Common.Constants).RODUX_KEY
local NewResult = require(Parent.Lumberyak).Logger.new(nil, RODUXKEY):new(RODUXKEY .. " Networking")
local ChallengeRequestWrapperFunction = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local MyRoduxNetworkingImplModule = require(ProfilePlatform.Networking.myRoduxNetworkingImpl)
local ConfigResult = HttpRequest.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 22 ]]
		-- upvalues: NewResult (copy), HttpRequest (copy)
		NewResult:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2) --[[ Line: 26 ]]
		-- upvalues: NewResult (copy)
		NewResult:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
	end,
	maxRetryCount = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3)
})
local MyRoduxNetworkingImplModule1 = if require(ProfilePlatform.Flags.FFlagProfilePlatformUseRoduxNetworkingRefactor) then MyRoduxNetworkingImplModule else ConfigResult

return (LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = game:DefineFastFlag("EnableProfilePlatformChallengeInterceptor", false) and ChallengeRequestWrapperFunction(MyRoduxNetworkingImplModule1) or MyRoduxNetworkingImplModule1
}))