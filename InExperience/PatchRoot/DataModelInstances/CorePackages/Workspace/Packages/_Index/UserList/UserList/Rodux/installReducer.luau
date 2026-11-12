local UserList = script:FindFirstAncestor("UserList")
local RoduxModule = require(UserList.Parent.Rodux)
local MyRoduxNetworkingModule = require(UserList.Networking.myRoduxNetworking)

return function()
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({ NetworkStatus = MyRoduxNetworkingModule.installReducer() })
end