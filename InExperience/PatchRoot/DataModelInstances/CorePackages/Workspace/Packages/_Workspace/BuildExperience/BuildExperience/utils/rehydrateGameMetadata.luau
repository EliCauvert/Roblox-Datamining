local buildExperience = script:FindFirstAncestor("BuildExperience")
local game = require(buildExperience.Parent.DataHydration).Game
local refreshPublishEligibilityModule = require(script.Parent.refreshPublishEligibility)
local refreshAdCampaignEligibilityModule = require(script.Parent.refreshAdCampaignEligibility)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)

return function(p1)
	-- upvalues: game (ref), refreshPublishEligibilityModule (ref), fFlagEnableBuildAdPromotionModule (ref), refreshAdCampaignEligibilityModule (ref)
	local var1 = tostring(p1)
	game.getGameInfoStore().fetchGameInfo(var1)
	game.getGameMediaStore().fetchGameMedia(var1)
	refreshPublishEligibilityModule(p1)
	
	if fFlagEnableBuildAdPromotionModule then
		refreshAdCampaignEligibilityModule(p1)
	end
end