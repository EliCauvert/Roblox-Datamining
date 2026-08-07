-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	return {
		getStatus = require(script.getStatus)(p0),
		setStatus = require(script.setStatus)(p0),
		installReducer = require(script.installReducer)(p0),
		Enum = { Status = require(script.EnumNetworkStatus) }
	}
end