local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UpdateCollectibleResellableInstanceModule = require(Modules.AvatarExperience.Catalog.Actions.UpdateCollectibleResellableInstance)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local _ = require(Modules.AvatarExperience.Common.Models.CollectibleInstance)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)

local function _(p1): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.UpdateCollectibleInstanceResaleStateKey .. tostring(p1)
end

local config = {
	toastMessage = "Feature.Catalog.Response.PlacedOnSaleSuccess",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}
local config1 = {
	toastMessage = "Feature.Catalog.Response.TakenOffSaleSuccess",
	isLocalized = false,
	toastType = ToastTypeModule.SuccessConfirmation
}

local _ = function(p1, p2, p3)
	local CollectiblesResellableInstances = p1.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
	
	return if CollectiblesResellableInstances[p2] then CollectiblesResellableInstances[p2][p3] else nil
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), PromiseModule (copy), WebApiModule (copy), UpdateCollectibleResellableInstanceModule (copy), config (copy), config1 (copy), SetCurrentToastMessageModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p6)
		-- upvalues: PerformFetch (upval), p3 (copy), CatalogConstantsModule (upval), p2 (copy), PromiseModule (upval), WebApiModule (upval), p1 (copy), p5 (copy), p4 (copy), UpdateCollectibleResellableInstanceModule (upval), config (upval), config1 (upval), SetCurrentToastMessageModule (upval), SetNetworkingErrorToastModule (upval)
		return PerformFetch.Single(CatalogConstantsModule.UpdateCollectibleInstanceResaleStateKey .. tostring(p3), function(p7)
			-- upvalues: p2 (upval), p3 (upval), PromiseModule (upval), WebApiModule (upval), p1 (upval), p5 (upval), p4 (upval), UpdateCollectibleResellableInstanceModule (upval), config (upval), config1 (upval), SetCurrentToastMessageModule (upval), SetNetworkingErrorToastModule (upval)
			local State = p7:getState()
			local LocalUserId = State.LocalUserId
			local CollectiblesResellableInstances = State.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
			local CollectiblesResellableInstanceEntry = if CollectiblesResellableInstances[p2] then CollectiblesResellableInstances[p2][p3] else nil
			
			return if CollectiblesResellableInstanceEntry == nil then PromiseModule.reject("Unable to find collectible instance") else WebApiModule.UpdateCollectibleInstanceResaleState(p1, p2, p3, CollectiblesResellableInstanceEntry.collectibleProductId, p5, p4, LocalUserId):andThen(function(_)
				-- upvalues: p7 (copy), p2 (upval), p3 (upval), p5 (upval), p4 (upval), UpdateCollectibleResellableInstanceModule (upval), config (upval), config1 (upval), SetCurrentToastMessageModule (upval), PromiseModule (upval)
				local CollectiblesResellableInstances = p7:getState().AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
				local CollectiblesResellableInstanceEntry = if CollectiblesResellableInstances[p2] then CollectiblesResellableInstances[p2][p3] else nil
				
				if CollectiblesResellableInstanceEntry then
					CollectiblesResellableInstanceEntry.price = p5 or CollectiblesResellableInstanceEntry.price
					CollectiblesResellableInstanceEntry.saleState = if p4 then "OnSale" else "OffSale"
					p7:dispatch(UpdateCollectibleResellableInstanceModule(p2, p3, CollectiblesResellableInstanceEntry))
				end
				p7:dispatch(SetCurrentToastMessageModule(if p4 then config else config1))
				
				return PromiseModule.resolve()
			end, function(p8)
				-- upvalues: p7 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
				p7:dispatch(SetNetworkingErrorToastModule(p8))
				
				return PromiseModule.reject(p8)
			end)
		end)(p6)
	end
end