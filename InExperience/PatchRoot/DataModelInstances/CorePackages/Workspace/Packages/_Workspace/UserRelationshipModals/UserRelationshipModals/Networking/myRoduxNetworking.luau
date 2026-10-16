local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local Parent = UserRelationshipModals.Parent
local HttpRequestModule = require(Parent.HttpRequest)

return (require(Parent.RoduxNetworking).config({
	keyPath = `{require(UserRelationshipModals.Rodux.RODUX_KEY)}.NetworkStatus`,
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 12 ]]
			-- upvalues: HttpRequestModule (copy)
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("AddFriendsHttpRetryCount", 3)
	})
}))