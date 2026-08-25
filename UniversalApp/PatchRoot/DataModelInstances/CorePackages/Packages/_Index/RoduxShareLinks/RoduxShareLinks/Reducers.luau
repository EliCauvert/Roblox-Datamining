local roduxModule = require(script:FindFirstAncestor("RoduxShareLinks").Parent.Rodux)
local invitesModule = require(script.Invites)

return function(p0)
	-- upvalues: roduxModule (ref), invitesModule (ref)
	return roduxModule.combineReducers({ Invites = invitesModule(p0) })
end