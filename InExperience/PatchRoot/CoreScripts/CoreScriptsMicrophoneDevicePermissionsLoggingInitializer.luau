local CoreGui = game:GetService("CoreGui")
local MicrophoneDevicePermissionsLoggingModule = require(CoreGui.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging)
require(CoreGui.RobloxGui.Modules.Settings.getCamMicPermissions)(function(p1)
	-- upvalues: MicrophoneDevicePermissionsLoggingModule (copy)
	MicrophoneDevicePermissionsLoggingModule:init(p1.hasMicPermissions)
end, {
	require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default.Permissions.MICROPHONE_ACCESS
}, true)