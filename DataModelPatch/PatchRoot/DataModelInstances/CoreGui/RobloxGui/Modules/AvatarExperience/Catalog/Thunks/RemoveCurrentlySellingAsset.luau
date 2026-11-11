local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UpdateUserAssetPriceModule = require(Modules.AvatarExperience.Catalog.Actions.UpdateUserAssetPrice)
local RemoveCurrentlySellingAssetModule = require(Modules.AvatarExperience.Catalog.Actions.RemoveCurrentlySellingAsset)
local AddAvailableToSellAssetModule = require(Modules.AvatarExperience.Catalog.Actions.AddAvailableToSellAsset)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.RemoveCurrentlySellingAssetKey .. tostring(p1)
end

local config = {
	toastMessage = "Feature.Catalog.Heading.ItemRemoved",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).SuccessConfirmation
}

return function(p1, p2, p3, p4)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), UpdateUserAssetPriceModule (copy), AddAvailableToSellAssetModule (copy), RemoveCurrentlySellingAssetModule (copy), SetCurrentToastMessageModule (copy), config (copy), PromiseModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p5)
		-- upvalues: ArgCheckModule (upval), p2 (copy), p4 (copy), p3 (copy), PerformFetch (upval), CatalogConstantsModule (upval), WebApiModule (upval), p1 (copy), UpdateUserAssetPriceModule (upval), AddAvailableToSellAssetModule (upval), RemoveCurrentlySellingAssetModule (upval), SetCurrentToastMessageModule (upval), config (upval), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
		ArgCheckModule.isType(p2, "string", "RemoveCurrentlySellingAsset thunk expects assetId to be a string")
		ArgCheckModule.isType(p4, "string", "RemoveCurrentlySellingAsset thunk expects userId to be a string")
		ArgCheckModule.isType(p3, "string", "RemoveCurrentlySellingAsset thunk expects userAssetId to be a string")
		
		return PerformFetch.Single(CatalogConstantsModule.RemoveCurrentlySellingAssetKey .. tostring(p3), function(p6)
			-- upvalues: WebApiModule (upval), p1 (upval), p2 (upval), p3 (upval), UpdateUserAssetPriceModule (upval), AddAvailableToSellAssetModule (upval), RemoveCurrentlySellingAssetModule (upval), SetCurrentToastMessageModule (upval), config (upval), PromiseModule (upval), SetNetworkingErrorToastModule (upval)
			return WebApiModule.RemoveCurrentlySellingAsset(p1, p2, p3):andThen(function(_)
				-- upvalues: p6 (copy), UpdateUserAssetPriceModule (upval), p3 (upval), AddAvailableToSellAssetModule (upval), p2 (upval), RemoveCurrentlySellingAssetModule (upval), SetCurrentToastMessageModule (upval), config (upval), PromiseModule (upval)
				p6:dispatch(UpdateUserAssetPriceModule(p3, nil))
				p6:dispatch(AddAvailableToSellAssetModule(p2, p3))
				p6:dispatch(RemoveCurrentlySellingAssetModule(p2, p3))
				p6:dispatch(SetCurrentToastMessageModule(config))
				
				return PromiseModule.resolve()
			end, function(p7)
				-- upvalues: p6 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
				p6:dispatch(SetNetworkingErrorToastModule(p7))
				
				return PromiseModule.reject(p7)
			end)
		end)(p5)
	end
end