local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local IXPUtilsModule = require(Parent.IXPUtils)
game:DefineFastFlag("AXRecentlyViewedSearchItemsEnabled4", false)
game:DefineFastFlag("AXRecentlyViewedSearchItemsEnabledForAll4", false)
game:DefineFastFlag("AXRecentlyViewedSearchItemsPositionTop4", false)
game:DefineFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4", false)

return IXPUtilsModule.defineIXPTest({
	name = "AvatarMarketplace.UA.RecentlyViewedSearchItems",
	recordExposure = false,
	layer = AppUserLayers.AvatarExperienceUASearchView,
	getIsUserInExperiment = function(p1): boolean
		return p1.enableRecentlyViewedItems ~= nil and (p1.recentlyViewedSearchItemsPositionTop ~= nil and p1.recentlyViewedSearchItemsSaveInCatalog ~= nil)
	end,
	getDependentFlagsEnabled = function(): boolean
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
		EnabledTopVariant = function(p1)
			local RecentlyViewedSearchItemsPositionTop = p1.recentlyViewedSearchItemsPositionTop
			
			return game:GetFastFlag("AXRecentlyViewedSearchItemsPositionTop4") or RecentlyViewedSearchItemsPositionTop == true
		end,
		EnabledSaveInCatalog = function(p1)
			local RecentlyViewedSearchItemsSaveInCatalog = p1.recentlyViewedSearchItemsSaveInCatalog
			
			return game:GetFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4") or RecentlyViewedSearchItemsSaveInCatalog == true
		end
	}
})