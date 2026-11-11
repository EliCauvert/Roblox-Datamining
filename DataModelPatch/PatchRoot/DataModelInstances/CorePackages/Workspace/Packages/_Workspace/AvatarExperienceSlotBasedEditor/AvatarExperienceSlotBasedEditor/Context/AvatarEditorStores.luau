local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local CreateAvatarEditorStoresModule = require(script.Parent.Parent.Stores.createAvatarEditorStores)

return (require(Parent.React).createContext(if require(Parent.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext then CreateAvatarEditorStoresModule() else nil))