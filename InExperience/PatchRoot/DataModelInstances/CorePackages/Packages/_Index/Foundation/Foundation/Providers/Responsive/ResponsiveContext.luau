local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	config = {
		breakpoint = require(foundation.Utility.Responsive.BreakpointConfig),
		grid = require(foundation.Utility.Responsive.GridConfig)
	}
})