local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local InteractiveAlert = require(CorePackages.Packages.UIBlox).App.Dialog.Alert.InteractiveAlert
local CloseCentralOverlayModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.CloseCentralOverlay)
local ProfileQrCodeCameraSettingsModalSeen: string = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local CameraPermissionPrompt = RoactModule.PureComponent:extend("CameraPermissionPrompt")

function CameraPermissionPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.titleText,
		bodyText = p2.messageText,
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = p1.props.closePrompt,
						text = p2.gotItButtonText
					}
				}
			}
		},
		screenSize = p1.props.screenSize
	})
end

function CameraPermissionPrompt:didMount()
	-- upvalues: AppStorageService (copy), ProfileQrCodeCameraSettingsModalSeen (copy)
	AppStorageService:SetItem(ProfileQrCodeCameraSettingsModalSeen, "true")
	AppStorageService:Flush()
end

function CameraPermissionPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Feature.AddFriends.Title.CameraPermission",
		messageText = "Feature.AddFriends.Description.CameraPermissionWarning",
		gotItButtonText = "Feature.Avatar.Action.GotIt"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

return (RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closePrompt = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			Callback(CloseCentralOverlayModule())
		end
	}
end)(CameraPermissionPrompt))