local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseNavigationFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseLocalizationFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmationModalTitle = "Feature.Avatar.Title.UnsavedChanges",
		confirmationModalDescription = "Feature.Avatar.Message.LeavingComposerWithoutSave",
		confirmationModalLeftButton = "Feature.Avatar.Action.Stay",
		confirmationModalRightButton = "Feature.Avatar.Action.Leave"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.confirmationModalTitle,
		bodyText = UseLocalizationResult.confirmationModalDescription,
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
							NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
						end, { UseNavigationResult }),
						text = UseLocalizationResult.confirmationModalLeftButton
					}
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.onOverlayClosed,
						text = UseLocalizationResult.confirmationModalRightButton
					}
				}
			}
		},
		screenSize = UseSelectorResult
	})
end))))