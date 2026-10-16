local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXAvatarsTabIXP = AvatarExperienceFlagsModule.FFlagAXAvatarsTabIXP
local FFlagAXAvatarsTabIXPEnabledForAll = AvatarExperienceFlagsModule.FFlagAXAvatarsTabIXPEnabledForAll

return require(Parent.IXPUtils).defineIXPTest({
	name = "AvatarExperience.UA.MarketplaceView.AvatarsTab",
	recordExposure = false,
	layer = require(Parent.ExperimentLayers).AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean --[[ Line: 27 ]]
		return p1.IsAvatarsTabEnabled ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean --[[ Line: 31 ]]
		return true
	end,
	getEnabledFlag = function() --[[ Line: 35 ]]
		-- upvalues: FFlagAXAvatarsTabIXP (copy)
		return FFlagAXAvatarsTabIXP
	end,
	getEnabledForAllFlag = function() --[[ Line: 39 ]]
		-- upvalues: FFlagAXAvatarsTabIXPEnabledForAll (copy)
		return FFlagAXAvatarsTabIXPEnabledForAll
	end,
	variables = {
		EnabledForUser = function(p1, p2) --[[ Line: 44 ]]
			return p2 or (p1.IsAvatarsTabEnabled or false)
		end
	}
})