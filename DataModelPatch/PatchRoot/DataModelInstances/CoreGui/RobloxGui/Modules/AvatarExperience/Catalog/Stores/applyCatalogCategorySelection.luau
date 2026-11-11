local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CatalogActiveSelectionStoreRefModule = require(Modules.AvatarExperience.Catalog.Stores.catalogActiveSelectionStoreRef)
local LogEditorTaxonomyExposureIfApplicableFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.logEditorTaxonomyExposureIfApplicable
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)

return function(Callback, p1, p2, p3)
	-- upvalues: LogEditorTaxonomyExposureIfApplicableFunction (copy), CatalogActiveSelectionStoreRefModule (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), MutedErrorFunction (copy)
	if p3.source == "EditorShopForMore" then
		LogEditorTaxonomyExposureIfApplicableFunction(p1)
	end
	local CallbackResult = nil
	if p3.source == "SduiTap" then
		local ActiveStoreRefResult = CatalogActiveSelectionStoreRefModule.activeStoreRef(false)
		
		if ActiveStoreRefResult then
			CallbackResult = ActiveStoreRefResult
		else
			SendAXCounterV2Function(ConstantsModule.Counter.Errors.SduiTapActiveStoreMissing)
			CallbackResult = Callback()
		end
	else
		CallbackResult = Callback()
	end
	if not CallbackResult.changeCategory(p1, p2) then
		MutedErrorFunction(`Failed to select catalog category (source={p3.source})`)
	end
	if p3.analytics then
		p3.analytics.clickNavigationTab(CallbackResult.selectedCategoryId(false), (CallbackResult.selectedSubcategoryId(false)))
	end
end