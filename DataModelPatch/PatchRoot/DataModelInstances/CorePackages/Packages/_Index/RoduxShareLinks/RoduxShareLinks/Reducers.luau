local RoduxModule = require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux)
local InvitesModule = require(script.Invites)

return function(p1)
	-- upvalues: RoduxModule (copy), InvitesModule (copy)
	return RoduxModule.combineReducers({ Invites = InvitesModule(p1) })
end