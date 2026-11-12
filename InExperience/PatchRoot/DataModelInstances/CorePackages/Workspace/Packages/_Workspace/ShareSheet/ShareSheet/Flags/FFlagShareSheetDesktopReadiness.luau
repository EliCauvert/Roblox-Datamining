local Parent = script:FindFirstAncestor("ShareSheet").Parent

return game:DefineFastFlag("ShareSheetDesktopReadiness3", false) and (require(Parent.SharedFlags).FFlagAppCompositionContainerWidth and (require(script.Parent.FFlagShareSheetOmitsEmptyActions) and require(Parent.Foundation).Utility.Flags.FoundationBottomSheetClearsActionsHeight))