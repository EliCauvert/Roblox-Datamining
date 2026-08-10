local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return if require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration) then nil else require(profilePlatform.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(profilePlatform.Networking.myRoduxNetworking)
})