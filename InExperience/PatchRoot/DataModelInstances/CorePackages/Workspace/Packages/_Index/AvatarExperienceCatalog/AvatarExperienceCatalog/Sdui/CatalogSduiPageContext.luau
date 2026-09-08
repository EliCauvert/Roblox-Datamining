local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(parent.AppCommonLib)

return require(parent.React).createContext(nil)