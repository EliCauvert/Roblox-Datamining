local EnableCommunityProfilePageIXPEnabledForAll = game:DefineFastFlag("EnableCommunityProfilePageIXPEnabledForAll", false)
local EnableCommunityProfilePageExperimentLayer = game:DefineFastString("EnableCommunityProfilePageExperimentLayer", "Social.CommunityProfileView")
local IXPService = game:GetService("IXPService")
local UseUserExperimentFunction = require(script:FindFirstAncestor("ProfilePlatform").Parent.RoactAppExperiment).useUserExperiment

local function isFeatureActive(p1)
	-- upvalues: EnableCommunityProfilePageExperimentLayer (copy), EnableCommunityProfilePageIXPEnabledForAll (copy)
	local Entry = (p1 or {})[EnableCommunityProfilePageExperimentLayer] or {}
	
	return EnableCommunityProfilePageIXPEnabledForAll or Entry.enableCommunityProfilePage == true
end

return {
	EnableCommunityProfilePageExperimentLayer = EnableCommunityProfilePageExperimentLayer,
	FFlagIsSetupEnabled = game:DefineFastFlag("EnableCommunityProfilePageIXPSetupEnabled_v4", false),
	isFeatureActive = isFeatureActive,
	useIsFeatureActive = function(p1)
		-- upvalues: UseUserExperimentFunction (copy), EnableCommunityProfilePageExperimentLayer (copy), isFeatureActive (copy)
		return UseUserExperimentFunction({ EnableCommunityProfilePageExperimentLayer }, isFeatureActive, if p1 then p1.isExposureEnabled else nil)
	end,
	logExposure = function()
		-- upvalues: IXPService (copy), EnableCommunityProfilePageExperimentLayer (copy)
		IXPService:LogUserLayerExposure(EnableCommunityProfilePageExperimentLayer)
	end
}