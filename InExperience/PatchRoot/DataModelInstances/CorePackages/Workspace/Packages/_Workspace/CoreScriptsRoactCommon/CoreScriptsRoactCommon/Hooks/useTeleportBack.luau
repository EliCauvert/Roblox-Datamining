local coreScriptsRoactCommon = script:FindFirstAncestor("CoreScriptsRoactCommon")
local teleportBackModule = require(coreScriptsRoactCommon.Traversal.TeleportBack)
local reactModule = require(coreScriptsRoactCommon.Parent.React)

return function(value)
	-- upvalues: reactModule (ref), teleportBackModule (ref)
	return reactModule.useCallback(function()
		-- upvalues: teleportBackModule (copy), value (ref)
		teleportBackModule(value)
	end, {})
end