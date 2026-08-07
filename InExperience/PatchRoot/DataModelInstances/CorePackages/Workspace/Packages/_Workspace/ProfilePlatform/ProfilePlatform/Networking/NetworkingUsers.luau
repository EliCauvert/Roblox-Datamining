local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingUsers.config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})