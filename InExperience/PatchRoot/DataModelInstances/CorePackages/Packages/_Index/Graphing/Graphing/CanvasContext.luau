local Graphing = script:FindFirstAncestor("Graphing")

return (require(Graphing.Parent.React).createContext(require(Graphing.Util.CanvasUtil).createDefaultFunctions()))