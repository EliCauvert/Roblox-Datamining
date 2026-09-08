local parent = script:FindFirstAncestor("Style").Parent
local _ = require(parent.Foundation)

return require(parent.React).createContext({})