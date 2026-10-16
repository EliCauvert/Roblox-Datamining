local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local RoduxModule = require(UserRelationshipModals.Parent.Rodux)
local MyRoduxNetworkingModule = require(UserRelationshipModals.Networking.myRoduxNetworking)

return function() --[[ Line: 7 ]]
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({ NetworkStatus = MyRoduxNetworkingModule.installReducer() })
end