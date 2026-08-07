local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local enableCommunityProfilePageIXPSetupEnabledV4 = game:DefineFastFlag("EnableCommunityProfilePageIXPSetupEnabled_v4", false)
local enableCommunityProfilePageIXPEnabledForAll = game:DefineFastFlag("EnableCommunityProfilePageIXPEnabledForAll", false)
local enableCommunityProfilePageExperimentLayer = game:DefineFastString("EnableCommunityProfilePageExperimentLayer", "Social.CommunityProfileView")
local IXPService = game:GetService("IXPService")
local useUserExperiment = require(profilePlatform.Parent.RoactAppExperiment).useUserExperiment

local function isFeatureActive(p0) --[[ line: 15 ]]
	-- upvalues: enableCommunityProfilePageExperimentLayer (ref), enableCommunityProfilePageIXPEnabledForAll (ref)
	return enableCommunityProfilePageIXPEnabledForAll or ((p0 or {})[enableCommunityProfilePageExperimentLayer] or {}).enableCommunityProfilePage == true
end

return {
	EnableCommunityProfilePageExperimentLayer = enableCommunityProfilePageExperimentLayer,
	FFlagIsSetupEnabled = enableCommunityProfilePageIXPSetupEnabledV4,
	isFeatureActive = isFeatureActive,
	useIsFeatureActive = function(p1) --[[ line: 27 ]]
		-- upvalues: useUserExperiment (ref), enableCommunityProfilePageExperimentLayer (ref), isFeatureActive (ref)
		return useUserExperiment({ enableCommunityProfilePageExperimentLayer }, isFeatureActive, if p1 then p1.isExposureEnabled else nil)
	end,
	logExposure = function() --[[ line: 34 ]]
		-- upvalues: IXPService (ref), enableCommunityProfilePageExperimentLayer (ref)
		IXPService:LogUserLayerExposure(enableCommunityProfilePageExperimentLayer)
	end
}