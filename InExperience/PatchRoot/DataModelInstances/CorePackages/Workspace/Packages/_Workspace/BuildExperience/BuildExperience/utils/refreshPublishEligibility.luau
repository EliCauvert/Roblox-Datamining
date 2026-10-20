local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local ExperienceQuestionnaireModule = require(Parent.DataHydration.ExperienceQuestionnaire)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)

return function(p1)
	-- upvalues: ExperienceGuidelinesModule (copy), UniverseActivationModule (copy), ExperienceQuestionnaireModule (copy)
	local UniverseActivationStore = UniverseActivationModule.getUniverseActivationStore()
	ExperienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p1):catch(function() end)
	UniverseActivationStore.refreshEligibility(p1):catch(function() end)
	ExperienceQuestionnaireModule.getExperienceQuestionnaireStore().fetchEligibility(p1)
end