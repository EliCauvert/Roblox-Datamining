local dependenciesModule = require(script.Parent.Parent.dependencies)
local throttleUserIdModule = require(script.Parent.throttleUserId)

return function(p1)
	-- upvalues: dependenciesModule (ref), throttleUserIdModule (ref)
	return function()
		-- upvalues: dependenciesModule (copy), throttleUserIdModule (copy), p1 (ref)
		local localPlayer = dependenciesModule.Players.LocalPlayer
		
		return if localPlayer and localPlayer.UserId then throttleUserIdModule({ throttle = p1(), userId = localPlayer.UserId }) else false
	end
end