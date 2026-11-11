local UserRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local RoduxModule = require(UserRelationshipModals.Parent.Rodux)
local MyRoduxNetworkingModule = require(UserRelationshipModals.Networking.myRoduxNetworking)

return function()
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({ NetworkStatus = MyRoduxNetworkingModule.installReducer() })
end