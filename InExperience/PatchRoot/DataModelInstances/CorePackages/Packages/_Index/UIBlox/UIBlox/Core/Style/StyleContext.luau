local parent = script.Parent.Parent.Parent
local _ = require(parent.App.Style.StyleTypes)

return require(parent.Parent.Roact).createContext(nil)