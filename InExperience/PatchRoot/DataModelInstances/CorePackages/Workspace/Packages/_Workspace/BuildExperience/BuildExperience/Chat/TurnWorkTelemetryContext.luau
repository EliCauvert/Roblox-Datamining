local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Telemetry.createTurnWorkTelemetry)

return require(BuildExperience.Parent.React).createContext(nil)