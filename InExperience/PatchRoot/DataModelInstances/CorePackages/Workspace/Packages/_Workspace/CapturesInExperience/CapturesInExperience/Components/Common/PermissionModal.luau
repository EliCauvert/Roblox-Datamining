local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Default = require(Parent1.PermissionsProtocol).PermissionsProtocol.default
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local UseCallbackFunction = ReactModule.useCallback
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local EventNamesModule = require(Parent.Analytics.EventNames)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

return function(p1) --[[ Line: 27 ]]
	-- upvalues: UseScreenSizeFunction (copy), UseStyleFunction (copy), UseAnalyticsModule (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), Default (copy), EventNamesModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStyleResult = UseStyleFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseLocalizationResult = UseLocalizationFunction({
		alertBody = "Feature.Captures.Description.AllowPhotoAccessInfo",
		alertTitle = "Feature.Captures.Title.AllowPhotoAccessInfo",
		accessDeniedCTA = "Feature.Captures.Action.AllowPhotoAccessDeclined",
		accessAllowedCTA = "Feature.Captures.Action.AllowPhotoAccessAccepted"
	})
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		Active = true,
		BackgroundColor3 = Theme.Overlay.Color,
		BackgroundTransparency = Theme.Overlay.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = p1.visible,
		ZIndex = p1.zIndex
	}, {
		Alert = ReactModule.createElement(InteractiveAlert, {
			isMiddleContentFocusable = false,
			bodyText = UseLocalizationResult.alertBody,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = UseCallbackFunction(function() --[[ Line: 48 ]]
								-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy)
								UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesSavePermissionModalCancelPressed)
								p1.closeModal()
							end, { p1.closeModal }),
							text = UseLocalizationResult.accessDeniedCTA
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseCallbackFunction(function() --[[ Line: 42 ]]
								-- upvalues: Default (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), p1 (copy)
								Default:requestPermissions({ Default.Permissions.WRITE_MEDIA_STORAGE })
								UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesSavePermissionModalAllowPressed)
								p1.closeModal()
							end, { p1.closeModal }),
							text = UseLocalizationResult.accessAllowedCTA
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = UseScreenSizeResult,
			title = UseLocalizationResult.alertTitle
		})
	})
end