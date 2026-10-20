local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return require(SocialExperienceJoin.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(SocialExperienceJoin.Common.Constants).RODUX_KEY .. ".Presence"
})