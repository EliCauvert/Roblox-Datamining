local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return ReactModule.createElement(InteractiveAlert, {
		title = p1.navigation.state.params.titleText,
		bodyText = p1.navigation.state.params.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: NavigationUtilsModule (upval), p1 (copy)
							NavigationUtilsModule.closeOverlay(p1.navigation)
						end, { p1.navigation }),
						text = p1.navigation.state.params.buttonText
					}
				}
			}
		},
		screenSize = UseSelectorFunction(function(p2)
			return p2.ScreenSize
		end, GetUseSelectorDeepEqualsFunction())
	})
end)