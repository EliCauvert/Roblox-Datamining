local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local Players = game:GetService("Players")
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local FStringMomentsPostInsightsIxpLayerModule = require(Moments.Flags.FStringMomentsPostInsightsIxpLayer)
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource

return function(p1, Profile)
	-- upvalues: RecommendationSource (copy), Players (copy), MomentsCommonModule (copy), FStringMomentsPostInsightsIxpLayerModule (copy)
	if Profile ~= RecommendationSource.Profile then return end
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer ~= nil and p1.creatorId == LocalPlayer.UserId then
		MomentsCommonModule.Utils.logMomentsLayerExposure(FStringMomentsPostInsightsIxpLayerModule)
		
		return
	end
end