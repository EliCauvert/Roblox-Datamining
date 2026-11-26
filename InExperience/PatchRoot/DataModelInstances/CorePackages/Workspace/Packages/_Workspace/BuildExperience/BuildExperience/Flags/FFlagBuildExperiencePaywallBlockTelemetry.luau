local BuildExperience = script:FindFirstAncestor("BuildExperience")

return game:DefineFastFlag("BuildExperiencePaywallBlockTelemetry", false) and require(BuildExperience.Parent.SharedFlags).FFlagBuildExperiencePromptFailureTelemetry