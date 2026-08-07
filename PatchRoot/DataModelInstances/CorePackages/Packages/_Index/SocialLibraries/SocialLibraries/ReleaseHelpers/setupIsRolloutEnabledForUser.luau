-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local dependenciesModule = require(script.Parent.Parent.dependencies)
local throttleUserIdModule = require(script.Parent.throttleUserId)

return function(p0) --[[ line: 5 ]]
	-- upvalues: dependenciesModule (ref), throttleUserIdModule (ref)
	return function() --[[ line: 6 ]]
		-- upvalues: dependenciesModule (copy), throttleUserIdModule (copy), p0 (ref)
		local localPlayer = dependenciesModule.Players.LocalPlayer
		
		return if localPlayer and localPlayer.UserId then throttleUserIdModule({ throttle = p0(), userId = localPlayer.UserId }) else false
	end
end