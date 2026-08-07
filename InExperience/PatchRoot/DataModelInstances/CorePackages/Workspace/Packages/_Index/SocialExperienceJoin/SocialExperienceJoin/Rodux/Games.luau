local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return require(socialExperienceJoin.Parent.LuaSocialLibrariesDeps).RoduxGames.config({
	keyPath = require(socialExperienceJoin.Common.Constants).RODUX_KEY .. ".Games"
})