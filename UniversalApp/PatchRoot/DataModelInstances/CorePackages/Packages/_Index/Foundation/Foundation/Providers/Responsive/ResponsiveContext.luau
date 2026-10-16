local Foundation = script:FindFirstAncestor("Foundation")

return require(Foundation.Parent.React).createContext({
	config = {
		breakpoint = require(Foundation.Utility.Responsive.BreakpointConfig),
		grid = require(Foundation.Utility.Responsive.GridConfig)
	}
})