local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local DeleteAvatarModule = require(Modules.AvatarExperience.Catalog.Thunks.DeleteAvatar)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseLocalizationModule (copy), ReactModule (copy), UseSelectorFunction (copy), NavigationUtilsModule (copy), DeleteAvatarModule (copy), AvatarScreen (copy), ConstantsModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseLocalizationModuleResult = UseLocalizationModule({
		titleText = "Feature.Catalog.Action.DeleteAvatar",
		messageText = "Feature.Catalog.Label.DeleteAvatarConfirmationPromptMessage",
		deleteButtonText = "Feature.Catalog.Action.Delete",
		cancelButtonText = "Feature.Catalog.Action.Cancel"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return RoactModule.createElement(InteractiveAlert, {
		title = UseLocalizationModuleResult.titleText,
		bodyText = UseLocalizationModuleResult.messageText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
							NavigationUtilsModule.closeOverlay(UseNavigationResult)
						end, { UseNavigationResult }),
						text = UseLocalizationModuleResult.cancelButtonText
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: UseStateResult2 (copy), p1 (copy), UseRoactServiceModuleResult1 (copy), UseDispatchResult (copy), DeleteAvatarModule (upval), UseRoactServiceModuleResult (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), ConstantsModule (upval)
							UseStateResult2(true)
							local OnOverlayClosedFunction = p1.onOverlayClosed
							UseDispatchResult(DeleteAvatarModule(UseRoactServiceModuleResult, p1.lookId)):andThen(function()
								-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (upval), OnOverlayClosedFunction (copy), AvatarScreen (upval)
								NavigationUtilsModule.closeOverlay(UseNavigationResult)
								OnOverlayClosedFunction()
								NavigationUtilsModule.closeTryOnManager(UseNavigationResult, { AvatarScreen.LookDetails })
							end):catch(function(_)
								-- upvalues: UseRoactServiceModuleResult1 (copy), ConstantsModule (upval)
								UseRoactServiceModuleResult1.sendAXCounterV2(ConstantsModule.Counter.MySharedAvatars.MySharedAvatarsDeleteAvatarError)
							end):finally(function()
								-- upvalues: UseStateResult2 (upval)
								UseStateResult2(false)
							end)
						end, {
							p1.lookId, p1.onOverlayClosed, UseRoactServiceModuleResult,
							UseRoactServiceModuleResult1, UseNavigationResult, UseStateResult
						}),
						text = UseLocalizationModuleResult.deleteButtonText,
						isLoading = UseStateResult
					}
				}
			}
		},
		screenSize = UseSelectorFunction(function(p2)
			return p2.ScreenSize
		end)
	})
end))))