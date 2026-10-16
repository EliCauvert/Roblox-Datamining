local SocialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local Parent = SocialBlockingModal.Parent
local HttpRequestModule = require(Parent.HttpRequest)

return (require(Parent.RoduxNetworking).config({
	keyPath = `{require(SocialBlockingModal.Rodux.RODUX_KEY)}.NetworkStatus`,
	networkImpl = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper((HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 13 ]]
			-- upvalues: HttpRequestModule (copy)
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("AddFriendsHttpRetryCount", 3)
	})))
}))