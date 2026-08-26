local roduxModule = require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux)
local invitesModule = require(script.Invites)

return function(p1)
	-- upvalues: roduxModule (ref), invitesModule (ref)
	return roduxModule.combineReducers({ Invites = invitesModule(p1) })
end