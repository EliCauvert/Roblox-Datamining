local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local teleportBackModule = require(coreScriptsRoactCommon.Traversal.TeleportBack)
local reactModule = require(coreScriptsRoactCommon.Parent.React)

return function(value) --[[ line: 7 | named "useTeleportBack" ]]
	-- upvalues: reactModule (ref), teleportBackModule (ref)
	return reactModule.useCallback(function() --[[ line: 8 ]]
		-- upvalues: teleportBackModule (copy), value (ref)
		teleportBackModule(value)
	end, {})
end