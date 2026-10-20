local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXEnableTaxonomyM20ExposureLoggingClothing = AvatarExperienceFlagsModule.FFlagAXEnableTaxonomyM20ExposureLoggingClothing
local FFlagAXEnableTaxonomyM21ExposureLoggingClothing = AvatarExperienceFlagsModule.FFlagAXEnableTaxonomyM21ExposureLoggingClothing
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlagsModule.FFlagAXMigrateAllTabToSduiDev
local FFlagAXSortsBodyTabRecExposureLogging = AvatarExperienceFlagsModule.FFlagAXSortsBodyTabRecExposureLogging
local FStringAXSortsBodyTabRecLayerName = AvatarExperienceFlagsModule.FStringAXSortsBodyTabRecLayerName
local FStringAXTaxonomyM20ExperimentLayerName = AvatarExperienceFlagsModule.FStringAXTaxonomyM20ExperimentLayerName
local FStringAXTaxonomyM21ExperimentLayerName = AvatarExperienceFlagsModule.FStringAXTaxonomyM21ExperimentLayerName
local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommonModule.Enums.CatalogCategories
local CatalogCategoryKeys = AvatarExperienceCommonModule.Enums.CatalogCategoryKeys
local CatalogSDUICategoryIds = AvatarExperienceCommonModule.Enums.CatalogSDUICategoryIds
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper

return function(Clothing, p1, p2)
	-- upvalues: ArgCheckModule (copy), FFlagAXEnableTaxonomyM20ExposureLoggingClothing (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXMigrateAllTabToSduiDev (copy), CatalogCategoryKeys (copy), CatalogSDUICategoryIds (copy), IXPServiceWrapper (copy), FStringAXTaxonomyM20ExperimentLayerName (copy), CatalogCategories (copy), FFlagAXEnableTaxonomyM21ExposureLoggingClothing (copy), FStringAXTaxonomyM21ExperimentLayerName (copy), FFlagAXSortsBodyTabRecExposureLogging (copy), FStringAXSortsBodyTabRecLayerName (copy), GetCatalogCategoriesStoreModule (copy), MutedErrorFunction (copy)
	return function(_)
		-- upvalues: ArgCheckModule (upval), Clothing (copy), p1 (copy), p2 (copy), FFlagAXEnableTaxonomyM20ExposureLoggingClothing (upval), FFlagAXCatalogCategoriesSDUI (upval), FFlagAXMigrateAllTabToSduiDev (upval), CatalogCategoryKeys (upval), CatalogSDUICategoryIds (upval), IXPServiceWrapper (upval), FStringAXTaxonomyM20ExperimentLayerName (upval), CatalogCategories (upval), FFlagAXEnableTaxonomyM21ExposureLoggingClothing (upval), FStringAXTaxonomyM21ExperimentLayerName (upval), FFlagAXSortsBodyTabRecExposureLogging (upval), FStringAXSortsBodyTabRecLayerName (upval), GetCatalogCategoriesStoreModule (upval), MutedErrorFunction (upval)
		ArgCheckModule.isTypeOrNil(Clothing, "string", "SetCategoryAndSubcategory thunk expects category")
		ArgCheckModule.isTypeOrNil(p1, "string", "SetCategoryAndSubcategory thunk expects subcategory")
		ArgCheckModule.isType(p2, "table", "SetCategory thunk expects analytics")
		
		if FFlagAXEnableTaxonomyM20ExposureLoggingClothing then
			if FFlagAXCatalogCategoriesSDUI then
				if Clothing == (if FFlagAXMigrateAllTabToSduiDev then CatalogCategoryKeys.Clothing else CatalogSDUICategoryIds.Clothing:rawValue()) then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXTaxonomyM20ExperimentLayerName)
				end
			elseif Clothing == (if FFlagAXMigrateAllTabToSduiDev then CatalogCategoryKeys.Clothing else CatalogCategories.Clothing:rawValue()) then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXTaxonomyM20ExperimentLayerName)
			end
		end
		if FFlagAXEnableTaxonomyM21ExposureLoggingClothing then
			if FFlagAXCatalogCategoriesSDUI then
				if Clothing == (if FFlagAXMigrateAllTabToSduiDev then CatalogCategoryKeys.Clothing else CatalogSDUICategoryIds.Clothing:rawValue()) then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXTaxonomyM21ExperimentLayerName)
				end
			elseif Clothing == (if FFlagAXMigrateAllTabToSduiDev then CatalogCategoryKeys.Clothing else CatalogCategories.Clothing:rawValue()) then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXTaxonomyM21ExperimentLayerName)
			end
		end
		if FFlagAXSortsBodyTabRecExposureLogging then
			if FFlagAXCatalogCategoriesSDUI then
				if Clothing == (if FFlagAXMigrateAllTabToSduiDev then CatalogCategoryKeys.Body else CatalogSDUICategoryIds.Body:rawValue()) then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXSortsBodyTabRecLayerName)
				end
			elseif Clothing == (if FFlagAXMigrateAllTabToSduiDev then CatalogCategoryKeys.Body else CatalogCategories.Body:rawValue()) then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringAXSortsBodyTabRecLayerName)
			end
		end
		if not GetCatalogCategoriesStoreModule.getCatalogSelectionStore().changeCategory(Clothing, p1) then
			MutedErrorFunction("Failed to select subcategory in SetCategoryAndSubcategory thunk")
		end
		local CatalogSelectionStore = GetCatalogCategoriesStoreModule.getCatalogSelectionStore()
		p2.clickNavigationTab(CatalogSelectionStore.selectedCategoryId(false), (CatalogSelectionStore.selectedSubcategoryId(false)))
	end
end