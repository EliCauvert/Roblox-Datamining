local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local FaceAnimatorService = game:GetService("FaceAnimatorService")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UsePreviousFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local ResetSortAndFiltersModule = require(Modules.AvatarExperience.Catalog.Actions.ResetSortAndFilters)
local ResetSortAndFiltersThunkModule = require(Modules.AvatarExperience.Catalog.Thunks.ResetSortAndFiltersThunk)
local StoreAndClearTryOnsModule = require(Modules.AvatarExperience.Common.Thunks.StoreAndClearTryOns)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetCameraButtonStatusFunction = AvatarExperienceRoduxModule.Actions.SetCameraButtonStatus
local SetCameraButtonErrorOccurredFunction = AvatarExperienceRoduxModule.Actions.SetCameraButtonErrorOccurred
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local FFlagAXMISEnableMultiShopping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GetCameraOptInFunction = require(CorePackages.Workspace.Packages.CameraOptIn).getCameraOptIn
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local UniversalAppCameraIXPTestModule = require(Modules.AvatarExperience.Flags.UniversalAppCameraIXPTest)
local FFlagAXResetAnalyticsMetadataOnFilterResetModule = require(Modules.AvatarExperience.Flags.FFlagAXResetAnalyticsMetadataOnFilterReset)
local AxTransition = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.transition")
local config = {
	toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}
local VideoEnabled = nil

return function(_)
	-- upvalues: UseDispatchFunction (copy), FFlagSignalsNavP3gAvatarExperience (copy), UseSignalStateFunction (copy), UtilsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UsePreviousFunction (copy), UseAvatarRouteFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), IxpUtilsModule (copy), UniversalAppCameraIXPTestModule (copy), AxTransition (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShopping (copy), StoreAndClearTryOnsModule (copy), FFlagAXResetAnalyticsMetadataOnFilterResetModule (copy), ResetSortAndFiltersThunkModule (copy), ResetSortAndFiltersModule (copy), GetCameraOptInFunction (copy), VideoEnabled (ref), FaceAnimatorService (copy), SetCameraButtonStatusFunction (copy), SetCameraButtonErrorOccurredFunction (copy), SetCurrentToastMessageModule (copy), config (copy), MutedErrorModule (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = if FFlagSignalsNavP3gAvatarExperience then UseSignalStateFunction(UtilsModule.getIsAvatarExperienceRoute()) else UseSelectorFunction(UtilsModule.isAvatarExperienceRoute, GetUseSelectorDeepEqualsFunction())
	local UsePreviousResult = UsePreviousFunction(UseSignalStateResult)
	local UsePreviousResult1 = UsePreviousFunction((UseAvatarRouteFunction()))
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseTestVariablesResult = IxpUtilsModule.useTestVariables(UniversalAppCameraIXPTestModule.EnabledForUser)
	
	local function onLeaveAvatarExperience()
		-- upvalues: AxTransition (upval), UsePreviousResult1 (copy), AvatarScreenProperties (upval), FFlagAXMISEnableMultiShopping (upval), UseDispatchResult (copy), StoreAndClearTryOnsModule (upval), FFlagAXResetAnalyticsMetadataOnFilterResetModule (upval), ResetSortAndFiltersThunkModule (upval), ResetSortAndFiltersModule (upval)
		AxTransition:debug("Leaving AvatarExperience")
		local Name = if UsePreviousResult1 then UsePreviousResult1.opaque.name else nil
		local IsMultiTryOn = Name and (AvatarScreenProperties[Name] and AvatarScreenProperties[Name].isMultiTryOn)
		
		if not FFlagAXMISEnableMultiShopping and IsMultiTryOn then
			UseDispatchResult(StoreAndClearTryOnsModule())
		end
		if FFlagAXResetAnalyticsMetadataOnFilterResetModule then
			UseDispatchResult(ResetSortAndFiltersThunkModule())
			
			return
		else
			UseDispatchResult(ResetSortAndFiltersModule())
		end
	end
	
	local function _()
		-- upvalues: AxTransition (upval)
		AxTransition:debug("Entering AvatarExperience")
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), UseSignalStateResult (copy), onLeaveAvatarExperience (copy), UseTestVariablesResult (copy), UtilsModule (upval), GetCameraOptInFunction (upval), UseRoactServiceModuleResult (copy), VideoEnabled (upval), FaceAnimatorService (upval), UseDispatchResult (copy), SetCameraButtonStatusFunction (upval), SetCameraButtonErrorOccurredFunction (upval), SetCurrentToastMessageModule (upval), config (upval), MutedErrorModule (upval), AxTransition (upval)
		if UsePreviousResult and not UseSignalStateResult then
			onLeaveAvatarExperience()
			
			return
		end
		if UseSignalStateResult and not UsePreviousResult then
			if UseTestVariablesResult and UtilsModule.isUserCameraEligible() then
				GetCameraOptInFunction(UseRoactServiceModuleResult, true):andThen(function(Result)
					-- upvalues: VideoEnabled (upval), FaceAnimatorService (upval), UseDispatchResult (upval), SetCameraButtonStatusFunction (upval), SetCameraButtonErrorOccurredFunction (upval), SetCurrentToastMessageModule (upval), config (upval), MutedErrorModule (upval)
					if VideoEnabled ~= Result then
						FaceAnimatorService:Init(Result, false)
						FaceAnimatorService.TrackerError:Connect(function(p1)
							-- upvalues: UseDispatchResult (upval), SetCameraButtonStatusFunction (upval), SetCameraButtonErrorOccurredFunction (upval), SetCurrentToastMessageModule (upval), config (upval), MutedErrorModule (upval)
							UseDispatchResult(SetCameraButtonStatusFunction(false))
							UseDispatchResult(SetCameraButtonErrorOccurredFunction(true))
							UseDispatchResult(SetCurrentToastMessageModule(config))
							MutedErrorModule(string.format("Universal App Camera FaceAnimatorService TrackerError: %s", (tostring(p1))))
						end)
						VideoEnabled = Result
					end
				end)
			end
			AxTransition:debug("Entering AvatarExperience")
		end
	end, {
		UseSignalStateResult,
		UsePreviousResult,
		UsePreviousResult1
	})
	
	return nil
end