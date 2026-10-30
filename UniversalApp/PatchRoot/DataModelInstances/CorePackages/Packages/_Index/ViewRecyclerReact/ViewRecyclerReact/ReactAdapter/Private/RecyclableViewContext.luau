local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.Signals)

return require(ViewRecyclerReact.Parent.React).createContext(false)