local parent = script.Parent
local roduxModule = require(parent.Parent.Rodux)
local invitesModule = require(parent.Reducers.Invites)

return function(p0) --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), invitesModule (ref)
	return roduxModule.combineReducers({ Invites = invitesModule(p0) })
end