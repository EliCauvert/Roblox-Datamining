local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent

return require(BuildExperience.Flags.FFlagBuildExperienceChainOfThought) and (require(Parent.DataHydration.CreatorAgentChat).FFlagBuildExperienceThoughtStatus and require(BuildExperience.Flags.FFlagBuildExperienceToolDisplaySummary))