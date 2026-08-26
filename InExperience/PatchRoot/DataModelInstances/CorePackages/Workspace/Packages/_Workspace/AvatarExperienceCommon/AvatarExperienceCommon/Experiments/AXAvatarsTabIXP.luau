local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXAvatarsTabIXP = avatarExperienceFlagsModule.FFlagAXAvatarsTabIXP
local fFlagAXAvatarsTabIXPEnabledForAll = avatarExperienceFlagsModule.FFlagAXAvatarsTabIXPEnabledForAll

return IXPUtilsModule.defineIXPTest({
	name = "AvatarExperience.UA.MarketplaceView.AvatarsTab",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1)
		return p1.IsAvatarsTabEnabled ~= nil
	end,
	getDependentFlagsEnabled = function()
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: fFlagAXAvatarsTabIXP (ref)
		return fFlagAXAvatarsTabIXP
	end,
	getEnabledForAllFlag = function()
		-- upvalues: fFlagAXAvatarsTabIXPEnabledForAll (ref)
		return fFlagAXAvatarsTabIXPEnabledForAll
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			return p2 or (p1.IsAvatarsTabEnabled or false)
		end
	}
})