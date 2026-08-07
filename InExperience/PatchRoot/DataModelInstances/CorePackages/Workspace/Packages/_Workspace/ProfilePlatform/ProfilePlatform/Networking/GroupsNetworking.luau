local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.GroupsNetworking).config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})