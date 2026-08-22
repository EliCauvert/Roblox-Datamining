local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local _ = require(script.Parent.RecyclingRuntime)

return require(viewRecyclerReact.Parent.React).createContext(nil)