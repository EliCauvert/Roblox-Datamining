local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local experienceQuestionnaireModule = require(parent.DataHydration.ExperienceQuestionnaire)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)
local fFlagBuildRehydrateOnPublishModule = require(buildExperience.Flags.FFlagBuildRehydrateOnPublish)

return function(p0)
	-- upvalues: experienceGuidelinesModule (ref), universeActivationModule (ref), fFlagBuildRehydrateOnPublishModule (ref), experienceQuestionnaireModule (ref)
	local experienceGuidelinesStore = experienceGuidelinesModule.getExperienceGuidelinesStore()
	local universeActivationStore = universeActivationModule.getUniverseActivationStore()
	
	if fFlagBuildRehydrateOnPublishModule then
		experienceGuidelinesStore.refreshDetailedGuidelines(p0):catch(function() end)
		universeActivationStore.refreshEligibility(p0):catch(function() end)
	else
		experienceGuidelinesStore.fetchDetailedGuidelines(p0)
		universeActivationStore.fetchEligibility(p0)
	end
	experienceQuestionnaireModule.getExperienceQuestionnaireStore().fetchEligibility(p0)
end