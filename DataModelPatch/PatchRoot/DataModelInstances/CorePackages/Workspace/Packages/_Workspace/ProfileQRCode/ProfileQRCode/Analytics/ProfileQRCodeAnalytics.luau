local Parent = script:FindFirstAncestor("ProfileQRCode").Parent

return require(Parent.React).createContext({ fireEvent = require(Parent.Dash).noop })