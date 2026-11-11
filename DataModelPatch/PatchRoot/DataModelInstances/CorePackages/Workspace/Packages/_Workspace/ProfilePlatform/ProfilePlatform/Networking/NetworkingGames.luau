local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingGames.config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))