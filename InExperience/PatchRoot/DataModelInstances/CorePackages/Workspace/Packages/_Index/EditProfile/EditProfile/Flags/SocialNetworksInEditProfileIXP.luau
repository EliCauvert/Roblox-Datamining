game:DefineFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6", false)
game:DefineFastFlag("SocialNetworksInEditProfileIXPEnabled", false)
local socialNetworksEditProfileIXPLayer = game:DefineFastString("SocialNetworksEditProfileIXPLayer", "Social.EditProfilePage")
local useUserExperiment = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment
local t = {
	Control = "control",
	VisibilityLast = "visibilityLast",
	VisibilityFirst = "visibilityFirst"
}

local function GetFFlagSocialNetworksInEditProfileIXPSetupEnabled()
	return game:GetFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6")
end

local function _()
	return game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled")
end

local function getExperimentVariant(p0)
	-- upvalues: socialNetworksEditProfileIXPLayer (ref), t (ref)
	return if game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled") then ((p0 or {})[socialNetworksEditProfileIXPLayer] or {}).editSocialNetworks or t.Control else nil
end

return {
	GetFFlagSocialNetworksInEditProfileIXPSetupEnabled = GetFFlagSocialNetworksInEditProfileIXPSetupEnabled,
	getExperimentVariant = getExperimentVariant,
	useGetExperimentVariant = function(p1)
		-- upvalues: useUserExperiment (ref), socialNetworksEditProfileIXPLayer (ref), getExperimentVariant (ref)
		return useUserExperiment({ socialNetworksEditProfileIXPLayer }, getExperimentVariant, p1.isExposureEnabled)
	end,
	Variants = t
}