local GetMomentsCapabilitiesFunction = require(script.Parent.Parent.Parent.MomentsCommon).Stores.GetMomentsCapabilities
local CaptureServiceEnableXExperiencePostingApisEngineFeature = game:GetEngineFeature("CaptureServiceEnableXExperiencePostingApis")

return function()
	-- upvalues: CaptureServiceEnableXExperiencePostingApisEngineFeature (copy), GetMomentsCapabilitiesFunction (copy)
	return CaptureServiceEnableXExperiencePostingApisEngineFeature and GetMomentsCapabilitiesFunction(false).getCanCreateMoments(false)
end