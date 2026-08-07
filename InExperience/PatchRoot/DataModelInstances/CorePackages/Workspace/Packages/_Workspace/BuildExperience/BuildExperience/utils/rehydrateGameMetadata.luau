local parent = script:FindFirstAncestor("BuildExperience").Parent
local experienceQuestionnaireModule = require(parent.DataHydration.ExperienceQuestionnaire)
local game = require(parent.DataHydration).Game
local refreshPublishEligibilityModule = require(script.Parent.refreshPublishEligibility)

return function(p0) --[[ line: 7 | named "rehydrateGameMetadata" ]]
	-- upvalues: game (ref), refreshPublishEligibilityModule (ref), experienceQuestionnaireModule (ref)
	local var2 = tostring(p0)
	game.getGameInfoStore().fetchGameInfo(var2)
	game.getGameMediaStore().fetchGameMedia(var2)
	refreshPublishEligibilityModule(p0)
	experienceQuestionnaireModule.getExperienceQuestionnaireStore().fetchLatestSubmission(p0)
end