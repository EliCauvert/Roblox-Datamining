game:DefineFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6", false)
game:DefineFastFlag("SocialNetworksInEditProfileIXPEnabled", false)
local SocialNetworksEditProfileIXPLayer = game:DefineFastString("SocialNetworksEditProfileIXPLayer", "Social.EditProfilePage")
local UseUserExperimentFunction = require(script:FindFirstAncestor("EditProfile").Parent.RoactAppExperiment).useUserExperiment
local Variants = {
	Control = "control",
	VisibilityLast = "visibilityLast",
	VisibilityFirst = "visibilityFirst"
}

local function _() --[[ Line: 21 | Named "GetFFlagSocialNetworksInEditProfileIXPEnabled" ]]
	return game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled")
end

local function getExperimentVariant(p1) --[[ Line: 25 ]]
	-- upvalues: SocialNetworksEditProfileIXPLayer (copy), Variants (copy)
	return if game:GetFastFlag("SocialNetworksInEditProfileIXPEnabled") then ((p1 or {})[SocialNetworksEditProfileIXPLayer] or {}).editSocialNetworks or Variants.Control else nil
end

return {
	GetFFlagSocialNetworksInEditProfileIXPSetupEnabled = function() --[[ Line: 17 ]]
		return game:GetFastFlag("SocialNetworksInEditProfileIXPSetupEnabled_v6")
	end,
	getExperimentVariant = getExperimentVariant,
	useGetExperimentVariant = function(p1) --[[ Line: 39 ]]
		-- upvalues: UseUserExperimentFunction (copy), SocialNetworksEditProfileIXPLayer (copy), getExperimentVariant (copy)
		return UseUserExperimentFunction({ SocialNetworksEditProfileIXPLayer }, getExperimentVariant, p1.isExposureEnabled)
	end,
	Variants = Variants
}