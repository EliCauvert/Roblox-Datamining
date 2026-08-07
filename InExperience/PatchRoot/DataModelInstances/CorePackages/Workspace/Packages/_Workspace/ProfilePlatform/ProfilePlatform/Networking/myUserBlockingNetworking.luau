local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.UserBlockingNetworking).config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})