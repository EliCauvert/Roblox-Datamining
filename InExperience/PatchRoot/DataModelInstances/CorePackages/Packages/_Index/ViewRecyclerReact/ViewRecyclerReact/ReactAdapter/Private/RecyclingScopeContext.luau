local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.ViewRecycler)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local _ = require(script.Parent.RecyclingRoot)

return ReactModule.createContext(nil)