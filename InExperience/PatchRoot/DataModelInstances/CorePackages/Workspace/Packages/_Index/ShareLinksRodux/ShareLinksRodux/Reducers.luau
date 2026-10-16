local Parent = script.Parent
local RoduxModule = require(Parent.Parent.Rodux)
local InvitesModule = require(Parent.Reducers.Invites)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: RoduxModule (copy), InvitesModule (copy)
	return RoduxModule.combineReducers({ Invites = InvitesModule(p1) })
end