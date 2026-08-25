local userRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local parent = userRelationshipModals.Parent
local httpRequestModule = require(parent.HttpRequest)

return require(parent.RoduxNetworking).config({
	keyPath = `{require(userRelationshipModals.Rodux.RODUX_KEY)}.NetworkStatus`,
	networkImpl = httpRequestModule.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: httpRequestModule (ref)
			return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("AddFriendsHttpRetryCount", 3)
	})
})