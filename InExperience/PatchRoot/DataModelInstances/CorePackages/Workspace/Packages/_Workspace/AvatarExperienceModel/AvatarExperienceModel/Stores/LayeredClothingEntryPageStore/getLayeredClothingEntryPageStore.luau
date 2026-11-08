local AvatarExperienceModel = script:FindFirstAncestor("AvatarExperienceModel")

return require(AvatarExperienceModel.Parent.Signals).createComputed((require(AvatarExperienceModel.Stores.LayeredClothingEntryPageStore.createLayeredClothingEntryPageStore)))