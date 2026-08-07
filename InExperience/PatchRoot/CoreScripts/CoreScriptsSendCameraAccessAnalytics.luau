local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("VideoCaptureService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local cryoModule = require(corePackagesService.Packages.Cryo)
local getCamMicPermissionsModule = require(coreGuiService.RobloxGui.Modules.Settings.getCamMicPermissions)
local default = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default
local var5 = not cryoModule.isEmpty(require(coreGuiService.RobloxGui.Modules.Settings.cameraDevicesHelper).GetDevices())

if var5 then
	getCamMicPermissionsModule(function(p0) --[[ line: 14 ]]
		-- upvalues: rbxAnalyticsService (ref), var5 (ref)
		rbxAnalyticsService:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
			hasAccessToCamera = p0.hasCameraPermissions,
			hasEligibleCamera = var5
		})
	end, { default.Permissions.CAMERA_ACCESS }, true)
	
	return
end
rbxAnalyticsService:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", { hasAccessToCamera = false, hasEligibleCamera = var5 })