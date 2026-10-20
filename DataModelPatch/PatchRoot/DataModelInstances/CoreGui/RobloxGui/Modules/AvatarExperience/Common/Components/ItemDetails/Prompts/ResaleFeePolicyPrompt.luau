local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

return require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), UseLocalizationFunction (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end, GetUseSelectorDeepEqualsFunction())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.navigation)
	end, { p1.navigation })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Catalog.Label.ResaleFeePolicy",
		bodyText = "Feature.Catalog.Message.ResaleFeePolicy",
		gotItButtonText = "Feature.Avatar.Action.GotIt"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText:gsub("({yourSharePercent})", p1.navigation.state.params.yourSharePercent):gsub("({robloxFeePercent})", p1.navigation.state.params.robloxFeePercent),
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.gotItButtonText
					}
				}
			}
		},
		screenSize = UseSelectorResult
	})
end)