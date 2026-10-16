local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")

return require(AvatarExperienceCommon.Parent.Signals).createComputed((require(AvatarExperienceCommon.Stores.AdjustmentTypeSelectedStore.createAdjustmentTypeSelectedStore)))