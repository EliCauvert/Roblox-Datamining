local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.UserProfileSettingsNetworking).config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})