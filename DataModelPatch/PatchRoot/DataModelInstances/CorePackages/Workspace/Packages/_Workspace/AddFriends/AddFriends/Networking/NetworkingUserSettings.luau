local Parent = script:FindFirstAncestor("AddFriends").Parent

return require(Parent.LuaSocialLibrariesDeps).NetworkingUserSettings.config({
	roduxNetworking = require(Parent.AddFriendsState).Networking.myRoduxNetworking
})