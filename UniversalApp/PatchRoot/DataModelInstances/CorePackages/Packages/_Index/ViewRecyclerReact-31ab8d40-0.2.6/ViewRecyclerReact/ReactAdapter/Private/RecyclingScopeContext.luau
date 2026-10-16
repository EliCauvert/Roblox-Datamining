local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local _ = require(script.Parent.RecyclingRoot)

return require(ViewRecyclerReact.Parent.React).createContext(nil)