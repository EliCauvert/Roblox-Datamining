local parent = script.Parent.Parent.Parent

return require(parent.React).createContext({ fireEvent = require(parent.Dash).noop })