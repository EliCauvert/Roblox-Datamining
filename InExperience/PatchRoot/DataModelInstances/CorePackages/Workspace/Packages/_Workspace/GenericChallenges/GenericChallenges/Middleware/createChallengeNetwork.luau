local httpClientModule = require(script:FindFirstAncestor("GenericChallenges").Parent.HttpClient)
local challengeNetworkWrapperModule = require(script.Parent.ChallengeNetworkWrapper)
local _ = require(script.Parent.InterceptChallenge)

return function(p0, p1)
	-- upvalues: httpClientModule (ref), challengeNetworkWrapperModule (ref)
	return challengeNetworkWrapperModule(p1 or httpClientModule.withRetry(httpClientModule.createRequestInternalNetwork()), p0)
end