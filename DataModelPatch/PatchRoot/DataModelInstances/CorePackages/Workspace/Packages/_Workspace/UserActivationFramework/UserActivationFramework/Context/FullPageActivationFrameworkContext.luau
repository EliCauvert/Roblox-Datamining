local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local _ = require(UserActivationFramework.Types)

return require(UserActivationFramework.Parent.React).createContext({
	dispatch = nil,
	navigation = nil,
	activationFrameworkState = {}
})