local httpClientModule = require(script:FindFirstAncestor("GenericChallenges").Parent.HttpClient)
local challengeNetworkWrapperModule = require(script.Parent.ChallengeNetworkWrapper)
local _ = require(script.Parent.InterceptChallenge)

return function(p1, p2)
	-- upvalues: httpClientModule (ref), challengeNetworkWrapperModule (ref)
	return challengeNetworkWrapperModule(p2 or httpClientModule.withRetry(httpClientModule.createRequestInternalNetwork()), p1)
end