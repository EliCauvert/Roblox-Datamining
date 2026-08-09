local userList = script:FindFirstAncestor("UserList")
local roduxModule = require(userList.Parent.Rodux)
local myRoduxNetworkingModule = require(userList.Networking.myRoduxNetworking)
local presenceModule = require(userList.Rodux.Presence)

return function() --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), presenceModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		Presence = presenceModule,
		NetworkStatus = myRoduxNetworkingModule.installReducer()
	})
end