local userRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local parent = userRelationshipModals.Parent
local httpRequestModule = require(parent.HttpRequest)

return require(parent.RoduxNetworking).config({
	keyPath = `{require(userRelationshipModals.Rodux.RODUX_KEY)}.NetworkStatus`,
	networkImpl = httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: httpRequestModule (ref)
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("AddFriendsHttpRetryCount", 3)
	})
})