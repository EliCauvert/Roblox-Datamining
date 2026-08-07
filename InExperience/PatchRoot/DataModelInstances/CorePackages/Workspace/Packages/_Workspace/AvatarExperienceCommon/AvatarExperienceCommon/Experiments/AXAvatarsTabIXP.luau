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
	getIsUserInExperiment = function(p0) --[[ line: 27 ]]
		return p0.IsAvatarsTabEnabled ~= nil
	end,
	getDependentFlagsEnabled = function() --[[ line: 31 ]]
		return true
	end,
	getEnabledFlag = function() --[[ line: 35 ]]
		-- upvalues: fFlagAXAvatarsTabIXP (ref)
		return fFlagAXAvatarsTabIXP
	end,
	getEnabledForAllFlag = function() --[[ line: 39 ]]
		-- upvalues: fFlagAXAvatarsTabIXPEnabledForAll (ref)
		return fFlagAXAvatarsTabIXPEnabledForAll
	end,
	variables = {
		EnabledForUser = function(p1, p2) --[[ line: 44 ]]
			return p2 or (p1.IsAvatarsTabEnabled or false)
		end
	}
})