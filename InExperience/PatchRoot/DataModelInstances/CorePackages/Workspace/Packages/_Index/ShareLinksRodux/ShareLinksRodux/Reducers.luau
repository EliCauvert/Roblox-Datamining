local parent = script.Parent
local roduxModule = require(parent.Parent.Rodux)
local invitesModule = require(parent.Reducers.Invites)

return function(p1)
	-- upvalues: roduxModule (ref), invitesModule (ref)
	return roduxModule.combineReducers({ Invites = invitesModule(p1) })
end