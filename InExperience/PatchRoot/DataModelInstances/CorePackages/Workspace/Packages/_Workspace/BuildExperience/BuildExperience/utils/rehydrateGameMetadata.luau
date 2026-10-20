local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Game = require(BuildExperience.Parent.DataHydration).Game
local RefreshPublishEligibilityModule = require(script.Parent.refreshPublishEligibility)
local RefreshAdCampaignEligibilityModule = require(script.Parent.refreshAdCampaignEligibility)
local FFlagEnableBuildAdPromotionModule = require(BuildExperience.Flags.FFlagEnableBuildAdPromotion)

return function(p1)
	-- upvalues: Game (copy), RefreshPublishEligibilityModule (copy), FFlagEnableBuildAdPromotionModule (copy), RefreshAdCampaignEligibilityModule (copy)
	local Text = tostring(p1)
	Game.getGameInfoStore().fetchGameInfo(Text)
	Game.getGameMediaStore().fetchGameMedia(Text)
	RefreshPublishEligibilityModule(p1)
	
	if FFlagEnableBuildAdPromotionModule then
		RefreshAdCampaignEligibilityModule(p1)
	end
end