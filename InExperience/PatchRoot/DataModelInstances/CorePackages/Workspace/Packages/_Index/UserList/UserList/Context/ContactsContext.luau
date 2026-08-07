local userList = script:FindFirstAncestor("UserList")
local _ = require(userList.Common.Types)

return require(userList.Parent.React).createContext({ contacts = {} })