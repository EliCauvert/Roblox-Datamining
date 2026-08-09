local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})