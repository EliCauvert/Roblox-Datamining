local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local GetFFlagCleanUpAXAlternativeLandingPageIXPModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagCleanUpAXAlternativeLandingPageIXP)
game:DefineFastFlag("AXDefaultAvatarToShopEnabled3", false)
game:DefineFastFlag("AXDefaultAvatarToShopEnabledForAll3", false)
game:DefineFastString("AXDefaultAvatarToShopLayer3", AppUserLayers.AvatarMarketplaceUILayer)
game:DefineFastFlag("AXDefaultAvatarToShopWidgetEnabled3", false)

return if GetFFlagCleanUpAXAlternativeLandingPageIXPModule() then nil else IxpUtilsModule.defineIXPTest({
	name = "AXDefaultAvatarToShop",
	cacheVariables = true,
	layer = game:GetFastString("AXDefaultAvatarToShopLayer3"),
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXDefaultAvatarToShopEnabled3")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXDefaultAvatarToShopEnabledForAll3")
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			local AvatarExperienceLandingPage = p1.avatarExperienceLandingPage
			
			return p2 or (if AvatarExperienceLandingPage then AvatarExperienceLandingPage ~= "default" else false)
		end,
		GetFullScreenEnabled = function(p1, p2)
			return p2 or p1.avatarExperienceLandingPage == "shopFullscreen"
		end,
		Row = function(_, _): number
			return 2
		end,
		WidgetEnabled = function(_, _)
			return game:GetFastFlag("AXDefaultAvatarToShopWidgetEnabled3")
		end
	}
})