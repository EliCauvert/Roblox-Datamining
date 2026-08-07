local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.FriendsNetworking).config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})