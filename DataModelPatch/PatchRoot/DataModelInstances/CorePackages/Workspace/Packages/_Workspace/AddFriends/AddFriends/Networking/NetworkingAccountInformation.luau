local Parent = script:FindFirstAncestor("AddFriends").Parent

return require(Parent.LuaSocialLibrariesDeps).NetworkingAccountInformation.config({
	roduxNetworking = require(Parent.AddFriendsState).Networking.myRoduxNetworking
})