local CoreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local TeleportBackModule = require(CoreScriptsRoactCommon.Traversal.TeleportBack)
local ReactModule = require(CoreScriptsRoactCommon.Parent.React)

return function(p1) --[[ Line: 7 | Named "useTeleportBack" ]]
	-- upvalues: ReactModule (copy), TeleportBackModule (copy)
	return ReactModule.useCallback(function() --[[ Line: 8 ]]
		-- upvalues: TeleportBackModule (upval), p1 (copy)
		TeleportBackModule(p1)
	end, {})
end