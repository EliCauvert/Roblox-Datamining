local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local WebApiModule = require(Modules.AvatarExperience.Catalog.Http.WebApi)
local _ = require(Modules.AvatarExperience.Common.Types)
local AddLookDetailsModule = require(Modules.AvatarExperience.Common.Actions.AddLookDetails)
local TryOnLooksOutfitFunction = AvatarExperienceRoduxModule.Actions.TryOnLooksOutfit
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local PromiseModule = require(Modules.LuaApp.Promise)
local CryoModule = require(CorePackages.Packages.Cryo)

local function _(Text): string
	-- upvalues: CatalogConstantsModule (copy)
	return CatalogConstantsModule.FetchLookDetailInfoKey .. Text
end

return function(p1, p2, AnalyticsInfo, LookId)
	-- upvalues: PerformFetch (copy), CatalogConstantsModule (copy), WebApiModule (copy), Logging (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), AddLookDetailsModule (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), TryOnLooksOutfitFunction (copy), CryoModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), NavigateWithLockFunction (copy), PromiseModule (copy)
	return function(p3)
		-- upvalues: PerformFetch (upval), LookId (copy), CatalogConstantsModule (upval), WebApiModule (upval), p1 (copy), Logging (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), AddLookDetailsModule (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), TryOnLooksOutfitFunction (upval), AnalyticsInfo (copy), CryoModule (upval), p2 (copy), NavigationUtilsModule (upval), AvatarScreen (upval), NavigateWithLockFunction (upval), PromiseModule (upval)
		return PerformFetch.Single(CatalogConstantsModule.FetchLookDetailInfoKey .. LookId, function(p4)
			-- upvalues: WebApiModule (upval), p1 (upval), LookId (upval), Logging (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), AddLookDetailsModule (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), TryOnLooksOutfitFunction (upval), AnalyticsInfo (upval), CryoModule (upval), p2 (upval), NavigationUtilsModule (upval), AvatarScreen (upval), NavigateWithLockFunction (upval), PromiseModule (upval)
			return WebApiModule.GetLookDetails(p1, LookId):andThen(function(Result)
				-- upvalues: Logging (upval), p4 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), AddLookDetailsModule (upval), LookId (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), TryOnLooksOutfitFunction (upval), AnalyticsInfo (upval), CryoModule (upval), p2 (upval), NavigationUtilsModule (upval), AvatarScreen (upval), NavigateWithLockFunction (upval), PromiseModule (upval)
				local Look = Result.responseBody.look
				
				if Look == nil then
					Logging.warn("Unexpectedly received an empty response from Look Details")
					p4:dispatch(SetCurrentToastMessageModule({
						isLocalized = false,
						toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
						toastType = ToastTypeModule.NetworkingError
					}))
					
					return
				end
				p4:dispatch(AddLookDetailsModule(LookId, Look.totalPrice, Look.totalPremiumPrice, Look.items))
				local AssetItemIdTypeAndSubtype = {}
				
				for _, item in Look.items do
					table.insert(AssetItemIdTypeAndSubtype, {
						itemType = "Asset",
						itemSubType = tostring(item.assetType),
						itemId = tostring(item.id)
					})
				end
				p4:dispatch(SetTryOnManagerPeekViewStateFunction(PeekViewState.SuperBrief))
				p4:dispatch(TryOnLooksOutfitFunction({
					assetItemIdTypeAndSubtype = AssetItemIdTypeAndSubtype,
					lookId = LookId,
					analyticsInfo = AnalyticsInfo,
					lookType = CryoModule.None
				}))
				
				if p2 ~= nil then
					p4:dispatch(NavigateWithLockFunction(function()
						-- upvalues: NavigationUtilsModule (upval), p2 (upval), AvatarScreen (upval)
						NavigationUtilsModule.closeFiltersAndItemDetails(p2)
						NavigationUtilsModule.closeTryOnManager(p2, { AvatarScreen.LookDetails })
						p2.navigate(AvatarScreen.TryOnManager)
					end))
				end
				return PromiseModule.resolve()
			end, function(_)
				-- upvalues: Logging (upval), p4 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval)
				Logging.warn("Error in TryOnLook thunk")
				p4:dispatch(SetCurrentToastMessageModule({
					isLocalized = false,
					toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
					toastType = ToastTypeModule.NetworkingError
				}))
			end)
		end)(p3)
	end
end