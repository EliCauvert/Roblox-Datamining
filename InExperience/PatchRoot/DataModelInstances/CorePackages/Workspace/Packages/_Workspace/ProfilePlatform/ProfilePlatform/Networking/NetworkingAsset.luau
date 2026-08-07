local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.AssetNetworking).config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})