local UserList = script:FindFirstAncestor("UserList")
local RoduxModule = require(UserList.Parent.Rodux)
local MyRoduxNetworkingModule = require(UserList.Networking.myRoduxNetworking)
local PresenceModule = require(UserList.Rodux.Presence)
local FFlagUserListPresenceStoreMigrationModule = require(UserList.Flags.FFlagUserListPresenceStoreMigration)

return function() --[[ Line: 9 ]]
	-- upvalues: RoduxModule (copy), FFlagUserListPresenceStoreMigrationModule (copy), PresenceModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({
		Presence = if FFlagUserListPresenceStoreMigrationModule then nil else PresenceModule,
		NetworkStatus = MyRoduxNetworkingModule.installReducer()
	})
end