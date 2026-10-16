local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local ExperienceQuestionnaireModule = require(Parent.DataHydration.ExperienceQuestionnaire)
local UniverseActivationModule = require(Parent.DataHydration.UniverseActivation)

return function(p1) --[[ Line: 8 | Named "refreshPublishEligibility" ]]
	-- upvalues: ExperienceGuidelinesModule (copy), UniverseActivationModule (copy), ExperienceQuestionnaireModule (copy)
	local UniverseActivationStore = UniverseActivationModule.getUniverseActivationStore()
	ExperienceGuidelinesModule.getExperienceGuidelinesStore().refreshDetailedGuidelines(p1):catch(function() --[[ Line: 11 ]] end)
	UniverseActivationStore.refreshEligibility(p1):catch(function() --[[ Line: 14 ]] end)
	ExperienceQuestionnaireModule.getExperienceQuestionnaireStore().fetchEligibility(p1)
end