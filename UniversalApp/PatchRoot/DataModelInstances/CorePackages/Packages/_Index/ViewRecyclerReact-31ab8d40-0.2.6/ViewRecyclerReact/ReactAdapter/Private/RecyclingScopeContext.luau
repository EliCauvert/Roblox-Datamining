local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.ViewRecycler)
local _ = require(script.Parent.RecyclingRoot)

return require(viewRecyclerReact.Parent.React).createContext(nil)