local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Analytics.AnalyticsPageEvents)

return require(BuildExperience.Parent.React).createContext(nil)