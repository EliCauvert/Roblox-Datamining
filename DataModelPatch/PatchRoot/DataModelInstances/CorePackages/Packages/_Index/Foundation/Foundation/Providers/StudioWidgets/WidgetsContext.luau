local _ = require(script.Parent.Types)
local Context = require(script:FindFirstAncestor("Foundation").Parent.React).createContext(nil)
Context.displayName = "WidgetsContext"

return Context