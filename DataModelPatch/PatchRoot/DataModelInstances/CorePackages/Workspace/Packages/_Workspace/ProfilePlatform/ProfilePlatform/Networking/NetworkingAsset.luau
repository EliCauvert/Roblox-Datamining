local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.AssetNetworking).config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))