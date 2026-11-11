local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local NavigateWithLockFunction = AvatarExperienceNavigationModule.Thunks.NavigateWithLock
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local ApplyCatalogCategorySelectionModule = require(Modules.AvatarExperience.Catalog.Stores.applyCatalogCategorySelection)
local GetCatalogCategoriesStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return {
	useNavigateToCatalogCategory = function()
		-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), ReactModule (copy), ApplyCatalogCategorySelectionModule (copy), GetCatalogCategoriesStoreModule (copy), NavigateWithLockFunction (copy), AvatarScreen (copy)
		local UseDispatchResult = UseDispatchFunction()
		local UseNavigationResult = UseNavigationFunction()
		
		return (ReactModule.useMemo(function()
			-- upvalues: UseDispatchResult (copy), UseNavigationResult (copy), ApplyCatalogCategorySelectionModule (upval), GetCatalogCategoriesStoreModule (upval), NavigateWithLockFunction (upval), AvatarScreen (upval)
			return function(p1, p2)
				-- upvalues: ApplyCatalogCategorySelectionModule (upval), GetCatalogCategoriesStoreModule (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseNavigationResult (copy), AvatarScreen (upval)
				ApplyCatalogCategorySelectionModule(GetCatalogCategoriesStoreModule.getCatalogSelectionStore, p1.CategoryId, p1.SubcategoryId, {
					source = "EditorShopForMore",
					analytics = p2 and p2.analytics
				})
				UseDispatchResult(NavigateWithLockFunction(function()
					-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), p2 (copy)
					if UseNavigationResult then
						UseNavigationResult.navigate(AvatarScreen.Catalog)
					end
					if p2 and p2.onAfterNavigate then
						p2.onAfterNavigate()
					end
				end))
			end
		end, { UseDispatchResult, UseNavigationResult }))
	end,
	makeNavigateToCatalogCategory = function(p1, p2)
		-- upvalues: ApplyCatalogCategorySelectionModule (copy), GetCatalogCategoriesStoreModule (copy), NavigateWithLockFunction (copy), AvatarScreen (copy)
		return function(p3, p4)
			-- upvalues: ApplyCatalogCategorySelectionModule (upval), GetCatalogCategoriesStoreModule (upval), p1 (copy), NavigateWithLockFunction (upval), p2 (copy), AvatarScreen (upval)
			ApplyCatalogCategorySelectionModule(GetCatalogCategoriesStoreModule.getCatalogSelectionStore, p3.CategoryId, p3.SubcategoryId, {
				source = "EditorShopForMore",
				analytics = p4 and p4.analytics
			})
			p1(NavigateWithLockFunction(function()
				-- upvalues: p2 (upval), AvatarScreen (upval), p4 (copy)
				if p2 then
					p2.navigate(AvatarScreen.Catalog)
				end
				if p4 and p4.onAfterNavigate then
					p4.onAfterNavigate()
				end
			end))
		end
	end
}