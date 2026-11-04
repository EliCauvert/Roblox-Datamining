local Groups = script:FindFirstAncestor("Groups")
local _ = require(Groups.Stores.createGroupSidebarState)

return require(Groups.Parent.React).createContext(nil)