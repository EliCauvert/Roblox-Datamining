-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local useEventConnectionModule = require(script.Parent.useEventConnection)

return function(p0) --[[ line: 20 | named "EventConnection" ]]
	-- upvalues: useEventConnectionModule (ref)
	useEventConnectionModule(p0.event, p0.callback, { p0.event, p0.callback })
end