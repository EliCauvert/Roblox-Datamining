local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.Signals)

return require(viewRecyclerReact.Parent.React).createContext(false)