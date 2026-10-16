local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local LuaSocialLibrariesDepsModule = require(ProfilePlatform.Parent.LuaSocialLibrariesDeps)
local MyRoduxNetworkingModule = require(ProfilePlatform.Networking.myRoduxNetworking)

return if require(ProfilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration) then nil else LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = MyRoduxNetworkingModule })