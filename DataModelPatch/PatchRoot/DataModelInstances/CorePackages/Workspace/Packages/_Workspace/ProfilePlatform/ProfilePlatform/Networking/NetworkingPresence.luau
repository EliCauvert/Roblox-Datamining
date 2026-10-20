local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))