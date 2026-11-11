local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.LuauPolyfill)
local PromiseModule = require(CorePackages.Packages.Promise)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RoactNetworkingModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)
local GetCatalogCategoriesModule = require(Modules.AvatarExperience.Catalog.GetCatalogCategories)
local CatalogCategoryDiffUtilsModule = require(Modules.AvatarExperience.Common.Debug.CatalogCategoryDiffUtils)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local Api = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Api
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local FFlagAXCatalogCategoriesSDUIDebugDiff = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUIDebugDiff
local FFlagAXCatalogCategoriesSDUILinks = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUILinks

return function()
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworkingModule (copy), FFlagAXCatalogCategoriesSDUILinks (copy), UseDispatchFunction (copy), ReactModule (copy), GetCatalogCategoriesStoreModule (copy), FFlagAXCatalogCategoriesSDUI (copy), PromiseModule (copy), Api (copy), Logging (copy), GetCatalogCategoriesModule (copy), FFlagAXCatalogCategoriesSDUIDebugDiff (copy), CatalogCategoryDiffUtilsModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseDispatchResult = if FFlagAXCatalogCategoriesSDUILinks then UseDispatchFunction() else nil
	
	return (ReactModule.useCallback(function(p1)
		-- upvalues: GetCatalogCategoriesStoreModule (upval), FFlagAXCatalogCategoriesSDUI (upval), PromiseModule (upval), Api (upval), UseRoactServiceResult (copy), Logging (upval), GetCatalogCategoriesModule (upval), FFlagAXCatalogCategoriesSDUIDebugDiff (upval), CatalogCategoryDiffUtilsModule (upval), FFlagAXCatalogCategoriesSDUILinks (upval), UseDispatchResult (copy)
		local CatalogCategoriesStore = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore()
		
		if FFlagAXCatalogCategoriesSDUI and CatalogCategoriesStore.getHasFetchedCategories(false) and not p1 then
			return PromiseModule.resolve(nil)
		else
			local CatalogCategories, _ = Api.getCatalogCategories(UseRoactServiceResult, 1)
			
			return (CatalogCategories:andThen(function(Result)
				-- upvalues: Logging (upval), GetCatalogCategoriesModule (upval), FFlagAXCatalogCategoriesSDUIDebugDiff (upval), CatalogCategoryDiffUtilsModule (upval), CatalogCategoriesStore (copy), FFlagAXCatalogCategoriesSDUILinks (upval), UseDispatchResult (upval)
				if not Result then
					Logging.warn("fetchCatalogCategories: categoriesResponse is nil")
					
					return
				end
				local CatalogCategoriesModule = GetCatalogCategoriesModule()
				
				if FFlagAXCatalogCategoriesSDUIDebugDiff then
					CatalogCategoryDiffUtilsModule.logCategoryDifferences(Result, CatalogCategoriesModule)
				end
				local List = { CatalogCategoriesModule[1] }
				
				for _, value in Result do
					if value.Id ~= "1" then
						table.insert(List, value)
					end
				end
				CatalogCategoriesStore.setCategories(List)
				
				if FFlagAXCatalogCategoriesSDUILinks then
					local SetHasFetchedCategoriesResult = CatalogCategoriesStore.setHasFetchedCategories(true)
					
					if FFlagAXCatalogCategoriesSDUILinks and SetHasFetchedCategoriesResult and UseDispatchResult then
						UseDispatchResult(SetHasFetchedCategoriesResult)
					end
				end
				return List
			end):catch(function(Err)
				-- upvalues: Logging (upval), FFlagAXCatalogCategoriesSDUI (upval)
				Logging.warn("fetchCatalogCategories error: " .. tostring(Err))
				
				if FFlagAXCatalogCategoriesSDUI then
					error(Err)
				end
			end))
		end
	end, { UseRoactServiceResult }))
end