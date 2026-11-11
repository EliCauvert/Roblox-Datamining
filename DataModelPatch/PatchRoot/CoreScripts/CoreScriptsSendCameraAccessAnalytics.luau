local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("VideoCaptureService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreGui = game:GetService("CoreGui")
local GetCamMicPermissionsModule: (any, any, any) -> () = require(CoreGui.RobloxGui.Modules.Settings.getCamMicPermissions)
local Default = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local Inverted = not require(CorePackages.Packages.Cryo).isEmpty((require(CoreGui.RobloxGui.Modules.Settings.cameraDevicesHelper).GetDevices()))

if Inverted then
	GetCamMicPermissionsModule(function(p1)
		-- upvalues: RbxAnalyticsService (copy), Inverted (copy)
		RbxAnalyticsService:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
			hasAccessToCamera = p1.hasCameraPermissions,
			hasEligibleCamera = Inverted
		})
	end, { Default.Permissions.CAMERA_ACCESS }, true)
	
	return
else
	RbxAnalyticsService:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", { hasAccessToCamera = false, hasEligibleCamera = Inverted })
end