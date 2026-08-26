local socialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local parent = socialBlockingModal.Parent
local httpRequestModule = require(parent.HttpRequest)

return require(parent.RoduxNetworking).config({
	keyPath = `{require(socialBlockingModal.Rodux.RODUX_KEY)}.NetworkStatus`,
	networkImpl = require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: httpRequestModule (ref)
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("AddFriendsHttpRetryCount", 3)
	}))
})