local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.FriendsNetworking).config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))