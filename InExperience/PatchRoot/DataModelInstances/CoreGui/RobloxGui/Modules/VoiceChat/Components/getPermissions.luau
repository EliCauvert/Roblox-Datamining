local GetCamMicPermissionsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.getCamMicPermissions)
local Default = require(game:GetService("CorePackages").Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default

return function(Callback, p1, p2) --[[ Line: 13 ]]
	-- upvalues: Default (copy), GetCamMicPermissionsModule (copy)
	local List = nil
	
	if p1 then
		if p1 == "camera" then
			List = { Default.Permissions.CAMERA_ACCESS }
		elseif p1 == "microphone" then
			List = { Default.Permissions.MICROPHONE_ACCESS }
		end
	end
	GetCamMicPermissionsModule(function(p3) --[[ Line: 24 ]]
		-- upvalues: Callback (copy)
		Callback(p3.hasCameraPermissions, p3.hasMicPermissions)
	end, List, p2, "ExperienceChat.getPermissions")
end