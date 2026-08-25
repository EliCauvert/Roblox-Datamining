local userList = script:FindFirstAncestor("UserList")
local roduxModule = require(userList.Parent.Rodux)
local myRoduxNetworkingModule = require(userList.Networking.myRoduxNetworking)
local presenceModule = require(userList.Rodux.Presence)
local fFlagUserListPresenceStoreMigrationModule = require(userList.Flags.FFlagUserListPresenceStoreMigration)

return function()
	-- upvalues: roduxModule (ref), fFlagUserListPresenceStoreMigrationModule (ref), presenceModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		Presence = if not fFlagUserListPresenceStoreMigrationModule then presenceModule else nil,
		NetworkStatus = myRoduxNetworkingModule.installReducer()
	})
end