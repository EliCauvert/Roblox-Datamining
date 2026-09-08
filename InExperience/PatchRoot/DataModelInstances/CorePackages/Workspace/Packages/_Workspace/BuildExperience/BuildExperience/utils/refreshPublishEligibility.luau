local parent = script:FindFirstAncestor("BuildExperience").Parent
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local experienceQuestionnaireModule = require(parent.DataHydration.ExperienceQuestionnaire)
local universeActivationModule = require(parent.DataHydration.UniverseActivation)

return function(p1)
	-- upvalues: experienceGuidelinesModule (ref), universeActivationModule (ref), experienceQuestionnaireModule (ref)
	local universeActivationStore = universeActivationModule.getUniverseActivationStore()
	experienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p1):catch(function() end)
	universeActivationStore.refreshEligibility(p1):catch(function() end)
	experienceQuestionnaireModule.getExperienceQuestionnaireStore().fetchEligibility(p1)
end