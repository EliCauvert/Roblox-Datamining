local HttpClientModule = require(script:FindFirstAncestor("GenericChallenges").Parent.HttpClient)
local ChallengeNetworkWrapperModule = require(script.Parent.ChallengeNetworkWrapper)
local _ = require(script.Parent.InterceptChallenge)

return function(p1, p2) --[[ Line: 12 ]]
	-- upvalues: HttpClientModule (copy), ChallengeNetworkWrapperModule (copy)
	return ChallengeNetworkWrapperModule(p2 or HttpClientModule.withRetry(HttpClientModule.createRequestInternalNetwork()), p1)
end