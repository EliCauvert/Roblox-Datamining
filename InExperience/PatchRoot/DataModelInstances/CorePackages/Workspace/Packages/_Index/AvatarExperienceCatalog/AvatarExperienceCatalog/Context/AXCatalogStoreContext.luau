local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")

return require(avatarExperienceCatalog.Parent.React).createContext(require(avatarExperienceCatalog.Stores)())