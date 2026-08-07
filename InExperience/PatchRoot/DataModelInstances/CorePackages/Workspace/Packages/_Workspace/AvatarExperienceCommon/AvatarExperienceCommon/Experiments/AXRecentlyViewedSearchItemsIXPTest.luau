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
	getIsUserInExperiment = function(p0) --[[ line: 25 ]]
		return p0.enableRecentlyViewedItems ~= nil and (p0.recentlyViewedSearchItemsPositionTop ~= nil and p0.recentlyViewedSearchItemsSaveInCatalog ~= nil)
	end,
	getDependentFlagsEnabled = function() --[[ line: 31 ]]
		return true
	end,
	getEnabledFlag = function() --[[ line: 35 ]]
		return game:GetFastFlag("AXRecentlyViewedSearchItemsEnabled4")
	end,
	getEnabledForAllFlag = function() --[[ line: 39 ]]
		return game:GetFastFlag("AXRecentlyViewedSearchItemsEnabledForAll4")
	end,
	variables = {
		EnabledForUser = function(p1, p2) --[[ line: 45 ]]
			return p2 or p1.enableRecentlyViewedItems
		end,
		EnabledTopVariant = function(p3) --[[ line: 48 ]]
			return if not game:GetFastFlag("AXRecentlyViewedSearchItemsPositionTop4") then if p3.recentlyViewedSearchItemsPositionTop ~= true then false else true else game:GetFastFlag("AXRecentlyViewedSearchItemsPositionTop4")
		end,
		EnabledSaveInCatalog = function(p4) --[[ line: 52 ]]
			return if not game:GetFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4") then if p4.recentlyViewedSearchItemsSaveInCatalog ~= true then false else true else game:GetFastFlag("AXRecentlyViewedSearchItemsSaveInCatalog4")
		end
	}
})