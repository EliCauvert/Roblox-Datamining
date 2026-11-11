local Parent = script.Parent.Parent.Parent

return require(Parent.React).createContext({ fireEvent = require(Parent.Dash).noop })