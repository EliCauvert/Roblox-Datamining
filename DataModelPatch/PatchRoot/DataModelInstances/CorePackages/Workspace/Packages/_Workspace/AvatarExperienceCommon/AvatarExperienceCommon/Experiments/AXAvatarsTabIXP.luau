local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXAvatarsTabIXP = AvatarExperienceFlagsModule.FFlagAXAvatarsTabIXP
local FFlagAXAvatarsTabIXPEnabledForAll = AvatarExperienceFlagsModule.FFlagAXAvatarsTabIXPEnabledForAll

return require(Parent.IXPUtils).defineIXPTest({
	name = "AvatarExperience.UA.MarketplaceView.AvatarsTab",
	recordExposure = false,
	layer = require(Parent.ExperimentLayers).AppUserLayers.AvatarExperienceUAMarketplaceView,
	getIsUserInExperiment = function(p1): boolean
		return p1.IsAvatarsTabEnabled ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		-- upvalues: FFlagAXAvatarsTabIXP (copy)
		return FFlagAXAvatarsTabIXP
	end,
	getEnabledForAllFlag = function()
		-- upvalues: FFlagAXAvatarsTabIXPEnabledForAll (copy)
		return FFlagAXAvatarsTabIXPEnabledForAll
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			return p2 or (p1.IsAvatarsTabEnabled or false)
		end
	}
})