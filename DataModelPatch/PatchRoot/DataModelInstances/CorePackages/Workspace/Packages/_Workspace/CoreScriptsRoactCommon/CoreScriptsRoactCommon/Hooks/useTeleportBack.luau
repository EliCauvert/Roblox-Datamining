local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local TeleportBackModule = require(CoreScriptsRoactCommon.Traversal.TeleportBack)
local ReactModule = require(CoreScriptsRoactCommon.Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy), TeleportBackModule (copy)
	return ReactModule.useCallback(function()
		-- upvalues: TeleportBackModule (upval), p1 (copy)
		TeleportBackModule(p1)
	end, {})
end