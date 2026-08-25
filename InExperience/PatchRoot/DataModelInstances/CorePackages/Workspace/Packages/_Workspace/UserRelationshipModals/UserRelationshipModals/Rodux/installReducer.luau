local userRelationshipModals = script:FindFirstAncestor("UserRelationshipModals")
local roduxModule = require(userRelationshipModals.Parent.Rodux)
local myRoduxNetworkingModule = require(userRelationshipModals.Networking.myRoduxNetworking)

return function()
	-- upvalues: roduxModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({ NetworkStatus = myRoduxNetworkingModule.installReducer() })
end