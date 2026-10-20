local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseSelectorFunction (copy), selectScreenSize (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), NavigationUtilsModule (copy), UseLocalizationFunction (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseSelectorResult = UseSelectorFunction(selectScreenSize, GetUseSelectorDeepEqualsFunction())
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.navigation)
	end, { p1.navigation })
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = "Feature.Catalog.Label.NewCollectibles",
		bodyText = "Feature.Catalog.Message.CollectiblesInfo",
		okButtonText = "CommonUI.Messages.Action.OK"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.okButtonText
					}
				}
			}
		},
		screenSize = UseSelectorResult
	})
end)