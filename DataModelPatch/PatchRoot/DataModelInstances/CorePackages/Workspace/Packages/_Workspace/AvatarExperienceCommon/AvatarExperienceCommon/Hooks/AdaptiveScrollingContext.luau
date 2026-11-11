local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local _ = require(Parent.AppCommonLib)

return (require(Parent.React).createContext(nil))