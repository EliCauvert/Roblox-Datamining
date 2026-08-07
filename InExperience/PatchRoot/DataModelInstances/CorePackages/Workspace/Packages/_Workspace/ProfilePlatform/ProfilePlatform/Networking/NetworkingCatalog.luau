local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.CatalogNetworking).config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})