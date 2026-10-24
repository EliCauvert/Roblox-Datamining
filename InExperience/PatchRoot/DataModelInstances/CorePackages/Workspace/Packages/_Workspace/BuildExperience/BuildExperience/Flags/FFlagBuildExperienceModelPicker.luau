local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent

return require(Parent.SharedFlags).FFlagBuildExperienceModelPickerData and (require(BuildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) and require(Parent.SharedFlags).FFlagComposerFooter)