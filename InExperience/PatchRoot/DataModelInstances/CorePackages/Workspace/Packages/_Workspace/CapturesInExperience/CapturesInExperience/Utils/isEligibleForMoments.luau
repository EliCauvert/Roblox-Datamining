local Parent = script.Parent.Parent
local _ = require(Parent.installReducer.MomentsEligibility)
local FFlagCapturesCarouselMomentsButtonModule = require(Parent.Flags.FFlagCapturesCarouselMomentsButton)
local GetMomentsCapabilitiesFunction = require(Parent.Parent.MomentsCommon).Stores.GetMomentsCapabilities
local CaptureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

return function(p1, p2): boolean
	-- upvalues: CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), GetMomentsCapabilitiesFunction (copy), FFlagCapturesCarouselMomentsButtonModule (copy)
	return if CaptureServiceEnableXExperiencePostingApisEngineFeature and GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false) then p1.byUniverseId[if FFlagCapturesCarouselMomentsButtonModule and p2 then p2 else game.GameId] == true else false
end