local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")

return require(avatarExperienceCommon.Parent.Signals).createComputed(require(avatarExperienceCommon.Stores.TimeoutStatusStore.createTimeoutStatusStore))