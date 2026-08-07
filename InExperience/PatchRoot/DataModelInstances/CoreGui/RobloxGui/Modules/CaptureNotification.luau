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

function captureNotification.init(p0) --[[ line: 40 ]]
	-- upvalues: images (ref), robloxTranslatorModule (ref), roactModule (ref), userInputService (ref)
	p0.state = {
		dismissedPermission = false,
		notificationType = "None",
		toastContent = nil,
		screenSize = Vector2.new(0, 0)
	}
	
	function p0.onScreenSizeChanged(p1) --[[ line: 48 ]]
		-- upvalues: p0 (ref)
		if p0.state.screenSize ~= p1.AbsoluteSize then
			p0:setState({ screenSize = p1.AbsoluteSize })
		end
	end
	
	function p0.getToastContent(p2) --[[ line: 56 ]]
		-- upvalues: images (copy), robloxTranslatorModule (copy), p0 (ref), roactModule (copy)
		if p2 == "Success" or p2 == "Fail" then
			local isSuccess = p2 == "Success"
			
			return {
				iconImage = if isSuccess then images["icons/status/success"] else images["icons/status/alert"],
				iconColorStyle = if not isSuccess then { Transparency = 0, Color = Color3.fromRGB(247, 75, 82) } else nil,
				toastTitle = isSuccess and robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Success.ToastText") or robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Fail.ToastText"),
				onDismissed = function() --[[ line: 68 ]]
					-- upvalues: p0 (copy), roactModule (copy)
					p0:setState({
						notificationType = "None",
						toastContent = roactModule.None
					})
					
					if p0.props.forceDismissToast and p0.props.forceDismissToast.onDismissed then
						p0.props.forceDismissToast.onDismissed()
					end
				end
			}
		end
		return roactModule.None
	end
	
	function p0.dismissPermissionAlert() --[[ line: 83 ]]
		-- upvalues: p0 (ref)
		p0:setState({
			dismissedPermission = true,
			notificationType = "Fail",
			toastContent = p0.getToastContent("Fail")
		})
	end
	
	function p0.screenshotSavedToAlbumCallback(_, p3, p4) --[[ line: 91 ]]
		-- upvalues: p0 (ref)
		local _ = nil
		local var12 = if p3 then "Success" elseif p0.state.dismissedPermission or not p4:find("Domain=ALAssetsLibraryErrorDomain") or not p4:find("Data unavailable") then "Fail" else "Permission"
		p0:setState({
			notificationType = var12,
			toastContent = p0.getToastContent(var12)
		})
	end
	
	function p0.permissionEventCallback() --[[ line: 116 ]]
		-- upvalues: p0 (ref)
		p0:setState({
			notificationType = "Permission",
			toastContent = p0.getToastContent("Permission")
		})
	end
	
	function p0.getPermissionAlertBodyText() --[[ line: 123 ]]
		-- upvalues: userInputService (copy), robloxTranslatorModule (copy)
		return if userInputService:GetPlatform() == Enum.Platform.IOS then robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextIOS") elseif userInputService:GetPlatform() == Enum.Platform.Android then robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTextAndroid") else robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertText")
	end
end

function captureNotification.renderWithStyle(_, p5) --[[ line: 134 ]]
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref)
	return renderWithCoreScriptsStyleProviderModule(p5)
end

function captureNotification.render(p6) --[[ line: 138 ]]
	-- upvalues: roactModule (ref), toast (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref), shouldSaveScreenshotToAlbumModule (ref), externalEventConnection (ref)
	local notificationType = p6.state.notificationType
	
	return p6:renderWithStyle({
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
				[roactModule.Change.AbsoluteSize] = p6.onScreenSizeChanged
			}, {
				SuccessToast = (notificationType == "Success" and p6.state.toastContent) and roactModule.createElement(toast, {
					duration = 3,
					show = not p6.props.forceDismissToast,
					toastContent = p6.state.toastContent
				}),
				FailToast = (notificationType == "Fail" and p6.state.toastContent) and roactModule.createElement(toast, {
					duration = 3,
					show = not p6.props.forceDismissToast,
					toastContent = p6.state.toastContent
				}),
				PermissionAlertOverlay = notificationType == "Permission" and roactModule.createElement("Frame", {
					Active = true,
					BackgroundTransparency = 0.5,
					BackgroundColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					PermissionAlert = roactModule.createElement(interactiveAlert, {
						title = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertTitle"),
						bodyText = p6.getPermissionAlertBodyText(),
						buttonStackInfo = {
							buttons = {
								{
									buttonType = buttonType.PrimarySystem,
									props = {
										onActivated = p6.dismissPermissionAlert,
										text = robloxTranslatorModule:FormatByKey("InGame.NotificationScript2.Capture.Permission.AlertButtonText")
									}
								}
							}
						},
						position = UDim2.fromScale(0.5, 0.5),
						screenSize = p6.state.screenSize
					})
				}),
				ScreenshotSavedToAlbumConnection = shouldSaveScreenshotToAlbumModule() and roactModule.createElement(externalEventConnection, {
					event = game.ScreenshotSavedToAlbum,
					callback = p6.screenshotSavedToAlbumCallback
				}),
				PermissionEventConnection = p6.props.permissionEvent and roactModule.createElement(externalEventConnection, {
					event = p6.props.permissionEvent.Event,
					callback = p6.permissionEventCallback
				})
			})
		})
	})
end

function captureNotification.didUpdate(p7, p8) --[[ line: 208 ]]
	local forceDismissToast = p7.props.forceDismissToast
	
	if p8.forceDismissToast ~= forceDismissToast then
		local var13
		if p7.state.notificationType ~= "Success" then
			var13 = p7.state.notificationType == "Fail" and p7.state.toastContent
		end
		if not var13 and forceDismissToast and forceDismissToast.onDismissed then
			forceDismissToast.onDismissed()
		end
	end
end

return captureNotification