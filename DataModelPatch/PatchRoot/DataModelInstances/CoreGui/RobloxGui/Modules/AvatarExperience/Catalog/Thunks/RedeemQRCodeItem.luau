local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(CorePackages.Packages.Promise)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local SetAssetOwnedModule = require(Modules.AvatarExperience.Common.Actions.SetAssetOwned)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local config = { HttpError = Enum.HttpError.OK }
local config1 = {
	toastMessage = "Feature.Catalog.Label.Redeemed",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config2 = {
	toastMessage = "Feature.Catalog.Label.NotAvailable",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config3 = {
	toastMessage = "Feature.Catalog.Label.AlreadyOwned",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.RedeemQRCodeItemKey .. tostring(p1)
end

return function(p1, p2, p3, p4)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), FetchAssetOrBundleInfoModule (copy), ItemDataModule (copy), SetCurrentToastMessageModule (copy), config3 (copy), PromiseModule (copy), WebApiModule (copy), SetAssetOwnedModule (copy), config1 (copy), config (copy), Logging (copy), SetNetworkingErrorToastModule (copy), config2 (copy)
	return PerformFetch.Single(CatalogConstantsModule.RedeemQRCodeItemKey .. tostring(p3), function(p5)
		-- upvalues: FetchAssetOrBundleInfoModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), ItemDataModule (upval), SetCurrentToastMessageModule (upval), config3 (upval), PromiseModule (upval), WebApiModule (upval), SetAssetOwnedModule (upval), config1 (upval), config (upval), Logging (upval), SetNetworkingErrorToastModule (upval), config2 (upval)
		return p5:dispatch(FetchAssetOrBundleInfoModule(p1, p2, p3, p4)):andThen(function()
			-- upvalues: ItemDataModule (upval), p5 (copy), p3 (upval), p4 (upval), SetCurrentToastMessageModule (upval), config3 (upval), PromiseModule (upval), WebApiModule (upval), p1 (upval), SetAssetOwnedModule (upval), config1 (upval), config (upval), Logging (upval), SetNetworkingErrorToastModule (upval), config2 (upval)
			local ItemDataModuleResult = ItemDataModule(p5:getState().AvatarExperience.Common, p3, p4)
			
			if ItemDataModuleResult and ItemDataModuleResult.isOwned then
				p5:dispatch(SetCurrentToastMessageModule(config3))
				
				return PromiseModule.resolve()
			else
				return WebApiModule.RedeemQRCodeItem(p1, p3):andThen(function(Result)
					-- upvalues: p5 (upval), SetAssetOwnedModule (upval), p3 (upval), SetCurrentToastMessageModule (upval), config1 (upval), PromiseModule (upval), config (upval), Logging (upval), SetNetworkingErrorToastModule (upval)
					local ResponseBody = Result.responseBody
					
					if type(ResponseBody) == "table" and ResponseBody.success == true then
						p5:dispatch(SetAssetOwnedModule(p3, true))
						p5:dispatch(SetCurrentToastMessageModule(config1))
						
						return PromiseModule.resolve()
					else
						Logging.warn("Response from RedeemQRCodeItem is malformed!")
						p5:dispatch(SetNetworkingErrorToastModule(config))
						
						return PromiseModule.reject(config)
					end
				end, function(p6)
					-- upvalues: config (upval), p5 (upval), SetCurrentToastMessageModule (upval), config2 (upval), PromiseModule (upval)
					if type(p6) ~= "table" or p6.HttpError == nil then
						p6 = config
					end
					p5:dispatch(SetCurrentToastMessageModule(config2))
					
					return PromiseModule.reject(p6)
				end)
			end
		end)
	end)
end