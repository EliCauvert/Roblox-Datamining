local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent

return game:DefineFastFlag("BuildExperienceModelPicker2", false) and (require(BuildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) and require(Parent.SharedFlags).FFlagComposerFooter)