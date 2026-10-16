local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local ConstantsModule = require(SocialExperienceJoin.Common.Constants)
local LuaSocialLibrariesDepsModule = require(SocialExperienceJoin.Parent.LuaSocialLibrariesDeps)

return if require(SocialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration) then nil else LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = ConstantsModule.RODUX_KEY .. ".Presence" })