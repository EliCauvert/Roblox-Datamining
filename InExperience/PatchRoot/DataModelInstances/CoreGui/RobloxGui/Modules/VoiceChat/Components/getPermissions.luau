local getCamMicPermissionsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.getCamMicPermissions)
local default = require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default

return function(p1, p2, p3)
	-- upvalues: default (ref), getCamMicPermissionsModule (ref)
	local list = nil
	
	if p2 then
		if p2 == "camera" then
			list = { default.Permissions.CAMERA_ACCESS }
		elseif p2 == "microphone" then
			list = { default.Permissions.MICROPHONE_ACCESS }
		end
	end
	getCamMicPermissionsModule(function(p4)
		-- upvalues: p1 (ref)
		p1(p4.hasCameraPermissions, p4.hasMicPermissions)
	end, list, p3, "ExperienceChat.getPermissions")
end