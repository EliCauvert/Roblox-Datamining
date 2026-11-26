local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsTypes)

return require(Parent.React).createContext(nil)