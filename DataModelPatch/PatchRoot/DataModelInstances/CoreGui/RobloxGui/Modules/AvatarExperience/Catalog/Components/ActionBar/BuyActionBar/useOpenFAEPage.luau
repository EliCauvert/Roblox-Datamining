local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local NavigateBackFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateBack
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local StartFacialAgeEstimationFunction = require(CorePackages.Workspace.Packages.SocialUpsell).Thunks.startFacialAgeEstimation
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local GetFaeFeatureAccessStoreModule = require(Modules.AvatarExperience.Catalog.Stores.GetFaeFeatureAccessStore)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AXFaeFeatureAccessRefetchDelayMs = game:DefineFastInt("AXFaeFeatureAccessRefetchDelayMs", 0)
local AXEnableFaeSuccessToastDurationSeconds = game:DefineFastFlag("AXEnableFaeSuccessToastDurationSeconds", false)
local AXFaeFeatureAccessToastDurationSeconds = game:DefineFastInt("AXFaeFeatureAccessToastDurationSeconds", 3)

return function(p1, p2, p3, p4, ItemName)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), StartFacialAgeEstimationFunction (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), AXEnableFaeSuccessToastDurationSeconds (copy), AXFaeFeatureAccessToastDurationSeconds (copy), AXFaeFeatureAccessRefetchDelayMs (copy), GetFaeFeatureAccessStoreModule (copy), ToggleTryOnThunkModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		ageVerificationComplete = {
			"Feature.MarketplaceFAEUpsell.Message.AgeCheckCompleteItem",
			itemName = ItemName
		}
	})
	
	return ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), StartFacialAgeEstimationFunction (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (copy), ToastTypeModule (upval), AXEnableFaeSuccessToastDurationSeconds (upval), AXFaeFeatureAccessToastDurationSeconds (upval), AXFaeFeatureAccessRefetchDelayMs (upval), GetFaeFeatureAccessStoreModule (upval), UseRoactServiceModuleResult (copy), p4 (copy), p3 (copy), p1 (copy), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult1 (copy), p2 (copy), UseAvatarRouteResult (copy), UseNavigationResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackFunction (upval)
		UseDispatchResult(StartFacialAgeEstimationFunction("MarketplaceUpsell", function()
			-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageModule (upval), UseLocalizationResult (upval), ToastTypeModule (upval), AXEnableFaeSuccessToastDurationSeconds (upval), AXFaeFeatureAccessToastDurationSeconds (upval), AXFaeFeatureAccessRefetchDelayMs (upval), GetFaeFeatureAccessStoreModule (upval), UseRoactServiceModuleResult (upval), p4 (upval), p3 (upval), p1 (upval), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult1 (upval), p2 (upval), UseAvatarRouteResult (upval), UseNavigationResult (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateBackFunction (upval)
			UseDispatchResult(SetCurrentToastMessageModule({
				isLocalized = true,
				toastMessage = UseLocalizationResult.ageVerificationComplete,
				toastType = ToastTypeModule.SuccessConfirmation,
				duration = if AXEnableFaeSuccessToastDurationSeconds then AXFaeFeatureAccessToastDurationSeconds else nil
			}))
			task.delay(AXFaeFeatureAccessRefetchDelayMs / 1000, function()
				-- upvalues: GetFaeFeatureAccessStoreModule (upval), UseRoactServiceModuleResult (upval)
				GetFaeFeatureAccessStoreModule.getFaeFeatureAccessStore().fetch(UseRoactServiceModuleResult)
			end)
			
			if p4 and p3 and p1 then
				UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult1, p2, p3, p1, false, UseAvatarRouteResult, UseNavigationResult, nil))
			end
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				UseDispatchResult(NavigateBackFunction())
			end
		end, function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				UseDispatchResult(NavigateBackFunction())
			end
		end, "MarketplaceUpsell"))
	end, {
		UseDispatchResult, UseLocalizationResult, UseRoactServiceModuleResult,
		UseRoactServiceModuleResult1, UseAvatarRouteResult, UseNavigationResult, p1,
		p2, p3, p4
	})
end