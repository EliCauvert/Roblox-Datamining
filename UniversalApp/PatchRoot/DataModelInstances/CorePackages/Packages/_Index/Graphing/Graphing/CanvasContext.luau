local graphing = script:FindFirstAncestor("Graphing")

return require(graphing.Parent.React).createContext(require(graphing.Util.CanvasUtil).createDefaultFunctions())