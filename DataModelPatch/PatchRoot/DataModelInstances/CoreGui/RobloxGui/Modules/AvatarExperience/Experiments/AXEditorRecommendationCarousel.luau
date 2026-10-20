local CorePackages = game:GetService("CorePackages")
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
game:DefineFastFlag("AXEditorRecommendationCarouselEnabled", false)
game:DefineFastFlag("AXEditorRecommendationCarouselEnabledForAll", false)

return IxpUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.Editor.RecommendationCarousel",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUACustomizeView,
	getIsUserInExperiment = function(p1): boolean
		return p1.enableAvatarEditorRecommendationCarousel ~= nil
	end,
	getDependentFlagsEnabled = function(): boolean
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXEditorRecommendationCarouselEnabled")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXEditorRecommendationCarouselEnabledForAll")
	end,
	variables = {
		EnableAvatarEditorRecommendationCarousel = function(p1, _): boolean
			return p1.enableAvatarEditorRecommendationCarousel == true
		end
	}
})