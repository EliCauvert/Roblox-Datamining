local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return require(socialExperienceJoin.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(socialExperienceJoin.Common.Constants).RODUX_KEY .. ".Presence"
})