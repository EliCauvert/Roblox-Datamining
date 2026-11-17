local Parent = script.Parent.Parent
local _ = require(Parent.installReducer.MomentsEligibility)
local GetMomentsCapabilitiesFunction = require(Parent.Parent.MomentsCommon).Stores.GetMomentsCapabilities
local CaptureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

return function(p1): boolean
	-- upvalues: CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), GetMomentsCapabilitiesFunction (copy)
	return if CaptureServiceEnableXExperiencePostingApisEngineFeature and GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false) then p1.byUniverseId[game.GameId] == true else false
end