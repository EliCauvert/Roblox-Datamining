local dependenciesModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.dependencies)

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	Navigation = require(script.Navigation),
	Dialog = require(script.Dialog),
	PlayerMenu = require(script.PlayerMenu),
	LastRemovedFriend = require(script.LastRemovedFriend),
	Call = dependenciesModule.RoduxCall.installReducer(),
	Friends = dependenciesModule.RoduxFriends.installReducer(),
	Presence = dependenciesModule.RoduxPresence.installReducer(),
	Users = dependenciesModule.RoduxUsers.installReducer(),
	NetworkStatus = dependenciesModule.RoduxNetworking.installReducer()
})