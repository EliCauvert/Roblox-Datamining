local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")

return (require(ProfilePlatform.Parent.LuaSocialLibrariesDeps).RoduxGames.config({
	keyPath = require(ProfilePlatform.Common.Constants).RODUX_KEY .. ".Games"
}))