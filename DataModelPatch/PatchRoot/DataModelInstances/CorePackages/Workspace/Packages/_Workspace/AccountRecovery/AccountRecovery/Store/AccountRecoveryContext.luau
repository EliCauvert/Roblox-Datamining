local AccountRecovery = script:FindFirstAncestor("AccountRecovery")
local _ = require(AccountRecovery.Store.State)

return require(AccountRecovery.Parent.React).createContext({ dispatch = nil, parentNavigation = nil, state = {} })