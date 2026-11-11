local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return require(SocialExperienceJoin.Parent.LuaSocialLibrariesDeps).RoduxGames.config({
	keyPath = require(SocialExperienceJoin.Common.Constants).RODUX_KEY .. ".Games"
})