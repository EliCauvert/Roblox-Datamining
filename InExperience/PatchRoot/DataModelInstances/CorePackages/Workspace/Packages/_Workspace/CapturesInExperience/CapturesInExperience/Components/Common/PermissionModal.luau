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

return function(p1)
	-- upvalues: useScreenSize (ref), useStyle (ref), useAnalyticsModule (ref), useLocalization (ref), useCallback (ref), default (ref), eventNamesModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref)
	local var1 = useScreenSize()
	local var2 = useStyle()
	local var3 = useAnalyticsModule()
	local var4 = useLocalization({
		alertBody = "Feature.Captures.Description.AllowPhotoAccessInfo",
		alertTitle = "Feature.Captures.Title.AllowPhotoAccessInfo",
		accessDeniedCTA = "Feature.Captures.Action.AllowPhotoAccessDeclined",
		accessAllowedCTA = "Feature.Captures.Action.AllowPhotoAccessAccepted"
	})
	local theme = var2.Theme
	
	return reactModule.createElement("Frame", {
		Active = true,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = p1.visible,
		ZIndex = p1.zIndex
	}, {
		Alert = reactModule.createElement(interactiveAlert, {
			isMiddleContentFocusable = false,
			bodyText = var4.alertBody,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = useCallback(function()
								-- upvalues: var3 (ref), eventNamesModule (copy), p1 (ref)
								var3.fireEvent(eventNamesModule.CapturesSavePermissionModalCancelPressed)
								p1.closeModal()
							end, { p1.closeModal }),
							text = var4.accessDeniedCTA
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = useCallback(function()
								-- upvalues: default (copy), var3 (ref), eventNamesModule (copy), p1 (ref)
								default:requestPermissions({ default.Permissions.WRITE_MEDIA_STORAGE })
								var3.fireEvent(eventNamesModule.CapturesSavePermissionModalAllowPressed)
								p1.closeModal()
							end, { p1.closeModal }),
							text = var4.accessAllowedCTA
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = var1,
			title = var4.alertTitle
		})
	})
end