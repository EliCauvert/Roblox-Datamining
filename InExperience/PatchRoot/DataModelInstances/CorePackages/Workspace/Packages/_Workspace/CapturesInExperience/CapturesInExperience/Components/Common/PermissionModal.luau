local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local localizationModule = require(parent_1.Localization)
local default = require(parent_1.PermissionsProtocol).PermissionsProtocol.default
local reactModule = require(parent_1.React)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local useCallback = reactModule.useCallback
local useLocalization = localizationModule.Hooks.useLocalization
local useScreenSize = robloxAppHooksModule.useScreenSize
local useStyle = UIBloxModule.Core.Style.useStyle
local eventNamesModule = require(parent.Analytics.EventNames)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

return function(p0)
	-- upvalues: useScreenSize (ref), useStyle (ref), useAnalyticsModule (ref), useLocalization (ref), useCallback (ref), default (ref), eventNamesModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var6 = useScreenSize()
	local var7 = useStyle()
	local var8 = useAnalyticsModule()
	local var9 = useLocalization({
		alertBody = "Feature.Captures.Description.AllowPhotoAccessInfo",
		alertTitle = "Feature.Captures.Title.AllowPhotoAccessInfo",
		accessDeniedCTA = "Feature.Captures.Action.AllowPhotoAccessDeclined",
		accessAllowedCTA = "Feature.Captures.Action.AllowPhotoAccessAccepted"
	})
	local theme = var7.Theme
	
	return reactModule.createElement("Frame", {
		Active = true,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = p0.visible,
		ZIndex = p0.zIndex
	}, {
		Alert = reactModule.createElement(interactiveAlert, {
			isMiddleContentFocusable = false,
			bodyText = var9.alertBody,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = useCallback(function()
								-- upvalues: var8 (ref), eventNamesModule (copy), p0 (ref)
								var8.fireEvent(eventNamesModule.CapturesSavePermissionModalCancelPressed)
								p0.closeModal()
							end, { p0.closeModal }),
							text = var9.accessDeniedCTA
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = useCallback(function()
								-- upvalues: default (copy), var8 (ref), eventNamesModule (copy), p0 (ref)
								default:requestPermissions({ default.Permissions.WRITE_MEDIA_STORAGE })
								var8.fireEvent(eventNamesModule.CapturesSavePermissionModalAllowPressed)
								p0.closeModal()
							end, { p0.closeModal }),
							text = var9.accessAllowedCTA
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = var6,
			title = var9.alertTitle
		})
	})
end