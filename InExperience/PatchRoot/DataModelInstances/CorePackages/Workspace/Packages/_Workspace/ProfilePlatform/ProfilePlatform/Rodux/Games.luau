local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.LuaSocialLibrariesDeps).RoduxGames.config({
	keyPath = require(profilePlatform.Common.Constants).RODUX_KEY .. ".Games"
})