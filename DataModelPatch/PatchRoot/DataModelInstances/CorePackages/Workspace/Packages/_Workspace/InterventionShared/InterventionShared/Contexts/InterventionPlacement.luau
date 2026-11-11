local InterventionShared = script:FindFirstAncestor("InterventionShared")

return (require(InterventionShared.Parent.React).createContext(require(InterventionShared.Utils.Constants).InterventionPlacementType.Unknown))