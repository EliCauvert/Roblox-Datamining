local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingCurrentlyWearing.config({
	roduxNetworking = require(ProfilePlatform.Networking.myRoduxNetworking)
}))