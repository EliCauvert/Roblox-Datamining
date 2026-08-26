local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local toast = UIBloxModule.App.Dialog.Toast
local images = UIBloxModule.App.ImageSet.Images
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local shouldSaveScreenshotToAlbumModule = require(robloxGui.Modules.shouldSaveScreenshotToAlbum)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local _ = {
	None = "None",
	Success = "Success",
	Fail = "Fail",
	Permission = "Permission"
}
local captureNotification = roactModule.PureComponent:extend("CaptureNotification")
captureNotification.validateProps = tModule.strictInterface({
	forceDismissToast = tModule.optional(tModule.table),
	permissionEvent = tModule.optional(tModule.instanceOf("BindableEvent"))
})

function captureNotification.init(p1)
	-- upvalues: images (ref), robloxTranslatorModule (ref), roactModule (ref), userInputService (ref)
	p1.state = {
		dismissedPermission = false,
		notificationType = "None",
		toastContent = nil,
		screenSize = Vector2.new(0, 0)
	}
	
	function p0.onScreenSizeChanged(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	function p0.getToastContent(p2)
		-- upvalues: images (copy), robloxTranslatorModule (copy), p1 (ref), roactModule (copy)
		if p2 == "Success" or p2 == "Fail" then
			local isSuccess = p2 == "Success"
			
			return {
				iconImage = if isSuccess then images["icons/status/success"] else images["icons/status/alert"],
				iconColorStyle = if not isSuccess then { Transparency = 0, Color = Color3.fromRGB(247, 75, 82) } else nil,
				toastTitle = isSuccess and robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Success.ToastText") or robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Fail.ToastText"),
				onDismissed = function()
					-- upvalues: p1 (copy), roactModule (copy)
					p1:setState({
						notificationType = "None",
						toastContent = roactModule.None
					})
					
					if p1.props.forceDismissToast and p1.props.forceDismissToast.onDismissed then
						p1.props.forceDismissToast.onDismissed()
					end
				end
			}
		end
		return roactModule.None
	end
	
	function p0.dismissPermissionAlert()
		-- upvalues: p1 (ref)
		p1:setState({
			dismissedPermission = true,
			notificationType = "Fail",
			toastContent = p1.getToastContent("Fail")
		})
	end
	
	function p0.screenshotSavedToAlbumCallback(_, p2, p3)
		-- upvalues: p1 (ref)
		local _ = nil
		local var1 = if p2 then "Success" elseif p1.state.dismissedPermission or not p3:find("Domain=ALAssetsLibraryErrorDomain") or not p3:find("Data unavailable") then "Fail" else "Permission"
		p1:setState({
			notificationType = var1,
			toastContent = p1.getToastContent(var1)
		})
	end
	
	function p0.permissionEventCallback()
		-- upvalues: p1 (ref)
		p1:setState({
			notificationType = "Permission",
			toastContent = p1.getToastContent("Permission")
		})
	end
	
	function p0.getPermissionAlertBodyText()
		-- upvalues: userInputService (copy), robloxTranslatorModule (copy)
		return if userInputService:GetPlatform() == Enum.Platform.IOS then robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextIOS") elseif userInputService:GetPlatform() == Enum.Platform.Android then robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextAndroid") else robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertText")
	end
end

function captureNotification.renderWithStyle(_, p1)
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref)
	return renderWithCoreScriptsStyleProviderModule(p1)
end

function captureNotification.render(p1)
	-- upvalues: roactModule (ref), toast (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref), shouldSaveScreenshotToAlbumModule (ref), externalEventConnection (ref)
	local notificationType = p1.state.notificationType
	
	return p1:renderWithStyle({
		RobloxCaptureNotificationGui = roactModule.createElement("ScreenGui", {
			AutoLocalize = false,
			DisplayOrder = 9,
			IgnoreGuiInset = true,
			OnTopOfCoreBlur = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			Content = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				[roactModule.Change.AbsoluteSize] = p1.onScreenSizeChanged
			}, {
				SuccessToast = (notificationType == "Success" and p1.state.toastContent) and roactModule.createElement(toast, {
					duration = 3,
					show = not p1.props.forceDismissToast,
					toastContent = p1.state.toastContent
				}),
				FailToast = (notificationType == "Fail" and p1.state.toastContent) and roactModule.createElement(toast, {
					duration = 3,
					show = not p1.props.forceDismissToast,
					toastContent = p1.state.toastContent
				}),
				PermissionAlertOverlay = notificationType == "Permission" and roactModule.createElement("Frame", {
					Active = true,
					BackgroundTransparency = 0.5,
					BackgroundColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					PermissionAlert = roactModule.createElement(interactiveAlert, {
						title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTitle"),
						bodyText = p1.getPermissionAlertBodyText(),
						buttonStackInfo = {
							buttons = {
								{
									buttonType = buttonType.PrimarySystem,
									props = {
										onActivated = p1.dismissPermissionAlert,
										text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertButtonText")
									}
								}
							}
						},
						position = UDim2.fromScale(0.5, 0.5),
						screenSize = p1.state.screenSize
					})
				}),
				ScreenshotSavedToAlbumConnection = shouldSaveScreenshotToAlbumModule() and roactModule.createElement(externalEventConnection, {
					event = game.ScreenshotSavedToAlbum,
					callback = p1.screenshotSavedToAlbumCallback
				}),
				PermissionEventConnection = p1.props.permissionEvent and roactModule.createElement(externalEventConnection, {
					event = p1.props.permissionEvent.Event,
					callback = p1.permissionEventCallback
				})
			})
		})
	})
end

function captureNotification.didUpdate(p1, p2)
	local forceDismissToast = p1.props.forceDismissToast
	
	if p2.forceDismissToast ~= forceDismissToast then
		local var1
		if p1.state.notificationType ~= "Success" then
			var1 = p1.state.notificationType == "Fail" and p1.state.toastContent
		end
		if not var1 and forceDismissToast and forceDismissToast.onDismissed then
			forceDismissToast.onDismissed()
		end
	end
end

return captureNotification