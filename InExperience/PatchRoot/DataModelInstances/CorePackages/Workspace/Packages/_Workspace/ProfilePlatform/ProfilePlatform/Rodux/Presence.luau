local profilePlatform = script:FindFirstAncestor("ProfilePlatform")

return require(profilePlatform.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(profilePlatform.Common.Constants).RODUX_KEY .. ".Presence"
})