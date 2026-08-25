local default = require(script:FindFirstAncestor("ExpChat").Parent.PermissionsProtocol).PermissionsProtocol.default
local t = {
	Granted = "granted",
	Denied = "denied",
	AlreadyAllowed = "already_allowed"
}

return {
	requestMicPermission = function()
		-- upvalues: default (ref), t (ref)
		return default:hasPermissions({ default.Permissions.MICROPHONE_ACCESS }):andThen(function(p1)
			-- upvalues: default (copy), t (copy)
			return if p1.status == default.Status.AUTHORIZED then { status = t.AlreadyAllowed } else default:requestPermissions({ default.Permissions.MICROPHONE_ACCESS }):andThen(function(p2)
				-- upvalues: default (copy), t (copy)
				return if p2.status == default.Status.AUTHORIZED then { status = t.Granted } else { status = t.Denied }
			end)
		end):catch(function(p0)
			-- upvalues: t (copy)
			return { status = t.Denied, error = tostring(p0) }
		end)
	end,
	PermissionStatus = t
}