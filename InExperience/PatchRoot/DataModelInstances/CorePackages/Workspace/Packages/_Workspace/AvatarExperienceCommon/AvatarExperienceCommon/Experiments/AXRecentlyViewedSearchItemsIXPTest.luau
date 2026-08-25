local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(parent.IXPUtils)
game:DefineFastFlag("AXRecentlyViewedSearchItemsEnabled4", false)
game:DefineFastFlag("AXRecentlyViewedSearchItemsEnabledForAll4", false)
game:DefineFastFlag("AXRecentlyViewedSearchItemsPositionTop4", false)
game:DefineFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.RecentlyViewedSearchItems",
	recordExposure = false,
	layer = appUserLayers.AvatarExperienceUASearchView,
	getIsUserInExperiment = function(p0)
		return p0.enableRecentlyViewedItems ~= nil and (p0.recentlyViewedSearchItemsPositionTop ~= nil and p0.recentlyViewedSearchItemsSaveInCatalog ~= nil)
	end,
	getDependentFlagsEnabled = function()
		return true
	end,
	getEnabledFlag = function()
		return game:GetFastFlag("AXRecentlyViewedSearchItemsEnabled4")
	end,
	getEnabledForAllFlag = function()
		return game:GetFastFlag("AXRecentlyViewedSearchItemsEnabledForAll4")
	end,
	variables = {
		EnabledForUser = function(p1, p2)
			return p2 or p1.enableRecentlyViewedItems
		end,
		EnabledTopVariant = function(p3)
			return if not game:GetFastFlag("AXRecentlyViewedSearchItemsPositionTop4") then if p3.recentlyViewedSearchItemsPositionTop ~= true then false else true else game:GetFastFlag("AXRecentlyViewedSearchItemsPositionTop4")
		end,
		EnabledSaveInCatalog = function(p4)
			return if not game:GetFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4") then if p4.recentlyViewedSearchItemsSaveInCatalog ~= true then false else true else game:GetFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4")
		end
	}
})