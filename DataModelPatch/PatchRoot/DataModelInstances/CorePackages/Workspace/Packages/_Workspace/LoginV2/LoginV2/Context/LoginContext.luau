local LoginV2 = script:FindFirstAncestor("LoginV2")
local _ = require(LoginV2.Components.Types)

return require(LoginV2.Parent.React).createContext({ dispatch = nil, parentNavigation = nil, state = {} })