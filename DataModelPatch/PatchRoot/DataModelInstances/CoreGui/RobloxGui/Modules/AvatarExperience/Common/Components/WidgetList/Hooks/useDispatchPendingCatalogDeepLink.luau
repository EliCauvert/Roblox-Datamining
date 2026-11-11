local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local GetCatalogCategoriesStoreModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

return function()
	-- upvalues: UseDispatchFunction (copy), GetCatalogCategoriesStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local CatalogCategoriesStore = GetCatalogCategoriesStoreModule.getCatalogCategoriesStore()
	local UseSignalStateResult = UseSignalStateFunction(CatalogCategoriesStore.getHasFetchedCategories)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: CatalogCategoriesStore (copy), UseSignalStateResult (copy), UseRefResult (copy), UseDispatchResult (copy)
		local GetPendingDeepLinkActionFunction = CatalogCategoriesStore.getPendingDeepLinkAction
		local ClearPendingDeepLinkActionFunction: () -> () = CatalogCategoriesStore.clearPendingDeepLinkAction
		
		if not GetPendingDeepLinkActionFunction or not ClearPendingDeepLinkActionFunction then return end
		if UseSignalStateResult and not UseRefResult.current then
			local PendingDeepLinkAction = GetPendingDeepLinkActionFunction(false)
			
			if PendingDeepLinkAction then
				UseRefResult.current = true
				UseDispatchResult(PendingDeepLinkAction)
				ClearPendingDeepLinkActionFunction()
			end
		end
	end, {
		UseSignalStateResult,
		CatalogCategoriesStore,
		UseDispatchResult
	})
end