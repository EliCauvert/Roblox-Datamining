local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingCurrentlyWearing.config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})