local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local _ = require(Parent.installReducer.MomentsEligibility)
local FFlagMomentsCreationFeatureGate = require(Parent1.SharedFlags).FFlagMomentsCreationFeatureGate
local GetMomentsCapabilitiesFunction = require(Parent1.MomentsCommon).Stores.GetMomentsCapabilities
local CaptureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

return function(p1): boolean
	-- upvalues: CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), FFlagMomentsCreationFeatureGate (copy), GetMomentsCapabilitiesFunction (copy)
	return if CaptureServiceEnableXExperiencePostingApisEngineFeature then (not FFlagMomentsCreationFeatureGate or GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false)) and p1.byUniverseId[game.GameId] == true else false
end