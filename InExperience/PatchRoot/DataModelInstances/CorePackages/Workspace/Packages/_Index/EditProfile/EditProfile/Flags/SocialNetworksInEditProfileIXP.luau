game:DefineFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6", false)
game:DefineFastFlag("SocialNetworksInEditProfileIXPEnabled", false)
local socialNetworksEditProfileIXPLayer = game:DefineFastString("SocialNetworksEditProfileIXPLayer", "Social.EditProfilePage")
local useUserExperiment = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment
local t = {
	Control = "control",
	VisibilityLast = "visibilityLast",
	VisibilityFirst = "visibilityFirst"
}

local function GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() --[[ line: 17 ]]
	return game:GetFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6")
end

local function _() --[[ line: 21 | named "GetFFlagSocialNetworksInEditProfileIXPEnabled" ]]
	return game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled")
end

local function getExperimentVariant(p0) --[[ line: 25 ]]
	-- upvalues: socialNetworksEditProfileIXPLayer (ref), t (ref)
	return if game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled") then ((p0 or {})[socialNetworksEditProfileIXPLayer] or {}).editSocialNetworks or t.Control else nil
end

return {
	GetFFlagSocialNetworksInEditProfileIXPSetupEnabled = GetFFlagSocialNetworksInEditProfileIXPSetupEnabled,
	getExperimentVariant = getExperimentVariant,
	useGetExperimentVariant = function(p1) --[[ line: 39 ]]
		-- upvalues: useUserExperiment (ref), socialNetworksEditProfileIXPLayer (ref), getExperimentVariant (ref)
		return useUserExperiment({ socialNetworksEditProfileIXPLayer }, getExperimentVariant, p1.isExposureEnabled)
	end,
	Variants = t
}