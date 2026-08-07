local interventionShared = script:FindFirstAncestor("InterventionShared")

return require(interventionShared.Parent.React).createContext(require(interventionShared.Utils.Constants).InterventionPlacementType.Unknown)