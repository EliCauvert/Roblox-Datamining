local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent

return require(parent.React).createContext(if require(parent.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext then require(script.Parent.Parent.Stores.createAvatarEditorStores)() else nil)