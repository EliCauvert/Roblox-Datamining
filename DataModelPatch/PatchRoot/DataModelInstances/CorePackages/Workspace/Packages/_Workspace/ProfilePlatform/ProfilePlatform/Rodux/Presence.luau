local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(ProfilePlatform.Common.Constants).RODUX_KEY .. ".Presence"
}))