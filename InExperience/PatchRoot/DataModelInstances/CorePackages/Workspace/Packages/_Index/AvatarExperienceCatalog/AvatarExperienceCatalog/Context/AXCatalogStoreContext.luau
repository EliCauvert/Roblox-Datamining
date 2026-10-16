local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")

return require(AvatarExperienceCatalog.Parent.React).createContext((require(AvatarExperienceCatalog.Stores)()))