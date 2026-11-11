local DependenciesModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList.dependencies)

return (require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	Navigation = require(script.Navigation),
	Dialog = require(script.Dialog),
	PlayerMenu = require(script.PlayerMenu),
	LastRemovedFriend = require(script.LastRemovedFriend),
	Call = DependenciesModule.RoduxCall.installReducer(),
	Friends = DependenciesModule.RoduxFriends.installReducer(),
	Presence = DependenciesModule.RoduxPresence.installReducer(),
	Users = DependenciesModule.RoduxUsers.installReducer(),
	NetworkStatus = DependenciesModule.RoduxNetworking.installReducer()
}))