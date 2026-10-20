local Default = require(script:FindFirstAncestor("ExpChat").Parent.PermissionsProtocol).PermissionsProtocol.default
local PermissionStatus = {
	Granted = "granted",
	Denied = "denied",
	AlreadyAllowed = "already_allowed"
}

return {
	requestMicPermission = function()
		-- upvalues: Default (copy), PermissionStatus (copy)
		return Default:hasPermissions({ Default.Permissions.MICROPHONE_ACCESS }):andThen(function(Result)
			-- upvalues: Default (upval), PermissionStatus (upval)
			return if Result.status == Default.Status.AUTHORIZED then { status = PermissionStatus.AlreadyAllowed } else Default:requestPermissions({ Default.Permissions.MICROPHONE_ACCESS }):andThen(function(Result)
				-- upvalues: Default (upval), PermissionStatus (upval)
				return if Result.status == Default.Status.AUTHORIZED then { status = PermissionStatus.Granted } else { status = PermissionStatus.Denied }
			end)
		end):catch(function(Err)
			-- upvalues: PermissionStatus (upval)
			return { status = PermissionStatus.Denied, error = tostring(Err) }
		end)
	end,
	PermissionStatus = PermissionStatus
}