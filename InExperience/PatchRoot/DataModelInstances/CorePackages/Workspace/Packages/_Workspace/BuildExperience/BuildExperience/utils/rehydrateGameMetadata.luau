local parent = script:FindFirstAncestor("BuildExperience").Parent
local experienceQuestionnaireModule = require(parent.DataHydration.ExperienceQuestionnaire)
local game = require(parent.DataHydration).Game
local refreshPublishEligibilityModule = require(script.Parent.refreshPublishEligibility)

return function(p1)
	-- upvalues: game (ref), refreshPublishEligibilityModule (ref), experienceQuestionnaireModule (ref)
	local var1 = tostring(p1)
	game.getGameInfoStore().fetchGameInfo(var1)
	game.getGameMediaStore().fetchGameMedia(var1)
	refreshPublishEligibilityModule(p1)
	experienceQuestionnaireModule.getExperienceQuestionnaireStore().fetchLatestSubmission(p1)
end