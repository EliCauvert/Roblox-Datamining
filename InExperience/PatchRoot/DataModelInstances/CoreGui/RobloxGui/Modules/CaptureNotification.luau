local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local Toast = UIBloxModule.App.Dialog.Toast
local Images = UIBloxModule.App.ImageSet.Images
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ShouldSaveScreenshotToAlbumModule = require(RobloxGui.Modules.shouldSaveScreenshotToAlbum)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local CaptureNotification = RoactModule.PureComponent:extend("CaptureNotification")
CaptureNotification.validateProps = TModule.strictInterface({
	forceDismissToast = TModule.optional(TModule.table),
	permissionEvent = TModule.optional(TModule.instanceOf("BindableEvent"))
})

function CaptureNotification.init(p1) --[[ Line: 40 ]]
	-- upvalues: Images (copy), RobloxTranslatorModule (copy), RoactModule (copy), UserInputService (copy)
	p1.state = {
		dismissedPermission = false,
		notificationType = "None",
		toastContent = nil,
		screenSize = Vector2.new(0, 0)
	}
	
	function p1.onScreenSizeChanged(Frame: Frame) --[[ Line: 48 ]]
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	function p1.getToastContent(Success) --[[ Line: 56 ]]
		-- upvalues: Images (upval), RobloxTranslatorModule (upval), p1 (copy), RoactModule (upval)
		if Success == "Success" or Success == "Fail" then
			local IsSuccess = Success == "Success"
			
			return {
				iconImage = IsSuccess and Images["icons/status/success"] or Images["icons/status/alert"],
				iconColorStyle = if IsSuccess then nil else { Transparency = 0, Color = Color3.fromRGB(247, 75, 82) } or nil,
				toastTitle = IsSuccess and RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Success.ToastText") or RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Fail.ToastText"),
				onDismissed = function() --[[ Line: 68 ]]
					-- upvalues: p1 (upval), RoactModule (upval)
					p1:setState({
						notificationType = "None",
						toastContent = RoactModule.None
					})
					
					if p1.props.forceDismissToast and p1.props.forceDismissToast.onDismissed then
						p1.props.forceDismissToast.onDismissed()
					end
				end
			}
		else
			return RoactModule.None
		end
	end
	
	function p1.dismissPermissionAlert() --[[ Line: 83 ]]
		-- upvalues: p1 (copy)
		p1:setState({
			dismissedPermission = true,
			notificationType = "Fail",
			toastContent = p1.getToastContent("Fail")
		})
	end
	
	function p1:screenshotSavedToAlbumCallback(p2, p3: string) --[[ Line: 91 ]]
		-- upvalues: p1 (copy)
		local Success: string = if p2 then "Success" elseif p1.state.dismissedPermission or not p3:find("Domain=ALAssetsLibraryErrorDomain") or not p3:find("Data unavailable") then "Fail" else "Permission"
		p1:setState({
			notificationType = Success,
			toastContent = p1.getToastContent(Success)
		})
	end
	
	function p1.permissionEventCallback() --[[ Line: 116 ]]
		-- upvalues: p1 (copy)
		p1:setState({
			notificationType = "Permission",
			toastContent = p1.getToastContent("Permission")
		})
	end
	
	function p1.getPermissionAlertBodyText() --[[ Line: 123 ]]
		-- upvalues: UserInputService (upval), RobloxTranslatorModule (upval)
		return if UserInputService:GetPlatform() == Enum.Platform.IOS then RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextIOS") elseif UserInputService:GetPlatform() == Enum.Platform.Android then RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextAndroid") else RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertText")
	end
end

function CaptureNotification:renderWithStyle(p1) --[[ Line: 134 ]]
	-- upvalues: RenderWithCoreScriptsStyleProviderModule (copy)
	return RenderWithCoreScriptsStyleProviderModule(p1)
end

function CaptureNotification.render(p1) --[[ Line: 138 ]]
	-- upvalues: RoactModule (copy), Toast (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), ButtonType (copy), ShouldSaveScreenshotToAlbumModule (copy), ExternalEventConnection (copy)
	local NotificationType = p1.state.notificationType
	
	return p1:renderWithStyle({
		RobloxCaptureNotificationGui = RoactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			DisplayOrder = 9,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Content = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[RoactModule.Change.AbsoluteSize] = p1.onScreenSizeChanged
			}, {
				SuccessToast = NotificationType == "Success" and p1.state.toastContent and RoactModule.createElement(Toast, {
					duration = 3,
					show = not p1.props.forceDismissToast,
					toastContent = p1.state.toastContent
				}),
				FailToast = NotificationType == "Fail" and p1.state.toastContent and RoactModule.createElement(Toast, {
					duration = 3,
					show = not p1.props.forceDismissToast,
					toastContent = p1.state.toastContent
				}),
				PermissionAlertOverlay = NotificationType == "Permission" and RoactModule.createElement("Frame", {
					Active = true,
					BackgroundTransparency = 0.5,
					BackgroundColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					PermissionAlert = RoactModule.createElement(InteractiveAlert, {
						title = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTitle"),
						bodyText = p1.getPermissionAlertBodyText(),
						buttonStackInfo = {
							buttons = {
								{
									buttonType = ButtonType.PrimarySystem,
									props = {
										onActivated = p1.dismissPermissionAlert,
										text = RobloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertButtonText")
									}
								}
							}
						},
						position = UDim2.fromScale(0.5, 0.5),
						screenSize = p1.state.screenSize
					})
				}),
				ScreenshotSavedToAlbumConnection = ShouldSaveScreenshotToAlbumModule() and RoactModule.createElement(ExternalEventConnection, {
					event = game.ScreenshotSavedToAlbum,
					callback = p1.screenshotSavedToAlbumCallback
				}),
				PermissionEventConnection = p1.props.permissionEvent and RoactModule.createElement(ExternalEventConnection, {
					event = p1.props.permissionEvent.Event,
					callback = p1.permissionEventCallback
				})
			})
		})
	})
end

function CaptureNotification.didUpdate(p1, p2) --[[ Line: 208 ]]
	local ForceDismissToast = p1.props.forceDismissToast
	
	if p2.forceDismissToast ~= ForceDismissToast and (not (if p1.state.notificationType == "Success" then p1.state.toastContent else p1.state.notificationType == "Fail" and p1.state.toastContent) and ForceDismissToast and ForceDismissToast.onDismissed) then
		ForceDismissToast.onDismissed()
	end
end

return CaptureNotification