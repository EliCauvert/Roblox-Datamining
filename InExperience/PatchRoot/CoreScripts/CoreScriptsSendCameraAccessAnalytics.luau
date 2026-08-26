local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("VideoCaptureService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local cryoModule = require(corePackagesService.Packages.Cryo)
local getCamMicPermissionsModule = require(coreGuiService.RobloxGui.Modules.Settings.getCamMicPermissions)
local default = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local var1 = not cryoModule.isEmpty(require(coreGuiService.RobloxGui.Modules.Settings.cameraDevicesHelper).GetDevices())

if var1 then
	getCamMicPermissionsModule(function(p1)
		-- upvalues: rbxAnalyticsService (ref), var1 (ref)
		rbxAnalyticsService:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
			hasAccessToCamera = p1.hasCameraPermissions,
			hasEligibleCamera = var1
		})
	end, { default.Permissions.CAMERA_ACCESS }, true)
	
	return
end
rbxAnalyticsService:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", { hasAccessToCamera = false, hasEligibleCamera = var1 })