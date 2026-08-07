local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingGames.config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})