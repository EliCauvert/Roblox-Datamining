local default = require(script:FindFirstAncestor("ExpChat").Parent.PermissionsProtocol).PermissionsProtocol.default
local t = {
	Granted = "granted",
	Denied = "denied",
	AlreadyAllowed = "already_allowed"
}

return {
	requestMicPermission = function() --[[ line: 23 ]]
		-- upvalues: default (ref), t (ref)
		return default:hasPermissions({ default.Permissions.MICROPHONE_ACCESS }):andThen(function(p1) --[[ line: 25 ]]
			-- upvalues: default (copy), t (copy)
			return if p1.status == default.Status.AUTHORIZED then { status = t.AlreadyAllowed } else default:requestPermissions({ default.Permissions.MICROPHONE_ACCESS }):andThen(function(p2) --[[ line: 30 ]]
				-- upvalues: default (copy), t (copy)
				return if p2.status == default.Status.AUTHORIZED then { status = t.Granted } else { status = t.Denied }
			end)
		end):catch(function(p0) --[[ line: 37 ]]
			-- upvalues: t (copy)
			return { status = t.Denied, error = tostring(p0) }
		end)
	end,
	PermissionStatus = t
}