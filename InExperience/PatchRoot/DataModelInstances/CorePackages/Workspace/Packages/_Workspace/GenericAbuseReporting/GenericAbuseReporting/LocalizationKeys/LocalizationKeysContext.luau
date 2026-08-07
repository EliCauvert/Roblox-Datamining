local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")

return require(genericAbuseReporting.Parent.React).createContext(require(genericAbuseReporting.LocalizationKeys.DefaultLocalizationKeys))