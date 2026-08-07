local parent = script:FindFirstAncestor("Style").Parent
local _ = require(parent.UIBlox)

return require(parent.React).createContext(nil)