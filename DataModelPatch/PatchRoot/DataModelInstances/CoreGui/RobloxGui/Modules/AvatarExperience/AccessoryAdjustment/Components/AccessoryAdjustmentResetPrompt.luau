local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Overlay = UIBloxModule.App.Dialog.Overlay
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), Focusable (copy), Overlay (copy), InteractiveAlert (copy), NavigationUtilsModule (copy), ButtonType (copy)
	local FeatureAvatarTitleResetToDefault = UseLocalizationFunction({
		title = "Feature.Avatar.Title.ResetToDefault",
		cancel = "Feature.Avatar.Action.Cancel",
		reset = "Feature.Avatar.Action.Reset",
		bodyText = "Feature.Avatar.Message.ResetAdjustment"
	})
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Overlay = ReactModule.createElement(Overlay, { ZIndex = -1, showGradient = false }),
		InteractiveAlert = ReactModule.createElement(InteractiveAlert, {
			title = FeatureAvatarTitleResetToDefault.title,
			bodyText = FeatureAvatarTitleResetToDefault.bodyText,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = function()
								-- upvalues: NavigationUtilsModule (upval), p1 (copy)
								NavigationUtilsModule.closeOverlay(p1.navigation)
							end,
							text = FeatureAvatarTitleResetToDefault.cancel
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: p1 (copy), NavigationUtilsModule (upval)
								p1.resetCallback()
								NavigationUtilsModule.closeOverlay(p1.navigation)
							end,
							text = FeatureAvatarTitleResetToDefault.reset
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = UseScreenSizeFunction(),
			defaultChildRef = p1.defaultChildRef
		})
	})
end))))