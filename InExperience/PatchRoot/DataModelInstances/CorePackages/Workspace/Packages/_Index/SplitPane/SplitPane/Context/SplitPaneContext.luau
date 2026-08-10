return require(script:FindFirstAncestor("SplitPane").Parent.React).createContext({
	renderSupportContent = nil,
	supportPaneResizable = nil,
	onContentRegionRectChanged = nil
})