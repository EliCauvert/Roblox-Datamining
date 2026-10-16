local UserSearch = script:FindFirstAncestor("UserSearch")
local RoduxModule = require(UserSearch.Parent.Rodux)
local PresenceModule = require(UserSearch.Rodux.Presence)
local FriendsModule = require(UserSearch.Rodux.Friends)
local MyRoduxNetworkingModule = require(UserSearch.Networking.myRoduxNetworking)
local FFlagUserSearchPresenceStoreMigrationModule = require(UserSearch.Flags.FFlagUserSearchPresenceStoreMigration)

return function() --[[ Line: 11 ]]
	-- upvalues: RoduxModule (copy), FFlagUserSearchPresenceStoreMigrationModule (copy), PresenceModule (copy), MyRoduxNetworkingModule (copy), FriendsModule (copy)
	return RoduxModule.combineReducers({
		Presence = if FFlagUserSearchPresenceStoreMigrationModule then nil else PresenceModule,
		NetworkStatus = MyRoduxNetworkingModule.installReducer(),
		Friends = FriendsModule
	})
end