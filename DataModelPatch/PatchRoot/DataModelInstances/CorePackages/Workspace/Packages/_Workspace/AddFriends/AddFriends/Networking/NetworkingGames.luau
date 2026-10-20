local Parent = script:FindFirstAncestor("AddFriends").Parent

return require(Parent.LuaSocialLibrariesDeps).NetworkingGames.config({
	roduxNetworking = require(Parent.AddFriendsState).Networking.myRoduxNetworking
})