local getCamMicPermissionsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.getCamMicPermissions)
local default = require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default

return function(p0, p1, p2)
	-- upvalues: default (ref), getCamMicPermissionsModule (ref)
	local list = nil
	
	if p1 then
		if p1 == "camera" then
			list = { default.Permissions.CAMERA_ACCESS }
		elseif p1 == "microphone" then
			list = { default.Permissions.MICROPHONE_ACCESS }
		end
	end
	getCamMicPermissionsModule(function(p3)
		-- upvalues: p0 (ref)
		p0(p3.hasCameraPermissions, p3.hasMicPermissions)
	end, list, p2, "ExperienceChat.getPermissions")
end