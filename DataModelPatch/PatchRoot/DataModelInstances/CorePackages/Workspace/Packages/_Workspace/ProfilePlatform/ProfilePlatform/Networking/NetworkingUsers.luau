local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingUsers.config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))