local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local _ = require(Parent.AppCommonLib)

return (require(Parent.React).createContext(nil))