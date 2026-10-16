local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.UserBlockingNetworking).config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))