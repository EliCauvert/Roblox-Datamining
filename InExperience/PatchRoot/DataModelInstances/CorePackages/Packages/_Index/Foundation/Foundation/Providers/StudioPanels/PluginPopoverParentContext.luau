local Context = require(script:FindFirstAncestor("Foundation").Parent.React).createContext({ id = nil, ready = true })
Context.displayName = "PluginPopoverParentContext"

return Context