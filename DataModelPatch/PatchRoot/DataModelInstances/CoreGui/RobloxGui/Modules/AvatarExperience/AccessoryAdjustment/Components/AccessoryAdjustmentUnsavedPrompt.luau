local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Overlay = UIBloxModule.App.Dialog.Overlay
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)((require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), Focusable (copy), Overlay (copy), InteractiveAlert (copy), NavigationUtilsModule (copy), ButtonType (copy)
	local FeatureAvatarTitleUnsavedChanges = UseLocalizationFunction({
		cancel = "Feature.Avatar.Action.Cancel",
		title = "Feature.Avatar.Title.UnsavedChanges",
		bodyText = "Feature.Avatar.Message.LeaveAccessoryAdjustmentWarning",
		discard = "Feature.Avatar.Action.Discard"
	})
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		ZIndex = 100,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		Overlay = ReactModule.createElement(Overlay, { ZIndex = -1, showGradient = false }),
		InteractiveAlert = ReactModule.createElement(InteractiveAlert, {
			title = FeatureAvatarTitleUnsavedChanges.title,
			bodyText = FeatureAvatarTitleUnsavedChanges.bodyText,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = function()
								-- upvalues: NavigationUtilsModule (upval), p1 (copy)
								NavigationUtilsModule.closeOverlay(p1.navigation)
							end,
							text = FeatureAvatarTitleUnsavedChanges.cancel
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: NavigationUtilsModule (upval), p1 (copy)
								NavigationUtilsModule.closeOverlay(p1.navigation)
								p1.exitCallback()
							end,
							text = FeatureAvatarTitleUnsavedChanges.discard
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