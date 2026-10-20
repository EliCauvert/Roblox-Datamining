local AddFriendsState = script:FindFirstAncestor("AddFriendsState")
local Parent = AddFriendsState.Parent
local ContactImporterModule = require(Parent.ContactImporter)
local RoduxModule = require(Parent.Rodux)
local FFlagAddFriendsPresenceStoreMigration = require(Parent.SharedFlags).FFlagAddFriendsPresenceStoreMigration

return function()
	-- upvalues: RoduxModule (copy), AddFriendsState (copy), FFlagAddFriendsPresenceStoreMigration (copy), ContactImporterModule (copy)
	return RoduxModule.combineReducers({
		NetworkStatus = require(AddFriendsState.Networking.myRoduxNetworking).installReducer(),
		Games = require(script.Parent.RoduxGames).installReducer(),
		Friends = require(script.Parent.RoduxFriends).installReducer(),
		Users = require(script.Parent.RoduxUsers).installReducer(),
		Analytics = require(script.Parent.RoduxAnalytics).installReducer(),
		Presence = if FFlagAddFriendsPresenceStoreMigration then nil else require(script.Parent.RoduxPresence).installReducer(),
		ShowContactImporterParams = ContactImporterModule.ShowContactImporterParams,
		RequestsFromOriginSourceType = require(script.Parent.RequestsFromOriginSourceType),
		ContactImporterWarning = require(script.Parent.contactImporterWarning),
		IsUserFollowing = require(script.Parent.IsUserFollowing)
	})
end