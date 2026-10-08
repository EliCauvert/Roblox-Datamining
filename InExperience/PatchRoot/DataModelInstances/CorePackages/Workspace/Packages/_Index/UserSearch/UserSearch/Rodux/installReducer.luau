local userSearch = script:FindFirstAncestor("UserSearch")
local roduxModule = require(userSearch.Parent.Rodux)
local presenceModule = require(userSearch.Rodux.Presence)
local friendsModule = require(userSearch.Rodux.Friends)
local myRoduxNetworkingModule = require(userSearch.Networking.myRoduxNetworking)
local fFlagUserSearchPresenceStoreMigrationModule = require(userSearch.Flags.FFlagUserSearchPresenceStoreMigration)

return function()
	-- upvalues: roduxModule (ref), fFlagUserSearchPresenceStoreMigrationModule (ref), presenceModule (ref), myRoduxNetworkingModule (ref), friendsModule (ref)
	return roduxModule.combineReducers({
		Presence = if fFlagUserSearchPresenceStoreMigrationModule then nil else presenceModule,
		NetworkStatus = myRoduxNetworkingModule.installReducer(),
		Friends = friendsModule
	})
end