local UserList = script:FindFirstAncestor("UserList")
local _ = require(UserList.Common.Types)

return (require(UserList.Parent.React).createContext({ contacts = {} }))