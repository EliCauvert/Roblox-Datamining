local parent = script:FindFirstAncestor("ProfileQRCode").Parent

return require(parent.React).createContext({ fireEvent = require(parent.Dash).noop })