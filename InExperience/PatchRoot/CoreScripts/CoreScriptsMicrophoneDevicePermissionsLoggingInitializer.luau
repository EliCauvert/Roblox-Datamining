local coreGuiService = game:GetService("CoreGui")
local microphoneDevicePermissionsLoggingModule = require(coreGuiService.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
require(coreGuiService.RobloxGui.Modules.Settings.getCamMicPermissions)(function(p1)
	-- upvalues: microphoneDevicePermissionsLoggingModule (ref)
	microphoneDevicePermissionsLoggingModule:init(p1.hasMicPermissions)
end, {
	require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default.Permissions.MICROPHONE_ACCESS
}, true)