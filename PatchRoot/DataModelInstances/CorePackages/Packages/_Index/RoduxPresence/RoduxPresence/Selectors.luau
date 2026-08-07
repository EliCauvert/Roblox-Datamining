-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local getUserPresenceByUserIdModule = require(script.getUserPresenceByUserId)

return function(p0) --[[ line: 3 ]]
	-- upvalues: getUserPresenceByUserIdModule (ref)
	return {
		getUserPresenceByUserId = getUserPresenceByUserIdModule(p0)
	}
end