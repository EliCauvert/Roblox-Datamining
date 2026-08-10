local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return if require(socialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration) then nil else require(socialExperienceJoin.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(socialExperienceJoin.Common.Constants).RODUX_KEY .. ".Presence"
})