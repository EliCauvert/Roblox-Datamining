local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.CatalogNetworking).config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))