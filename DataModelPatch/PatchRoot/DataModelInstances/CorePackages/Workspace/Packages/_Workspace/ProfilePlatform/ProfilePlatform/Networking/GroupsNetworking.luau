local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.GroupsNetworking).config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))